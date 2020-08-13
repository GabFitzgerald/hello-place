require "xml"

class Welcome < Application
  base "/"

  def index
    welcome_text = "Welcome to your todo list"
    Log.warn { "logs can be collated using the request ID" }

    # You can use signals to change log levels at runtime
    # USR1 is debugging, USR2 is info
    # `kill -s USR1 %APP_PID`
    Log.debug { "use signals to change log levels at runtime" }

    respond_with do
      html template("welcome.ecr")
      text "Welcome, #{welcome_text}"
      json({welcome: welcome_text})
      xml do
        XML.build(indent: "  ") do |xml|
          xml.element("welcome") { xml.text welcome_text }
        end
      end
    end
  end


end

class ToDos < Application
  base "/todos"

  def index
    # @todos = ToDo.all
    todo = "String from ToDO controller"


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
  end

end 
