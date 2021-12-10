## Temperature Converter

CONSTANT = 32

# A function that converts temperatures between Celsius and Fahrenheit scales. 
# The function should accept a temperature in Celsius as an argument and return
# the temperature in Fahrenheit and vice versa.

def convert(temperature, scale)
  if scale == "C"
    return (temperature * 9/5) + CONSTANT
  elsif scale == "F"
    return (temperature - CONSTANT) * 5/9
  end
end


toConvert = 32
puts "#{toConvert} Celsius to Fahrenheit: #{convert(toConvert, "C")}"
puts "#{toConvert} Fahrenheit to Celsius: #{convert(toConvert, "F")}"
