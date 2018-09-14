/* Code written by Nikhil Patel
 *
 * Function
 * can_AI_capture
 * test_can_blue_jump_again
 *
 * Procedures
 * one_option_capture
 * multiple_option_capture
 *
 *
 * Functions/Procedures Called
 * draw_blue_capture
 * can_blue_jump_again
 * AI_capture_move
 * can_AI_capture
 * test_capture
 * opponent_capture
 * can_blue_captue
 * check_legal_AI_move
 * AI_test_move
 * draw_blue_capture
 * actual_capture
 *
 */

forward function test_capture (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, var number_redpieces,
    number_bluepieces : int, start_x, start_y, end_x, end_y : int) : int

forward function opponent_capture (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, var number_redpieces,
    number_bluepieces : int) : int

forward function AI_test_move (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, start_x, start_y, end_x, end_y : int) : int

forward proc actual_capture (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, var number_redpieces, start_x,
    start_y, end_x, end_y : int)


%Check for possible blue jumps - result stand/end locations
function can_AI_capture (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int) : array 1 .. 8, 1 .. 8, 1 .. 8, 1 .. 8 of
	boolean
    var blue_jump_choices : array 1 .. 8, 1 .. 8, 1 .. 8, 1 .. 8 of boolean

    for a : 1 .. 8
	for b : 1 .. 8
	    for c : 1 .. 8
		for d : 1 .. 8
		    blue_jump_choices (a, b, c, d) := false
		end for
	    end for
	end for
    end for

    for x : 1 .. 8
	for y : 1 .. 8
	    %Blue Piece capture left and down
	    if blue_piece (x, y) = true and (red_piece (x - 1, y - 1) = true or red_king (x - 1, y - 1) = true) and blue_piece (x - 2, y - 2) = false
		    and blue_king (x - 2, y - 2) = false and red_piece (x - 2, y - 2) = false and red_king (x - 2, y - 2) = false then

		blue_jump_choices (x, y, x - 2, y - 2) := true

	    end if

	    %Blue Piece capture right and down
	    if blue_piece (x, y) = true and (red_piece (x + 1, y - 1) = true or red_king (x + 1, y - 1) = true) and blue_piece (x + 2, y - 2) = false
		    and blue_king (x + 2, y - 2) = false and red_piece (x + 2, y - 2) = false and red_king (x + 2, y - 2) = false then

		blue_jump_choices (x, y, x + 2, y - 2) := true

	    end if

	    %Blue King capture right and up
	    if blue_king (x, y) = true and (red_piece (x + 1, y + 1) = true or red_king (x + 1, y + 1) = true) and blue_piece (x + 2, y + 2) = false
		    and blue_king (x + 2, y + 2) = false and red_piece (x + 2, y + 2) = false and red_king (x + 2, y + 2) = false then

		blue_jump_choices (x, y, x + 2, y + 2) := true

	    end if

	    %Blue King capture right and down
	    if blue_king (x, y) = true and (red_piece (x + 1, y - 1) = true or red_king (x + 1, y - 1) = true) and blue_piece (x + 2, y - 2) = false
		    and blue_king (x + 2, y - 2) = false and red_piece (x + 2, y - 2) = false and red_king (x + 2, y - 2) = false then

		blue_jump_choices (x, y, x + 2, y - 2) := true

	    end if

	    %Blue King capture left and up
	    if blue_king (x, y) = true and (red_piece (x - 1, y + 1) = true or red_king (x - 1, y + 1) = true) and blue_piece (x - 2, y + 2) = false
		    and blue_king (x - 2, y + 2) = false and red_piece (x - 2, y + 2) = false and red_king (x - 2, y + 2) = false then

		blue_jump_choices (x, y, x - 2, y + 2) := true

	    end if

	    %Blue King capture left and down
	    if blue_king (x, y) = true and (red_piece (x - 1, y - 1) = true or red_king (x - 1, y - 1) = true) and blue_piece (x - 2, y - 2) = false
		    and blue_king (x - 2, y - 2) = false and red_piece (x - 2, y - 2) = false and red_king (x - 2, y - 2) = false then

		blue_jump_choices (x, y, x - 2, y - 2) := true

	    end if

	end for
    end for

    result blue_jump_choices

end can_AI_capture

function test_can_blue_jump_again (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, x, y : int) : boolean

    %Green Piece capture left and down
    if blue_piece (x, y) = true and (red_piece (x - 1, y - 1) = true or red_king (x - 1, y - 1) = true) and blue_piece (x - 2, y - 2) = false
	    and blue_king (x - 2, y - 2) = false and red_piece (x - 2, y - 2) = false and red_king (x - 2, y - 2) = false then
	result true

	%Green Piece capture right and down
    elsif blue_piece (x, y) = true and (red_piece (x + 1, y - 1) = true or red_king (x + 1, y - 1) = true) and blue_piece (x + 2, y - 2) = false
	    and blue_king (x + 2, y - 2) = false and red_piece (x + 2, y - 2) = false and red_king (x + 2, y - 2) = false then
	result true

	%Green King capture right and up
    elsif blue_king (x, y) = true and (red_piece (x + 1, y + 1) = true or red_king (x + 1, y + 1) = true) and blue_piece (x + 2, y + 2) = false
	    and blue_king (x + 2, y + 2) = false and red_piece (x + 2, y + 2) = false and red_king (x + 2, y + 2) = false then
	result true

	%Green King capture right and down
    elsif blue_king (x, y) = true and (red_piece (x + 1, y - 1) = true or red_king (x + 1, y - 1) = true) and blue_piece (x + 2, y - 2) = false
	    and blue_king (x + 2, y - 2) = false and red_piece (x + 2, y - 2) = false and red_king (x + 2, y - 2) = false then
	result true

	%Green King capture left and up
    elsif blue_king (x, y) = true and (red_piece (x - 1, y + 1) = true or red_king (x - 1, y + 1) = true) and blue_piece (x - 2, y + 2) = false
	    and blue_king (x - 2, y + 2) = false and red_piece (x - 2, y + 2) = false and red_king (x - 2, y + 2) = false then
	result true

	%Green King capture left and down
    elsif blue_king (x, y) = true and (red_piece (x - 1, y - 1) = true or red_king (x - 1, y - 1) = true) and blue_piece (x - 2, y - 2) = false
	    and blue_king (x - 2, y - 2) = false and red_piece (x - 2, y - 2) = false and red_king (x - 2, y - 2) = false then
	result true
    else
	result false
    end if

end test_can_blue_jump_again

body proc one_option_capture (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, var number_redpieces,
	number_bluepieces : int)

    var start_x, start_y, end_x, end_y : int

    for x : 1 .. 8
	for y : 1 .. 8
	    %Blue Piece capture left and down
	    if blue_piece (x, y) = true and (red_piece (x - 1, y - 1) = true or red_king (x - 1, y - 1) = true) and blue_piece (x - 2, y - 2) = false
		    and blue_king (x - 2, y - 2) = false and red_piece (x - 2, y - 2) = false and red_king (x - 2, y - 2) = false then

		start_x := x
		start_y := y
		end_x := x - 2
		end_y := y - 2

		%Blue Piece capture right and down
	    elsif blue_piece (x, y) = true and (red_piece (x + 1, y - 1) = true or red_king (x + 1, y - 1) = true) and blue_piece (x + 2, y - 2) = false
		    and blue_king (x + 2, y - 2) = false and red_piece (x + 2, y - 2) = false and red_king (x + 2, y - 2) = false then

		start_x := x
		start_y := y
		end_x := x + 2
		end_y := y - 2

		%Blue King capture right and up
	    elsif blue_king (x, y) = true and (red_piece (x + 1, y + 1) = true or red_king (x + 1, y + 1) = true) and blue_piece (x + 2, y + 2) = false
		    and blue_king (x + 2, y + 2) = false and red_piece (x + 2, y + 2) = false and red_king (x + 2, y + 2) = false then

		start_x := x
		start_y := y
		end_x := x + 2
		end_y := y + 2

		%Blue King capture right and down
	    elsif blue_king (x, y) = true and (red_piece (x + 1, y - 1) = true or red_king (x + 1, y - 1) = true) and blue_piece (x + 2, y - 2) = false
		    and blue_king (x + 2, y - 2) = false and red_piece (x + 2, y - 2) = false and red_king (x + 2, y - 2) = false then

		start_x := x
		start_y := y
		end_x := x + 2
		end_y := y - 2

		%Blue King capture left and up
	    elsif blue_king (x, y) = true and (red_piece (x - 1, y + 1) = true or red_king (x - 1, y + 1) = true) and blue_piece (x - 2, y + 2) = false
		    and blue_king (x - 2, y + 2) = false and red_piece (x - 2, y + 2) = false and red_king (x - 2, y + 2) = false then

		start_x := x
		start_y := y
		end_x := x - 2
		end_y := y + 2

		%Blue King capture left and down
	    elsif blue_king (x, y) = true and (red_piece (x - 1, y - 1) = true or red_king (x - 1, y - 1) = true) and blue_piece (x - 2, y - 2) = false
		    and blue_king (x - 2, y - 2) = false and red_piece (x - 2, y - 2) = false and red_king (x - 2, y - 2) = false then

		start_x := x
		start_y := y
		end_x := x - 2
		end_y := y - 2

	    end if
	end for
    end for

    if red_piece (start_x + (end_x - start_x) div 2, start_y + (end_y - start_y) div 2) = true then
	red_piece (start_x + (end_x - start_x) div 2, start_y + (end_y - start_y) div 2) := false
    else
	red_king (start_x + (end_x - start_x) div 2, start_y + (end_y - start_y) div 2) := false
    end if

    if blue_piece (start_x, start_y) = true then
	blue_piece (start_x, start_y) := false
	blue_piece (end_x, end_y) := true
    else
	blue_king (start_x, start_y) := false
	blue_king (end_x, end_y) := true
    end if

    for x : 1 .. 8
	if blue_piece (x, 1) = true then
	    blue_piece (x, 1) := false
	    blue_king (x, 1) := true
	end if
    end for

    draw_blue_capture (blue_king, center, number_redpieces, start_x, start_y, end_x, end_y)

    number_redpieces -= 1

    if test_can_blue_jump_again (blue_piece, red_piece, blue_king, red_king, center, end_x, end_y) = true then
	AI_capture_move (blue_piece, red_piece, blue_king, red_king, center, number_redpieces, number_bluepieces)
    end if

end one_option_capture


body proc multiple_option_capture (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, var number_redpieces,
	number_bluepieces
	: int)

    % var blue_pcs := blue_piece
    % var red_pcs := red_piece
    % var blueKing := blue_king
    % var redKing := red_king
    % var num_red_pcs := number_redpieces
    % var num_blue_pcs := number_bluepieces

    var jump_options := can_AI_capture (blue_piece, red_piece, blue_king, red_king, center)
    var score : int := -1000
    var best_move : array 1 .. 4 of int

    %var test_value : array 1 .. 8, 1 .. 8, 1 .. 8, 1 .. 8 of int
    % var new_value, try_value : array 1 .. 8, 1 .. 8 of int
    %
    % for a : 1 .. 8
    %     for b : 1 .. 8
    %
    %         new_value (a, b) := -1000
    %         try_value (a, b) := -1000
    %
    %         for c : 1 .. 8
    %             for d : 1 .. 8
    %
    %                 %test_value (a, b, c, d) := -1000
    %
    %             end for
    %         end for
    %     end for
    % end for

    %NEW
    var move_score : array 1 .. 8, 1 .. 8, 1 .. 8, 1 .. 8 of int

    for a : 1 .. 8
	for b : 1 .. 8
	    for c : 1 .. 8
		for d : 1 .. 8

		    move_score (a, b, c, d) := 0

		end for
	    end for
	end for
    end for
    %END NEW



    for a : 1 .. 8
	for b : 1 .. 8
	    for c : 1 .. 8
		for d : 1 .. 8

		    if jump_options (a, b, c, d) = true then
			var blue_pcs := blue_piece
			var red_pcs := red_piece
			var blueKing := blue_king
			var redKing := red_king
			var num_red_pcs := number_redpieces
			var num_blue_pcs := number_bluepieces
			%var value := test_capture (blue_pcs, red_pcs, blueKing, redKing, center, num_red_pcs, num_blue_pcs, a, b, c, d)
			%value -= opponent_capture (blue_pcs, red_pcs, blueKing, redKing, center, num_red_pcs, num_blue_pcs)

			%new_value (a, b) := test_capture (blue_pcs, red_pcs, blueKing, redKing, center, num_red_pcs, num_blue_pcs, a, b, c, d)
			%new_value (a, b) -= opponent_capture (blue_pcs, red_pcs, blueKing, redKing, center, num_red_pcs, num_blue_pcs)

			move_score (a, b, c, d) := test_capture (blue_pcs, red_pcs, blueKing, redKing, center, num_red_pcs, num_blue_pcs, a, b, c, d)
			move_score (a, b, c, d) -= opponent_capture (blue_pcs, red_pcs, blueKing, redKing, center, num_red_pcs, num_blue_pcs)

			var counter : int := 0
			var blue_capture_choices : array 1 .. 6 of boolean := can_blue_AI_capture (blue_pcs, red_pcs, blueKing, redKing, center)
			for x : 1 .. 6
			    if blue_capture_choices (x) = false then
				counter += 1
			    end if
			end for

			var rejump_choices : array 1 .. 8, 1 .. 8, 1 .. 8, 1 .. 8 of boolean

			if counter = 6 then
			    rejump_choices := check_legal_AI_move (blue_pcs, red_pcs, blueKing, redKing)
			else
			    rejump_choices := can_AI_capture (blue_pcs, red_pcs, blueKing, redKing, center)
			end if


			for w : 1 .. 8
			    for x : 1 .. 8
				for y : 1 .. 8
				    for z : 1 .. 8

					if rejump_choices (w, x, y, z) = true then
					    var test_blue_pcs := blue_pcs
					    var test_red_pcs := red_pcs
					    var test_blueKing := blueKing
					    var test_redKing := redKing
					    var number_red_pcs := num_red_pcs
					    var number_blue_pcs := num_blue_pcs


					    % var test_value : array 1 .. 8, 1 .. 8 of int
					    %
					    % for e : 1 .. 8
					    %     for f : 1 .. 8
					    %
					    %         test_value (e, f) := 0
					    %
					    %     end for
					    % end for


					    if counter = 6 then
						%test_value (a, b) += AI_test_move (test_blue_pcs, test_red_pcs, test_blueKing, test_redKing, w, x, y, z)
						move_score (a, b, w, x) += AI_test_move (test_blue_pcs, test_red_pcs, test_blueKing, test_redKing, w, x, y, z)
					    else
						%test_value (a, b) += test_capture (test_blue_pcs, test_red_pcs, test_blueKing, test_redKing, center, number_red_pcs, number_blue_pcs, w, x, y, z)
						move_score (a, b, w, x) += test_capture (test_blue_pcs, test_red_pcs, test_blueKing, test_redKing, center, number_red_pcs, number_blue_pcs, w, x, y, z)
					    end if
					    %test_value (a, b) -= opponent_capture (test_blue_pcs, test_red_pcs, test_blueKing, test_redKing, center, number_red_pcs, number_blue_pcs)
					    move_score (a, b, w, x) -= opponent_capture (test_blue_pcs, test_red_pcs, test_blueKing, test_redKing, center, number_red_pcs, number_blue_pcs)

					    % if new_value (a, b) > test_value (a, b) then
					    %     new_value (a, b) := test_value (a, b)
					    % end if

					end if

				    end for
				end for
			    end for
			end for

			% if score < new_value (a, b) then
			%     score := new_value (a, b)
			%     best_move (1) := a
			%     best_move (2) := b
			%     best_move (3) := c
			%     best_move (4) := d
			% end if

			%NEW
			var final_score : int := -1000
			if final_score < move_score (a, b, c, d) then
			    final_score := move_score (a, b, c, d)
			    best_move (1) := a
			    best_move (2) := b
			    best_move (3) := c
			    best_move (4) := d
			end if
			%END NEW


		    end if

		end for
	    end for
	end for
    end for


    actual_capture (blue_piece, red_piece, blue_king, red_king, center, number_redpieces, best_move (1), best_move (2), best_move (3), best_move (4))

    draw_blue_capture (blue_king, center, number_redpieces, best_move (1), best_move (2), best_move (3), best_move (4))

    if test_can_blue_jump_again (blue_piece, red_piece, blue_king, red_king, center, best_move (3), best_move (4)) = true then
	AI_capture_move (blue_piece, red_piece, blue_king, red_king, center, number_redpieces, number_bluepieces)
    end if

end multiple_option_capture
