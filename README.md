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
end
```
## Contributing
1. Fork it ( https://github.com/Joelith/cp_oraclecloud )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
