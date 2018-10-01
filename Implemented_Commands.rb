class ImplementedCommands
def initialize
  # @draw = []
  @canvas_size
end

  def interpreter(command)
    puts "contenido del canvas a la primera llamada de C#{@canvas_size}"
    tool = command.split[0]
    parameters = command.split.drop(1)
    case tool
      when 'C'
        #Supongo que si el comando es valido se guardan los parametros en @canvas_size
        #lo meto como parametro para validar, si ya hay un canvas que no se reescriba
      @canvas_size = ValidationCommand.new.validation_canvas(@canvas_size, parameters)
      puts "puts in the case C print canvas_size#{@canvas_size}"
      # Si el comando es valido aquí se llama al método para implementarlo
      when 'L'
      validation_result =  ValidationCommand.new.validation_line(parameters)
      when 'R'
        validation_result = ValidationCommand.new.validation_rectangle(parameters)
      # # when 'B'
      # ValidationCommand.new.validation_bucket_fill(command)
      when 'Q'
        ValidationCommand.new.validation_quit(tool, parameters)
      else puts 'it is not an implemented command'
    end
  end

# def canvas()
#
#
# end

def quit
  puts 'Thanks for use our little paint, have a nice day'
  exit
end

end
