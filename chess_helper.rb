class Fixnum
	def flip
		self * -1
	end
end

def row(location)
	rows = "87654321"
	rows =~ /#{location[1]}/ # returns index of 1st match in string
end

def col(location)
	cols = "abcdefgh"
	cols =~ /#{location[0]}/
end