require "../models/*"

def create(user_data : UserData)
  User.create(
    name: user_data.name,
    age: user_data.age
  )
end

def find_all
  User.all
end

def find_by_id(id : Int32)
  user = User.find!(id) #TODO: modify to #find() when handle exception in controller
end

def update(id, user_data : UserData)
  User.where { _id == id }.update(
    name: user_data.name,
    age: user_data.age,
    updated_at: Time.local
  )
  find_by_id(id)
end

def delete(id : Int32)
  User.delete(id)
end
