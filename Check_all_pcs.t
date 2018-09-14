/* Code written by Nikhil Patel
 *
 * Functions Declared         Return Value                  Purpose
 * can_red_capture          : array 1 .. 6 of boolean   Check for possible red jumps
 * can_green_capture        : array 1 .. 6 of boolean   Check for possible green jumps
 *
 * Parameters - blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, - 1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int
 *
 */

function can_red_capture (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, - 1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int) : array 1 .. 6 of boolean
    var red_jump_choices : array 1 .. 6 of boolean := init (false, false, false, false, false, false)
    for x : 1 .. 8
	for y : 1 .. 8
	    %Red Piece capture left and up
	    if red_piece (x, y) = true and (blue_piece (x - 1, y + 1) = true or blue_king (x - 1, y + 1) = true) and red_piece (x - 2, y + 2) = false
		    and red_king (x - 2, y + 2) = false and blue_piece (x - 2, y + 2) = false and blue_king (x - 2, y + 2) = false then
		red_jump_choices (1) := true
		light_open_red_jump (red_king, center, x, y)

		%Red Piece capture right and up
	    elsif red_piece (x, y) = true and (blue_piece (x + 1, y + 1) = true or blue_king (x + 1, y + 1) = true) and red_piece (x + 2, y + 2) = false
		    and red_king (x + 2, y + 2) = false and blue_piece (x + 2, y + 2) = false and blue_king (x + 2, y + 2) = false then
		red_jump_choices (2) := true
		light_open_red_jump (red_king, center, x, y)

		%Red King capture right and down
	    elsif red_king (x, y) = true and (blue_piece (x + 1, y - 1) = true or blue_king (x + 1, y - 1) = true) and red_piece (x + 2, y - 2) = false
		    and red_king (x + 2, y - 2) = false and blue_piece (x + 2, y - 2) = false and blue_king (x + 2, y - 2) = false then
		red_jump_choices (3) := true
		light_open_red_jump (red_king, center, x, y)

		%Red King capture right and up
	    elsif red_king (x, y) = true and (blue_piece (x + 1, y + 1) = true or blue_king (x + 1, y + 1) = true) and red_piece (x + 2, y + 2) = false
		    and red_king (x + 2, y + 2) = false and blue_piece (x + 2, y + 2) = false and blue_king (x + 2, y + 2) = false then
		red_jump_choices (4) := true
		light_open_red_jump (red_king, center, x, y)

		%Red King capture left and down
	    elsif red_king (x, y) = true and (blue_piece (x - 1, y - 1) = true or blue_king (x - 1, y - 1) = true) and red_piece (x - 2, y - 2) = false
		    and red_king (x - 2, y - 2) = false and blue_piece (x - 2, y - 2) = false and blue_king (x - 2, y - 2) = false then
		red_jump_choices (5) := true
		light_open_red_jump (red_king, center, x, y)

		%Red King capture left and up
	    elsif red_king (x, y) = true and (blue_piece (x - 1, y + 1) = true or blue_king (x - 1, y + 1) = true) and red_piece (x - 2, y + 2) = false
		    and red_king (x - 2, y + 2) = false and blue_piece (x - 2, y + 2) = false and blue_king (x - 2, y + 2) = false then
		red_jump_choices (6) := true
		light_open_red_jump (red_king, center, x, y)

	    end if

	end for
    end for

    result red_jump_choices

end can_red_capture

%Check for possible green jumps
function can_blue_capture (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, - 1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int) : array 1 .. 6 of boolean
    var blue_jump_choices : array 1 .. 6 of boolean := init (false, false, false, false, false, false)

    for x : 1 .. 8
	for y : 1 .. 8
	    %Green Piece capture left and down
	    if blue_piece (x, y) = true and (red_piece (x - 1, y - 1) = true or red_king (x - 1, y - 1) = true) and blue_piece (x - 2, y - 2) = false
		    and blue_king (x - 2, y - 2) = false and red_piece (x - 2, y - 2) = false and red_king (x - 2, y - 2) = false then
		blue_jump_choices (1) := true
		light_open_blue_jump (blue_king, center, x, y)

		%Green Piece capture right and down
	    elsif blue_piece (x, y) = true and (red_piece (x + 1, y - 1) = true or red_king (x + 1, y - 1) = true) and blue_piece (x + 2, y - 2) = false
		    and blue_king (x + 2, y - 2) = false and red_piece (x + 2, y - 2) = false and red_king (x + 2, y - 2) = false then
		blue_jump_choices (2) := true
		light_open_blue_jump (blue_king, center, x, y)

		%Green King capture right and up
	    elsif blue_king (x, y) = true and (red_piece (x + 1, y + 1) = true or red_king (x + 1, y + 1) = true) and blue_piece (x + 2, y + 2) = false
		    and blue_king (x + 2, y + 2) = false and red_piece (x + 2, y + 2) = false and red_king (x + 2, y + 2) = false then
		blue_jump_choices (3) := true
		light_open_blue_jump (blue_king, center, x, y)

		%Green King capture right and down
	    elsif blue_king (x, y) = true and (red_piece (x + 1, y - 1) = true or red_king (x + 1, y - 1) = true) and blue_piece (x + 2, y - 2) = false
		    and blue_king (x + 2, y - 2) = false and red_piece (x + 2, y - 2) = false and red_king (x + 2, y - 2) = false then
		blue_jump_choices (4) := true
		light_open_blue_jump (blue_king, center, x, y)

		%Green King capture left and up
	    elsif blue_king (x, y) = true and (red_piece (x - 1, y + 1) = true or red_king (x - 1, y + 1) = true) and blue_piece (x - 2, y + 2) = false
		    and blue_king (x - 2, y + 2) = false and red_piece (x - 2, y + 2) = false and red_king (x - 2, y + 2) = false then
		blue_jump_choices (5) := true
		light_open_blue_jump (blue_king, center, x, y)

		%Green King capture left and down
	    elsif blue_king (x, y) = true and (red_piece (x - 1, y - 1) = true or red_king (x - 1, y - 1) = true) and blue_piece (x - 2, y - 2) = false
		    and blue_king (x - 2, y - 2) = false and red_piece (x - 2, y - 2) = false and red_king (x - 2, y - 2) = false then
		blue_jump_choices (6) := true
		light_open_blue_jump (blue_king, center, x, y)

	    end if
	end for
    end for

    result blue_jump_choices

end can_blue_capture
