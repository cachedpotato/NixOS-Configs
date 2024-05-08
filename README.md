# NixOS Configs

Hello and Welcome! There isn't a lot to see here but I hope you enjoy your brief stay here.

## Why NixOS?
I've always wanted to try out Linux ever since Windows 11 became a pain in the butt to manage.
When I was looking for which distro to use, by complete chance I came across a video about NixOS. Being the pretentious dork that I am, I really liked how different it was from other distros. Also there were genuinely good reasons to use it as well, such as it being highly reproducible and idk how but everything can be configured declaratively? That sounded like magic to me, so I decided to try it out myself, _conveniently forgetting the fact that I do not know Linux in general_. 
... Safe to say I ran into a lot of problems (still am), mostly stemming from me being an idiot, but I'm having a lot of fun and I think that's what really matters.
As I've mentioned before, I know next to nothing about linux, so whatever config I'm doing now will be, frankly speaking, bad. Nobody should ever want to use my setup, at least for now.
Still, I think (or at least hope) I'm learning a few things everyday, so I hope to one day be competent enough to make a decent setup.

## Directories
- **/home**: home-manager configs.
- **/themes**: base16/base24 themes from [Tinted-Theming](https://github.com/tinted-theming/schemes). Used for styling purposes.
- **/wallpapers**: ...wallpapers. used for hyprpaper and can also be used to create custom color scheme using stylix.
- **/hosts**: list of hosts. currently only have one, but I'm planning on creating more.
- **/system**: all the system related goodies, such as boot, bluetoooth, security, etc.
- **/dev**: currently being used as a testing ground for nix-shell. I say testing ground, but I really haven't done anything with it.

## Screenshot
Can you believe this took me 3 whole weeks? Yeah, me neither.
![screenshot](screenshots/Preview1.png)
Nothing too much going on, I'm using Hyprland as my DE + Ags for my status bar atm. As for the status bar I may add a few more widgets but at the same time I do not find the need to.
Hell, I don't even have floating tiles. I just think of tiling WMs as a glorified version of tmux, however wrong that may be.

## Issues
There are currently 3 major Issues with my setup:
- **Bluetooth**: dmesg shows a bunch of stuff and errors about bluetooth. Still don't know exactly why this happens.
- **Hyprlock**: Probably related to the bluetooth issue mentioned above, but my screen freezes for a good few seconds before I can type anything whenever I open my laptop.
- **Keyboard/Language**: I currently have my i18n settings to support ENG, KR and JP, but I can only type in English. I'm not too familiar with keyboard/locale settings so this may take a while.

## Acknowledgements
If you've looked through my setup and thought to yourself: "wait a moment I've seen this before" then you'd be correct. I've "borrowed" a bunch of configs from other people who actually knows what they're doing, unlike me.
Below is the list of people I've gotten inspiration from:

- [fufexan](https://github.com/fufexan/dotfiles)
- [LibrePhoenix](https://github.com/librephoenix/nixos-config)
- [EmergentMind](https://github.com/EmergentMind/nix-config)
- [GaetanLepage](https://github.com/GaetanLepage/nix-config)

Chances are you've  seen these people's configs already, but just in case you haven't please do check them out.

Also special thanks to the NixOS reddit for being extra helpful! I wouldn't have come this far without their help.


