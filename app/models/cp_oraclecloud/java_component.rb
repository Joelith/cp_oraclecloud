module CpOraclecloud
  class JavaComponent < CloudComponent
    after_initialize :init
    store :config, accessors: [:service_name, :cloud_storage_container, :cloud_storage_pwd, :cloud_storage_user, :cloud_storage_if_missing, :description, :enable_admin_console, :provision_otd, :sample_app_deployment_requested, :subscription_type, :level, :admin_password, :admin_port, :admin_username, :backup_volume_size, :cluster_name, :content_port, :dba_name, :dba_password, :db_service_name, :wls_deployment_channel_port, :domain_mode, :domain_name, :domain_partition_count, :domain_volume_size, :edition, :num_nodes, :ms_initial_heap_mb, :ms_jvm_args, :ms_max_heap_mb, :ms_max_perm_mb, :node_manager_password, :node_manager_port, :node_manager_username, :overwrite_ms_jvm_args, :pdb_name, :secured_admin_port, :secured_content_port, :shape, :ssh_key, :version], coder: JSON

    enum edition: [:SE, :EE, :SUITE]
    enum shape: [:oc3, :oc4, :oc5, :oc6, :oc1m, :oc2m, :oc3m, :oc4m]
    enum level: [:PAAS, :BASIC]
    enum subscription_type: [:HOURLY, :MONTHLY]
    enum domain_mode: [:DEVELOPMENT, :PRODUCTION]
  
    validates :service_name, :presence => true
    validates :dba_name, :presence => true
    validates :dba_password, :presence => true
    validates :db_service_name, :presence => true
    validates :shape, :presence => true
    validates :version, :presence => true
    validates :ssh_key, :presence => true
    validates :admin_password, :presence => true
    #validates_inclusion_of :num_nodes, :in => [1,2,4,8]
    #validates :domain_partition_count, :inclusion => {:in => [0,1,2,4]}

    validate :admin_password_complexity
    validate :server_count_correct
    validate :domain_partition_correct

    def init
      self.enable_admin_console ||= true
      self.provision_otd ||= true
      self.level ||= 'PAAS'
      self.subscription_type ||= 'HOURLY'
      self.edition ||= 'EE'
      self.num_nodes ||= 1
    end

    def server_count_correct
      if ![1,2,4,8].include?(num_nodes.to_i) then errors.add :num_nodes, "Invalid server count" end
    end

    def domain_partition_correct
      if ![0,1,2,4].include?(domain_partition_count.to_i) then errors.add :domain_partition_count, "Invalid Domain Partition Count" end
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
      'Oracle Java Cloud Service'
    end

    def pretty_size
      if config && config.is_a?(Hash) && config.key?('shape')
        config['shape']
      end
    end

    # These should be constants, can't work out
    # how to access them that way though
    def self.provider
      "OracleCloud"
    end

    def provider
      "OracleCloud"
    end

    def fog_type
      "Java"
    end

    def instance_type
      "CpOraclecloud::JavaInstance"
    end

    def instance_name
      "service_name"
    end

  end
end