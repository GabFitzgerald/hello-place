require "../models/todos.cr"

class Todos < Application
  base "/todos"

  getter todo : Todo { find_todo }

  # GET /todos
  def index
    render json: Todo.query.select.to_a
  end

  # POST /todos
  def create
    new_todo = Todo.new(JSON.parse(request.body.as(IO))).save!
    # fix for production/dev environment
    new_todo.url = "http://localhost:3000/todos/#{new_todo.id}"
    new_todo.save!
    output(new_todo)
  end

  # GET /todos/:id
  def show
    output
  end

  # PATCH /todos/:id
  # update a specific todo
  def update
    changes = JSON.parse(request.body.as(IO)).as_h

    changes.each do |key, value|
      begin
        case key
        when "title"
          todo.title = value.to_s
        when "completed"
          todo.completed = value.as_bool
        when "order"
          todo.order = value.as_i
        end
      rescue NilAssertionError
      end
    end

    todo.save
    output
  end

  # DELETE /todos/:id
  def destroy
    todo.delete
    output
  end

  # DELETE /todos (for todobackend.com compliance)
  delete "/" do
    Todo.query.select.each { |todo| todo.delete }
    output({} of String => String)
  end

  options "/" { cors_access }

  options "/:id" { cors_access }

  # ============================================
  #              Helper Methods
  # ============================================

  def find_todo
    Todo.find!(route_params["id"])
  end

  def cors_access
    response.headers["Access-Control-Allow-Methods"] = "GET,POST,DELETE,OPTIONS,PATCH"
  end

  def output(todo = todo)
    render text: todo.to_json
  end
end
