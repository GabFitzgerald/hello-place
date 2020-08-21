require "../spec_helper"

describe Todo do
  it "should save and destroy todos" do
    todo = Todo.new
    todo.title = "make a will"
    todo.completed = false
    todo.order = 100

    begin
      todo.save!
    rescue e
      puts todo.errors
      raise e
    end

    results = [] of Todo

    Todo.query.select.to_a.each { |i| results << i }

    results.map(&.id).includes?(todo.id).should eq(true)

    todo.delete
  end

  it "should instantiate a todo using JSON" do
    # todo = Todo.from_json(%({"title":"make a will"}))
    # todo.title.should eq("make a will")
    # # booking.extension_data.to_json.should eq(%({"test":"data"}))
    # todo.delete
  end
end
