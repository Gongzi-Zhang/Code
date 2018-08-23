#include <cmath>
#include <iostream>
// consider the null string


/* "Hello\0"
 *  012345  -- char *
 *  12345   -- natural index
 *     -1   -- backward counting
 *    -2
 * -5
 */


// length
int len(const char * string){
    int l=0;
    while (*string++) ++l;  // note that this will change the position of pointer
    return l;
}

// position, the first appearence of char in string
int pos(const char * string, const char ch){
    int l = len(string);

    for(int i=0; i<l; i++)
	if(string[i] == ch) return i+1;
    return -1;	// not found
}

// concatenate two strings
char * cat(const char * first, const char * second){
    int l1 = 0, l2 = 0;

    l1 = len(first);
    l2 = len(second);

    char * result = new char[l1 + l2];

    for (int i=0; i<l1; i++) result[i] = first[i];
    for (int i=l1; i<l1+l2; i++) result[i] = second[i-l1];

    result[l1+l2] = '\0';
    return result;
}

// delete one char from a string
char * del(const char * string, const int pos){
    if (pos == 0) return const_cast<char *>(string);    // remove nothing

    int l = 0, p=pos;
    l = len(string);

    if (abs(p) > l) exit(1);
    if (p < 0) p+=l;
    else p-=1;

    char * result = new char[l-1];

    for(int i=0, j=0; i<l; i++)
	if (i==p)   continue;
	else	result[j++] = string[i];
    result[l-1] = '\0';

    return result;
}

// slim, remove all occurrence of a char in a string
char * slim(const char * string, const char ch){
    int p = pos(string, ch);
    if (p == -1) return const_cast<char *>(string);
    else return slim(del(string, p), ch);
}
// reverse
char * reverse(const char * string){
    int l = len(string);

    char * result = new char[l];

    for(int i=0; i<l; i++) result[i] = string[l-1-i];
    result[l] = '\0';

    return result;
}


// strip head, remove all occurrence of char in the head of string
char * strip_head(const char * string, const char ch){
    if (string[0]!=ch) return const_cast<char *>(string);
    else return strip_head(++string, ch);
}

// strip tail, remove all occurrence of char in the end of string
char * strip_tail(const char * string, const char ch){
    char * r = reverse(string);
    char * result = strip_head(r, ch);
    return reverse(result);
}

// replacement, replace char at pos in string with ch
char * rep(const char * string, const int pos, const char ch){
    int l = len(string), p=pos;

    if (p==0 || abs(p) > l) exit(1);
    if (p < 0) p+=l;
    else p-=1;

    char * result = new char[l];

    for(int i=0, j=0; i<l; i++)
	if (i==pos) result[j++] = ch;
	else	result[j++] = string[i];
    result[l] = '\0';

    return result;
}
// replace all occurence of ch1 with ch2
char * rep(const char * string, const char ch1, const char ch2){
    int l = len(string);

    char * result = new char[l];

    for(int i=0, j=0; i<l; i++)
	if (string[i]==ch1) result[j++] = ch2;
	else	result[j++] = string[i];
    result[l] = '\0';

    return result;
}
