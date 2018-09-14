/* Code written by Nikhil Patel
 *
 * Forced capture for AI
 *
 * Function
 * check_number_captures
 *
 * Procedure
 * AI_capture_move
 *
 *
 * Functions/Procedures Called
 * can_blue_capture
 * one_option_capture
 * multiple_option_capture
 *
 */

forward proc one_option_capture (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, var number_redpieces,
    number_bluepieces : int)
forward proc multiple_option_capture (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, var number_redpieces,
    number_bluepieces : int)

function check_number_captures (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int) : int

    var AI_capture_choices : array 1 .. 6 of boolean := can_blue_AI_capture (blue_piece, red_piece, blue_king, red_king, center)
    var counter : int := 0

    for x : 1 .. 6
	if AI_capture_choices (x) = false then
	    counter += 1
	end if
    end for

    result counter

end check_number_captures

proc AI_capture_move (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, var number_redpieces, number_bluepieces :
	int)

    var counter := check_number_captures (blue_piece, red_piece, blue_king, red_king, center)

    if counter = 5 then

	one_option_capture (blue_piece, red_piece, blue_king, red_king, center, number_redpieces, number_bluepieces)

    else
    
	%Input.Pause
	multiple_option_capture (blue_piece, red_piece, blue_king, red_king, center, number_redpieces, number_bluepieces)

    end if

end AI_capture_move

