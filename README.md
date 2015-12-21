Autocomplete by Uberi
=====================
Suggests and completes words as you type! Write faster and more efficiently.

# [Get the latest version](https://github.com/Uberi/Autocomplete/archive/master.zip)
# [See stable releases/binaries](https://github.com/Uberi/Autocomplete/releases/)

![Screenshot](Screenshot.png)

Using
-----

1. Extract the archive to a safe location.
2. If you downloaded the binaries, open `Autocomplete.exe`.
3. If you downloaded the source, make sure you have a recent version of [AutoHotkey](http://www.autohotkey.com/) installed, and run `Autocomplete.ahk`.
4. Start typing somewhere. After the first few characters, a suggestion box will appear.
5. Use the `Up` and `Down` arrow keys to select an entry if the currently selected one is not the desired word.
6. Press `Enter` or `Tab` to trigger the completion with the currently selected word.
7. Alternatively, press one of `Alt + 1`, `Alt + 2`, ..., `Alt + 9`, `Alt + 0` to trigger completion with the 1st, 2nd, ..., 9th, and 10th word, repectively.

Advanced
--------

Click on the tray icon to bring up the settings dialog. The dialog allows you to configure settings such as the maximum number of results to show at a time and the number of characters to type before showing suggestions.

The dialog also allows you to edit the wordlist by adding or removing words. All settings are saved automatically upon program exit.

The wordlist is contained in `WordList.txt`. Each line represents a word. The list can be edited with a text editor, but ensure the editor supports larger files before doing so! Some may crash or hang upon editing such files.

Settings are stored in `Settings.ini` in the program directory. This contains a few more settings not accessible in the settings dialog, mainly the key settings.

Key settings are URL encoded lists of key names such as `Space` and `d` where each entry is separated by a newline (the URL encoded version of a newline is `%0A`). They can be edited to change the keys accepted by the program.

Licence
-------

This program is provided under the 3-clause BSD license. In short, this gives you the right to modify and distribute the program as you please, as long as you make sure the notice below is accessible to the user.

    Copyright (c) 2013, Anthony Zhang
    All rights reserved.
    
    Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
    
    Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    Neither the name of the <ORGANIZATION> nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
