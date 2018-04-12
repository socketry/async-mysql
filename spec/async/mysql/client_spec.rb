
require 'async/mysql/client'

RSpec.describe Async::MySQL::Client do
	include_context Async::RSpec::Reactor
	
	let(:connection) {Async::MySQL::Client.new(host: 'localhost', database: 'test')}
	
	it "should execute query" do
		reactor.async do
			results = connection.query("SELECT 42 AS LIFE")
		
			expect(results.each.to_a).to be == [{"LIFE" => 42}]
			
			connection.close
		end
	end
end
