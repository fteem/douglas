# Douglas

[![Active Development](https://img.shields.io/badge/Maintenance%20Level-Actively%20Developed-brightgreen.svg)](https://gist.github.com/cheerfulstoic/d107229326a01ff0f333a1d3476e068d)

**Status: Under heavy development**

Douglas is a Ruby gem that adds the ability to easily add `created_by` and
`updated_by` attributes to any ActiveRecord model.
It allows easy user-stamping for any Active Record model.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'douglas'
```

And then execute:

    $ bundle


## Usage

### Built-in generator

When added in a Rails application, Douglas adds a generator which enables the users
to easily generate migrations which need to be stamped.

To generate these migrations, you can use Douglas' `table` generator:

```
rails generate douglas:table NAME
```

This will generate a migration:

```
create  db/migrate/20170322225126_add_created_by_and_updated_by_to_<model-name>.rb
```

The contents of this migration will be:

```ruby
class AddCreatedByAndUpdatedByTo<model-name> < ActiveRecord::Migration[5.0]
  def change
    add_column :<model-name>, :created_by, :integer
    add_column :<model-name>, :updated_by, :integer

    add_index :<model-name>, :created_by
    add_index :<model-name>, :updated_by
  end
end
```

### Plug it into a controller

In your `ApplicationController` add a `before_action`:

```ruby
class ApplicationController
  before_action :set_douglas_the_stamper
end
```

This will enable `Douglas` to know the current user that peroforms the action (create/update) on an model object.

### Use it in models

In the model (that you ran the generate task for), add this:

```ruby
class User < ApplicationRecord
  has_stamps
end
```

This will populat the `created_by` and `updated_by` attributes accordintly. Under
the hood this injects callbacks that are executed before create and update.

### Use it in console

Since the `{created,updated}_by` columns cannot be `null` it means that the `Douglas.the_stamper` has to always be set to a value. This is normally done via the controller `before_filter` method, but in console you have to use the `Douglas.with_stamper` method. This method expects two arguments, an identifier of the user that does the action and a block. This means that the user will be logged as the person that has done the actions within the block.

For example:

```
>> Douglas.with_stamper(123) do
?>   p = Post.first
>>   p.body = 'Lorem ipsum dolor sit amet''
>>   p.save
>> end
```

The `Post` will be updated, and the `updated_by` attribute will be set to the first passed argument - `123`.

## Progress

- [x] Add migrations generator (https://github.com/fteem/douglas/pull/1)
- [x] Find way to hijack `current_user` and store in `RequestStore`
- [x] Find way to plug-in `Douglas` in model lifecycle
- [ ] Make it work with Rails.version < 3.2
- [ ] Make logged attribute (currently `id`) to be configurable
- [ ] Add `deleted_by` attribute?

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/douglas. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Why Douglas?

Named after [Douglas "Doug" **Stamper**](http://house-of-cards.wikia.com/wiki/Doug_Stamper),
President Frank Underwood's White House Chief of Staff and former director of strategy.

![](http://thediscussion.net/main/wp-content/uploads/2014/08/Doug-n-Brick-S1.gif)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

