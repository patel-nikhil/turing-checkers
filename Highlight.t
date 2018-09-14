/* Code written by Nikhil Patel
 *
 * Procedures Declared                          Parameters
 * light_open_red_pcs, light_open_red_jump      red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x_location, y_location : int
 * light_open_blue_pcs, light_open_blue_jump    blue_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x_location, y_location : int
 *
 * Purpose
 * Highlight pieces that can be legally moved
 *
 */


proc light_open_red_pcs (red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x_location, y_location : int)
    const X_POSITION := 1
    const Y_POSITION := 2
    Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 25, 25, brightred)
    if red_king (x_location, y_location) = true then
	Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 5, 5, yellow)
    end if
end light_open_red_pcs

proc light_open_red_jump (red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x_location, y_location : int)
    const X_POSITION := 1
    const Y_POSITION := 2
    Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 25, 25, black)
    Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 20, 20, brightred)
    if red_king (x_location, y_location) = true then
	Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 5, 5, yellow)
    end if
end light_open_red_jump

proc light_open_blue_pcs (blue_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x_location, y_location : int)
    const X_POSITION := 1
    const Y_POSITION := 2
    Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 25, 25, 53)
    if blue_king (x_location, y_location) = true then
	Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 5, 5, yellow)
    end if
end light_open_blue_pcs

proc light_open_blue_jump (blue_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x_location, y_location : int)
    const X_POSITION := 1
    const Y_POSITION := 2
    Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 25, 25, black)
    Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 20, 20, 53)
    if blue_king (x_location, y_location) = true then
	Draw.FillOval (center (X_POSITION, x_location, y_location), center (Y_POSITION, x_location, y_location), 5, 5, yellow)
    end if
end light_open_blue_jump
