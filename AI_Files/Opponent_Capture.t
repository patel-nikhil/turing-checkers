/* Code written by Nikhil Patel
 *
 * Function
 * can_opponent_capture
 * test_opponent_capture
 * opponent_capture
 *
 * Functions/Procedures Called
 * can_red_jump_again
 * can_opponent_capture
 * test_opponent_capture
 * can_red_capture
 *
 */

function test_can_red_capture (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int) : array 1 .. 6 of boolean
    var red_jump_choices : array 1 .. 6 of boolean := init (false, false, false, false, false, false)
    for x : 1 .. 8
	for y : 1 .. 8
	    %Red Piece capture left and up
	    if red_piece (x, y) = true and (blue_piece (x - 1, y + 1) = true or blue_king (x - 1, y + 1) = true) and red_piece (x - 2, y + 2) = false
		    and red_king (x - 2, y + 2) = false and blue_piece (x - 2, y + 2) = false and blue_king (x - 2, y + 2) = false then
		red_jump_choices (1) := true

		%Red Piece capture right and up
	    elsif red_piece (x, y) = true and (blue_piece (x + 1, y + 1) = true or blue_king (x + 1, y + 1) = true) and red_piece (x + 2, y + 2) = false
		    and red_king (x + 2, y + 2) = false and blue_piece (x + 2, y + 2) = false and blue_king (x + 2, y + 2) = false then
		red_jump_choices (2) := true

		%Red King capture right and down
	    elsif red_king (x, y) = true and (blue_piece (x + 1, y - 1) = true or blue_king (x + 1, y - 1) = true) and red_piece (x + 2, y - 2) = false
		    and red_king (x + 2, y - 2) = false and blue_piece (x + 2, y - 2) = false and blue_king (x + 2, y - 2) = false then
		red_jump_choices (3) := true

		%Red King capture right and up
	    elsif red_king (x, y) = true and (blue_piece (x + 1, y + 1) = true or blue_king (x + 1, y + 1) = true) and red_piece (x + 2, y + 2) = false
		    and red_king (x + 2, y + 2) = false and blue_piece (x + 2, y + 2) = false and blue_king (x + 2, y + 2) = false then
		red_jump_choices (4) := true

		%Red King capture left and down
	    elsif red_king (x, y) = true and (blue_piece (x - 1, y - 1) = true or blue_king (x - 1, y - 1) = true) and red_piece (x - 2, y - 2) = false
		    and red_king (x - 2, y - 2) = false and blue_piece (x - 2, y - 2) = false and blue_king (x - 2, y - 2) = false then
		red_jump_choices (5) := true

		%Red King capture left and up
	    elsif red_king (x, y) = true and (blue_piece (x - 1, y + 1) = true or blue_king (x - 1, y + 1) = true) and red_piece (x - 2, y + 2) = false
		    and red_king (x - 2, y + 2) = false and blue_piece (x - 2, y + 2) = false and blue_king (x - 2, y + 2) = false then
		red_jump_choices (6) := true

	    end if

	end for
    end for

    result red_jump_choices

end test_can_red_capture

function test_can_red_jump_again (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x, y : int) : boolean

    %Red Piece capture left and up
    if red_piece (x, y) = true and (blue_piece (x - 1, y + 1) = true or blue_king (x - 1, y + 1) = true) and red_piece (x - 2, y + 2) = false
	    and red_king (x - 2, y + 2) = false and blue_piece (x - 2, y + 2) = false and blue_king (x - 2, y + 2) = false then
	result true

	%Red Piece capture right and up
    elsif red_piece (x, y) = true and (blue_piece (x + 1, y + 1) = true or blue_king (x + 1, y + 1) = true) and red_piece (x + 2, y + 2) = false
	    and red_king (x + 2, y + 2) = false and blue_piece (x + 2, y + 2) = false and blue_king (x + 2, y + 2) = false then
	result true

	%Red King capture right and down
    elsif red_king (x, y) = true and (blue_piece (x + 1, y - 1) = true or blue_king (x + 1, y - 1) = true) and red_piece (x + 2, y - 2) = false
	    and red_king (x + 2, y - 2) = false and blue_piece (x + 2, y - 2) = false and blue_king (x + 2, y - 2) = false then
	result true

	%Red King capture right and up
    elsif red_king (x, y) = true and (blue_piece (x + 1, y + 1) = true or blue_king (x + 1, y + 1) = true) and red_piece (x + 2, y + 2) = false
	    and red_king (x + 2, y + 2) = false and blue_piece (x + 2, y + 2) = false and blue_king (x + 2, y + 2) = false then
	result true

	%Red King capture left and down
    elsif red_king (x, y) = true and (blue_piece (x - 1, y - 1) = true or blue_king (x - 1, y - 1) = true) and red_piece (x - 2, y - 2) = false
	    and red_king (x - 2, y - 2) = false and blue_piece (x - 2, y - 2) = false and blue_king (x - 2, y - 2) = false then
	result true

	%Red King capture left and up
    elsif red_king (x, y) = true and (blue_piece (x - 1, y + 1) = true or blue_king (x - 1, y + 1) = true) and red_piece (x - 2, y + 2) = false
	    and red_king (x - 2, y + 2) = false and blue_piece (x - 2, y + 2) = false and blue_king (x - 2, y + 2) = false then
	result true
    else
	result false
    end if

end test_can_red_jump_again

%Check for possible blue jumps - result stand/end locations
function can_opponent_capture (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int) : array 1 .. 8, 1 .. 8, 1 .. 8, 1 .. 8
	of boolean
    var red_jump_choices : array 1 .. 8, 1 .. 8, 1 .. 8, 1 .. 8 of boolean

    for a : 1 .. 8
	for b : 1 .. 8
	    for c : 1 .. 8
		for d : 1 .. 8
		    red_jump_choices (a, b, c, d) := false
		end for
	    end for
	end for
    end for

    for x : 1 .. 8
	for y : 1 .. 8
	    %Blue Piece capture left and down
	    if red_piece (x, y) = true and (blue_piece (x - 1, y - 1) = true or blue_king (x - 1, y - 1) = true) and red_piece (x - 2, y - 2) = false
		    and red_king (x - 2, y - 2) = false and blue_piece (x - 2, y - 2) = false and blue_king (x - 2, y - 2) = false then

		red_jump_choices (x, y, x - 2, y - 2) := true

	    end if

	    %Blue Piece capture right and down
	    if red_piece (x, y) = true and (blue_piece (x + 1, y - 1) = true or blue_king (x + 1, y - 1) = true) and red_piece (x + 2, y - 2) = false
		    and red_king (x + 2, y - 2) = false and blue_piece (x + 2, y - 2) = false and blue_king (x + 2, y - 2) = false then

		red_jump_choices (x, y, x + 2, y - 2) := true

	    end if

	    %Blue King capture right and up
	    if red_king (x, y) = true and (blue_piece (x + 1, y + 1) = true or blue_king (x + 1, y + 1) = true) and red_piece (x + 2, y + 2) = false
		    and red_king (x + 2, y + 2) = false and blue_piece (x + 2, y + 2) = false and blue_king (x + 2, y + 2) = false then

		red_jump_choices (x, y, x + 2, y + 2) := true

	    end if

	    %Blue King capture right and down
	    if red_king (x, y) = true and (blue_piece (x + 1, y - 1) = true or blue_king (x + 1, y - 1) = true) and red_piece (x + 2, y - 2) = false
		    and red_king (x + 2, y - 2) = false and blue_piece (x + 2, y - 2) = false and blue_king (x + 2, y - 2) = false then

		red_jump_choices (x, y, x + 2, y - 2) := true

	    end if

	    %Blue King capture left and up
	    if red_king (x, y) = true and (blue_piece (x - 1, y + 1) = true or blue_king (x - 1, y + 1) = true) and red_piece (x - 2, y + 2) = false
		    and red_king (x - 2, y + 2) = false and blue_piece (x - 2, y + 2) = false and blue_king (x - 2, y + 2) = false then

		red_jump_choices (x, y, x - 2, y + 2) := true

	    end if

	    %Blue King capture left and down
	    if red_king (x, y) = true and (blue_piece (x - 1, y - 1) = true or blue_king (x - 1, y - 1) = true) and red_piece (x - 2, y - 2) = false
		    and red_king (x - 2, y - 2) = false and blue_piece (x - 2, y - 2) = false and blue_king (x - 2, y - 2) = false then

		red_jump_choices (x, y, x - 2, y - 2) := true

	    end if

	end for
    end for


    result red_jump_choices

end can_opponent_capture

function opponent_test_move (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, start_x, start_y, end_x, end_y : int) : int

    var score : int := 0

    if red_piece (start_x, start_y) = true then
	red_piece (start_x, start_y) := false
	red_piece (end_x, end_y) := true
    elsif red_king (start_x, start_y) = true then
	red_king (start_x, start_y) := false
	red_king (end_x, end_y) := true
    end if
    score += 1

    if red_piece (end_x, 8) = true then
	score += 5
	red_piece (end_x, end_y) := false
	red_king (end_x, end_y) := true
    end if

    result score

end opponent_test_move

function test_opponent_capture (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, var number_bluepieces : int,
	start_x, start_y, end_x, end_y : int) : int

    var score : int := 0

    if red_piece (start_x, start_y) = true then
	red_piece (start_x, start_y) := false
	red_piece (end_x, end_y) := true
    elsif red_king (start_x, start_y) = true then
	red_king (start_x, start_y) := false
	red_king (end_x, end_y) := true
    end if

    number_bluepieces -= 1

    if blue_piece (start_x + (end_x - start_x) div 2, start_y + (end_y - start_y) div 2) = true then
	blue_piece (start_x + (end_x - start_x) div 2, start_y + (end_y - start_y) div 2) := false
	score += 2
    else
	blue_king (start_x + (end_x - start_x) div 2, start_y + (end_y - start_y) div 2) := false
	score += 5
    end if

    if end_x = 1 or end_x = 8 then
	score += 1
    end if
    if end_y = 1 or end_y = 8 then
	score += 1
    end if

    if red_piece (end_x, 8) = true then

	score += 5
	red_piece (end_x, 8) := false
	red_king (end_x, 8) := true
	result score

    else


	if test_can_red_jump_again (blue_piece, red_piece, blue_king, red_king, center, end_x, end_y) = true then

	    var blue_pcs := blue_piece
	    var red_pcs := red_piece
	    var blueKing := blue_king
	    var redKing := red_king
	    var num_blue_pcs := number_bluepieces

	    var red_jump_choices : array 1 .. 8, 1 .. 8, 1 .. 8, 1 .. 8 of boolean

	    red_jump_choices := can_opponent_capture (blue_pcs, red_pcs, blueKing, redKing, center)

	    for x : 1 .. 8
		for y : 1 .. 8

		    if red_jump_choices (end_x, end_y, x, y) = true then

			score += test_opponent_capture (blue_pcs, red_pcs, blueKing, redKing, center, num_blue_pcs, end_x, end_y, x, y)

		    end if

		end for
	    end for

	end if

    end if

    result score

end test_opponent_capture

body function opponent_capture (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, var number_redpieces,
	number_bluepieces : int) : int

    var red_capture_choices := test_can_red_capture (blue_piece, red_piece, blue_king, red_king, center)
    var score : int := 0
    var counter : int := 0

    for x : 1 .. 6
	if red_capture_choices (x) = false then
	    counter += 1
	end if
    end for


    if counter not= 6 then

	var red_jump_choice := can_opponent_capture (blue_piece, red_piece, blue_king, red_king, center)

	for a : 1 .. 8
	    for b : 1 .. 8
		for c : 1 .. 8
		    for d : 1 .. 8

			if red_jump_choice (a, b, c, d) = true then
			    var blue_pcs := blue_piece
			    var red_pcs := red_piece
			    var blueKing := blue_king
			    var redKing := red_king
			    var num_blue_pcs := number_bluepieces
			    var capture_score := test_opponent_capture (blue_pcs, red_pcs, blueKing, redKing, center, num_blue_pcs, a, b, c, d)

			    if score < capture_score then
				score := capture_score
			    end if


			end if

		    end for
		end for
	    end for
	end for

    else

	for a : 1 .. 8
	    for b : 1 .. 8
		for c : 1 .. 8
		    for d : 1 .. 8

			var blue_pcs := blue_piece
			var red_pcs := red_piece
			var blueKing := blue_king
			var redKing := red_king
			var move_score : int := opponent_test_move (blue_pcs, red_pcs, blueKing, redKing, a, b, c, d)

			if score < move_score then
			    score := move_score
			end if


		    end for
		end for
	    end for
	end for

    end if

    result score

end opponent_capture
