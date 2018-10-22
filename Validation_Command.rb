class ValidationCommand

  # def initialize
  #   @canvas_size = {}
  # end
def canvas_exist
  puts 'you need to create a canvas first' if @figure.nil?
  return(true)
end
  def arguments_number(parameters, number_parameter)
    if (parameters.size != number_parameter)
      puts "Expecting #{number_parameter} parameters you wrote #{parameters.size}"
      return(true)
    end
  end

  def arguments_integer?(parameters)
    begin
      if !parameters.all? { |parameter|  eval(parameter).integer?}
        puts 'Invalid arguments, try whit positive integers'
        return(true)
      end
    rescue NameError, TypeError, SyntaxError
      puts 'Invalid arguments, try whit positive integers'
      return(true)
    end
  end

  def arguments_positive?(parameters)
      begin
        if !parameters.all? { |parameter|  eval(parameter) > 0}
          puts 'Invalid arguments, try whit positive integers'
          return(true)
        end
      rescue NameError, TypeError, SyntaxError
        puts 'Invalid arguments, try whit positive integers'
        return(true)
      end
  end

def parameters_as_numbers (parameters)
  parameters0 = []

  parameters.each do |val|
    parameters0 <<  eval(val)
    end

  return(parameters0)
end


  def orientation_line(parameters)
    parameters = parameters_as_numbers(parameters)

    if parameters[0] != parameters[2] & parameters[1] != parameters[3]
      puts 'You can\'t draw oblique lines, ensure that the first coordinate it\'s the same at the two points if you want to draw a vertical line or the second one if you want to draw an horizontal line'
    return(true)
  end

def inside_canvas(parameters)
  parameters_even = []
  parameters_odd = []

  parameters = parameters_as_numbers(parameters)

  parameters.each_with_index{ |val, idx|
    puts "indice #{idx} valor #{val}"
    if idx.even?
      parameters_even << val
    end
    if !idx.even?
      parameters_odd << val
    end
  }
#Estamos definiendo esta mkda
  if  parameters_even.any? { |coordinate|
    coordinate > @canvas_size[:width] }
    puts 'Your Canvas is not that big'
    return(true)
  end

  if parameters_odd.any? { |coordinate|
    coordinate > @canvas_size[:height]}
    puts 'Your Canvas is not that big'
    return(true)
  end
end

  def validation_canvas(canvas_size, parameters)
    puts "este es el canvas que recibe #{canvas_size}"
    return(puts 'there is a canvas already, if you want a new one you must to restart the program') if !canvas_size.nil?
    return(nil) if arguments_number(parameters, 2)
    return(nil) if arguments_integer?(parameters)
    return(nil) if arguments_positive?(parameters)
    # return
    canvas_size = {width: eval(parameters[0]), height: eval(parameters[1])}
    return (canvas_size)
  end

def validation_line(command)
  puts 'Validacion no implementada'
end

def validation_rectangle(command)
  puts 'Validacion no implementada'
end
# def validation_rectangle(command)
#   puts 'Validacion no implementada'
# end
def validation_quit(tool, parameters)
  if parameters.size != 0
    puts 'if you want to close the program, ingress Q '
  else
    ImplementedCommands.new.quit
  end
end
# def valid_argument_quantity(quantity_arguments)
#
#
# end
end
