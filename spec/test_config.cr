# Dependent libs
require "clear"
require "simple_retry"

require "action-controller"
require "action-controller/server"

# Set up testing env
require "../src/db/migrations/*"
require "../src/constants.cr"




SimpleRetry.try_to(max_attempts: 10, retry_on: DB::ConnectionRefused) do
  # Connect to PG
    Clear::SQL.init(App::PG_DATABASE_URL,
        connection_pool_size: 5)
end

# Run the Migration
Clear::Migration::Manager.instance.apply_all