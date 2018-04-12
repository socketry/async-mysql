# Async::MySQL

This is an experimental drop in wrapper to make MySQL work asynchronously, including an ActiveRecord connection adapter.

## Motivation

We have some IO bound web APIs generating statistics and we sometimes have issues when using [passenger] due to thread/process exhaustion. In addition, we make a lot of upstream HTTP RPCs and these are also IO bound.

This library, in combination with [async-http], ensure that we don't become IO bound in many cases. In addition, we don't need to tune the intermediate server as it will simply scale according to backend resource availability and IO throughput.

[passenger]: https://github.com/phusion/passenger
[async-http]: https://github.com/socketry/async-http

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'async-mysql'
```

And then execute:

	$ bundle

Or install it yourself as:

	$ gem install async-mysql

## Usage

Use the `async_mysql` adapter, as in `adapter: async_mysql` in your database configuration. This is a drop-in replacement for the MySQL adapter for ActiveRecord. But, it must be used with an [async] capable server like [falcon].

[async]: https://github.com/socketry/async
[falcon]: https://github.com/socketry/falcon

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright, 2018, by Samuel G. D. Williams. <http://www.codeotaku.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
