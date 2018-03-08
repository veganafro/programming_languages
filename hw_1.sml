fun is_older (date_1:int * int * int, date_2:int * int * int) =
    #1 date_1 < #1 date_2 andalso #2 date_1 < #2 date_2 andalso #3 date_1 < #3 date_2

fun number_in_month (dates:(int * int * int) list, month:int) =
    if null dates
    then 0
    else
	if #2 (hd dates) = month
	then 1 + number_in_month(tl dates, month)
	else 0 + number_in_month(tl dates, month)

fun number_in_months (dates:(int * int * int) list, months:int list) =
    if null dates orelse null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month (dates: (int * int * int) list, month: int) =
    if null dates
    then []
    else
	if #2 (hd dates) = month
	then hd dates :: dates_in_month(tl dates, month)
	else dates_in_month(tl dates, month)
	    
