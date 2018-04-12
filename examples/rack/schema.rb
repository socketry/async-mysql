
gem 'pg', '~> 0.18'

if defined?(Falcon)
	$stderr.puts "Loading async/mysql"
	require_relative '../lib/async/mysql'
end

require 'active_record'

ActiveRecord::Base.establish_connection(adapter: "mysqlql", database: "test", pool: 1024)
# ActiveRecord::Base.logger = Logger.new(STDOUT)
