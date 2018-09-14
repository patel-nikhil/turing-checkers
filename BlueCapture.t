/* Code written by Nikhil Patel
 *
 * Functions Declared       Return Value              Parameters
 * blue_take1               boolean                  (blue_piece, red_piece, blue_king, red_king : array -1 .. 10, -1 .. 10 of boolean, X1, Y1 : int)
 * Blue_Piece               array 1 .. 2 of int      (blue_piece, red_piece, blue_king, red_king : array -1 .. 10, -1 .. 10 of boolean)
 * Blue_Piece1              array 1 .. 2 of int      (blue_piece, red_piece, blue_king, red_king : array -1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x, y : int)
 *
 * Purpose
 * blue_take1 -> Check if piece can be used to capture
 * Blue_Piece & Blue_Piece1 -> Selecting Piece
 *
 * Procedures Declared      Parameters
 * blue_capture_move        blue_piece, red_piece, blue_king, red_king : array -1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, number_redpieces : int
 * draw_blue_capture        blue_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, var number_redpieces : int, x, y, x1, y1 : int
 * 
 * Purpose
 * Evaluate and Perform Capture Moves
 *
 */

function blue_take1 (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, X1, Y1 : int) : boolean

    if blue_piece (Conv_to_x_location (X1), Conv_to_y_location (Y1)) = true and (red_piece (Conv_to_x_location (X1) - 1, Conv_to_y_location (Y1) - 1) = true or red_king (Conv_to_x_location (X1) - 1,
	    Conv_to_y_location (Y1) - 1) = true)
	    and blue_piece (Conv_to_x_location (X1) - 2, Conv_to_y_location (Y1) - 2) = false and blue_king (Conv_to_x_location (X1) - 2, Conv_to_y_location (Y1) - 2) = false
	    and red_piece (Conv_to_x_location (X1) - 2, Conv_to_y_location (Y1) - 2) = false and red_king (Conv_to_x_location (X1) - 2, Conv_to_y_location (Y1) - 2) = false then
	result true

    elsif blue_piece (Conv_to_x_location (X1), Conv_to_y_location (Y1)) = true and (red_piece (Conv_to_x_location (X1) + 1, Conv_to_y_location (Y1) - 1) = true or red_king (Conv_to_x_location (X1) +
	    1,
	    Conv_to_y_location (Y1) - 1) = true)
	    and blue_piece (Conv_to_x_location (X1) + 2, Conv_to_y_location (Y1) - 2) = false and blue_king (Conv_to_x_location (X1) + 2, Conv_to_y_location (Y1) - 2) = false
	    and red_piece (Conv_to_x_location (X1) + 2, Conv_to_y_location (Y1) - 2) = false and red_king (Conv_to_x_location (X1) + 2, Conv_to_y_location (Y1) - 2) = false then
	result true

    elsif blue_king (Conv_to_x_location (X1), Conv_to_y_location (Y1)) = true and (red_piece (Conv_to_x_location (X1) + 1, Conv_to_y_location (Y1) + 1) = true or red_king (Conv_to_x_location (X1) + 1,
	    Conv_to_y_location (Y1) + 1) = true)
	    and blue_piece (Conv_to_x_location (X1) + 2, Conv_to_y_location (Y1) + 2) = false and blue_king (Conv_to_x_location (X1) + 2, Conv_to_y_location (Y1) + 2) = false
	    and red_piece (Conv_to_x_location (X1) + 2, Conv_to_y_location (Y1) + 2) = false and red_king (Conv_to_x_location (X1) + 2, Conv_to_y_location (Y1) + 2) = false then
	result true

    elsif blue_king (Conv_to_x_location (X1), Conv_to_y_location (Y1)) = true and (red_piece (Conv_to_x_location (X1) + 1, Conv_to_y_location (Y1) - 1) = true or red_king (Conv_to_x_location (X1) + 1,
	    Conv_to_y_location (Y1) - 1) = true)
	    and blue_piece (Conv_to_x_location (X1) + 2, Conv_to_y_location (Y1) - 2) = false and blue_king (Conv_to_x_location (X1) + 2, Conv_to_y_location (Y1) - 2) = false
	    and red_piece (Conv_to_x_location (X1) + 2, Conv_to_y_location (Y1) - 2) = false and red_king (Conv_to_x_location (X1) + 2, Conv_to_y_location (Y1) - 2) = false then
	result true

    elsif blue_king (Conv_to_x_location (X1), Conv_to_y_location (Y1)) = true and (red_piece (Conv_to_x_location (X1) - 1, Conv_to_y_location (Y1) + 1) = true or red_king (Conv_to_x_location (X1) - 1,
	    Conv_to_y_location (Y1) + 1) = true)
	    and blue_piece (Conv_to_x_location (X1) - 2, Conv_to_y_location (Y1) + 2) = false and blue_king (Conv_to_x_location (X1) - 2, Conv_to_y_location (Y1) + 2) = false
	    and red_piece (Conv_to_x_location (X1) - 2, Conv_to_y_location (Y1) + 2) = false and red_king (Conv_to_x_location (X1) - 2, Conv_to_y_location (Y1) + 2) = false then
	result true

    elsif blue_king (Conv_to_x_location (X1), Conv_to_y_location (Y1)) = true and (red_piece (Conv_to_x_location (X1) - 1, Conv_to_y_location (Y1) - 1) = true or red_king (Conv_to_x_location (X1) - 1,
	    Conv_to_y_location (Y1) - 1) = true)
	    and blue_piece (Conv_to_x_location (X1) - 2, Conv_to_y_location (Y1) - 2) = false and blue_king (Conv_to_x_location (X1) - 2, Conv_to_y_location (Y1) - 2) = false
	    and red_piece (Conv_to_x_location (X1) - 2, Conv_to_y_location (Y1) - 2) = false and red_king (Conv_to_x_location (X1) - 2, Conv_to_y_location (Y1) - 2) = false then
	result true

    else
	result false

    end if

end blue_take1

function Blue_Piece (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean) : array 1 .. 2 of int

    var X, Y, Btn2, btnUpDown : int
    var square : array 1 .. 2 of int

    loop
	Mouse.ButtonWait ("down", X, Y, Btn2, btnUpDown)

	%Selecting Piece that will be used to capture
	if Btn2 = 1 and Conv_to_x_location (X) > 0 and Conv_to_x_location (X) < 9 and Conv_to_y_location (Y) > 0 and Conv_to_y_location (Y) < 9 and
		(blue_piece (Conv_to_x_location (X), Conv_to_y_location (Y)) = true or blue_king (Conv_to_x_location (X), Conv_to_y_location (Y)) = true) then
	    X := X
	    Y := Y
	    exit when blue_take1 (blue_piece, red_piece, blue_king, red_king, X, Y) = true
	end if

    end loop

    square (1) := Conv_to_x_location (X)
    square (2) := Conv_to_y_location (Y)

    result square

end Blue_Piece

function Blue_Piece1 (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x, y : int) : array 1 .. 2 of int

    const X_position := 1
    const Y_position := 2
    var X1, Y1, Btn2, Btn3, btnUpDown : int
    var square : array 1 .. 2 of int

    loop
	Mouse.ButtonWait ("down", X1, Y1, Btn3, btnUpDown)
	if Btn3 = 1 then
	    exit
	end if
    end loop

    square (1) := Conv_to_x_location (X1)
    square (2) := Conv_to_y_location (Y1)

    result square

end Blue_Piece1

function can_blue_AI_capture (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int) : array 1 .. 6 of boolean
    var blue_jump_choices : array 1 .. 6 of boolean := init (false, false, false, false, false, false)

    for x : 1 .. 8
	for y : 1 .. 8
	    %Blue Piece capture left and down
	    if blue_piece (x, y) = true and (red_piece (x - 1, y - 1) = true or red_king (x - 1, y - 1) = true) and blue_piece (x - 2, y - 2) = false
		    and blue_king (x - 2, y - 2) = false and red_piece (x - 2, y - 2) = false and red_king (x - 2, y - 2) = false then
		blue_jump_choices (1) := true

		%Blue Piece capture right and down
	    elsif blue_piece (x, y) = true and (red_piece (x + 1, y - 1) = true or red_king (x + 1, y - 1) = true) and blue_piece (x + 2, y - 2) = false
		    and blue_king (x + 2, y - 2) = false and red_piece (x + 2, y - 2) = false and red_king (x + 2, y - 2) = false then
		blue_jump_choices (2) := true

		%Blue King capture right and up
	    elsif blue_king (x, y) = true and (red_piece (x + 1, y + 1) = true or red_king (x + 1, y + 1) = true) and blue_piece (x + 2, y + 2) = false
		    and blue_king (x + 2, y + 2) = false and red_piece (x + 2, y + 2) = false and red_king (x + 2, y + 2) = false then
		blue_jump_choices (3) := true

		%Blue King capture right and down
	    elsif blue_king (x, y) = true and (red_piece (x + 1, y - 1) = true or red_king (x + 1, y - 1) = true) and blue_piece (x + 2, y - 2) = false
		    and blue_king (x + 2, y - 2) = false and red_piece (x + 2, y - 2) = false and red_king (x + 2, y - 2) = false then
		blue_jump_choices (4) := true

		%Blue King capture left and up
	    elsif blue_king (x, y) = true and (red_piece (x - 1, y + 1) = true or red_king (x - 1, y + 1) = true) and blue_piece (x - 2, y + 2) = false
		    and blue_king (x - 2, y + 2) = false and red_piece (x - 2, y + 2) = false and red_king (x - 2, y + 2) = false then
		blue_jump_choices (5) := true

		%Blue King capture left and down
	    elsif blue_king (x, y) = true and (red_piece (x - 1, y - 1) = true or red_king (x - 1, y - 1) = true) and blue_piece (x - 2, y - 2) = false
		    and blue_king (x - 2, y - 2) = false and red_piece (x - 2, y - 2) = false and red_king (x - 2, y - 2) = false then
		blue_jump_choices (6) := true

	    end if
	end for
    end for

    result blue_jump_choices

end can_blue_AI_capture

proc draw_blue_capture (blue_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, var number_redpieces : int, x, y, x1, y1 : int)

    const X_position := 1
    const Y_position := 2
    const size := maxy div 10

    Draw.FillBox ((x + (x1 - x) div 2) * size + size, (y + (y1 - y) div 2) * size, (x + (x1 - x) div 2) * size + (size * 2), (y + (y1 - y) div 2) * size + size, green)
    Draw.FillBox (x * size + size, y * size, x * size + (size * 2), y * size + size, green)
    Draw.FillOval (center (X_position, x1, y1), center (Y_position, x1, y1), 25, 25, 53)
    if blue_king (x1, y1) = true then
	Draw.FillOval (center (X_position, x1, y1), center (Y_position, x1, y1), 5, 5, yellow)
    end if

    delay (1000)

    Draw.FillOval (center (X_position, x1, y1), center (Y_position, x1, y1), 25, 25, 104)

end draw_blue_capture

proc blue_capture_move (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, var number_redpieces : int)
    const X_position : int := 1
    const Y_position : int := 2
    const size := maxy div 10
    var X, X1, Y, Y1, Btn2, Btn3, btnUpDown, x, y, x1, y1 : int
    var square1, square2 : array 1 .. 2 of int
    var newking : boolean := false


    loop

	square1 := Blue_Piece (blue_piece, red_piece, blue_king, red_king)
	x := square1 (1)
	y := square1 (2)

	blueselect (blue_king, center, x, y)

	square2 := Blue_Piece1 (blue_piece, red_piece, blue_king, red_king, center, x, y)
	x1 := square2 (1)
	y1 := square2 (2)

	exit when blue_piece (x, y) = true and abs (x1 - x) = 2 and y - y1 = 2 and
	    (red_piece (x + (x1 - x) div 2, y - 1) = true or red_king (x + (x1 - x) div 2, y - 1) = true)
	    and blue_piece (x1, y1) = false and blue_king (x1, y1) = false and red_piece (x1, y1) = false and red_king (x1, y1) = false

	exit when blue_king (x, y) = true and abs (x1 - x) = 2 and abs (y - y1) = 2 and
	    (red_piece (x + (x1 - x) div 2, y + (y1 - y) div 2) = true or red_king (x + (x1 - x) div 2, y + (y1 - y) div 2) = true)
	    and blue_piece (x1, y1) = false and blue_king (x1, y1) = false and red_piece (x1, y1) = false and red_king (x1, y1) = false

	Draw.FillOval (center (X_position, x, y), center (Y_position, x, y), 25, 25, black)
	Draw.FillOval (center (X_position, x, y), center (Y_position, x, y), 20, 20, 53)
	if blue_king (x, y) = true then
	    Draw.FillOval (center (X_position, x, y), center (Y_position, x, y), 5, 5, yellow)
	end if

    end loop

    if blue_piece (x, y) = true then
	blue_piece (x, y) := false
	blue_piece (x1, y1) := true
    else
	blue_king (x, y) := false
	blue_king (x1, y1) := true
    end if
    if red_piece (x + (x1 - x) div 2, y + (y1 - y) div 2) = true then
	red_piece (x + (x1 - x) div 2, y + (y1 - y) div 2) := false
    else
	red_king (x + (x1 - x) div 2, y + (y1 - y) div 2) := false
    end if

    draw_blue_capture (blue_king, center, number_redpieces, x, y, x1, y1)

    for count : 1 .. 8
	if blue_piece (count, 1) = true then
	    blue_piece (count, 1) := false
	    blue_king (count, 1) := true
	    Draw.FillOval (center (X_position, count, 1), center (Y_position, count, 1), 5, 5, yellow)
	    newking := true
	end if
    end for

    delay (10)

    if newking = false then

	if can_blue_jump_again (blue_piece, red_piece, blue_king, red_king, center, x1, y1) = true then
	    blue_capture_move (blue_piece, red_piece, blue_king, red_king, center, number_redpieces)
	end if

    end if

end blue_capture_move
