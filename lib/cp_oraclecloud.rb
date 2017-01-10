require "cp_oraclecloud/engine"

module CpOraclecloud
	extend ActiveSupport::Autoload

  mattr_accessor :username
  mattr_accessor :password
  mattr_accessor :domain
  mattr_accessor :compute_api
  mattr_accessor :storage_api
  mattr_accessor :region
  mattr_accessor :active_components
  mattr_accessor :rate_card

  autoload :DatabaseMixin
  autoload :JavaMixin
  autoload :SoaMixin
  autoload :ComputeMixin

	def self.setup
    yield self
  end

  def self.to_s
    "Oracle Cloud"
  end 
end
	