class Migration1
    include Clear::Migration1

    def change(direction)
        direction.up do 
            execute()
        end
    
        direction.down do
            execute()
        end
    end
end