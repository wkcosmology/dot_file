#!/opt/homebrew/bin/zsh

Repos=(\
    "/Users/wangk/Project/14.ConnectGalaxyInPC" \
    "/Users/wangk/Project/17.SateQuenching" \
    "/Users/wangk/Project/22.WeakLensing" \
    "/Users/wangk/Project/paper/paper_old" \
    "/Users/wangk/Project/paper/6_Conformity" \
    "/Users/wangk/Project/homepage" \
    "/Users/wangk/.config" \
)

for r in ${Repos[*]}; do
    cd $r
    printf "Repo: \e[36m$r\n      Fetching......  \e[0m"
    git remote update > /dev/null
    printf "\e[32mDone\e[0m\n"
    printf "Status:\n"
    printf "\e[32m"
    git -C $r status -uno | sed -e "s|^|    |g"
    printf "\e[0m\n"
    echo "----------------------------------------------------------------"
done
