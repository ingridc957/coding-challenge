class ValidationCommand

  # def initialize
  #   @canvas_size = {}
  # end

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
