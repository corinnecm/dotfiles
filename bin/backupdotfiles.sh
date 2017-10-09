#!/usr/local/bin/zsh

python has_been_week.py /Users/cocamc/.dotfiles/backup.log
if [ $? -eq 0 ]; then
    osascript -e "display notification \"Pausing Dropbox.\" with title \"Backing up ~/.dotfiles\""
    dropbox-pause-unpause.sh --pause
    cp -rf ~/.dotfiles /Volumes/T3/Dropbox/dotfiles 2> ~/.dotfiles/backuperr.log
    echo "Backed up dotfiles $(date +%d.%m.%y-%H:%M:%S)" >> ~/.dotfiles/backup.log
    dropbox-pause-unpause.sh --unpause
    osascript -e "display notification \"Unpausing Dropbox.\" with title \"Finished backing up ~/.dotfiles\""
else;
    msg="Attempted backup $(date +%d.%m.%y-%H:%M:%S), hasn't been week since last backup in log" 
    echo $msg >> ~/.dotfiles/backuperr.log
    echo $msg
fi
