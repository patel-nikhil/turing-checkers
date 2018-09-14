/* Code written by Nikhil Patel
 *
 * Procedures Declared      Parameters
 * redmove                  blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int
 * bluemove                 blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int
 *
 *
 * Purpose
 * Regular moves for red and blue, respectively
 *
 * Functions Declared        Return Value               Parameters
 * select_red_piece          array 1 .. 2 of int        blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean
 * select_second_red_piece   array 1 .. 2 of int        blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, x_location, y_location : int
 * select_blue_piece         array 1 .. 2 of int        blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean
 * select_second_blue_piece  array 1 .. 2 of int        blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, x_location, y_location : int
 *
 * Purpose
 * Selecting the Pieces to be moved
 *
 */

%Selecting Piece to move
function select_red_piece (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean) : array 1 .. 2 of int

    var X, Y, Btn, btnUpDown : int
    var grid : array 1 .. 2 of int

    loop
	Mouse.ButtonWait ("down", X, Y, Btn, btnUpDown)
	if Btn = 1 and Conv_to_x_location (X) > 0 and Conv_to_x_location (X) < 9 and Conv_to_y_location (Y) > 0 and Conv_to_y_location (Y) < 9
		and ((Conv_to_x_location (X) mod 2 = 0 and Conv_to_y_location (Y) mod 2 = 0) or (Conv_to_x_location (X) mod 2 = 1 and Conv_to_y_location (Y) mod 2 = 1))
		and red_piece (Conv_to_x_location (X), Conv_to_y_location (Y)) = true and blue_piece (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) + 1) = false
		and red_piece (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) + 1) = false and blue_king (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) + 1) = false
		and red_king (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) + 1) = false then
	    exit
	elsif Btn = 1 and Conv_to_x_location (X) > 0 and Conv_to_x_location (X) < 9 and Conv_to_y_location (Y) > 0 and Conv_to_y_location (Y) < 9
		and ((Conv_to_x_location (X) mod 2 = 0 and Conv_to_y_location (Y) mod 2 = 0) or (Conv_to_x_location (X) mod 2 = 1 and Conv_to_y_location (Y) mod 2 = 1))
		and red_piece (Conv_to_x_location (X), Conv_to_y_location (Y)) = true and blue_piece (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) + 1) = false
		and red_piece (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) + 1) = false and blue_king (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) + 1) = false
		and red_king (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) + 1) = false then
	    exit
	elsif Btn = 1 and Conv_to_x_location (X) > 0 and Conv_to_x_location (X) < 9 and Conv_to_y_location (Y) > 0 and Conv_to_y_location (Y) < 9
		and ((Conv_to_x_location (X) mod 2 = 0 and Conv_to_y_location (Y) mod 2 = 0) or (Conv_to_x_location (X) mod 2 = 1 and Conv_to_y_location (Y) mod 2 = 1))
		and red_king (Conv_to_x_location (X), Conv_to_y_location (Y)) = true and blue_piece (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) + 1) = false
		and red_piece (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) + 1) = false and blue_king (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) + 1) = false
		and red_king (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) + 1) = false then
	    exit
	elsif Btn = 1 and Conv_to_x_location (X) > 0 and Conv_to_x_location (X) < 9 and Conv_to_y_location (Y) > 0 and Conv_to_y_location (Y) < 9
		and ((Conv_to_x_location (X) mod 2 = 0 and Conv_to_y_location (Y) mod 2 = 0) or (Conv_to_x_location (X) mod 2 = 1 and Conv_to_y_location (Y) mod 2 = 1))
		and red_king (Conv_to_x_location (X), Conv_to_y_location (Y)) = true and blue_piece (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) + 1) = false
		and red_piece (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) + 1) = false and blue_king (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) + 1) = false
		and red_king (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) + 1) = false then
	    exit
	elsif Btn = 1 and Conv_to_x_location (X) > 0 and Conv_to_x_location (X) < 9 and Conv_to_y_location (Y) > 0 and Conv_to_y_location (Y) < 9
		and ((Conv_to_x_location (X) mod 2 = 0 and Conv_to_y_location (Y) mod 2 = 0) or (Conv_to_x_location (X) mod 2 = 1 and Conv_to_y_location (Y) mod 2 = 1))
		and red_king (Conv_to_x_location (X), Conv_to_y_location (Y)) = true and blue_piece (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) - 1) = false
		and red_piece (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) - 1) = false and blue_king (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) - 1) = false
		and red_king (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) - 1) = false then
	    exit
	elsif Btn = 1 and Conv_to_x_location (X) > 0 and Conv_to_x_location (X) < 9 and Conv_to_y_location (Y) > 0 and Conv_to_y_location (Y) < 9
		and ((Conv_to_x_location (X) mod 2 = 0 and Conv_to_y_location (Y) mod 2 = 0) or (Conv_to_x_location (X) mod 2 = 1 and Conv_to_y_location (Y) mod 2 = 1))
		and red_king (Conv_to_x_location (X), Conv_to_y_location (Y)) = true and blue_piece (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) - 1) = false
		and red_piece (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) - 1) = false and blue_king (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) - 1) = false
		and red_king (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) - 1) = false then
	    exit
	end if
    end loop

    grid (1) := Conv_to_x_location (X)
    grid (2) := Conv_to_y_location (Y)

    result grid

end select_red_piece

function select_second_red_piece (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, x_location, y_location : int) : array 1 .. 2 of int

    var X, Y, Btn, btnUpDown : int
    var grid : array 1 .. 2 of int

    loop
	Mouse.ButtonWait ("down", X, Y, Btn, btnUpDown)
	exit when Btn = 1
    end loop

    grid (1) := Conv_to_x_location (X)
    grid (2) := Conv_to_y_location (Y)

    result grid

end select_second_red_piece

function select_blue_piece (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean) : array 1 .. 2 of int

    var X, Y, Btn, btnUpDown : int
    var grid : array 1 .. 2 of int

    loop
	Mouse.ButtonWait ("down", X, Y, Btn, btnUpDown)
	if Btn = 1 and Conv_to_x_location (X) > 0 and Conv_to_x_location (X) < 9 and Conv_to_y_location (Y) > 0 and Conv_to_y_location (Y) < 9
		and ((Conv_to_x_location (X) mod 2 = 0 and Conv_to_y_location (Y) mod 2 = 0) or (Conv_to_x_location (X) mod 2 = 1 and Conv_to_y_location (Y) mod 2 = 1))
		and blue_piece (Conv_to_x_location (X), Conv_to_y_location (Y)) = true and red_piece (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) - 1) = false
		and blue_piece (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) - 1) = false and red_king (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) - 1) = false
		and blue_king (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) - 1) = false then
	    exit
	elsif Btn = 1 and Conv_to_x_location (X) > 0 and Conv_to_x_location (X) < 9 and Conv_to_y_location (Y) > 0 and Conv_to_y_location (Y) < 9
		and ((Conv_to_x_location (X) mod 2 = 0 and Conv_to_y_location (Y) mod 2 = 0) or (Conv_to_x_location (X) mod 2 = 1 and Conv_to_y_location (Y) mod 2 = 1))
		and blue_piece (Conv_to_x_location (X), Conv_to_y_location (Y)) = true and red_piece (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) - 1) = false
		and blue_piece (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) - 1) = false and red_king (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) - 1) = false
		and blue_king (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) - 1) = false then
	    exit
	elsif Btn = 1 and Conv_to_x_location (X) > 0 and Conv_to_x_location (X) < 9 and Conv_to_y_location (Y) > 0 and Conv_to_y_location (Y) < 9
		and ((Conv_to_x_location (X) mod 2 = 0 and Conv_to_y_location (Y) mod 2 = 0) or (Conv_to_x_location (X) mod 2 = 1 and Conv_to_y_location (Y) mod 2 = 1))
		and blue_king (Conv_to_x_location (X), Conv_to_y_location (Y)) = true and red_piece (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) - 1) = false
		and blue_piece (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) - 1) = false and red_king (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) - 1) = false
		and blue_king (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) - 1) = false then
	    exit
	elsif Btn = 1 and Conv_to_x_location (X) > 0 and Conv_to_x_location (X) < 9 and Conv_to_y_location (Y) > 0 and Conv_to_y_location (Y) < 9
		and ((Conv_to_x_location (X) mod 2 = 0 and Conv_to_y_location (Y) mod 2 = 0) or (Conv_to_x_location (X) mod 2 = 1 and Conv_to_y_location (Y) mod 2 = 1))
		and blue_king (Conv_to_x_location (X), Conv_to_y_location (Y)) = true and red_piece (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) - 1) = false
		and blue_piece (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) - 1) = false and red_king (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) - 1) = false
		and blue_king (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) - 1) = false then
	    exit
	elsif Btn = 1 and Conv_to_x_location (X) > 0 and Conv_to_x_location (X) < 9 and Conv_to_y_location (Y) > 0 and Conv_to_y_location (Y) < 9
		and ((Conv_to_x_location (X) mod 2 = 0 and Conv_to_y_location (Y) mod 2 = 0) or (Conv_to_x_location (X) mod 2 = 1 and Conv_to_y_location (Y) mod 2 = 1))
		and blue_king (Conv_to_x_location (X), Conv_to_y_location (Y)) = true and red_piece (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) + 1) = false
		and blue_piece (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) + 1) = false and red_king (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) + 1) = false
		and blue_king (Conv_to_x_location (X) - 1, Conv_to_y_location (Y) + 1) = false then
	    exit
	elsif Btn = 1 and Conv_to_x_location (X) > 0 and Conv_to_x_location (X) < 9 and Conv_to_y_location (Y) > 0 and Conv_to_y_location (Y) < 9
		and ((Conv_to_x_location (X) mod 2 = 0 and Conv_to_y_location (Y) mod 2 = 0) or (Conv_to_x_location (X) mod 2 = 1 and Conv_to_y_location (Y) mod 2 = 1))
		and blue_king (Conv_to_x_location (X), Conv_to_y_location (Y)) = true and red_piece (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) + 1) = false
		and blue_piece (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) + 1) = false and red_king (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) + 1) = false
		and blue_king (Conv_to_x_location (X) + 1, Conv_to_y_location (Y) + 1) = false then
	    exit
	end if
    end loop

    grid (1) := Conv_to_x_location (X)
    grid (2) := Conv_to_y_location (Y)

    result grid

end select_blue_piece

function select_second_blue_piece (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, x_location, y_location : int) : array 1 .. 2 of int

    var X, Y, Btn, btnUpDown : int
    var grid : array 1 .. 2 of int

    loop
	Mouse.ButtonWait ("down", X, Y, Btn, btnUpDown)
	exit when Btn = 1
    end loop

    grid (1) := Conv_to_x_location (X)
    grid (2) := Conv_to_y_location (Y)

    result grid

end select_second_blue_piece


%Regular move Red
proc red_move (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int)

    const X_POSITION := 1
    const Y_POSITION := 2
    const size := maxy div 10
    var X, Y, Btn, btnUpDown, x_location, y_location, x_location1, y_location1 : int
    var square1, square2 : array 1 .. 2 of int

    loop

	square1 := select_red_piece (blue_piece, red_piece, blue_king, red_king)

	x_location := square1 (1)
	y_location := square1 (2)

	redselect (red_king, center, x_location, y_location)

	square2 := select_second_red_piece (blue_piece, red_piece, blue_king, red_king, x_location, y_location)

	x_location1 := square2 (1)
	y_location1 := square2 (2)

	if x_location1 < 9 and x_location1 > 0 and y_location1 > 0 and y_location1 < 9
		and abs (x_location1 - x_location) = 1 and abs (y_location1 - y_location) = 1 and blue_piece (x_location1, y_location1) = false
		and blue_king (x_location1, y_location1) = false and red_piece (x_location1, y_location1) = false and red_king (x_location1, y_location1) = false
		and ((red_piece (x_location, y_location) = true and y_location1 > y_location) or red_king (x_location, y_location) = true) then
	    exit

	else

	    Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 25, 25, brightred)
	    if red_king (x_location, y_location) = true then
		Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 5, 5, yellow)
	    end if

	end if

    end loop


    Draw.FillBox (x_location * size + size, y_location * size, x_location * size + (size * 2), y_location * size + size, green)
    Draw.FillOval (center (X_POSITION, x_location1, y_location1), center (Y_POSITION, x_location1, y_location1), 25, 25, red)
    if red_king (x_location, y_location) = true then
	Draw.FillOval (center (X_POSITION, x_location1, y_location1), center (Y_POSITION, x_location1, y_location1), 5, 5, yellow)
    end if

    if red_piece (x_location, y_location) = true then
	red_piece (x_location, y_location) := false
	red_piece (x_location1, y_location1) := true
    else
	red_king (x_location, y_location) := false
	red_king (x_location1, y_location1) := true
    end if

    %Input.Pause
    for count : 1 .. 8
	if red_piece (count, 8) = true then
	    red_piece (count, 8) := false
	    red_king (count, 8) := true
	    Draw.FillOval (center (X_POSITION, count, 8), center (Y_POSITION, count, 8), 5, 5, yellow)
	end if
    end for
end red_move

%Regular move blue
proc blue_move (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int)
    var X, Y, Btn, btnUpDown, x_location, y_location, x_location1, y_location1 : int
    const X_POSITION := 1
    const Y_POSITION := 2
    const size := maxy div 10
    var square1, square2 : array 1 .. 2 of int

    loop

	square1 := select_blue_piece (blue_piece, red_piece, blue_king, red_king)

	x_location := square1 (1)
	y_location := square1 (2)

	blueselect (blue_king, center, x_location, y_location)

	square2 := select_second_blue_piece (blue_piece, red_piece, blue_king, red_king, x_location, y_location)

	x_location1 := square2 (1)
	y_location1 := square2 (2)


	if x_location1 < 9 and x_location1 > 0 and y_location1 > 0 and y_location1 < 9
		and abs (x_location1 - x_location) = 1 and abs (y_location - y_location1) = 1 and blue_piece (x_location1, y_location1) = false
		and blue_king (x_location1, y_location1) = false and red_piece (x_location1, y_location1) = false and red_king (x_location1, y_location1) = false
		and ((blue_piece (x_location, y_location) = true and y_location1 < y_location) or blue_king (x_location, y_location) = true) then
	    exit

	else

	    Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 25, 25, 53)
	    if blue_king (x_location, y_location) = true then
		Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 5, 5, yellow)
	    end if

	end if

    end loop

    Draw.FillBox (x_location * size + size, y_location * size, x_location * size + (size * 2), y_location * size + size, green)
    Draw.FillOval (center (X_POSITION, x_location1, y_location1), center (Y_POSITION, x_location1, y_location1), 25, 25, 104)
    if blue_king (x_location, y_location) = true then
	Draw.FillOval (center (X_POSITION, x_location1, y_location1), center (Y_POSITION, x_location1, y_location1), 5, 5, yellow)
    end if

    if blue_piece (x_location, y_location) = true then
	blue_piece (x_location, y_location) := false
	blue_piece (x_location1, y_location1) := true
    else
	blue_king (x_location, y_location) := false
	blue_king (x_location1, y_location1) := true
    end if

    for count : 1 .. 8
	if blue_piece (count, 1) = true then
	    blue_piece (count, 1) := false
	    blue_king (count, 1) := true
	    Draw.FillOval (center (X_POSITION, count, 1), center (Y_POSITION, count, 1), 5, 5, yellow)
	end if
    end for
end blue_move

