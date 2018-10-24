$stdout.puts('Welcome to Console Paint',
	'Use the commands: ',
	'* C to set the dimensions of the canvas',
	'* L to make lines',
	'* R to make rectangles')

load 'Canvas.rb'
load 'Implemented_Commands.rb'
load 'Command_Validation.rb'
load 'Drawing_Tool.rb'
load 'User_input.rb'

commands = DrawingTool.new
commands.run
