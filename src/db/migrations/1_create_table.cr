require "clear"

class Migration1
  include Clear::Migration

  def change(direction)
    direction.up do
      execute("CREATE TABLE to_dos (
                id serial NOT NULL PRIMARY KEY,
                completed bool,
                todo text
            );")
    end

    direction.down do
      execute("DROP TABLE to_dos")
    end
  end
end
