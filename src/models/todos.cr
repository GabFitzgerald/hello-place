class ToDo < Clear::Model
  include Clear::Model

  column completed : Bool
  column todo : String

  column id : Int32, primary: true, presence: false
end

t = ToDo.new
t.completed = true
t.to = "connect db"

