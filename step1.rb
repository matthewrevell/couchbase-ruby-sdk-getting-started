# Couchbase Ruby SDK quick-start part 1

require 'csv'
require 'couchbase'

class StockList

	def initialize
		@list = { }
	end
		

	def import_csv(filename, db)
		CSV.foreach(filename, headers: true) do |row|
			@list[row[0].strip] = [row[1].strip, row[2].to_i] unless row.empty?				
		end
	end
	
	def all
		@list.each { |key, value| puts key, value }
	end
	
	def find(key)
		puts key
		puts @list[key]
	end
	
	def save(db)
		@list.each do |key, array|
			doc = {"Description" => array[0], "Quantity" => array[1]}
			db.set(key, doc)
		end
	end
	
		
end

db = Couchbase.connect(:hostname => "localhost", :key_prefix => "swag_")

stock_list = StockList.new
stock_list.import_csv("stock.csv", db)
stock_list.all
stock_list.save(db)

item = db.get("STICKERCBLOGO")

puts "#{item['Description']}, Quantity: #{item['Quantity']}"