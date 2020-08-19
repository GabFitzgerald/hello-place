require "../models/todos.cr"

class Todos < Application
  base "/todos"

  getter todo : Todo { find_todo }
  # setter
  # property

  # GET /todos
  def index
    render json: Todo.query.select.to_a
    # respond_with do
    #   html template("todos.ecr")
    # end
  end

  # GET /todos/new

  # POST /todos
  def create
    new_todo = Todo.new(JSON.parse(request.body.as(IO))).save!
    new_todo.url = "http://localhost:3000/todos/#{new_todo.id}"
    new_todo.save!
    render text: new_todo.to_json
  end

  # GET /todos/:id
  def show
    render text: todo.to_json
  end

  # PATCH /todos/:id
  # update a specific todo
  def update
  end

  # PUT /todos/:id
  # replace a specific todo
  def replace
  end

  # DELETE /todos/:id
  def destroy
    todo.delete
    render text: todo.to_json 
  end

  delete "/" do 
    Todo.query.select.each { |todo| todo.delete }
    render text: ({} of String => String).to_json
  end

  options "/", :option_todo do 
    response.headers["Access-Control-Allow-Methods"] = "GET,HEAD,POST,DELETE,OPTIONS,PUT,PATCH"  
  end

  options "/:id", :option_todo_id do
    response.headers["Access-Control-Allow-Methods"] = "GET,HEAD,POST,DELETE,OPTIONS,PUT,PATCH"
  end

  # ============================================
  #              Helper Methods
  # ============================================

  def find_todo
    Todo.find!(route_params["id"])
  end
end
