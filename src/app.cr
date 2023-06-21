# TODO: Write documentation for `SimpleCrystalApp`
module SimpleCrystalApp
  VERSION = "0.1.0"

  # TODO: Put your code here
end

require "kemal"
require "jennifer"
require "../config/*"
require "./models/*"

get "/" do
  "Hello World!"
end

post "/user" do |env|
  env.response.content_type = "application/json"

  name = env.params.json["name"].as(String)
  age = env.params.json["age"].as(Number)

  user = User.new({:name => "#{name}", :age => "#{age}"})
  user.save
  env.response.status_code = 201 #Created
end

Kemal.run
