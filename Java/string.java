// string methods
String welcome = "Welcome to " + "Java.";

char charAt(int index) {
    //* The index range must be between 0 to string_length-1.
    //* If the index value is higher than string length or a negative, then IndexOutOfBounds Exception error occurs.
} 

// 4 overloads of indexOf
int indexOf(int c) {
    // returns -1 if the char doesn't exist
}
int indexOf(char c) {
    // returns -1 if the char doesn't exist
}
int indexOf(char c, int startindex) {
    // returns the first occurrence of 'c' after the startindex
}
int indexOf(String substr) {
    // returns -1 if the substr is not found
}

int lastIndexOf(int c) 
    {Returns index of the last occurrence of a character}

int lastIndexOf(String s) 
    {Returns index of last occurrence of String s in the current String}

int compareTo(String s) {
    //* returns < 0 if the string calling the method is lexicographically first
    //* returns == 0 if the two strings are lexicographically equal
    //* returns > 0 ...
}


String copyValueOf(char[] ca)
    {Returns a String equivalent to the specified array of characters. This is a static method of the String class.}

boolean equals(String s)
    {Returns true if this String matches another String s ("case"-sensitive comparison)}

boolean equalsIgnoreCase s (String s)
    {Returns true if this String matches another String regardless of "case" ("case"-insensitive comparison)}

byte[] getBytes()
    {Copies characters from a String into a new byte array (uses the default character-encoding of the system)}

byte[] getBytes(String encodingName)
    {Copies characters from a String into a new byte array according to the character encoding specified by a name such as US-ASCII, ISO-8859-1, UTF-8, UTF-16, and so on}

void getChars(int srcBegin, int srcEnd, char[] dest, int destBegin)
    {Copies characters from a String into a char array}

int hashcode() 
    {Returns hash code for the String}


String intern() 
    {Returns a unique instance of String from a global shared pool of String objects}



boolean regionMatches (int offset, String s, String s int soffset, int length) 
    {Returns true if a region of the String matches the specified region of another}

String substring(int begin, int end) 
    {Returns a substring of this String}

char[] toCharArray() 
    {Returns a character array from the String}

String toString() 
    {Returns another String with the same contents}

String trim() 
    {Removes any leading and trailing white space from String}

String valueOf(type obj) 
    {Returns the String representation of an object's value (type may be any object of primitive type such as boolean, char, int, long, float, and double). This is a static method of the String class.}

// notes
//* String reference can be overridden but that does not delete the content; i.e.
String h1 = "hello";
h1 = "hello"+"world";   // then "hello" String does not get deleted. It just loses its handle.


// convert to string
//* char <=> string
String str1 = Character.toString('c');
String str2 = String.valueOf('c');
char char1 = str1.charAt(0);
