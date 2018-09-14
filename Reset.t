/* Code written by Nikhil Patel
 *
 * Procedure Declared           Parameters
 * reset_pieces                 blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean
 * drawboard                    center : array 1 .. 2, 1 .. 8, 1 .. 8 of int
 *
 * Purpose
 * Draws starting checkers board and pieces
 *
 */


proc reset_pieces (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean)

    for x : 1 .. 8
	for y : 1 .. 8
	    blue_piece (x, y) := false
	    red_piece (x, y) := false
	    blue_king (x, y) := false
	    red_king (x, y) := false
	end for
    end for

    for y : 1 .. 3
	for x : 1 .. 8
	    if (x mod 2 = 0) and (y mod 2 = 0) or x mod 2 = 1 and y mod 2 = 1 then
		red_piece (x, y) := true
	    end if
	end for
    end for

    for y : 6 .. 8
	for x : 1 .. 8
	    if (x mod 2 = 0) and (y mod 2 = 0) or x mod 2 = 1 and y mod 2 = 1 then
		blue_piece (x, y) := true
	    end if
	end for
    end for


    for y : -1 .. 0
	for x : -1 .. 10
	    blue_piece (x, y) := true
	    red_piece (x, y) := true
	    blue_piece (y, x) := true
	    red_piece (y, x) := true
	    blue_king (x, y) := true
	    red_king (x, y) := true
	    blue_king (y, x) := true
	    red_king (y, x) := true
	end for
    end for

    for y : 9 .. 10
	for x : -1 .. 10
	    blue_piece (x, y) := true
	    red_piece (x, y) := true
	    blue_piece (y, x) := true
	    red_piece (y, x) := true
	    blue_king (x, y) := true
	    red_king (x, y) := true
	    blue_king (y, x) := true
	    red_king (y, x) := true
	end for
    end for

end reset_pieces

proc drawboard (var center : array 1 .. 2, 1 .. 8, 1 .. 8 of int)

    const X_POSITION := 1
    const Y_POSITION := 2
    const SIZE := maxy div 10

    colorback (90)
    cls

    %Draws the checkerboard
    for x : 1 .. 8
	for y : 1 .. 8
	    var colours : int
	    if (x mod 2 = 0) and (y mod 2 = 0) or x mod 2 = 1 and y mod 2 = 1 then
		colours := green
	    else
		colours := white
	    end if
	    Draw.FillBox (x * SIZE + SIZE, y * SIZE, x * SIZE + (SIZE * 2), y * SIZE + SIZE, colours)
	    center (X_POSITION, x, y) := x * SIZE + ceil (SIZE * 1.5)
	    center (Y_POSITION, x, y) := y * SIZE + (SIZE div 2)
	end for
    end for

    %Draws red pieces on bottom 3 rows
    for y : 1 .. 3
	for x : 1 .. 8
	    if (x mod 2 = 0) and (y mod 2 = 0) or x mod 2 = 1 and y mod 2 = 1 then
		Draw.FillOval (center (X_POSITION, x, y), center (Y_POSITION, x, y), 25, 25, red)
	    end if
	end for
    end for

    %Draws black pieces on the top 3 rows
    for y : 6 .. 8
	for x : 1 .. 8
	    if (x mod 2 = 0) and (y mod 2 = 0) or x mod 2 = 1 and y mod 2 = 1 then
		Draw.FillOval (center (X_POSITION, x, y), center (Y_POSITION, x, y), 25, 25, 104)
	    end if
	end for
    end for

end drawboard
