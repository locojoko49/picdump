# select pictures to be moved to specified subfolders,
# all within a readymade master folder of unsorted pictures,
# creating the subfolders as necessary

require 'fileutils'

# modules
require './detect'
require './utils'

class Dump
	def initialize
		@folders = {}
		@pictures = {}
	end
	
	def live
		loop do
			prompt
			output
			complete
		end
	end
	
	def prompt
		# sets the main context for the app
		puts "Select a master folder"; @folders[:master] = gets.strip
		# chooses the subfolder to be used or created if needed
		puts "Select a subfolder"; @folders[:sub] = gets.strip
		# gets the group of pictures to be sorted
		puts "Select some pictures (separate by comma, ', ')"
		pictures = gets; num = 1; pictures.split(", ").each do |pic|
			@pictures["pic_#{num}".to_sym] = pic.strip; num += 1
		end
	end
	
	def output
		puts @folders
		puts @pictures
	end
	
	def complete
		puts "Finish?"
		answer = gets.strip
		case answer
			when "Y", "Yes", "yes", "yeah", "yay", "y"
				exit
			when "N", "No", "no", "nay", "nah", "na", "n"
				puts "\n\n"
		end
	end
end
