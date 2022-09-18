#!/opt/homebrew/bin/zsh

Repos=(\
    "/Users/wangk/Project/14.ConnectGalaxyInPC" \
    "/Users/wangk/Project/17.SateQuenching" \
    "/Users/wangk/Project/paper/paper_old" \
    "/Users/wangk/Project/paper/6_Conformity" \
    "/Users/wangk/Project/homepage" \
    "/Users/wangk/.config" \
)

for r in ${Repos[*]}; do
    gitstatus=$(git -C $r status --short)
    if [ "$gitstatus" != "" ] 
    then
        printf "Repo: \e[36m$r\e[0m\nStatus:\n"
        printf "\e[31m"
        git -C $r status --short | sed -e "s|^|    |g"
        printf "\e[0m\n"
    fi
done
