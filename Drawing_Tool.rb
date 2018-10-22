class DrawingTool
	# out = ''
	# while out == ''
	while 1 == 1
		puts 'Plese enter your command'
		command = gets.chomp
		ImplementedCommands.new.interpreter(command)
	end
end
