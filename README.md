# Rubyminer

The gem ruby miners, adds a custom view for your scaffolds. Also blog and notification generators are available if you want to include notification and blog system in your application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubyminer'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rubyminer

## Usage

For notifications run the generator:
    ``$ rails g notification``
    
This will give you all the required models and controller that gives your app the feature to use notification. Notifications will be specific to users. The developer can modify the message and the url that the notification is meant to redirect from this module. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rubyminer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/rubyminer/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rubyminer project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rubyminer/blob/master/CODE_OF_CONDUCT.md).
