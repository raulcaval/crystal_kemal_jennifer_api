require "../services/user_service"

BASE_ENDPOINT = "/users"

post BASE_ENDPOINT do |env|
  env.response.content_type = "application/json"

  user_data = UserData.from_json(env.request.body.not_nil!)
  user = create(user_data)

  env.response.status_code = 201 # Created
  user.to_json(%w[id name age])  # only: id name age
end

get BASE_ENDPOINT do |env|
  env.response.content_type = "application/json"

  users = find_all()

  env.response.status_code = 200 # ok
  users.to_json(%w[id name age]) # only: id, name, age
end

put BASE_ENDPOINT + "/:id" do |env|
  env.response.content_type = "application/json"

  id = env.params.url["id"].to_i32
  # TODO:handle exception if user not exist
  user_data = UserData.from_json(env.request.body.not_nil!)
  updated_user = update(id, user_data)

  env.response.status_code = 200                   # ok
  updated_user.to_json(%w[id name age updated_at]) # only: id, name, age, updated_at
end

delete BASE_ENDPOINT + "/:id" do |env|
  id = env.params.url["id"].to_i32
  # TODO:handle exception if user not exist
  env.response.status_code = 204 # No Content
  delete(id)
end
