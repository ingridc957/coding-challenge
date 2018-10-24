class ImplementedCommands
	def initialize(canvas_object)
		@canvas = canvas_object
	end

	def set_canvas (parameters)
		@canvas.set_canvas_size({width: parameters[0], height: parameters[1]})
		puts "The size canvas was set as: \n #{@canvas.canvas_size}"
	end

	def make_line (parameters)
		x1 = parameters[0]
		y1 = parameters[1]
		x2 = parameters[2]
		y2 = parameters[3]

		if y1 == y2
			z1 = [x1, x2].min
			z2 = [x1, x2].max
			@canvas.draw[y1][z1..z2]='X'*(z2-z1+1)
		end
		if x1 == x2
			z1 = [y1, y2].min
			z2 = [y1, y2].max
			for element in Array(z1..z2)
				@canvas.draw[element][x1]='X'
			end
		end
		@canvas.modify_drawing(@canvas.draw)
	end

	def make_rectangle(parameters)
		line = Array.new(parameters)
		line[2] = line[0]
		self.make_line(line)
		line = Array.new(parameters)
		line[0] = line[2]
		self.make_line(line)
		line = Array.new(parameters)
		line[1] = line[3]
		self.make_line(line)
		line = Array.new(parameters)
		line[3] = line[1]
		self.make_line(line)
	end

def bucket_fill

end

	def quit
		$stdout.puts ('You have left the program.' 'Have a nice day.')
		exit
	end

end
