---
title: "App switcher on all/one monitor"
language: en
date: '2022-10-24 10:00:00'
type: note
properties:
    tags: ["macos"]
published: true
...

MacOS shows the App Switcher by default only on the display where the Dock was last displayed. If you're using a multi monitor setup this is, at least for me, a little bit annoying. I couldn't find any setting in the UI for changing this behaviour. Thankfully it can be done using the CLI.

To display the App switcher on all monitors you need to run the following commands.

    $ defaults write com.apple.Dock appswitcher-all-displays -bool true
    $ killall Dock

Changing it back to the default behaviour can be achieved using the following commands.

    $ defaults write com.apple.Dock appswitcher-all-displays -bool false
    $ killall Dock

found via [Show macOS app switcher across all monitors](https://gist.github.com/jthodge/c4ba15a78fb29671dfa072fe279355f0)