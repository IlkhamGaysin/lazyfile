# Lazyfile

Simple test task for [Mediapeers](https://www.mediapeers.com)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lazyfile', git: "https://github.com/IlkhamGaysin/lazyfile"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lazyfile

## Usage

```ruby

# We need a helper method that we can include in any class.
# The helper should accept a block and assign objects of lazy-temp files to each
# argument of this block, no matter how many arguments there are.
#
# For example:

with_lazyfiles do |file1, file2, file3|
  file2.write "hello"
end

# What are lazy-temp files?
# Temp files should not be created until they used inside block. In current
# example, file1 and file3 will never physically created, since they not used.
# Otherwise lazy-temp files should work similar to Tempfile from ruby stdlib.
# Also, all names of temp files (in file system) should start with "mediapeers".
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/IlkhamGaysin/lazyfile.

