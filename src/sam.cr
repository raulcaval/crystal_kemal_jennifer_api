require "../config/initializers/database" # here load jennifer and all required configurations
require "sam"
require "jennifer/adapter/postgres"
load_dependencies "jennifer"

# ...

Sam.help
