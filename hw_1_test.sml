use "hw_1.sml";

val test_is_older_1 = is_older((1996, 10, 17), (1995, 6, 17)) = false;
val test_is_older_2 = is_older((1997, 12, 23), (1998, 4, 18)) = true;
val test_is_older_3 = is_older((1996, 9, 18), (1996, 9, 18)) = false;
