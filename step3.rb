# Couchbase Ruby SDK quick-start part 3

require 'couchbase'

# Connect to the database
db = Couchbase.connect(:hostname => "localhost", :key_prefix => "swag_")

# Add but don't overwrite a document
key = "NOTEBOOK"
document = {"Description" => "Red leather-bound notebook", "Quantity" => 297}
db.add(key, document)

# Try adding another document with the same key
key = "NOTEBOOK"
document = {"Description" => "Red leather-bound notebook with Couchbase logo", "Quantity" => 10}
db.add(key, document)
