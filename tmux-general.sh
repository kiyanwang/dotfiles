#!/bin/zsh
# My starter template for tmux layout
SESSION=`basename $PWD`

tmux -2 new-session -d -s $SESSION

# first window will contain vim + two terminals
tmux rename-window -t $SESSION:1 IDE
tmux split-window -v
tmux select-pane -t 1
tmux resize-pane -D 10
tmux select-pane -t 2
tmux split-window -h
tmux select-pane -t 1 

# second window contains monitors + utils
tmux new-window -t $SESSION -a -n general-purpose
tmux split-window -h
tmux select-pane -t 1
tmux split-window -v
tmux select-pane -t 1
tmux resize-pane -U 15
tmux select-pane -t 3
tmux split-window -v
tmux select-pane -t 3
tmux resize-pane -U 10
tmux send-keys "mc" C-m
tmux select-pane -t 4
tmux send-keys "htop" C-m
tmux select-pane -t 2
#tmux send-keys "bmon -o curses" C-m

tmux select-window -t $SESSION:1
tmux -2 attach -t $SESSION
