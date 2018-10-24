class CommandValidation

	def initialize(canvas_object, parameters)
		@canvas = canvas_object
		@parameters = parameters
	end

	def parameters_as_numbers
		parameters0 = []
		@parameters.each do |val|
			parameters0 <<  eval(val)
			@parameters = parameters0
		end
	end

	def canvas_exist
		if @canvas.canvas_size.nil?
			puts 'you need to create a canvas first'
			return(false)
		else
			return(true)
		end
	end

	def multiple_canvas
		if @canvas.canvas_size.nil?
			return(true)
		else
			puts 'there is a canvas already, if you want a new one you must to restart the program'
			return(false)
		end
	end

	def arguments_number(number_parameter)
		if (@parameters.size != number_parameter)
			puts "Expecting #{number_parameter}, parameters you wrote #{@parameters.size}"
			return(false)
		else
			return(true)
		end
	end

	def arguments_integer
		begin
			if !@parameters.all? { |parameter|  eval(parameter).integer?}
				puts 'Invalid arguments, try whit positive integers'
				return(false)
			else
				return(true)
			end
		rescue NameError, TypeError, SyntaxError
			puts 'Invalid arguments, try whit positive integers'
			return(false)
		end
	end

	def arguments_positive
		begin
			if !@parameters.all? { |parameter|  eval(parameter) > 0}
				puts 'Invalid arguments, try whit positive integers'
				return(false)
			else
				return(true)
			end
		rescue NameError, TypeError, SyntaxError
			puts 'Invalid arguments, try whit positive integers'
			return(false)
		end
	end

	def orientation_line
		if (@parameters[0] != @parameters[2]) & (@parameters[1] != @parameters[3])
			puts 'You can\'t draw oblique lines, ensure that the first coordinate it\'s the same at the two points if you want to draw a vertical line or the second one if you want to draw an horizontal line'
			return(false)
		else
			return(true)
		end
	end

	def inside_canvas
		parameters_even = []
		parameters_odd = []

		self.parameters_as_numbers

		@parameters.each_with_index{ |val, idx|
			if idx.even?
				parameters_even << val
			end
			if !idx.even?
				parameters_odd << val
			end
		}
		if  parameters_even.any? { |coordinate|
			coordinate > @canvas.canvas_size[:width] }
			puts 'Your Canvas is not that big'
			return(false)
		elsif parameters_odd.any? { |coordinate|
			coordinate > @canvas.canvas_size[:height]}
			puts 'Your Canvas is not that big'
			return(false)
		else
			return(true)
		end
	end

	def validation_canvas
		if !self.multiple_canvas
			return(false)
		elsif !self.arguments_number(2)
			return(false)
		elsif !self.arguments_integer
			return(false)
		elsif !self.arguments_positive
			return(false)
		else
			return(true)
		end
	end

	def validation_line
		if !self.canvas_exist
			return(false)
		elsif !self.arguments_number(4)
			return(false)
		elsif !self.arguments_integer
			return(false)
		elsif !self.arguments_positive
			return(false)
		elsif !self.inside_canvas
			return(false)
		elsif !self.orientation_line
			return(false)
		else
			return(true)
		end
	end

	def validation_rectangle(command)
		if !self.canvas_exist
			return(false)
		elsif !self.arguments_number(4)
			return(false)
		elsif !self.arguments_integer
			return(false)
		elsif !self.arguments_positive
			return(false)
		elsif !self.inside_canvas
			return(false)
		else
			return(true)
		end
	end

	def validation_quit(parameters)
		if parameters.size != 0
			puts 'if you want to close the program, ingress Q'
			return(false)
		else
			return(true)
		end
	end

end
