env = ARGV[0] || "development"

require 'dotenv'
Dotenv.load(File.expand_path("../.env.#{env}", __dir__))
require 'sequel'
#require 'pry'

begin
#connection
DB = Sequel.connect(ENV['DATABASE_URL'])

#create table
DB.create_table :clients do
  primary_key :id
  String :name
  String :email
  String :owner_name
  String :namespace
  String :token
  TrueClass :is_active, null: false, default: false
  DateTime :created_at
  DateTime :updated_at
end

DB.disconnect
end
#binding.pry
