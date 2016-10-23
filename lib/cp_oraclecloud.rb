require "cp_oraclecloud/engine"

module CpOraclecloud
  # Your code goes here...

	FOG_CONFIG = YAML.load_file(File.expand_path "../../config/config.yml", __FILE__)[Rails.env].symbolize_keys!

end
