puts 'Welcome to a little Paint in our console'

load 'Canvas.rb'
load 'Implemented_Commands.rb'
load 'Command_Validation.rb'
load 'Drawing_Tool.rb'
load 'User_input.rb'


commands = DrawingTool.new
commands.run
