class Todo
  include Clear::Model

  column completed : Bool
  column todo : String

  column id : Int32, primary: true, presence: false
end


# seed db?
# t = Todo.new
# t.completed = false
# t.todo = "a thing to do"
# t.save!

