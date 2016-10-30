# CP_OracleCloud
Cloud Portal plugin to support the Oracle Cloud Platform.

## Usage
This is included by default in the Cloud Portal project. It relies on that project and will not work stand-alone. 

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'cp_oraclecloud'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install cp_oraclecloud
```
Configuration options need to be added to an initliazer in your app. Eg: in config/initializers/cp_oraclecloud.rb

```ruby
CpOraclecloud.setup do |config|
  config.username = <username>
  config.password = <password>
  config.domain = <domain>
  config.region = <region, remove if using US data centres>
  config.compute_api = <compute url>
  config.storage_api = <storage url>
  config.active_components = ['Database', 'Java', 'SOA']
  config.rate_card = YAML.load_file(File.expand_path "<path to rate card yml file", __FILE__)[Rails.env].symbolize_keys!

end
```
The *active_components* option configures which components can be created in the cloud. Supported options are 'Database', 'Java' and 'SOA'. Remove any services you aren't subscribed to. 

The *rate_card* option points to where the rate card YML file is located. Add the following to /config/oraclecloud_rate_card.yml to use the default US pricing for the Oracle Cloud (modify to suit your rate card)

```yml
---
defaults: &defaults
  compute:
    hourly: 0.1
  java:
    general:
      standard: 
        monthly: 450
        hourly: 0.75
      enterprise: 
        monthly: 1200
        hourly: 2.02
      suite: 
        monthly: 2800
        hourly: 4.7
    high:
      standard: 
        monthly: 550
        hourly: 0.924
      enterprise: 
        monthly: 1300
        hourly: 2.184
      suite: 
        monthly: 2900
        hourly: 4.872
  soa:
    full: 5500
    api: 3500
    mft: 4500
  database:
    general:
      standard: 
        monthly: 600
        hourly: 1.08
      enterprise: 
        monthly: 3000
        hourly: 5.04
      hp: 
        monthly: 4000
        hourly: 6.72
      xp:
        monthly: 5000
        hourly: 8.401
    high:
      standard: 
        monthly: 700
        hourly: 1.176
      enterprise: 
        monthly: 3100
        hourly: 5.208
      hp: 
        monthly: 4100
        hourly: 6.888
      xp:
        monthly: 5100
        hourly: 8.569

development:
  <<: *defaults

test:
  <<: *defaults

production:
  <<: *defaults
```

## Contributing
1. Fork it ( https://github.com/Joelith/cp_oraclecloud )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
