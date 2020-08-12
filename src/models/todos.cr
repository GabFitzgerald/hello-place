class ToDo
  include Clear::Model

  column completed : Bool
  column todo : String

  column id : Int32, primary: true, presence: false
end
