require "../spec_helper"
# require "/src/controllers/todos.cr"

describe Todos do
  todo1 = Todo.new
  todo2 = Todo.new

  Spec.before_each do
    todo1 = Todo.new
    todo1.title = "Test todo 1"
    todo1.completed = false
    todo1.save

    todo2 = Todo.new
    todo2.title = "Test todo 2"
    todo2.completed = false
    todo2.save
  end

  Spec.after_each do
    todo1.delete
    todo2.delete
  end

  with_server do

    # test GET /todos

    it "should successfully request /todos" do
      result = curl("GET", "/todos")
      result.success?.should be_true
    end

    it "should get a 200 status code on GET /todos" do
      result = curl("GET", "/todos")
      result.status_code.should eq(200)
    end

    pending "should return correct json on GET /todos" do
      result = curl("GET", "/todos")
      # this is wrong (fix)
      JSON.parse(result.body)["title"].should eq("todo.title")
    end

    
    # test POST /todos
    pending "should successfully post to /todos" do
      result = curl("POST", "/todos")
      result.success?.should be_true
    end

    pending "should get a 200 status code on POST /todos" do
      result = curl("POST", "/todos")
      result.status_code.should eq(200)
    end

    pending "should return correct json on POST /todos" do
      # TODO
    end

  

    # test PATCH /todos/:id



    # test DELETE /todos/:id



    # test DELETE /todos
    it "should delete all todos" do
      result = curl("DELETE", "/todos")
      result.status_code.should eq(200)
    end

    it "should delete all todos" do
      result = curl("DELETE", "/todos")
      todos = result.body
      todos.should eq("{}")
    end

  end
end
