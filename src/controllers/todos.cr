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

  # before_all "/todos" do |env|
  #   # Support CORS and set responses to JSON as default.
  #   headers env, {
  #     "Access-Control-Allow-Origin"  => "*",
  #     "Content-Type"                 => "application/json",
  #     "Access-Control-Allow-Headers" => "Content-Type",
  #   }
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

  getter(todo : Todo?) { find_todo }

  # setter
  # property

  # GET /todos
  def index
    render json: Todo.query.select.to_a
  end

  # POST /todos
  def create
    Todo.new(JSON.parse(request.body.as(IO))).save!
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

  # ============================================
  #              Helper Methods
  # ============================================

  def find_todo
    Todo.find!(route_params["id"])
  end
end
