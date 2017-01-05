class Board

	attr_accessor :go

private
	def initialize
		@go = true
		@xs = Array.new
		@os = Array.new
		@visual = [['.', '.', '.'],['.', '.', '.'],['.', '.', '.'],['.', '.', '.']]
	end

	def threeinarow(character)
		answer=false

		if (@visual[0][0]==character)&&(@visual[0][1]==character)&&(@visual[0][2]==character)
			answer=true
		end
		if (@visual[0][0]==character)&&(@visual[1][1]==character)&&(@visual[2][2]==character)
			answer=true
		end
		if (@visual[0][0]==character)&&(@visual[1][0]==character)&&(@visual[2][0]==character)
			answer=true
		end
		if (@visual[0][1]==character)&&(@visual[1][1]==character)&&(@visual[2][1]==character)
			answer=true
		end
		if (@visual[0][2]==character)&&(@visual[1][2]==character)&&(@visual[2][2]==character)
			answer=true
		end
		if (@visual[0][2]==character)&&(@visual[1][1]==character)&&(@visual[2][0]==character)
			answer=true
		end
		if (@visual[1][0]==character)&&(@visual[1][1]==character)&&(@visual[1][2]==character)
			answer=true
		end
		if (@visual[2][0]==character)&&(@visual[2][1]==character)&&(@visual[2][2]==character)
			answer=true
		end

		answer
	end

	def update
		@xs.each do |number|
			row = number/3
			column = number%3
			@visual[row][column] = 'x'
		end
		@os.each do |number|
			row = number/3
			column = number%3
			@visual[row][column] = 'o'
		end
	end

	def show
		for x in 0..2 do
			for y in 0..2 do
				print @visual[x][y]
				print " "
			end
			puts ""
		end

		if threeinarow("x")
			puts "PLAYER 1 WINS"
			@go = false
		elsif threeinarow("o")
			puts "PLAYER 2 WINS"
			@go = false
		end
	end

	def play_move(move, player)
		taken = (@xs.include? move-1)||(@os.include? move-1)
		if (move.is_a? Integer)&&(move>0)&&(move<10)&&(taken==false)
			if player==1
				@xs << move.to_i-1
			else
				@os << move.to_i-1
			end
			update
			show
		else
			puts "invalid move"
			if player==1
				turn(1)
			else
				turn(2)
			end
		end
	end

public
	def turn(p)
		puts "player #{p}s turn"
		input = gets.chomp.to_i
		play_move(input, p)
	end

end

this_board = Board.new

while this_board.go
this_board.turn(1)
break unless this_board.go
this_board.turn(2)
end