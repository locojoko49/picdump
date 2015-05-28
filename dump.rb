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
		end
	end
	
	def prompt
		# sets the main context for the app
		puts "Select a master folder"; @folders[:master] = gets
		# chooses the subfolder to be used or created if needed
		puts "Select a subfolder"; @folders[:sub] = gets
		# gets the group of pictures to be sorted
		puts "Select some pictures (separate by comma, ', ')"
		pictures = gets; num = 1; pictures.split(", ").each do |pic|
			@pictures["pic_#{num}".to_sym] = pic; num += 1
		end
	end
end
