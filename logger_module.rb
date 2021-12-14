## Create a module to introduce logging features to any Ruby application. This module contains two methods:
# log(message): Logs the message to the standard output with INFO level.
# log(message, level): Logs the message to the standard output with the specific level. 
# Available levels are: DEBUG, INFO, WARN, ERROR, FATAL. 
# If the specific level is not part of the list of available level, then the method should throw an error message.

module Logger
    def log (message, level="INFO")
        case level
        when "DEBUG"
            puts "DEBUG: #{message}"
        when "INFO"
            puts "INFO: #{message}"
        when "WARN"
            puts "WARN: #{message}"
        when "ERROR"
            puts "ERROR: #{message}"
        when "FATAL"
            puts "FATAL: #{message}"
        else
            raise "Invalid level"
        end
    end
end

class BookStore
    include Logger
end

begin
    bookstore = BookStore.new
    bookstore.log("Log default level")
    bookstore.log("Log INFO level", "INFO")
    bookstore.log("Log WARN level", "WARN")
    bookstore.log("Log ERROR level", "ERROR")
    bookstore.log("Log FATAL level", "FATAL")
    bookstore.log("Log invalid level", "INVALID")
rescue Exception => e
    puts e.message
end