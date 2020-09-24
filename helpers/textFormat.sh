#!/usr/bin/env bash

# ------------------------------------------------------------------------------
# Text output colours and formats
# ------------------------------------------------------------------------------

# Formatting
export tBold='\033[1m'
export tDim='\033[2m'
export tUnderlined='\033[4m'
export tInverted='\033[7m'
export tHidden='\033[8m'

# Foreground
export tDefault='\033[39m'
export tWhite='\033[97m'
export tLightGrey='\033[37m'
export tDarkGrey='\033[90m'
export tBlack='\033[30m'

export tRed='\033[31m'
export tGreen='\033[32m'
export tBlue='\033[34m'
export tYellow='\033[33m'
export tMagenta='\033[35m'
export tCyan='\033[36m'

export tLightRed='\033[91m'
export tLightGreen='\033[92m'
export tLightBlue='\033[94m'
export tLightYellow='\033[93m'
export tLightMagenta='\033[95m'
export tLightCyan='\033[96m'

# Background
export tBgDefault='\033[49m'
export tBgWhite='\033[107m'
export tBgLightGrey='\033[47m'
export tBgDarkGrey='\033[100m'
export tBgBlack='\033[40m'

export tBgRed='\033[41m'
export tBgGreen='\033[42m'
export tBgBlue='\033[44m'
export tBgYellow='\033[43m'
export tBgMagenta='\033[45m'
export tBgCyan='\033[46m'

export tBgLightRed='\033[101m'
export tBgLightGreen='\033[102m'
export tBgLightBlue='\033[104m'
export tBgLightYellow='\033[103m'
export tBgLightMagenta='\033[105m'
export tBgLightCyan='\033[106m'

# Reset all attributes
export tReset='\033[0m'

# ------------------------------------------------------------------------------
# Colour and format tests only when this file is executed standalone
# ------------------------------------------------------------------------------

# check if we are being sourced by another script or shell
[[ "${#BASH_SOURCE[@]}" -gt "1" ]] && { return 0; }

echo "-----"
echo $tBold"hello text format: BOLD"$tReset
echo $tDim"hello text format: DIM"$tReset
echo $tUnderlined"hello text format: UNDERLINED"$tReset
echo $tInverted"hello text format: INVERT"$tReset
echo $tHidden"hello text format: HIDDEN"$tReset
echo "-----"
echo $tDefault"hello colour: DEFAULT"$tReset
echo $tWhite"hello colour: WHITE"$tReset
echo $tLightGrey"hello colour: LIGHT GREY"$tReset
echo $tDarkGrey"hello colour: DARK GREY"$tReset
echo $tBlack"hello colour: BLACK"$tReset
echo "-----"
echo $tRed"hello colour: RED"$tReset
echo $tLightRed"hello colour: LIGHT RED"$tReset
echo $tGreen"hello colour: GREEN"$tReset
echo $tLightGreen"hello colour: LIGHT GREEN"$tReset
echo $tYellow"hello colour: YELLOW"$tReset
echo $tLightYellow"hello colour: LIGHT YELLOW"$tReset
echo $tBlue"hello colour: BLUE"$tReset
echo $tLightBlue"hello colour: LIGHT BLUE"$tReset
echo $tMagenta"hello colour: MAGENTA"$tReset
echo $tLightMagenta"hello colour: LIGHT MAGENTA"$tReset
echo $tCyan"hello colour: CYAN"$tReset
echo $tLightCyan"hello colour: LIGHT CYAN"$tReset
echo "-----"
echo $tBgDefault"hello background: DEFAULT"$tReset
echo $tBgWhite"hello background: WHITE"$tReset
echo $tBgLightGrey"hello background: LIGHTGREY"$tReset
echo $tBgDarkGrey"hello background: DARKGREY"$tReset
echo $tBgBlack"hello background: BLACK"$tReset
echo $tBgRed"hello background: RED"$tReset
echo $tBgLightRed"hello background: LIGHT RED"$tReset
echo $tBgGreen"hello background: GREEN"$tReset
echo $tBgLightGreen"hello background: LIGHT GREEN"$tReset
echo $tBgBlue"hello background: BLUE"$tReset
echo $tBgLightBlue"hello background: LIGHT BLUE"$tReset
echo $tBgYellow"hello background: YELLOW"$tReset
echo $tBgLightYellow"hello background: LIGHT YELLOW"$tReset
echo $tBgMagenta"hello background: MAGENTA"$tReset
echo $tBgLightMagenta"hello background: LIGHT MAGENTA"$tReset
echo $tBgCyan"hello background: CYAN"$tReset
echo $tBgLightCyan"hello background: LIGHT CYAN"$tReset
echo "-----"
echo $tBgCyan$tWhite$tBold" mixed format, colour and background example "$tReset
echo $tBgYellow$tBlack$tUnderlined" mixed format, colour and background example "$tReset
echo "-----"
