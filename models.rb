# Setup DataMapper with a database URL. On Heroku, ENV['DATABASE_URL'] will be
# set, when working locally this line will fall back to using SQLite in the
# current directory.
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/development.sqlite")

# Define a simple DataMapper model.
class Thing
  include DataMapper::Resource

  property :id, Serial, :key => true
  property :created_at, DateTime
  property :title, String, :length => 255
  property :description, Text
end

# Finalize the DataMapper models.
DataMapper.finalize

# Tell DataMapper to update the database according to the definitions above.
DataMapper.auto_upgrade!

if Thing.count == 0
  Thing.create(:title => "Test Thing One", :description => "Sometimes I eat pizza.")
  Thing.create(:title => "Test Thing Two", :description => "Other times I eat cookies.")
end
