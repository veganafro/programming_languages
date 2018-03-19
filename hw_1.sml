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


