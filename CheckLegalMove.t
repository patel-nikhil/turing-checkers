/* Code written by Nikhil Patel
 *
 * Functions Declared
 * check_legalred : boolean
 * check_legalblue : boolean
 * check_legalAI : boolean
 *
 * Function Parameters
 * blue_piece, red_piece, blue_king, red_king : array -1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int
 *
 * Purpose
 * Check for possible regular moves for red and blue, respectively
 *
 */

function check_legalred (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int) : boolean

    var count : int := 0

    for x : 1 .. 8
	for y : 1 .. 8

	    if red_piece (x, y) = true then

		if (red_piece (x + 1, y + 1) = false and blue_piece (x + 1, y + 1) = false
			and red_king (x + 1, y + 1) = false and blue_king (x + 1, y + 1) = false)

			or (red_piece (x - 1, y + 1) = false and blue_piece (x - 1, y + 1) = false
			and red_king (x - 1, y + 1) = false and blue_king (x - 1, y + 1) = false)

			then

		    light_open_red_pcs (red_king, center, x, y)
		    count += 1

		end if

	    elsif red_king (x, y) = true then

		if (red_piece (x + 1, y + 1) = false and blue_piece (x + 1, y + 1) = false
			and red_king (x + 1, y + 1) = false and blue_king (x + 1, y + 1) = false)

			or (red_piece (x - 1, y + 1) = false and blue_piece (x - 1, y + 1) = false
			and red_king (x - 1, y + 1) = false and blue_king (x - 1, y + 1) = false)

			or (red_piece (x + 1, y - 1) = false and blue_piece (x + 1, y - 1) = false
			and red_king (x + 1, y - 1) = false and blue_king (x + 1, y - 1) = false)

			or (red_piece (x - 1, y - 1) = false and blue_piece (x - 1, y - 1) = false
			and red_king (x - 1, y - 1) = false and blue_king (x - 1, y - 1) = false)


			then

		    light_open_red_pcs (red_king, center, x, y)
		    count += 1

		end if
	    end if

	end for
    end for

    if count > 0 then
	result true
    else
	result false
    end if

end check_legalred

function check_legalblue (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int) : boolean

    var count : int := 0

    for x : 1 .. 8
	for y : 1 .. 8

	    if blue_piece (x, y) = true then

		if (red_piece (x + 1, y - 1) = false and blue_piece (x + 1, y - 1) = false
			and red_king (x + 1, y - 1) = false and blue_king (x + 1, y - 1) = false)

			or (red_piece (x - 1, y - 1) = false and blue_piece (x - 1, y - 1) = false
			and red_king (x - 1, y - 1) = false and blue_king (x - 1, y - 1) = false)

			then

		    light_open_blue_pcs (blue_king, center, x, y)
		    count += 1

		end if

	    elsif blue_king (x, y) = true then

		if (red_piece (x + 1, y + 1) = false and blue_piece (x + 1, y + 1) = false
			and red_king (x + 1, y + 1) = false and blue_king (x + 1, y + 1) = false)

			or (red_piece (x - 1, y + 1) = false and blue_piece (x - 1, y + 1) = false
			and red_king (x - 1, y + 1) = false and blue_king (x - 1, y + 1) = false)

			or (red_piece (x + 1, y - 1) = false and blue_piece (x + 1, y - 1) = false
			and red_king (x + 1, y - 1) = false and blue_king (x + 1, y - 1) = false)

			or (red_piece (x - 1, y - 1) = false and blue_piece (x - 1, y - 1) = false
			and red_king (x - 1, y - 1) = false and blue_king (x - 1, y - 1) = false)

			then

		    light_open_blue_pcs (blue_king, center, x, y)
		    count += 1

		end if
	    end if

	end for
    end for

    if count > 0 then
	result true
    else
	result false
    end if

end check_legalblue

function check_legalAI (blue_piece, red_piece, blue_king, red_king : array - 1 .. 10, -1 .. 10 of boolean, center : array 1 .. 2, 1 .. 8, 1 .. 8 of int) : boolean

    var count : int := 0

    for x : 1 .. 8
	for y : 1 .. 8

	    if blue_piece (x, y) = true then

		if (red_piece (x + 1, y - 1) = false and blue_piece (x + 1, y - 1) = false
			and red_king (x + 1, y - 1) = false and blue_king (x + 1, y - 1) = false)

			or (red_piece (x - 1, y - 1) = false and blue_piece (x - 1, y - 1) = false
			and red_king (x - 1, y - 1) = false and blue_king (x - 1, y - 1) = false)

			then

		    count += 1

		end if

	    elsif blue_king (x, y) = true then

		if (red_piece (x + 1, y + 1) = false and blue_piece (x + 1, y + 1) = false
			and red_king (x + 1, y + 1) = false and blue_king (x + 1, y + 1) = false)

			or (red_piece (x - 1, y + 1) = false and blue_piece (x - 1, y + 1) = false
			and red_king (x - 1, y + 1) = false and blue_king (x - 1, y + 1) = false)

			or (red_piece (x + 1, y - 1) = false and blue_piece (x + 1, y - 1) = false
			and red_king (x + 1, y - 1) = false and blue_king (x + 1, y - 1) = false)

			or (red_piece (x - 1, y - 1) = false and blue_piece (x - 1, y - 1) = false
			and red_king (x - 1, y - 1) = false and blue_king (x - 1, y - 1) = false)

			then

		    count += 1

		end if
	    end if

	end for
    end for

    if count > 0 then
	result true
    else
	result false
    end if

end check_legalAI
