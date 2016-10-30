module CpOraclecloud
  class SshKey
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_accessor :uri, :enabled, :key, :name

    validates :enabled, inclusion: [true, false]
    validates :key, :presence => true
    validates :name, :presence => true


    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def to_model
      self
    end

    def persisted?
      false
    end

    def self.all
      connection.ssh_keys
    end

    def self.find_by_id(id)
      connection.ssh_keys.get(id)
    end

    def self.create(params)
      connection.ssh_keys.create(:name => params[:name],
                             :enabled => params[:enabled],
                             :key => params[:key])
    end

    def save
      self.connection.ssh_keys.create(:name => name,
                                 :enabled => enabled,
                                 :key => key)
    end

    def self.delete(id)
      connection.ssh_keys.get(id).destroy
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