require "action-controller"
require "xml"

class Todos < Application
    base "/todos"
  
    # before_action :find_todo
  
    # @todo : Todo?
  
    # getter
    # setter
    # property
  
  
    def index
      # @todos = ToDo.all
      todo = "String from ToDo controller"
      # @todos = ToDo.all
      
      # SELECT * FROM todos
      # query = ToDo.query
      # todos = Todo.query.each do |todo|
      #   "number #{todo.id}: #{todo.todo}"
      # end
      # puts todos.todo
      
      # todos = ["first element"]
      # todos = Todo.query.each do |todo|
      #   "number #{todo.id}: #{todo.todo}"
      # end
  
      welcome_text = "To Do List"
      Log.warn { "logs can be collated using the request ID" }
  
      # You can use signals to change log levels at runtime
      # USR1 is debugging, USR2 is info
      # `kill -s USR1 %APP_PID`
      Log.debug { "use signals to change log levels at runtime" }
  
      respond_with do
        html template("index.ecr")
        text "Welcome, #{welcome_text}"
        json({welcome: welcome_text})
        xml do
          XML.build(indent: "  ") do |xml|
            xml.element("welcome") { xml.text welcome_text }
          end
        end
      end
    end
  
    # GET /todos/new
    def new
      welcome_text = "New To Do"
      respond_with do
        html template("new.ecr")
        text "Welcome, #{welcome_text}"
        json({welcome: welcome_text})
        xml do
          XML.build(indent: "  ") do |xml|
            xml.element("welcome") { xml.text welcome_text }
          end
        end
      end
    end
  
    # POST /todos
    def create
  
    end
  
    # GET /todos/:id
    def show
    end
  
    # GET /todos/:id/edit
    def edit
      respond_with do
        html template("edit.ecr")
        # text "Welcome, #{welcome_text}"
        # json({welcome: welcome_text})
        # xml do
        #   XML.build(indent: "  ") do |xml|
        #     xml.element("welcome") { xml.text welcome_text }
        #   end
        # end
      end
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
      # query = Todo.query
      # query.select("id")
      # query.destroy
      # Clear::SQL.delete(Todo.id).from("todos").execute
      # todo = current_todo
      # getter(todo, &find_todo)
      # todo = current_todo
      # todo.destroy
      puts "destroy method ran!!!!"
    end
  
    # ============================================
    #              Helper Methods
    # ============================================
  
    
    
    
  
    def find_todo
      Todo.find!(id)
    end
    
    # def find_todo : String
    #   id = route_params["id"]
    #   @todo = Todo.find!(id)
    # end
  
    # lazy getter
    # default nilable until its returned
    # getter(todo) { Todo.find!(id) }
    

  
  end
  