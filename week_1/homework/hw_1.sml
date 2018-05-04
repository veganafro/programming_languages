(*
 * is_older compares two Dates and returns true if the first Date is earlier than the second Date.
 * Dates are represented as tuples with 3 integers. The first item is the year, the second item is
 * the month, and the third item is the day.
 *
 * date_1: a Date
 * date_2: a Date
 *)
fun is_older (date_1: int * int * int, date_2: int * int * int) =
    if #1 date_1 = #1 date_2
    then
        if #2 date_1 = #2 date_2
        then
            #3 date_2 < #3 date_2
        else
            #2 date_1 < #2 date_2
    else #1 date_1 < #1 date_2;

(*
 * number_in_month takes a list of Dates and a month represented by an integer then returns how many
 * Dates in the list are in the given month.
 *
 * dates: a list of Dates
 * month: an integer
 *)
fun number_in_month (dates: (int * int * int) list, month: int) =
    if null dates
    then 0
    else
        if #2 (hd dates) = month
        then 1 + number_in_month(tl dates, month)
        else 0 + number_in_month(tl dates, month);

(*
 * number_in_months takes a list of Dates and a list of months each represented as integers then
 * returns the number of Dates that are in any of the months.
 *
 * dates: a list of Dates
 * months: a list of integers
 *)
fun number_in_months (dates: (int * int * int) list, months: int list) =
    if null dates orelse null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months);

(*
 * dates_in_month takes a list of Dates and a month represented as an integer then returns a list
 * containing the Dates from the argument list that are in the month.
 *
 * dates: a list of Dates
 * month: an integer
 *)
fun dates_in_month (dates: (int * int * int) list, month: int) =
    if null dates
    then []
    else
        if #2 (hd dates) = month
        then hd dates :: dates_in_month(tl dates, month)
        else dates_in_month(tl dates, month);

(*
 * dates_in_months takes a list of Dates and a list of months then returns a list of Dates from the
 * argument list that occur in any of the argument list of months.
 *
 * dates: a list of Dates
 * months: a list of months
 *)
fun dates_in_months (dates: (int * int * int) list, months: int list) =
    if null dates orelse null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months);

(*
 * get_nth takes a list of strings and an integer n then returns the nth element in the 1-indexed
 * list.
 *
 * strings: a list of strings
 * n: an integer
 *)
fun get_nth (strings: string list, n: int) =
    if n = 0
    then hd strings
    else
        get_nth(tl strings, n - 1);

(*
 * date_to_string takes a Date and returns a string in the form Month Day, Year.
 *
 * date: a Date
 *)
fun date_to_string (date: (int * int * int)) =
    let
        fun get_month (month: int) =
            case month of
                1 => "January"
              | 2 => "Febrary"
              | 3 => "March"
              | 4 => "April"
              | 5 => "May"
              | 6 => "June"
              | 7 => "July"
              | 8 => "August"
              | 9 => "September"
              | 10 => "October"
              | 11 => "November"
              | 12 => "December"
              | _ => "";
    in
        get_month(#2 date) ^ ", " ^ Int.toString(#3 date) ^ " " ^ Int.toString(#1 date)
    end;

(*
 * number_before_reaching_sum takes an integer sum and an int list numbers then returns an integer
 * n such that the first n values in numbers add to a value less than sum and the first n + 1 values
 * add to a value greater than sum.
 *
 * sum: an integer
 * numbers: an int list
 *)
fun number_before_reaching_sum (sum: int, numbers: int list) =
    if sum - (hd numbers) <= 0
    then 0
    else
        1 + number_before_reaching_sum(sum - hd numbers, tl numbers);

(*
 * what_month takes an integer day_of_year and returns what month the argued value is in.
 *
 * day_of_year: an integer
 *)
fun what_month (day_of_year: int) =
    number_before_reaching_sum(
        day_of_year,
        [
          31,
          29,
          31,
          30,
          31,
          30,
          31,
          31,
          30,
          31,
          30,
          31
        ]
    );

(*
 * month_range takes two integers day_1 and day_2 and returns an int list containing the months that
 * occur between the two days.
 *
 * day_1: an integer
 * day_2: an integer
 *)
fun month_range (day_1: int, day_2: int) =
    if day_1 > day_2
    then []
    else
        let
            val month_1 = what_month(day_1)
            val month_2 = what_month(day_2)
        in
            [get_month(month_1)] @ month_range(day_1 + 1, day_2)
        end;

fun get_oldest (current_oldest: (int * int * int), dates: (int * int * int) list) =
    if null dates
    then current_oldest
    else
        if is_older(current_oldest, hd dates)
        then get_oldest(current_oldest, tl dates)
        else get_oldest(hd dates, tl dates);

(*
 * oldest takes a list of Dates and returns an option of NONE if the argued list is empty or SOME
 * oldest Date in the argued list otherwise.
 *
 * dates: a list of Dates
 *)
fun oldest (dates: (int * int * int) list) =
    if null dates
    then NONE
    else
        SOME (get_oldest(hd dates, tl dates));
