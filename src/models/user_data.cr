require "json"

class UserData
  include JSON::Serializable

  property id : Int32
  property name : String
  property age : Int32
end
