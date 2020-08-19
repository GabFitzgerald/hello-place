require "../spec_helper"
# require "/src/controllers/todos.cr"

describe Todos do
  todo1 = Todo.new
  todo2 = Todo.new

  Spec.before_each do
    todo1 = Todo.new
    todo1.completed = false
    todo1.title = "Test todo 1"
    todo1.save

    todo2 = Todo.new
    todo2.completed = false
    todo2.title = "Test todo 2"
    todo2.save
  end

  Spec.after_each do
    todo1.delete
    todo2.delete
  end

  with_server do
    it "should successfully request /todos" do
      result = curl("GET", "/todos")
      
      result.success?.should be_true
      # status_code(result).should eq(200)
    end

    # it "should delete a todo" do
    #   # instantiate the controller
    #   context = context("DELETE", "/todos/#{todo1.id}/")
    #   context.route_params = {"id" => todo1.id.not_nil!}
    #   app = Todo.new(context)
  
    #   # Test the instance method of the controller
    #   app.destroy
  
    #   # Check only one is returned
    #   response = IO::Memory.new
    #   app = Todo.new(context("GET", "/todos", response_io: response))
  
    #   # Test the instance method of the controller
    #   app.index
    #   response.to_s.split("\r\n").reject(&.empty?)[-1].should eq(
    #     %([{"completed"=false,"todo"="Test todo 1"}])
    #   )
    # end

  end
end
