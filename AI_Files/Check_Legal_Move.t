/* Code written by Nikhil Patel
 *
 * Function
 * check_legal_AI_move
 *
 * NO Functions/Procedures Called
 *
 */

%Checks for legal moves and results true for viable move locations
function check_legal_AI_move (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean) : array 1 .. 8, 1 .. 8, 1 .. 8, 1 .. 8
	of boolean

    %Indices are as follows: start_x, start_y, end_x, end_y
    var move_options : array 1 .. 8, 1 .. 8, 1 .. 8, 1 .. 8 of boolean

    %Initialize array to false
    for a : 1 .. 8
	for b : 1 .. 8
	    for c : 1 .. 8
		for d : 1 .. 8

		    move_options (a, b, c, d) := false

		end for
	    end for
	end for
    end for

    for x : 1 .. 8
	for y : 1 .. 8

	    %Move Right
	    if blue_piece (x, y) = true and (red_piece (x + 1, y - 1) = false and blue_piece (x + 1, y - 1) = false
		    and red_king (x + 1, y - 1) = false and blue_king (x + 1, y - 1) = false) then

		move_options (x, y, x + 1, y - 1) := true

	    end if

	    %Move Left
	    if blue_piece (x, y) = true and (red_piece (x - 1, y - 1) = false and blue_piece (x - 1, y - 1) = false
		    and red_king (x - 1, y - 1) = false and blue_king (x - 1, y - 1) = false) then

		move_options (x, y, x - 1, y - 1) := true

	    end if

	    %Move Right and UP
	    if blue_king (x, y) = true and (red_piece (x + 1, y + 1) = false and blue_piece (x + 1, y + 1) = false
		    and red_king (x + 1, y + 1) = false and blue_king (x + 1, y + 1) = false) then

		move_options (x, y, x + 1, y + 1) := true

	    end if

	    %Move Left and UP
	    if blue_king (x, y) = true and (red_piece (x - 1, y + 1) = false and blue_piece (x - 1, y + 1) = false
		    and red_king (x - 1, y + 1) = false and blue_king (x - 1, y + 1) = false) then

		move_options (x, y, x - 1, y + 1) := true

	    end if

	    %Move Right
	    if blue_king (x, y) = true and (red_piece (x + 1, y - 1) = false and blue_piece (x + 1, y - 1) = false
		    and red_king (x + 1, y - 1) = false and blue_king (x + 1, y - 1) = false) then

		move_options (x, y, x + 1, y - 1) := true

	    end if

	    %Move Left
	    if blue_king (x, y) = true and (red_piece (x - 1, y - 1) = false and blue_piece (x - 1, y - 1) = false
		    and red_king (x - 1, y - 1) = false and blue_king (x - 1, y - 1) = false) then

		move_options (x, y, x - 1, y - 1) := true

	    end if

	end for
    end for

    result move_options

end check_legal_AI_move
