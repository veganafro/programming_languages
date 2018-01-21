fun is_older (date_1:int, date_2:int) =
    if date_1 < 0 orelse date_2 < 0
    then false
    else date_1 < date_2

fun number_in_month (dates:int list, month:int) =
    if null dates
    then 0
    else
	if 0 = hd dates mod month
	then 1 + number_in_month(tl dates, month)
	else 0 + number_in_month(tl dates, month)    
