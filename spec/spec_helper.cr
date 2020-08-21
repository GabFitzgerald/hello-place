require "spec"

# Your application config
# If you have a testing environment, replace this with a test config file
# require "../src/config"

# Helper methods for testing controllers (curl, with_server, context)
require "../lib/action-controller/spec/curl_context"
require "clear"
require "action-controller"
require "action-controller/server"
require "../src/db/migrations/*"
require "../src/constants.cr"
require "../src/models/*"
require "../src/controllers/*"
# require "../src/*"

# Dependent libs

# # require "simple_retry"



# # Set up testing env



Clear::SQL.init(App::PG_DATABASE_URL,
    connection_pool_size: 5)

# SimpleRetry.try_to(max_attempts: 10, retry_on: DB::ConnectionRefused) do
#   # Connect to PG

# end

# Run the Migration
Clear::Migration::Manager.instance.apply_all