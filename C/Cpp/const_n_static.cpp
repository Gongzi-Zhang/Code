char str1[] = "abc";
char str2[] = "abc";
const char str3[] = "abc";
const char str4[] = "abc";
const char *str5 = "abc";
const char *str6 = "abc";
char *str7 = "abc";
char *str8 = "abc";
assert(str1 != str2);	// though with the same content, the two array has their own stack memory block
assert(str3 != str4);	
assert(str5 == str6);	// but pointer points to the same stack memory block
assert(str7 == str8);	// but pointer points to the same stack memory block
