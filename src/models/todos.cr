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

