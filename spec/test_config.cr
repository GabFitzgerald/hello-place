require "../src/db/migrations/1_create_table.cr"
require "../src/constants.cr"

require "clear"
Clear::SQL.init("postgres://gab@localhost/gab",
    connection_pool_size: 5)

Clear::Migration::Manager.instance.apply_all