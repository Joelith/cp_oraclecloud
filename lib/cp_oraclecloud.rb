require "cp_oraclecloud/engine"

module CpOraclecloud
  # Your code goes here...
  mattr_accessor :username
  mattr_accessor :password
  mattr_accessor :domain
  mattr_accessor :compute_api
  mattr_accessor :storage_api
  mattr_accessor :region
  mattr_accessor :active_components

	def self.setup
    yield self
  end
end
