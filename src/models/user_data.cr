require "jennifer_twin"
require "json"
require "./user"

class UserData
  include JenniferTwin
  include JSON::Serializable

  map_fields(User)
end
