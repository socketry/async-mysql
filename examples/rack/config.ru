
$LOAD_PATH << "../../lib"

gem 'mysql2'
require 'active_record'

if defined?(Falcon)
	$stderr.puts "Loading async/mysql"
	require_relative '../../lib/async/mysql'
	
	ActiveRecord::Base.establish_connection(adapter: "async_mysql", database: "test", pool: 1024)
else
	ActiveRecord::Base.establish_connection(adapter: "mysql2", database: "test", pool: 1024)
end

# ActiveRecord::Base.logger = Logger.new(STDOUT)

run lambda {|env|
	10.times do
		ActiveRecord::Base.connection.execute("SELECT SLEEP(0.01)")
	end
	
	ActiveRecord::Base.clear_active_connections!
	
	[200, {}, ["Hello World"]]
}
