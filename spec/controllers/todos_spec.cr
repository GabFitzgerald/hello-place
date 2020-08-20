require "../spec_helper"
# require "/src/controllers/todos.cr"

describe Todos do
  todo1 = Todo.new
  todo2 = Todo.new

  Spec.before_each do
    todo1 = Todo.new
    todo1.title = "make todo list"
    todo1.completed = false
    todo1.save

    todo2 = Todo.new
    todo2.title = "practice colouring"
    todo2.completed = false
    todo2.save
  end

  Spec.after_each do
    Todo.query.select.each { |todo| todo.delete }
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

    it "should return correct json on GET /todos" do
      result = curl("GET", "/todos")
      result.body.should eq("[#{todo1.to_json},#{todo2.to_json}]")
    end

    
    # test POST /todos

    it "should successfully post to /todos" do
      body1 = {"title"=>"research graduate schools","completed"=>"false","order"=>"3"}
      result = curl("POST", "/todos", body: body1.to_json )
      result.success?.should be_true
      result.status_code.should eq(200)

      body2 = {"title"=>"be spontaneous","completed"=>"true"}
      result2 = curl("POST", "/todos", body: body2.to_json )
      result2.success?.should be_true
      result2.status_code.should eq(200)
    end

    it "should return correct json on POST /todos" do
      body = {"title"=>"research graduate schools","completed"=>"false","order"=>"3"}
      result = curl("POST", "/todos", body: body.to_json )
      result.body.includes?("research graduate schools").should eq(true)
      result.body.includes?("3").should eq(true)

      body2 = {"title"=>"be spontaneous","completed"=>"true"}
      result2 = curl("POST", "/todos", body: body2.to_json )
      result2.body.includes?("be spontaneous").should eq(true)
      result2.body.includes?("true").should eq(true)
    end


    # test PATCH /todos/:id

    it "should successfully send a PATCH request" do
      body = {"title"=>"create lasting childhood memories"}
      result = curl("PATCH", "/todos/#{todo1.id}", body: body.to_json)
      result.success?.should be_true
      result.status_code.should eq(200)
    end

    it "should update a specific todo" do
      body = {"title"=>"create lasting childhood memories"}
      result = curl("PATCH", "/todos/#{todo1.id}", body: body.to_json)
      result.body.includes?("create lasting childhood memories").should eq(true)
      result.body.includes?("false").should eq(true)
    end


    # test DELETE /todos/:id

    it "should delete a specific todo" do
      result = curl("DELETE", "/todos/#{todo1.id}")
      result.status_code.should eq(200)
    end

    it "should delete a specific todo" do
      result1 = curl("DELETE", "/todos/#{todo1.id}")
      result1.body.should eq("#{todo1.to_json}")
      result2 = curl("DELETE", "/todos/#{todo2.id}")
      result2.body.should eq("#{todo2.to_json}")
    end


    # test DELETE /todos
    it "should delete all todos" do
      result = curl("DELETE", "/todos")
      result.status_code.should eq(200)
    end

    it "should delete all todos" do
      result = curl("DELETE", "/todos")
      result.body.should eq("{}")
    end

  end
end
