/* Code written by Nikhil Patel
 *
 * Functions Declared       Return Value              Parameters
 * redtake1               boolean                  blue_piece, red_piece, blue_king, red_king : array -1 .. 10, -1 .. 10 of boolean, X2, Y2: int
 * RedPiece               array 1 .. 2 of int      blue_piece, red_piece, blue_king, red_king : array -1 .. 10, -1 .. 10 of boolean
 * RedPiece1              array 1 .. 2 of int      blue_piece, red_piece, blue_king, red_king : array -1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, X, Y : int
 *
 * Purpose
 * redtake1 -> Check if piece can be used to capture
 * RedPiece & RedPiece1 -> Selecting Piece
 *
 * Procedures Declared      Parameters
 * red_capture_move         blue_piece, red_piece, blue_king, red_king : array -1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, btotal : int
 *
 *
 * Purpose
 * Evaluates and Performs Capture Moves
 *
 */


function redtake1 (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, X2, Y2 : int) : boolean

    if red_piece (Conv_to_x_location (X2), Conv_to_y_location (Y2)) = true and (blue_piece (Conv_to_x_location (X2) - 1, Conv_to_y_location (Y2) + 1) = true or blue_king (Conv_to_x_location (X2) - 1,
	    Conv_to_y_location (Y2) + 1) = true)
	    and blue_piece (Conv_to_x_location (X2) - 2, Conv_to_y_location (Y2) + 2) = false and blue_king (Conv_to_x_location (X2) - 2, Conv_to_y_location (Y2) + 2) = false
	    and red_piece (Conv_to_x_location (X2) - 2, Conv_to_y_location (Y2) + 2) = false and red_king (Conv_to_x_location (X2) - 2, Conv_to_y_location (Y2) + 2) = false then
	result true

    elsif red_piece (Conv_to_x_location (X2), Conv_to_y_location (Y2)) = true and (blue_piece (Conv_to_x_location (X2) + 1, Conv_to_y_location (Y2) + 1) = true or blue_king (Conv_to_x_location (X2) +
	    1,
	    Conv_to_y_location (Y2) + 1) = true)
	    and blue_piece (Conv_to_x_location (X2) + 2, Conv_to_y_location (Y2) + 2) = false and blue_king (Conv_to_x_location (X2) + 2, Conv_to_y_location (Y2) + 2) = false
	    and red_piece (Conv_to_x_location (X2) + 2, Conv_to_y_location (Y2) + 2) = false and red_king (Conv_to_x_location (X2) + 2, Conv_to_y_location (Y2) + 2) = false then
	result true

    elsif red_king (Conv_to_x_location (X2), Conv_to_y_location (Y2)) = true and (blue_piece (Conv_to_x_location (X2) + 1, Conv_to_y_location (Y2) + 1) = true or blue_king (Conv_to_x_location (X2) +
	    1,
	    Conv_to_y_location (Y2) + 1) = true)
	    and blue_piece (Conv_to_x_location (X2) + 2, Conv_to_y_location (Y2) + 2) = false and blue_king (Conv_to_x_location (X2) + 2, Conv_to_y_location (Y2) + 2) = false
	    and red_piece (Conv_to_x_location (X2) + 2, Conv_to_y_location (Y2) + 2) = false and red_king (Conv_to_x_location (X2) + 2, Conv_to_y_location (Y2) + 2) = false then
	result true

    elsif red_king (Conv_to_x_location (X2), Conv_to_y_location (Y2)) = true and (blue_piece (Conv_to_x_location (X2) + 1, Conv_to_y_location (Y2) - 1) = true or blue_king (Conv_to_x_location (X2) +
	    1,
	    Conv_to_y_location (Y2) - 1) = true)
	    and blue_piece (Conv_to_x_location (X2) + 2, Conv_to_y_location (Y2) - 2) = false and blue_king (Conv_to_x_location (X2) + 2, Conv_to_y_location (Y2) - 2) = false
	    and red_piece (Conv_to_x_location (X2) + 2, Conv_to_y_location (Y2) - 2) = false and red_king (Conv_to_x_location (X2) + 2, Conv_to_y_location (Y2) - 2) = false then
	result true

    elsif red_king (Conv_to_x_location (X2), Conv_to_y_location (Y2)) = true and (blue_piece (Conv_to_x_location (X2) - 1, Conv_to_y_location (Y2) + 1) = true or blue_king (Conv_to_x_location (X2) -
	    1,
	    Conv_to_y_location (Y2) + 1) = true)
	    and blue_piece (Conv_to_x_location (X2) - 2, Conv_to_y_location (Y2) + 2) = false and blue_king (Conv_to_x_location (X2) - 2, Conv_to_y_location (Y2) + 2) = false
	    and red_piece (Conv_to_x_location (X2) - 2, Conv_to_y_location (Y2) + 2) = false and red_king (Conv_to_x_location (X2) - 2, Conv_to_y_location (Y2) + 2) = false then
	result true

    elsif red_king (Conv_to_x_location (X2), Conv_to_y_location (Y2)) = true and (blue_piece (Conv_to_x_location (X2) - 1, Conv_to_y_location (Y2) - 1) = true or blue_king (Conv_to_x_location (X2) -
	    1,
	    Conv_to_y_location (Y2) - 1) = true)
	    and blue_piece (Conv_to_x_location (X2) - 2, Conv_to_y_location (Y2) - 2) = false and blue_king (Conv_to_x_location (X2) - 2, Conv_to_y_location (Y2) - 2) = false
	    and red_piece (Conv_to_x_location (X2) - 2, Conv_to_y_location (Y2) - 2) = false and red_king (Conv_to_x_location (X2) - 2, Conv_to_y_location (Y2) - 2) = false then
	result true

    else
	result false

    end if

end redtake1

function RedPiece (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean) : array 1 .. 2 of int

    var X, Y, Btn2, btnUpDown : int
    var square : array 1 .. 2 of int

    loop
	Mouse.ButtonWait ("down", X, Y, Btn2, btnUpDown)

	%Selecting Piece that will be used to capture
	if Btn2 = 1 and Conv_to_x_location (X) > 0 and Conv_to_x_location (X) < 9 and Conv_to_y_location (Y) > 0 and Conv_to_y_location (Y) < 9 and
		(red_piece (Conv_to_x_location (X), Conv_to_y_location (Y)) = true or red_king (Conv_to_x_location (X), Conv_to_y_location (Y)) = true) then
	    X := X
	    Y := Y
	    exit when redtake1 (blue_piece, red_piece, blue_king, red_king, X, Y) = true
	end if

    end loop

    square (1) := Conv_to_x_location (X)
    square (2) := Conv_to_y_location (Y)

    result square

end RedPiece

function RedPiece1 (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, X, Y : int) : array 1 .. 2 of int

    const X_position := 1
    const Y_position := 2
    var X2, Y2, Btn2, Btn3, btnUpDown : int
    var square : array 1 .. 2 of int

    loop
	Mouse.ButtonWait ("down", X2, Y2, Btn3, btnUpDown)
	if Btn3 = 1 then
	    exit
	end if
    end loop

    square (1) := Conv_to_x_location (X2)
    square (2) := Conv_to_y_location (Y2)

    result square

end RedPiece1


proc red_capture_move (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, var btotal : int)
    const X_position : int := 1
    const Y_position : int := 2
    const size := maxy div 10
    var X, X2, Y, Y2 : int
    var square1, square2 : array 1 .. 2 of int
    var newking : boolean := false

    loop

	square1 := RedPiece (blue_piece, red_piece, blue_king, red_king)
	X := square1 (1)
	Y := square1 (2)

	redselect (red_king, center, X, Y)

	square2 := RedPiece1 (blue_piece, red_piece, blue_king, red_king, center, X, Y)
	X2 := square2 (1)
	Y2 := square2 (2)

	exit when red_piece (X, Y) = true and abs (X2 - X) = 2 and Y2 - Y = 2 and
	    (blue_piece (X + (X2 - X) div 2, Y + 1) = true or blue_king (X + (X2 - X) div 2, Y + 1) = true)
	    and blue_piece (X2, Y2) = false and blue_king (X2, Y2) = false and red_piece (X2, Y2) = false and red_king (X2, Y2) = false

	exit when red_king (X, Y) = true and abs (X2 - X) = 2 and abs (Y - Y2) = 2 and
	    (blue_piece (X + (X2 - X) div 2, Y + (Y2 - Y) div 2) = true or blue_king (X + (X2 - X) div 2, Y + (Y2 - Y) div 2) = true)
	    and blue_piece (X2, Y2) = false and blue_king (X2, Y2) = false and red_piece (X2, Y2) = false and red_king (X2, Y2) = false

	Draw.FillOval (center (X_position, X, Y), center (Y_position, X, Y), 25, 25, black)
	Draw.FillOval (center (X_position, X, Y), center (Y_position, X, Y), 20, 20, brightred)
	if red_king (X, Y) = true then
	    Draw.FillOval (center (X_position, X, Y), center (Y_position, X, Y), 5, 5, yellow)
	end if

    end loop


    if red_piece (X, Y) = true then
	red_piece (X, Y) := false
	red_piece (X2, Y2) := true
    else
	red_king (X, Y) := false
	red_king (X2, Y2) := true
    end if
    if blue_piece (X + (X2 - X) div 2, Y + (Y2 - Y) div 2) = true then
	blue_piece (X + (X2 - X) div 2, Y + (Y2 - Y) div 2) := false
    else
	blue_king (X + (X2 - X) div 2, Y + (Y2 - Y) div 2) := false
    end if

    Draw.FillBox ((X + (X2 - X) div 2) * size + size, (Y + (Y2 - Y) div 2) * size,
	(X + (X2 - X) div 2) * size + (size * 2), (Y + (Y2 - Y) div 2) * size + size, green)
    Draw.FillBox (X * size + size, Y * size, X * size + (size * 2), Y * size + size, green)
    Draw.FillOval (center (X_position, X2, Y2), center (Y_position, X2, Y2), 25, 25, red)
    if red_king (X2, Y2) = true then
	Draw.FillOval (center (X_position, X2, Y2), center (Y_position, X2, Y2), 5, 5, yellow)
    end if

    btotal -= 1

    for count : 1 .. 8
	if red_piece (count, 8) = true then
	    red_piece (count, 8) := false
	    red_king (count, 8) := true
	    Draw.FillOval (center (X_position, count, 8), center (Y_position, count, 8), 5, 5, yellow)
	    newking := true
	end if
    end for

    delay (10)

    if newking = false then

	if can_red_jump_again (blue_piece, red_piece, blue_king, red_king, center, X2, Y2) = true then
	    red_capture_move (blue_piece, red_piece, blue_king, red_king, center, btotal)
	end if

    end if

end red_capture_move
