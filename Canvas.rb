class Canvas

	def initialize
		@draw = []
		@canvas_size = nil
	end

	def draw
		@draw
	end
	def modify_drawing(new_draw)
		@draw = new_draw
	end
	def print_draw
		@draw.each do |linea|
			puts linea
		end
	end

	def blank_canvas
		width = @canvas_size[:width]
		height = @canvas_size[:height]

		@draw << '-'*(width + 2)
		height.times {
			@draw << '|' + ' '*width + '|'
		}
		@draw << '-'*(width + 2)

		self.print_draw
	end

	def set_canvas_size(new_size)
		@canvas_size = new_size
	end

	def canvas_size
		@canvas_size
	end

end
