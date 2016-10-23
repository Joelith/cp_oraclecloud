# CpOraclecloud
Short description and motivation.

## Usage
How to use my plugin.

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
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
