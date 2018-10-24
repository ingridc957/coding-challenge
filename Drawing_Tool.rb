class DrawingTool
def initialize
	@canvas = Canvas.new
end
	def run
		while 1 == 1
			user_input = User_Input.new(@canvas)
			puts 'Plese enter your command'
			command = gets.chomp
			user_input.interpreter(command)
		end
	end
end
