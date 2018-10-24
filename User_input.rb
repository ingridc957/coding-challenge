class User_Input
	def initialize(canvas_object)
		@canvas = canvas_object

	end

	def tool(command)
		@tool = command.split[0]
	end

	def parameters(command)
		@parameters = command.split.drop(1)
	end

	def parameters_as_numbers
		parameters0 = []
		@parameters.each do |val|
			parameters0 <<  eval(val)
			@parameters = parameters0
		end
	end

	def interpreter(command)
		self.tool(command)
		self.parameters(command)

		validation_object = CommandValidation.new(@canvas, @parameters)
		implemented_object = ImplementedCommands.new(@canvas)

		case @tool
		when 'C'
			if validation_object.validation_canvas
				self.parameters_as_numbers
				implemented_object.set_canvas(@parameters)
				@canvas.blank_canvas
			end
		when 'L'
			if validation_object.validation_line
				self.parameters_as_numbers
				implemented_object.make_line(@parameters)
				@canvas.print_draw
			end
		when 'R'
			if validation_object.validation_rectangle(@parameters)
				self.parameters_as_numbers
				implemented_object.make_rectangle(@parameters)
				@canvas.print_draw
			end
			# # when 'B'
			# ValidationCommand.new.validation_bucket_fill(command)
		when 'Q'
			if validation_object.validation_quit(@parameters)
				implemented_object.quit
			end
		else puts 'it is not an implemented command'
		end
	end
end
