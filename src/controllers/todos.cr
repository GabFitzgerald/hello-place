require "action-controller"
require "xml"

class Todos < Application
    base "/todos"

    getter todo : Todo?
  
    # before_action :current_todo, only: [:destroy]
  
    # @todo : Todo?
  
    # getter
    # setter
    # property
  
    def index
      todos = Todo.query.select.to_a

      render json: todos
    end
  
    # POST /todos
    def create
      t = Todo.new
      t.todo = "hard coded todo"
      t.completed = false
      t.save!

    end
  
    # GET /todos/:id
    def show
    end
  
    # GET /todos/:id/edit
    def edit
 
      
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
      todo_id = route_params["id"]
      current_todo = Todo.query.find!{ id == todo_id }
      current_todo.delete

      # redirect_to Todos.index
      #puts current_todo

      # puts current_todo
      # current_todo.destroy
      # head :accepted
      
      # puts todo_id
      # todos = Todo.query
      # todo = todos.find!(todo_id.to_i32)
      
      # todo.destroy
      # query.select("id").destroy

      # Clear::SQL.delete(Todo.id).from("todos").execute
      # todo = current_todo
      # getter(todo, &find_todo)
      # todo = current_todo
      # todo.destroy
      # puts "destroy method ran!!!!"
    end
  
    # ============================================
    #              Helper Methods
    # ============================================
  
    
    def find_todo
      Todo.find!(id)
    end
    
    def current_todo
      
    #   todo_id = route_params["id"]
    #   current_todo = Todo.query.where(id: todo_id)
    #   current_todo
    end 

    # def find_todo : String
    #   id = route_params["id"]
    #   @todo = Todo.find!(id)
    # end
  
    # lazy getter
    # default nilable until its returned
    # getter(todo) { Todo.find!(id) }
    

  
  end
  