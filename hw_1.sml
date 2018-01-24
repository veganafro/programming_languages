fun is_older (date_1:int * int * int, date_2:int * int * int) =
    if null date_1 or null date_2
    then false
    else  #1 date_1 < #1 date_2 andalso #2 date_1 < #2 date_2 andalso #3 date_1 < #3 date_2

(* needs some more work to correctly identify the month a given date is in *)
fun number_in_month (dates:int list, month:int) =
    if null dates
    then 0
    else
	val year_and_month = hd dates / (hd dates mod 365)
	
	(*
	if 0 = hd dates mod month
	then 1 + number_in_month(tl dates, month)
	else 0 + number_in_month(tl dates, month)
	*)
	
fun number_in_months (dates:int list, months:int list) =
    if null dates orelse null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)
