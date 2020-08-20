require "clear"

class Migration1
  include Clear::Migration

  def change(direction)
    direction.up do
      execute("CREATE TABLE todos (
                id serial NOT NULL PRIMARY KEY,
                title text,
                completed bool DEFAULT false,
                \"order\" int,
                url text
            );")
    end

    direction.down do
      execute("DROP TABLE todos")
    end
  end
end
