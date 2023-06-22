# TODO: Write documentation

require "../config/config"


get "/" do |env|
  env.response.content_type = "application/json"
  {server_status: "Ok"}.to_json
end


Kemal.run
