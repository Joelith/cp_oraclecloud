module CpOraclecloud
  class SoaComponent < CloudComponent
    include CpOraclecloud::SoaMixin

    after_initialize :init
    store :config, accessors: [:service_name, :cloud_storage_container, :cloud_storage_pwd, :cloud_storage_user, :description, :provision_otd, :subscription_type, :level, :topology, :admin_password, :admin_username, :dba_name, :dba_password, :db_service_name, :num_nodes, :shape, :ssh_key, :version], coder: JSON

    enum shape: [:oc1m, :oc2m, :oc3m, :oc4m, :oc5m]
    enum topology: [:soa, :osb, :soaosb, :b2b, :mft, :apim, :insight]
  
    validates :service_name, :presence => true
    validates :shape, :presence => true
    validates :version, :presence => true
    validates :ssh_key, :presence => true
    validates :admin_password, :presence => true
    validates :admin_username, :presence => true
    validates :topology, :presence => true

    validate :admin_password_complexity
    validate :server_count_correct

    def init
      self.provision_otd ||= false
      self.level ||= 'PAAS'
      self.subscription_type ||= 'MONTHLY'
      self.num_nodes ||= 1
    end

    def server_count_correct
      if ![1,2,4].include?(num_nodes.to_i) then errors.add :num_nodes, "Invalid server count" end
    end

    def admin_password_complexity
      if admin_password.size < 8 or admin_password.size > 30
        errors.add :admin_password, "Must be at betweeen 8 and 30 characters long."
      end
      if !(admin_password[0] =~ /[[:alpha:]]/)
        errors.add :admin_password, "First character must be a letter"
      end
      if (admin_password =~ /[a-z]/).blank? then errors.add :admin_password, 'Must contain a lower case letter' end
      if (admin_password =~ /[A-Z]/).blank? then errors.add :admin_password, 'Must contain an upper case letter' end
      if (admin_password =~ /[0-9]/).blank? then errors.add :admin_password, 'Must contain atleast one number' end
      if (admin_password =~ /[-_#$]/).blank? then errors.add :admin_password, 'Must contain a special character (-, _, #, $)' end

    end

    def pretty_type
      'Oracle SOA Cloud Service'
    end

    def instance_name
      "service_name"
    end

    def instance_type
      "CpOraclecloud::SoaInstance"
    end
  end
end