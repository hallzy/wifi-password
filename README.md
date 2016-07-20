[![Analytics](https://ga-beacon.appspot.com/UA-49189836-2/hallzy/wifi-password)](https://github.com/igrigorik/ga-beacon)

# Wifi-Password

Note: that this script requires root privileges. The files accessed are owned by
root on Ubuntu.

Note: I have only tested this script on Ubuntu. This script depends largely on
if `/etc/NetworkManager/system-connections` exists, since this is where known
networks are stored.

This script returns wifi passwords to your prompt.

### Usage

#### Default (No Arguments)

By default it will return the password of your current network.

Example:

```bash
$ get-wifi-password
password for my network
```

#### Specified SSID

You can also pass it the name of a network you have connected to previously.

Example:

```bash
$ get-Wifi-password mywifi
password for mywifi
```

It also works for SSIDs with spaces in them if needed.

#### List SSIDs You Can Use

There is also an `-ls` option that will give you a list of the networks you can
get a password for (this is not a full list of the networks you have accessed.
Just the ones that have a password for them).

```bash
$ get-wifi-password -ls
mywifi
friends wifi
work wifi
```

#### Tab Completion

This script also has tab completion if you install the autocompletion file in
this repo.

```bash
$ get-wifi-password <tab>
mywifi    friends wifi    work wifi
```

#### Forget a Network

To forget a network so that the password is no longer saved:

```bash
$ get-wifi-password -rm mywifi
```

This will remove this connection and restart the network-manager service.
Changes don't seem to take place until that service is restarted so it is
essential in order to get the expected behaviour.

If the script fails to remove the network due to some error or a typo it will
let you know.

Also if the network-manager fails to restart it will let you know. You may need
to try to restart it yourself, or reboot your system for the changes to take
effect.

As with everything else, this also works with tab completion.

#### Help

The `-h` option gives some instructions for how to use the script as well.

### Install

#### Autocomplete

Run the script from the root of this repo:

```bash
$ ./install-autocomplete
```

This just symlinks the autocomplete file to `/etc/bash_completion.d/`

#### Script

Whatever method you think is best. You can:
  * Copy the file to somewhere in your path already ie. `/bin`
  * Add this repo to your path by adding `export PATH=$PATH:path/to/this/repo`
    to something like your `.bashrc`
  * Don't do anything. You could just come back to this repo everytime you want
    to execute it as well :)
