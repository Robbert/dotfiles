#!/usr/bin/env bash

DARK_THEME=~/.dotfiles/solarized-sublime/Solarized\ \(dark\).tmTheme
LIGHT_THEME=~/.dotfiles/solarized-sublime/Solarized\ \(light\).tmTheme

SUBLIME_PREFS=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
TMP_PREFS=/tmp/Preferences.sublime-settings

CURRENT_THEME=$(jq -r '.color_scheme' "$SUBLIME_PREFS")

if [ "$(basename "$CURRENT_THEME")" == "$(basename "$DARK_THEME")" ]
then
	NEW_THEME="$LIGHT_THEME";
else
	NEW_THEME="$DARK_THEME";
fi;

# Since Sublime doesn't appear to support paths outside the Packages/User/ directory, generate relative paths:
jq --indent 2 '.color_scheme = $path' --arg path "Packages/User/$(basename "$NEW_THEME")" "$SUBLIME_PREFS" > /tmp/Preferences.sublime-settings
cp "$TMP_PREFS" "$SUBLIME_PREFS"
