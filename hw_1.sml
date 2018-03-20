fun is_older (date_1:int * int * int, date_2:int * int * int) =
    if #1 date_1 = #1 date_2 then
	if #2 date_1 = #2 date_2 then
	    #3 date_2 < #3 date_2
	else
	    #2 date_1 < #2 date_2
    else
	#1 date_1 < #1 date_2;
				      
fun number_in_month (dates:(int * int * int) list, month:int) =
    if null dates
    then 0
    else
	if #2 (hd dates) = month
	then 1 + number_in_month(tl dates, month)
	else 0 + number_in_month(tl dates, month);

fun number_in_months (dates:(int * int * int) list, months:int list) =
    if null dates orelse null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months);

fun dates_in_month (dates: (int * int * int) list, month: int) =
    if null dates
    then []
    else
	if #2 (hd dates) = month
	then hd dates :: dates_in_month(tl dates, month)
	else dates_in_month(tl dates, month);

fun dates_in_months (dates: (int * int * int) list, months: int list) =
    if null dates orelse null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months);

fun get_nth (strings: string list, n: int) =
    if n = 0
    then hd strings
    else
	get_nth(tl strings, n - 1);

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
		

fun date_to_string (date: (int * int * int)) =
    get_month(#2 date) ^ ", " ^ Int.toString(#3 date) ^ " " ^ Int.toString(#1 date);

fun number_before_reaching_sum (sum: int, numbers: int list) =
    if sum - (hd numbers) <= 0
    then 0
    else
	1 + number_before_reaching_sum(sum - hd numbers, tl numbers);

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

(*
fun oldest ()
*)
