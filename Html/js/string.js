let x = 'hello\nworld';
x.length;   // 11; note that length is a property, not a method
x.toUpperCase(), x.toLowerCase();
x.includes(substr, position);
x.startsWith(), x.endsWith();
x.trim(substr);
x.repeat(n);

// code
"zZ".codePointAt(0); // 122; return the code for the char at position pos;
"zZ".codePointAt(1); // 90; return the code for the char at position pos;
String.fromCodePoint(90);   // "Z"
str1.localeCompare(str2, language);

if (~str.indexOf(substr)){  // with ~, the 0 return value will not be a problem
    ...
}

x.split('\n');	// return an array
x.split('');	// split into letters
