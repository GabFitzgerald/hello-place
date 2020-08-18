class Todo
  include Clear::Model

  column todo : String
  column completed : Bool

  column id : Int32, primary: true, presence: false
end
