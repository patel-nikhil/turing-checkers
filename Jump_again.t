/* Code written by Nikhil Patel
 *
 * Functions Declared       Return Value    Parameters
 * can_blue_jump_again      boolean         blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x, y : int
 * can_red_jump_again       boolean         blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x, y : int
 *
 */

function can_blue_jump_again (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x, y : int) : boolean

    %Blue Piece capture left and down
    if blue_piece (x, y) = true and (red_piece (x - 1, y - 1) = true or red_king (x - 1, y - 1) = true) and blue_piece (x - 2, y - 2) = false
	    and blue_king (x - 2, y - 2) = false and red_piece (x - 2, y - 2) = false and red_king (x - 2, y - 2) = false then
	light_open_blue_jump (blue_king, center, x, y)
	result true

	%Blue Piece capture right and down
    elsif blue_piece (x, y) = true and (red_piece (x + 1, y - 1) = true or red_king (x + 1, y - 1) = true) and blue_piece (x + 2, y - 2) = false
	    and blue_king (x + 2, y - 2) = false and red_piece (x + 2, y - 2) = false and red_king (x + 2, y - 2) = false then
	light_open_blue_jump (blue_king, center, x, y)
	result true

	%Blue King capture right and up
    elsif blue_king (x, y) = true and (red_piece (x + 1, y + 1) = true or red_king (x + 1, y + 1) = true) and blue_piece (x + 2, y + 2) = false
	    and blue_king (x + 2, y + 2) = false and red_piece (x + 2, y + 2) = false and red_king (x + 2, y + 2) = false then
	light_open_blue_jump (blue_king, center, x, y)
	result true

	%Blue King capture right and down
    elsif blue_king (x, y) = true and (red_piece (x + 1, y - 1) = true or red_king (x + 1, y - 1) = true) and blue_piece (x + 2, y - 2) = false
	    and blue_king (x + 2, y - 2) = false and red_piece (x + 2, y - 2) = false and red_king (x + 2, y - 2) = false then
	light_open_blue_jump (blue_king, center, x, y)
	result true

	%Blue King capture left and up
    elsif blue_king (x, y) = true and (red_piece (x - 1, y + 1) = true or red_king (x - 1, y + 1) = true) and blue_piece (x - 2, y + 2) = false
	    and blue_king (x - 2, y + 2) = false and red_piece (x - 2, y + 2) = false and red_king (x - 2, y + 2) = false then
	light_open_blue_jump (blue_king, center, x, y)
	result true

	%Blue King capture left and down
    elsif blue_king (x, y) = true and (red_piece (x - 1, y - 1) = true or red_king (x - 1, y - 1) = true) and blue_piece (x - 2, y - 2) = false
	    and blue_king (x - 2, y - 2) = false and red_piece (x - 2, y - 2) = false and red_king (x - 2, y - 2) = false then
	light_open_blue_jump (blue_king, center, x, y)
	result true
    else
	result false
    end if

end can_blue_jump_again

function can_red_jump_again (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x, y : int) : boolean

    %Red Piece capture left and up
    if red_piece (x, y) = true and (blue_piece (x - 1, y + 1) = true or blue_king (x - 1, y + 1) = true) and red_piece (x - 2, y + 2) = false
	    and red_king (x - 2, y + 2) = false and blue_piece (x - 2, y + 2) = false and blue_king (x - 2, y + 2) = false then
	light_open_red_jump (red_king, center, x, y)
	result true

	%Red Piece capture right and up
    elsif red_piece (x, y) = true and (blue_piece (x + 1, y + 1) = true or blue_king (x + 1, y + 1) = true) and red_piece (x + 2, y + 2) = false
	    and red_king (x + 2, y + 2) = false and blue_piece (x + 2, y + 2) = false and blue_king (x + 2, y + 2) = false then
	light_open_red_jump (red_king, center, x, y)
	result true

	%Red King capture right and down
    elsif red_king (x, y) = true and (blue_piece (x + 1, y - 1) = true or blue_king (x + 1, y - 1) = true) and red_piece (x + 2, y - 2) = false
	    and red_king (x + 2, y - 2) = false and blue_piece (x + 2, y - 2) = false and blue_king (x + 2, y - 2) = false then
	light_open_red_jump (red_king, center, x, y)
	result true

	%Red King capture right and up
    elsif red_king (x, y) = true and (blue_piece (x + 1, y + 1) = true or blue_king (x + 1, y + 1) = true) and red_piece (x + 2, y + 2) = false
	    and red_king (x + 2, y + 2) = false and blue_piece (x + 2, y + 2) = false and blue_king (x + 2, y + 2) = false then
	light_open_red_jump (red_king, center, x, y)
	result true

	%Red King capture left and down
    elsif red_king (x, y) = true and (blue_piece (x - 1, y - 1) = true or blue_king (x - 1, y - 1) = true) and red_piece (x - 2, y - 2) = false
	    and red_king (x - 2, y - 2) = false and blue_piece (x - 2, y - 2) = false and blue_king (x - 2, y - 2) = false then
	light_open_red_jump (red_king, center, x, y)
	result true

	%Red King capture left and up
    elsif red_king (x, y) = true and (blue_piece (x - 1, y + 1) = true or blue_king (x - 1, y + 1) = true) and red_piece (x - 2, y + 2) = false
	    and red_king (x - 2, y + 2) = false and blue_piece (x - 2, y + 2) = false and blue_king (x - 2, y + 2) = false then
	light_open_red_jump (red_king, center, x, y)
	result true
    else
	result false
    end if

end can_red_jump_again
