/* Code written by Nikhil Patel
 *
 * Functions Declared        Return Value
 * Conv_to_x_location           int
 * Conv_to_y_location           int
 *
 * Parameters (var : int)
 *
 * Purpose
 * Convert coordinates of click to square on grid
 *
 */

function Conv_to_x_location (temp : int) : int
    const size := maxy div 10
    result (temp - size) div size
end Conv_to_x_location

function Conv_to_y_location (temp : int) : int
    const size := maxy div 10
    result temp div size
end Conv_to_y_location

