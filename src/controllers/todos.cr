require "action-controller"
require "xml"

class Todos < Application
    base "/todos"
    
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

    getter todo : Todo?
  
    # before_action :current_todo, only: [:destroy]
  
    # @todo : Todo?
  
    # getter
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
      todo = Todo.query.find!{id == route_params["id"]}
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
      Todo.query.find!{id == route_params["id"]}.delete
    end
  
    # ============================================
    #              Helper Methods
    # ============================================
  
    
    def find_todo
      Todo.query.find!({id: params["id"]})
    end
  
    # lazy getter
    # default nilable until its returned
    # getter(todo) { Todo.find!(id) }
  
  end
  