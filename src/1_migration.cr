class Migration1
  include Clear::Migration1

  def change(direction)
    direction.up do
      execute("CREATE TABLE todos (
                id serial NOT NULL PRIMARY KEY,
                completed bool,
                todo text
            );")
    end

    direction.down do
      execute("DROP TABLE todos")
    end
  end
end
