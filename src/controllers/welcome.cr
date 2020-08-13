require "xml"

class Welcome < Application
  base "/"

  def index
    welcome_text = "ToDo List"
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

class New < Application
  base "/new"

  def index
    welcome_text = "New To Do"
    Log.warn { "logs can be collated using the request ID" }

    # You can use signals to change log levels at runtime
    # USR1 is debugging, USR2 is info
    # `kill -s USR1 %APP_PID`
    Log.debug { "use signals to change log levels at runtime" }

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
end 
