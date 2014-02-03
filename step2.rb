# Couchbase Ruby SDK quick-start part 2

require 'couchbase'

# Connect to the database
db = Couchbase.connect(:hostname => "localhost", :key_prefix => "swag_")

# Read in a document
document, flags, cas = db.get("PENCBLOGO", :extended => true)
puts "Item: #{document["Description"]}. Quantity: #{document["Quantity"]}.\n"

# Change the document
document["Description"] = "Red Couchbase pen with logo"
db.set("PENCBLOGO", document, :cas => cas, :flags => flags)

# Read it again
document, flags, cas2 = db.get("PENCBLOGO", :extended => true)
puts "Item: #{document["Description"]}. Quantity: #{document["Quantity"]}.\n"

# Change the document again, using the old CAS. This will fail.
document["Description"] = "Red ball-point pen with Couchbase logo"
db.set("PENCBLOGO", document, :cas => cas2, :flags => flags)

# Try again using the second CAS value
document["Description"] = "Red Couchbase pen with logo"
db.set("PENCBLOGO", document, :cas => cas2, :flags => flags)


# Read it again
document, flags, cas2 = db.get("PENCBLOGO", :extended => true)
puts "Item: #{document["Description"]}. Quantity: #{document["Quantity"]}.\n"






