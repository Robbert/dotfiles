#!/usr/bin/env bash

DARK_THEME="Packages/User/SublimeLinter/Solarized (Dark) (SL).tmTheme"
LIGHT_THEME="Packages/User/SublimeLinter/Xcode_default (SL).tmTheme"

SUBLIME_PREFS=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
TMP_PREFS=/tmp/Preferences.sublime-settings

CURRENT_THEME=`jq -r '.color_scheme' "$SUBLIME_PREFS"`

if [ "$CURRENT_THEME" = "$DARK_THEME" ]
then
	DARK_THEME="$LIGHT_THEME"
fi;

jq --indent 2 '.color_scheme = $path' --arg path "$DARK_THEME" "$SUBLIME_PREFS" > /tmp/Preferences.sublime-settings
cp "$TMP_PREFS" "$SUBLIME_PREFS"


jq -r '.color_scheme' ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
