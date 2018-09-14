/* Code written by Nikhil Patel
 *
 * Alternative Main Function for AI-based Game
 *
 * procedure AI_Game & AI_game_over
 *
 * Functions/Procedures Called
 * reset_pieces
 * drawboard
 * can_red_capture
 * red_capture_move
 * check_legalred
 * red_move
 * can_blue_capture
 * AI_capture_move
 * check_legalblue
 * AI_move
 * AI_game_over
 *
 */

proc AI_game_over (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, number_redpieces, number_bluepieces : int)
    var font : int := Font.New ("Times New Roman:40:bold")

    delay (50)

    if number_redpieces = 0 or check_legalred (blue_piece, red_piece, blue_king, red_king, center) = false then
	Font.Draw ("The AI Wins!", maxy div 10 * 14, maxy div 2, font, blue)
    elsif number_bluepieces = 0 or check_legalAI (blue_piece, red_piece, blue_king, red_king, center) = false then
	Font.Draw ("Red Wins!", maxy div 10 * 14, maxy div 2, font, red)
    end if


end AI_game_over

proc AI_Game

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

	%If there are pieces left on the board for both sides
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

	%If there are pieces left on the board for both sides
	if number_redpieces > 0 and number_bluepieces > 0 then

	    var blue_capture_choices : array 1 .. 6 of boolean := can_blue_AI_capture (blue_piece, red_piece, blue_king, red_king, center)
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
		    AI_capture_move (blue_piece, red_piece, blue_king, red_king, center, number_redpieces, number_bluepieces)
		    exit
		else
		    if check_legalAI (blue_piece, red_piece, blue_king, red_king, center) = true then
			AI_move (blue_piece, red_piece, blue_king, red_king, center, number_redpieces, number_bluepieces)
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


    AI_game_over (blue_piece, red_piece, blue_king, red_king, center, number_redpieces, number_bluepieces)

end AI_Game
