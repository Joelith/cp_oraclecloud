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
You need to add some configuration options to a yml file for this plugin to correctly connect to the Cloud Platform. To do so, add the following to config/config.yml:

```yaml
---
defaults: &defaults
  oracle_username: <username>
  oracle_password: <password>
  oracle_domain: <identity domain>
  oracle_compute_api: <compute api>
  oracle_region: <region, remove for us data centre>
  oracle_storage_api: <storage api>
development:
  <<: *defaults

test:
  <<: *defaults

production:
  <<: *defaults
```
## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
