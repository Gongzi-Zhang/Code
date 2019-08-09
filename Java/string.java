String welcome = "Welcome to " + "Java.";
int numchars = welcome.length();


char charAt(int index) 
    {Returns character at a specified index} 

int compareTo(String s) 
    {Compares this String with another String s}

String concat(String s) 
    {Concatenates this String with another String}

String copyValueOf(char[] ca)
    {Returns a String equivalent to the specified array of characters. This is a static method of the String class.}

boolean endsWith (String suffix)
    {Returns true if String ends with suffix}

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

int indexOf(int c) 
    {Returns index of first occurrence of a character}

int indexOf(String s) 
    {Returns index of first occurrence of String s in the current String}

String intern() 
    {Returns a unique instance of String from a global shared pool of String objects}

int lastIndexOf(int c) 
    {Returns index of the last occurrence of a character}

int lastIndexOf(String s) 
    {Returns index of last occurrence of String s in the current String}

int length() 
    {Returns the length of the String (the number of characters in the string)}

boolean regionMatches (int offset, String s, String s int soffset, int length) 
    {Returns true if a region of the String matches the specified region of another}

String replace(char old, char new) 
    {Replaces all occurrences of old character with new}

boolean startsWith (String prefix) 
    {Returns true if String starts with specified prefix}

String substring(int begin, int end) 
    {Returns a substring of this String}

char[] toCharArray() 
    {Returns a character array from the String}

String toLowerCase() 
    {Converts String to lowercase}

String toString() 
    {Returns another String with the same contents}

String toUpperCase() 
    {Converts String to uppercase}

String trim() 
    {Removes any leading and trailing white space from String}

String valueOf(type obj) 
    {Returns the String representation of an object's value (type may be any object of primitive type such as boolean, char, int, long, float, and double). This is a static method of the String class.}
