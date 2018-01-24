fun is_older (date_1:int, date_2:int) =
    if date_1 < 0 orelse date_2 < 0
    then false
    else date_1 < date_2

(* needs some more work to correctly identify the month a given date is in *)
fun number_in_month (dates:int list, month:int) =
    if null dates
    then 0
    else
	let val year_and_month = hd dates / (hd dates mod 365)
	if month = year_and_month mod 12
						then
						    
	(*
	if 0 = hd dates mod month
	then 1 + number_in_month(tl dates, month)
	else 0 + number_in_month(tl dates, month)
	*)
	
fun number_in_months (dates:int list, months:int list) =
    if null dates orelse null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)
