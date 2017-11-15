#! /bin/bash

tmux kill-window -t Internet
tmux new-window -a -n Internet
tmux new-session -d -s Internet 'htop'
tmux selectp -t Internet
# tmux select-window -t Internet:0
tmux set-window-option -g window-status-current-bg blue
tmux split-window -v 'slurm -s -i eth0'
tmux split-window -v 'slurm -s -i tun0'
tmux select-layout even-vertical
tmux resize-pane -t 0 -y 24
tmux resize-pane -t 1 -U 4
tmux attach -t Internet

