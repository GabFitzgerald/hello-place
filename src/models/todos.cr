require "clear"

class Todo
  include Clear::Model

  column title : String
  column completed : Bool?
  column order : Int32?
  column url : String?

  column id : Int32, primary: true, presence: false
end
