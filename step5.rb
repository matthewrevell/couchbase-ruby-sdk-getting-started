# Couchbase Ruby SDK quick-start part 5

require 'couchbase'

# Connect to the database
db = Couchbase.connect(:hostname => "localhost", :key_prefix => "swag_")

# Delete a document
db.delete("NOTEBOOK")