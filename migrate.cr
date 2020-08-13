require "./src/db/migrations/1_create_table.cr"
require "clear"

# Clear::SQL.init(default: "postgres://XXX..."

Clear::SQL.init("postgres://gab@localhost/postgres",
  connection_pool_size: 5)

# Clear::Migration::Manager.instance.apply_all

class ToDo
    include Clear::Model
  
    column completed : Bool
    column todo : String
  
    column id : Int32, primary: true, presence: false
end
  
  # seed db?
  t = ToDo.new
  t.completed = true
  t.todo = "connect db"
  t.save!


