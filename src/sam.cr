require "../config/initializers/database" # here load jennifer and all required configurations
require "sam"
require "jennifer/adapter/postgres"
require "../db/migrations/*"

load_dependencies "jennifer"

# ...

Sam.help
