require "../models/todos.cr"

class Todos < Application
  base "/todos"

  ################################################
  # CORS setup
  ################################################
  # def todo_url(id)
  #   "#{TODOS_URI}/#{id}"
  # end

  # def repr(todo, base_url)
  #   {uid:       todo._id,
  #     title:     todo.title,
  #     order:     todo.order,
  #     completed: todo.completed,
  #     url:       base_url + todo_url(todo._id),
  #   }
  # end

  # def before_all "/todos" do |env|
  #   # Support CORS and set responses to JSON as default.
  #   headers env, {
  #     "Access-Control-Allow-Origin"  => "*",
  #     "Content-Type"                 => "application/json",
  #     "Access-Control-Allow-Headers" => "Content-Type",
  #   }
  # end

  # before_action :before_all 

  

  # ,HEAD,POST,DELETE,OPTIONS,PUT,PATCH

  # options "/:id", :option_task_id do
  #   response.headers["Access-Control-Allow-Methods"] = "GET,HEAD,POST,DELETE,OPTIONS,PUT,PATCH"
  # end

  # before_action :setup_cors

  # def setup_cors
  #     "Access-Control-Allow-Origin"  => "*",
  #     "Content-Type"                 => "application/json",
  #     "Access-Control-Allow-Headers" => "Content-Type"
  # end

  # before_all "/todos/:id" do |env|
  #   # Support CORS and set responses to JSON as default.
  #   headers env, {
  #     "Access-Control-Allow-Origin"  => "*",
  #     "Content-Type"                 => "application/json",
  #     "Access-Control-Allow-Headers" => "Content-Type",
  #   }
  # end

  ###########################################################

  getter todo : Todo { find_todo }

  # setter
  # property

  # GET /todos
  def index
    render json: Todo.query.select.to_a
    # respond_with do
    #   html template("todos.ecr")
    # end
    # response.headers["Access-Control-Allow-Methods"] = "GET,HEAD,POST,DELETE,OPTIONS,PUT,PATCH"
  end

  # GET /todos/new


  # POST /todos
  def create
    new_todo = Todo.new(JSON.parse(request.body.as(IO))).save!
    new_todo.url = "http://localhost:3000/todos/#{new_todo.id}"
    new_todo.save!
    return new_todo
    # render new_todo
    # render json: { todo }
    # render :created, text: todo.to_json
  end

  # GET /todos/:id
  def show
    render json: {todo}
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
  end

  options "/", :option_todo do 
    response.headers["Access-Control-Allow-Methods"] = "GET,HEAD,POST,DELETE,OPTIONS,PUT,PATCH"
    # response.["Access-Control-Allow-Origin"]  = "*"
    # response.["Content-Type"]                = "application/json"
    # response.["Access-Control-Allow-Headers"] = "Content-Type"
  
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
