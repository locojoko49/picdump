module Utils
	def count_char str, char
		count = 0; for c in str.split("")
			count += 1 if c.eql? char
		end
		return count
	end
end
