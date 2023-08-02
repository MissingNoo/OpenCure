var updown = -input_check_pressed("up") + input_check_pressed("down");
upd = updown;
firstItem += updown;
lastItem += updown;
if (firstItem < 0) {
    firstItem = 0;
	lastItem = 4;
}
if (lastItem > array_length(Achievements) - 1) {
    firstItem = array_length(Achievements) - 5;
	lastItem = array_length(Achievements) - 1;
}