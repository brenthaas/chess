require_relative "../chess_piece"

describe ChessPiece do
	describe "#new" do
		specify "invalid input is not accepted" do
			expect { ChessPiece.new("z") }.to raise_error
		end
	end

	describe "white pawn" do
		before { @piece = ChessPiece.new("P") }

		it "is white" do
			@piece.white?.should be true
		end

		it "can move up the board one space" do
			@piece.valid_move?('b2', 'b3').should be true
		end

		it "can not move backwards" do
			@piece.valid_move?('b2', 'b1').should be false
		end

		it "can capture by moving diagonally one space" do
			@piece.valid_capture?('b2', 'c3').should be true
		end

		it "can not capture by moving forward" do
			@piece.valid_capture?('b2', 'b3').should be false
		end
	end


	describe "black pawn" do
		before { @piece = ChessPiece.new("p") }

		it "is black" do
			@piece.black?.should be true
		end

		it "can move down the board one space" do
			@piece.valid_move?('e7', 'e6').should be true
		end

		it "can not move backwards" do
			@piece.valid_move?('e6', 'e7').should be false
		end

		it "can capture by moving diagonally one space" do
			@piece.valid_capture?('e6', 'f5').should be true
		end
	end
end