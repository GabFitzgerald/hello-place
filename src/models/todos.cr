class ToDo
    include Clear::Model
    
    column completed : Bool
    column todo : String
    column due : Time

    column id : Int32, primary: true, presence: false
end
