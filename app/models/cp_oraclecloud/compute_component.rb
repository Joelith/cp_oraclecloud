module CpOraclecloud
  class ComputeComponent < CloudComponent
    include CpOraclecloud::ComputeMixin

    store :config, accessors: [:name, :shape, :imagelist, :label, :sshkeys], coder: JSON

    enum shape: [:oc3, :oc4, :oc5, :oc6, :oc1m, :oc2m, :oc3m, :oc4m]

    validates :name, :presence => true
    validates :imagelist, :presence => true
    validates :shape, :presence => true
    validates :sshkeys, :presence => true

    def all_image_lists
      connection.image_lists.all
    end

    def all_ssh_keys
      connection.ssh_keys.all
    end

    def pretty_type
      'Oracle Compute Instance'
    end

    def instance_type
      "CpOraclecloud::ComputeInstance"
    end

    def instance_name
      "name"
    end

    def connection 
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