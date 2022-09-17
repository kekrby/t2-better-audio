# Better Audio for Macs with the T2 Chip

Currently, someone who wants to run linux on their T2 Mac must install the audio files manually depending on their model and things like switching to headphones when plugging them automatically does not work, so the situation is less than ideal. Coupled with changes made in `apple-bce`, this repository tries to improve this situation. Currently, only `pipewire` works properly.

Note that an `apple-bce` with [these changes made](https://github.com/kekrby/apple-bce) is required.

The files are based on `https://gist.github.com/MCMrARM/c357291e4e5c18894bea10665dcebffb`, `https://gist.github.com/kevineinarsson/8e5e92664f97508277fefef1b8015fba`, `https://gist.github.com/bigbadmonster17/8b670ae29e0b7be2b73887f3f37a057b` and `https://github.com/Redecorating/archlinux-t2-packages/tree/main/apple-t2-audio-config`.

## Installation
You can install the files using `install.sh`.

Note that some distributions (for example NixOS) may have different ways to install the files.
