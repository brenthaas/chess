require_relative 'chess_helper'

class ChessPiece
 	WHITE_PIECES = /[RKBQKP]/
	BLACK_PIECES = /[rkbqkp]/

	def initialize(type)
		@type = type

		raise "Invalid chess piece given: #{type}" unless valid_chess_piece?
	end

	def valid_chess_piece?
		white? || black?
	end

	def white?
		!!(@type =~ WHITE_PIECES)
	end

	def black?
		!!(@type =~ BLACK_PIECES)
	end

	def valid_move?(from_loc, to_loc)
		move_row = row(from_loc) - row(to_loc)
		move_col = col(from_loc) - col(to_loc)

		# flip the board around if the piece is black
		if black?
			move_row = move_row.flip
			move_col = move_col.flip
		end

		case @type
		when /p/i   # pawn
			move_col == 0 && move_row == 1
		end
	end

	def valid_capture?(from_loc, to_loc)
		move_row = row(from_loc) - row(to_loc)
		move_col = col(from_loc) - col(to_loc)

		# flip the board around if the piece is black
		if black?
			move_row *= -1
			move_col *= -1
		end

		case @type
		when /p/i   #pawn
			move_col.abs == 1 && move_row == 1
		else				#anything else can capture on a move
			valid_move?(from_loc, to_loc)
		end
	end
end
