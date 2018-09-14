/* Code written by Nikhil Patel
 *
 */

 body function AI_test_move (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, start_x, start_y, end_x, end_y : int) : int

    var score : int := 0

    if blue_piece (start_x, start_y) = true then
	blue_piece (start_x, start_y) := false
	blue_piece (end_x, end_y) := true
	score += 1
    elsif blue_king (start_x, start_y) = true then
	blue_king (start_x, start_y) := false
	blue_king (end_x, end_y) := true
	score += 1
    end if

    if blue_piece (end_x, 1) = true then
	score += 5
	blue_piece (end_x, end_y) := false
	blue_king (end_x, end_y) := true
    end if

    result score

end AI_test_move

proc draw_AI_move (blue_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, start_x, start_y, end_x, end_y : int)

    const size := maxy div 10
    const X_position := 1
    const Y_position := 2


    Draw.FillBox (start_x * size + size, start_y * size, start_x * size + (size * 2), start_y * size + size, green)
    Draw.FillOval (center (X_position, end_x, end_y), center (Y_position, end_x, end_y), 25, 25, 53)
    if blue_king (end_x, end_y) = true then
	Draw.FillOval (center (X_position, end_x, end_y), center (Y_position, end_x, end_y), 5, 5, yellow)
    end if

    %delay (1000)

    Draw.FillOval (center (X_position, end_x, end_y), center (Y_position, end_x, end_y), 25, 25, 104)

end draw_AI_move

proc AI_actual_move (var blue_piece, blue_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, start_x, start_y, end_x, end_y : int)

    const X_position := 1
    const Y_position := 2

    if blue_piece (start_x, start_y) = true then
	blue_piece (start_x, start_y) := false
	blue_piece (end_x, end_y) := true
    elsif blue_king (start_x, start_y) = true then
	blue_king (start_x, start_y) := false
	blue_king (end_x, end_y) := true
    end if

    for x : 1 .. 8
	if blue_piece (x, 1) = true then
	    blue_piece (x, 1) := false
	    blue_king (x, 1) := true
	    Draw.FillOval (center (X_position, end_x, end_y), center (Y_position, end_x, end_y), 5, 5, yellow)
	end if
    end for


end AI_actual_move

proc AI_move (var blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int, var number_redpieces, number_bluepieces : int)

    var move_options := check_legal_AI_move (blue_piece, red_piece, blue_king, red_king)
    var score : int := -1000
    var best_move : array 1 .. 4 of int
    var nomove : int := 0
    var value : array 1 .. 8, 1 .. 8 of int

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

		    if move_options (a, b, c, d) = true then
			var blue_pcs := blue_piece
			var red_pcs := red_piece
			var blueKing := blue_king
			var redKing := red_king
			var num_red_pcs := number_redpieces
			var num_blue_pcs := number_bluepieces

			%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


			%Makes a test move using pcs variable
			%piece variable remains intact
			move_score (a, b, c, d) += AI_test_move (blue_pcs, red_pcs, blueKing, redKing, a, b, c, d)

			%Checks if red can capture (single-check)
			var count : int := 0
			var red_capture_choices := test_can_red_capture (blue_pcs, red_pcs, blueKing, redKing, center)

			for x : 1 .. 6
			    if red_capture_choices (x) = false then
				count += 1
			    end if
			end for

			if count < 6 then
			    move_score (a, b, c, d) -= 2
			end if
			%End capture checking

			move_score (a, b, c, d) -= opponent_capture (blue_pcs, red_pcs, blueKing, redKing, center, num_red_pcs, num_blue_pcs)

			var counter : int := 0
			var blue_capture_choices : array 1 .. 6 of boolean := can_blue_AI_capture (blue_pcs, red_pcs, blueKing, redKing, center)
			for x : 1 .. 6
			    if blue_capture_choices (x) = false then
				counter += 1
			    end if
			end for

			var new_move_choices : array 1 .. 8, 1 .. 8, 1 .. 8, 1 .. 8 of boolean

			if counter = 6 then
			    new_move_choices := check_legal_AI_move (blue_pcs, red_pcs, blueKing, redKing)
			else
			    new_move_choices := can_AI_capture (blue_pcs, red_pcs, blueKing, redKing, center)
			end if

			%NEW

			var temp : int := 0


			%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%s

			for w : 1 .. 8
			    for x : 1 .. 8
				%NEW
				value (w, x) := 0
				for y : 1 .. 8
				    for z : 1 .. 8

					if new_move_choices (w, x, y, z) = true then

					    var blue_pc := blue_pcs
					    var red_pc := red_pcs
					    var blueking := blueKing
					    var redking := redKing
					    var num_redpcs := num_red_pcs
					    var num_bluepcs := num_blue_pcs
					    %value := move_score (a, b, c, d)
					    %NEW
					    temp := 0

					    if counter = 6 then
						%move_score (a, b, c, d) += AI_test_move (blue_pc, red_pc, blueking, redking, a, b, c, d)
						%%value += AI_test_move (blue_pc, red_pc, blueking, redking, a, b, c, d)
						%%%move_score (a, b, w, x) += AI_test_move (blue_pc, red_pc, blueking, redking, a, b, w, x)
						temp += AI_test_move (blue_pc, red_pc, blueking, redking, a, b, w, x)
					    else
						%move_score (a, b, c, d) += test_capture (blue_pc, red_pc, blueking, redking, center, num_redpcs, num_bluepcs, a, b, c, d)
						%%value += test_capture (blue_pc, red_pc, blueking, redking, center, num_redpcs, num_bluepcs, a, b, c, d)
						%%%move_score (a, b, w, x) += test_capture (blue_pc, red_pc, blueking, redking, center, num_redpcs, num_bluepcs, a, b, w, x)
						temp += test_capture (blue_pc, red_pc, blueking, redking, center, num_redpcs, num_bluepcs, a, b, w, x)
					    end if

					    %move_score (a, b, c, d) -= opponent_capture (blue_pc, red_pc, blueking, redking, center, num_redpcs, num_bluepcs)
					    %%value -= opponent_capture (blue_pc, red_pc, blueking, redking, center, num_redpcs, num_bluepcs)
					    %%%move_score (a, b, w, x) -= opponent_capture (blue_pc, red_pc, blueking, redking, center, num_redpcs, num_bluepcs)
					    temp -= opponent_capture (blue_pc, red_pc, blueking, redking, center, num_redpcs, num_bluepcs)


					end if

					%NEW
					if temp < value (w, x) then
					    value (w, x) := temp
					end if

				    end for
				end for
			    end for
			end for


		    else

			move_score (a, b, c, d) := -9876

		    end if

		end for
	    end for
	end for
    end for

    %FROM INSIDE FOR LOOP
    for a : 1 .. 8
	for b : 1 .. 8
	    for c : 1 .. 8
		for d : 1 .. 8

		    move_score (a, b, c, d) += value (c, d)

		    %if score < value then
		    if score < move_score (a, b, c, d) then
			score := move_score (a, b, c, d)
			best_move (1) := a
			best_move (2) := b
			best_move (3) := c
			best_move (4) := d
		    end if


		end for
	    end for
	end for
    end for

    /*
     * var NEW : int := Window.Open ("text")
     * for a : 1 .. 8
     * for b : 1 .. 8
     * for c : 1 .. 8
     * for d : 1 .. 8
     * put move_score (a, b, c, d) ..
     * end for
     * put ""
     * end for
     * put ""
     * end for
     * put ""
     * end for
     * break
     */

    %NEW
    % var check_score : array 1 .. 8, 1 .. 8 of int
    %
    % for a : 1 .. 8
    %     for b : 1 .. 8
    %
    %         check_score (a, b) := 1000
    %         %put check_score (a, b) ..
    %
    %     end for
    %     %put ""
    % end for
    %
    % %break
    %
    % var num : int := 0
    %
    % for a : 1 .. 8
    %     for b : 1 .. 8
    %         for c : 1 .. 8
    %             for d : 1 .. 8
    %
    %                 if move_score (a, b, c, d) not= -9876 then
    %                     % Input.Pause
    %                     % locate (1, 1)
    %                     % put move_score (a, b, c, d)
    %                     % locate (2, 1)
    %                     % put check_score (a, b)
    %                     % Input.Pause
    %
    %                     if move_score (a, b, c, d) < check_score (a, b) or check_score (a, b) = -9876 then
    %                         %num += 1
    %                         check_score (a, b) := move_score (a, b, c, d)
    %                         %put check_score (a, b) ..
    %                     else
    %                         check_score (a, b) := -1000
    %                     end if
    %                 else
    %                     if check_score (a, b) = 1000 then
    %                         check_score (a, b) := -9876
    %                     end if
    %                     %nomove += 1
    %
    %                 end if
    %
    %             end for
    %         end for
    %     end for
    % end for

    /*
     * put num
     * put nomove
     * break
     * var NEW1 : int := Window.Open ("text")
     * for a : 1 .. 8
     * for b : 1 .. 8
     *
     * put check_score (a, b) ..
     * if check_score (a, b) not= -9876 then
     * Input.Pause
     * end if
     * end for
     * put ""
     * end for
     */

    % break

    %var num2 : int := 0

    % var temp : int := minint
    % for a : 1 .. 8
    %     for b : 1 .. 8
    %
    %         if check_score (a, b) not= -9876 and check_score (a, b) not= -1000 and check_score (a, b) > temp then
    %             %num2 += 1
    %             temp := check_score (a, b)
    %             best_move (1) := a
    %             best_move (2) := b
    %         end if
    %
    %     end for
    % end for


    % put num2
    %put best_move (1)
    %put best_move (2)
    %break


    % var temp1 : int := minint
    % for x : 1 .. 8
    %     for y : 1 .. 8
    %
    %         if move_score (best_move (1), best_move (2), x, y) not= -9876 and move_score (best_move (1), best_move (2), x, y) > temp1 then
    %             temp1 := move_score (best_move (1), best_move (2), x, y)
    %             best_move (3) := x
    %             best_move (4) := y
    %         end if
    %
    %     end for
    % end for



    %put best_move (1), best_move (2), best_move (3), best_move (4)
    %Input.Pause

    AI_actual_move (blue_piece, blue_king, center, best_move (1), best_move (2), best_move (3), best_move (4))

    draw_AI_move (blue_king, center, best_move (1), best_move (2), best_move (3), best_move (4))

end AI_move

