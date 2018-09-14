/* Program written by Nikhil Patel
 *
 * This is the main body of the checkers program
 *
 * Procedure Declared
 * Game
 * game_over
 *
 */


include "Reset.t"
include "DrawSelect.t"
include "Click.t"
include "Highlight.t"
include "Check_all_pcs.t"
include "Jump_again.t"
include "Reg Move.t"
include "BlueCapture.t"
include "RedCapture.t"
include "CheckLegalMove.t"

include "AI_Files/Check_Legal_Move.t"
include "AI_Files/Capture.t"
include "AI_Files/AI_Capture.t"
include "AI_Files/Opponent_Capture.t"
include "AI_Files/Make_Capture.t"
include "AI_Files/AI_Move.t"
include "AI_Files/Main_AI.t"


proc game_over (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, number_redpieces, number_bluepieces : int)
    var font : int := Font.New ("Times New Roman:40:bold")

    delay (50)

    if number_redpieces = 0 or check_legalred (blue_piece, red_piece, blue_king, red_king, center) = false then
	Font.Draw ("Blue Wins!", maxy div 10 * 14, maxy div 2, font, blue)
    elsif number_bluepieces = 0 or check_legalblue (blue_piece, red_piece, blue_king, red_king, center) = false then
	Font.Draw ("Red Wins!", maxy div 10 * 14, maxy div 2, font, red)
    end if


end game_over

proc Game

    setscreen ("graphics:max;max;nobuttonbar")
    var font : int := Font.New ("Times New Roman:40:bold")
    var number_redpieces, number_bluepieces : int := 12

    %Array index of -1 to 10 used to adapt to checking pieces for possible jumps
    var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean

    var center : array 1 .. 2, 1 .. 8, 1 .. 8 of int

    reset_pieces (blue_piece, red_piece, blue_king, red_king)
    drawboard (center)

    Font.Draw ("Red's Turn...", maxy div 10 * 14, maxy div 3, font, black)
    Font.Draw ("Blue's Turn...", maxy div 10 * 14, (maxy div 3) * 2, font, black)

    loop


	if number_redpieces > 0 and number_bluepieces > 0 then

	    var red_capture_choices : array 1 .. 6 of boolean
	    var counter : int := 0

	    red_capture_choices := can_red_capture (blue_piece, red_piece, blue_king, red_king, center)

	    Font.Draw ("Red's Turn...", maxy div 10 * 14, maxy div 3, font, red)
	    Font.Draw ("Blue's Turn...", maxy div 10 * 14, (maxy div 3) * 2, font, black)
	    Draw.FillOval (maxy div 10 * 13, (maxy div 3) * 2 + 10, 20, 20, 90)
	    Draw.FillOval (maxy div 10 * 13, maxy div 3 + 10, 20, 20, red)


	    for x : 1 .. 6
		if red_capture_choices (x) = false then
		    counter += 1
		end if
	    end for

	    loop
		if counter < 6 then
		    red_capture_move (blue_piece, red_piece, blue_king, red_king, center, number_bluepieces)
		    exit
		else
		    if check_legalred (blue_piece, red_piece, blue_king, red_king, center) = true then
			red_move (blue_piece, red_piece, blue_king, red_king, center)
		    else
			return
		    end if
		end if
		exit
	    end loop

	else
	    exit
	end if

	if number_redpieces > 0 and number_bluepieces > 0 then

	    var blue_capture_choices : array 1 .. 6 of boolean := can_blue_capture (blue_piece, red_piece, blue_king, red_king, center)
	    var counter : int := 0

	    Draw.FillOval (maxy div 10 * 13, (maxy div 3) * 2 + 10, 20, 20, blue)
	    Draw.FillOval (maxy div 10 * 13, maxy div 3 + 10, 20, 20, 90)
	    Font.Draw ("Red's Turn...", maxy div 10 * 14, maxy div 3, font, black)
	    Font.Draw ("Blue's Turn...", maxy div 10 * 14, (maxy div 3) * 2, font, blue)

	    for x : 1 .. 6
		if blue_capture_choices (x) = false then
		    counter += 1
		end if
	    end for

	    loop
		if counter < 6 then
		    blue_capture_move (blue_piece, red_piece, blue_king, red_king, center, number_redpieces)
		    exit
		else
		    if check_legalblue (blue_piece, red_piece, blue_king, red_king, center) = true then
			blue_move (blue_piece, red_piece, blue_king, red_king, center)
		    else
			return
		    end if
		end if
		exit
	    end loop

	else
	    exit
	end if


    end loop


    game_over (blue_piece, red_piece, blue_king, red_king, center, number_redpieces, number_bluepieces)

end Game

AI_Game
