/* Code written by Nikhil Patel
 *
 * Procedures Declared      Parameters
 * redselect                red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x_location, y_location : int
 * redselect1               red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, whichtake : int, X, Y : array 1 .. 6 of int
 * blueselect               blue_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x_location, y_location : int
 * blueselect1              blue_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, whichtake, whichtake1 : int, X, Y, X2, Y2 : array 1 .. 6 of int
 *
 * Purpose
 * Draws border to identify the selection of pieces
 *
 *
 */


proc redselect (red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x_location, y_location : int)
    const X_POSITION := 1
    const Y_POSITION := 2
    Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 25, 25, yellow)
    Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 20, 20, brightred)
    if red_king (x_location, y_location) = true then
	Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 5, 5, yellow)
    end if
end redselect
proc redselect1 (red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, whichtake : int, X, Y : array 1 .. 6 of int)
    const X_POSITION := 1
    const Y_POSITION := 2
    Draw.FillOval (center (X_POSITION, X (whichtake), Y (whichtake)), center (Y_POSITION, X (whichtake), Y (whichtake)), 25, 25, yellow)
    Draw.FillOval (center (X_POSITION, X (whichtake), Y (whichtake)), center (Y_POSITION, X (whichtake), Y (whichtake)), 20, 20, brightred)
    if red_king (X (whichtake), Y (whichtake)) = true then
	Draw.FillOval (center (X_POSITION, X (whichtake), Y (whichtake)), center (Y_POSITION, X (whichtake), Y (whichtake)), 5, 5, yellow)
    end if
end redselect1
proc blueselect (blue_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x_location, y_location : int)
    const X_POSITION := 1
    const Y_POSITION := 2
    Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 25, 25, yellow)
    Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 20, 20, 53)
    if blue_king (x_location, y_location) = true then
	Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 5, 5, yellow)
    end if
end blueselect
proc blueselect1 (blue_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, whichtake, whichtake1 : int, X, Y, X2, Y2 : array 1 .. 6 of int)
    const X_POSITION := 1
    const Y_POSITION := 2
    Draw.FillOval (center (X_POSITION, X2 (whichtake1), Y2 (whichtake1)), center (Y_POSITION, X2 (whichtake1), Y2 (whichtake1)), 25, 25, yellow)
    Draw.FillOval (center (X_POSITION, X2 (whichtake1), Y2 (whichtake1)), center (Y_POSITION, X2 (whichtake1), Y2 (whichtake1)), 20, 20, 53)
    if blue_king (X (whichtake), Y (whichtake)) = true then
	Draw.FillOval (center (X_POSITION, X (whichtake), Y (whichtake)), center (Y_POSITION, X (whichtake), Y (whichtake)), 5, 5, yellow)
    end if
end blueselect1
