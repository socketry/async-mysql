# frozen_string_literal: true

require "active_record/connection_adapters/mysql2_adapter"

module ActiveRecord
	module ConnectionHandling
		def async_mysql_connection(config)
			config = config.symbolize_keys
			
			if config[:flags].kind_of? Array
				config[:flags].push "FOUND_ROWS".freeze
			else
				config[:flags] ||= 0
				config[:flags] |= Mysql2::Client::FOUND_ROWS
			end
			
			client = Async::MySQL::Client.new(config)
			ConnectionAdapters::Mysql2Adapter.new(client, logger, nil, config)
		rescue Mysql2::Error => error
			if error.message.include?("Unknown database")
				raise ActiveRecord::NoDatabaseError
			else
				raise
			end
		end
	end
end
