# Terminals Color -- Select Graphic Rendition (SGR)
The SGR substring values are integers in decimal representation and can
be concatenated with semicolons.

## COmmon values
* 1	**bold**
* 4	underline
* 5	blink
* 7	inverse
* 39	default fg color
* 30-37	fg colors
    1. 30
    2. 31   red
    3. 32   green
    4. 33
    5. 34   blue
    6. 35   magenta
    7. 36   cyan


* 90-97	16-color mode fg colors
* 38;5;0 - 38;5;255	
	88-color and 256-color modes fg colors
* 49	default bg color
* 40-47	bg colors
* 100-107   
	16-color mode bg colors
* 48;5;0-48;5;255   
	88-color and 256-color modes bg colors


## example
$GCC_COLORS
