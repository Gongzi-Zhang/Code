#!/bin/bash

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
