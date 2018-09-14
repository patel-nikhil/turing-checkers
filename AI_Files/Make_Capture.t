/* Code written by Nikhil Patel
 *
 * Function
 * test_capture
 *
 * Procedure
 * actual_capture
 *
 *
 * Functions/Procedures Called
 * can_blue_jump_again
 * can_AI_capture
 * test_capture
 *
 */

body function test_capture (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, var number_redpieces,
	number_bluepieces : int, start_x, start_y, end_x, end_y : int) : int

    var score : int := 0

    if blue_piece (start_x, start_y) = true then
	blue_piece (start_x, start_y) := false
	blue_piece (end_x, end_y) := true
    else
	blue_king (start_x, start_y) := false
	blue_king (end_x, end_y) := true
    end if

    if red_piece (start_x + (end_x - start_x) div 2, start_y + (end_y - start_y) div 2) = true then
	red_piece (start_x + (end_x - start_x) div 2, start_y + (end_y - start_y) div 2) := false
	score += 2
    else
	red_king (start_x + (end_x - start_x) div 2, start_y + (end_y - start_y) div 2) := false
	score += 5
    end if

    if end_x = 1 or end_x = 8 then
	score += 1
    end if
    if end_y = 1 or end_y = 8 then
	score += 1
    end if

    if blue_piece (end_x, 1) = true then
	score += 5
	blue_piece (end_x, 1) := false
	blue_king (end_x, 1) := true
	result score

    else

	if test_can_blue_jump_again (blue_piece, red_piece, blue_king, red_king, center, end_x, end_y) = true then

	    var blue_jump_choices : array 1 .. 8, 1 .. 8, 1 .. 8, 1 .. 8 of boolean

	    blue_jump_choices := can_AI_capture (blue_piece, red_piece, blue_king, red_king, center)

	    for x : 1 .. 8
		for y : 1 .. 8

		    if blue_jump_choices (end_x, end_y, x, y) = true then

			score += test_capture (blue_piece, red_piece, blue_king, red_king, center, number_redpieces, number_bluepieces, end_x, end_y, x, y)

		    else

			result score

		    end if

		end for
	    end for

	end if

    end if

    result score

end test_capture

body proc actual_capture (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, var number_redpieces,
	start_x, start_y, end_x, end_y : int)

    const X_position := 1
    const Y_position := 2

    if blue_piece (start_x, start_y) = true then
	blue_piece (start_x, start_y) := false
	blue_piece (end_x, end_y) := true
    else
	blue_king (start_x, start_y) := false
	blue_king (end_x, end_y) := true
    end if

    if red_piece (start_x + (end_x - start_x) div 2, start_y + (end_y - start_y) div 2) = true then
	red_piece (start_x + (end_x - start_x) div 2, start_y + (end_y - start_y) div 2) := false
    else
	red_king (start_x + (end_x - start_x) div 2, start_y + (end_y - start_y) div 2) := false
    end if

    for x : 1 .. 8
	if blue_piece (x, 1) = true then
	    blue_piece (x, 1) := false
	    blue_king (x, 1) := true
	    Draw.FillOval (center (X_position, end_x, 1), center (Y_position, end_x, 1), 5, 5, yellow)
	end if
    end for


    %put red_piece (start_x + (end_x - start_x) div 2, start_y + (end_y - start_y) div 2)

    %put start_x + (end_x - start_x) div 2
    %put start_y + (end_y - start_y) div 2

    number_redpieces -= 1

end actual_capture
