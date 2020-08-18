require "../spec_helper"
# require "/src/controllers/todos.cr"

describe Todos do
  todo1 = Todo.new
  todo2 = Todo.new

  Spec.before_each do
    todo1 = Todo.new
    todo1.completed = false
    todo1.todo = "Test todo 1"
    todo1.save

    todo2 = Todo.new
    todo2.completed = false
    todo2.todo = "Test todo 2"
    todo2.save
  end

  # Spec.after_each do
  #   todo1.destroy
  #   todo2.destroy
  # end

  it "should return a list of todos" do
  end
end
