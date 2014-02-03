# Couchbase Ruby SDK quick-start part 4

require 'couchbase'

# Connect to the database
db = Couchbase.connect(:hostname => "localhost", :key_prefix => "swag_")

# Try replacing the NOTEBOOK document
key = "NOTEBOOK"
document = {"Description" => "Red leather-bound notebook with Couchbase logo", "Quantity" => 10}
db.replace(key, document)

# Try replacing a document that doesn't exist
key = "COFFEEMUG"
document = {"Description" => "Matte red coffee mug with Couchbase logo", "Quantity" => 109}
db.replace(key, document)