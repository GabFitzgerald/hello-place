require "spec"

# Your application config
# If you have a testing environment, replace this with a test config file
require "../src/config.cr"
require "./test_config.cr"


# Helper methods for testing controllers (curl, with_server, context)
require "../lib/action-controller/spec/curl_context"

require "../src/models/*"
require "../src/controllers/*"