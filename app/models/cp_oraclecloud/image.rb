module CpOraclecloud
  class Image
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_accessor :id, :uri, :name, :default, :description, :entries

    validates :name, :presence => true

    def initialize(attributes = {})
      if !attributes[:name].blank?
        regex = attributes[:name].match(/\/.*\/(.*)/)
        if regex && regex.length > 1
          clean_name = regex[1]
          attributes[:id] = clean_name
          attributes[:name] = clean_name
        end
      end
      attributes.each do |field, value|
        send("#{field}=", value)
      end
    end

    def to_s
      name
    end

    def to_model
      self
    end

    def persisted?
      !id.blank?
    end

    def self.all
      result = []
      connection.image_lists.each { |k| result.push(CpOraclecloud::Image.new(k.attributes))}
      result
    end

    def self.find_by_id(id)
      data = connection.image_lists.get(id)
      CpOraclecloud::Image.new(data.attributes)
    end

    def self.create(params)
      connection.image_lists.create(:name => params[:name],
                                 :default => params[:default],
                                 :description => params[:description])
    end

    def update(params)
      fog = self.class.connection.image_lists.get(id)

      [:name, :default, :description].each do |field|
        fog.attributes[field.to_sym] = params[field.to_sym]
      end
      fog.update
    end

    def self.delete(id)
      connection.image_lists.get(id).destroy
    end

    def self.connection
      @connection ||= Fog::Compute.new(
        :provider => 'OracleCloud',
        :oracle_username => CpOraclecloud.username,
        :oracle_password => CpOraclecloud.password,
        :oracle_domain => CpOraclecloud.domain,
        :oracle_compute_api => CpOraclecloud.compute_api
        )
    end
  end
end