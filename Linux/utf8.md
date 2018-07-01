# conversion between characters and utf-8 encoding
echo -e '\0NNN'	    : octal value of ASCII character
echo -e '\xNN'      : hexadecimal value of ASCII character

printf '\350\257\255\345\275\225'   : octal escaped utf8 encoding of chinese characters

echo 你好  | hexdump	: show the utf8 encoding of chinese character
