#!/bin/bash

############################################
# 1 for bold
# 2 for dim
# 4 for underline
# 5 for blink 
# 7 for inverse
# 39 for default foreground color
# 30-37 for foreground colors
# 90-97 for 16-color mode foreground colors
# 38;5;0 to 38;5;255 for 88-color and 256-color modes foreground colors
# 49 for default background color
# 40-47 for background colors
# 100-107 for 16-color mode background colors
# 48;5;0 to 48;5;255 for 88-color and 256-color modes background colors
############################################
bold()
{
    echo -ne "\e[1m$*\e[21m"
}

dim()
{
    echo -ne "\e[2m$*\e[22m"
}

underline()
{
    echo -ne "\e[4m$*\e[24m"
}

reverse()
{
    echo -ne "\e[7m$*\e[27m"
}

hidden()
{
    echo -ne "\e[8m$*\e[28m"
}
