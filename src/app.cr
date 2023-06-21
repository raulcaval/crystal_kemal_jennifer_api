# TODO: Write documentation for `SimpleCrystalApp`
module SimpleCrystalApp
  VERSION = "0.1.0"

  # TODO: Put your code here
end

require "kemal"
require "jennifer"
require "jennifer/adapter/postgres"
require "../config/*"
require "./models/**"
require "json"

get "/" do
  "Hello World!"
end

post "/user" do |env|
  env.response.content_type = "application/json"

  name = env.params.json["name"].as(String)
  age = env.params.json["age"].as(Number)

  user = User.new({:name => "#{name}", :age => "#{age}"})
  user.save

  env.response.status_code = 201 # Created
end

get "/users" do |env|
  env.response.content_type = "application/json"

  users = User.all
  result = Array(UserData).from_json(users.to_json)

  env.response.status_code = 200 # ok
  result.to_json
end

Kemal.run
