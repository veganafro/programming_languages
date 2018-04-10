use "hw_1.sml";

val test_is_older_1 = is_older((1996, 10, 17), (1995, 2, 29)) = false;
val test_is_older_2 = is_older((1997, 12, 23), (1998, 4, 18)) = true;
val test_is_older_3 = is_older((1996, 9, 18), (1996, 9, 18)) = false;

val dates = [
    (1996, 10, 17),
    (1995, 2, 29),
    (1997, 12, 23),
    (1998, 4, 18),
    (1996, 9, 18),
    (1993, 2, 16)
];

val test_number_in_month_1 = number_in_month(dates, 2) = 2;
val test_number_in_month_2 = number_in_month(dates, 9) = 1;

val months = [
    10,
    5,
    12,
    9,
    8
];

val test_number_in_months = number_in_months(dates, months) = 3;

val test_dates_in_month = dates_in_month(dates, 2)
