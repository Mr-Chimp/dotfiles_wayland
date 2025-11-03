export XCURSOR_THEME="Neutral"
export XCURSOR_SIZE=24
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
export ADW_DISABLE_PORTAL=1
numlockx &

#exec bspwm
exec startxfce4
