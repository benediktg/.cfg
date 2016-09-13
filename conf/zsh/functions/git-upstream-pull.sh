#!/bin/bash

git-upstream-pull()
{
	local remote
	remote="$(git remote)"
	local branch
	branch="$(git currentbranch)"
	local upstream="upstream"
	local repo
	if (( $# == 0 )); then
		if [[ ! $remote =~ $upstream ]]; then
			echo "missing argument, put in a repo URL:"
			IFS= read -r repo
			if [[ -z $repo ]]; then
				echo "aborting"
				return 1
			fi
		fi
	elif (( $# == 1 )); then
		repo="$1"
	else
		case $1 in
			gh)
				repo="https://github.com/$2.git" ;;
			gl)
				repo="https://gitlab.com/$2.git" ;;
			nab)
				repo="https://notabug.org/$2.git" ;;
			gnuio)
				repo="https://git.gnu.io/$2.git" ;;
			kde)
				repo="git://anongit.kde.org/$2.git" ;;
			*)
				echo "wrong arg[1]"
				return 1 ;;
		esac
	fi
	if [[ ! $remote =~ $upstream ]]; then
		git remote add $upstream "$repo"
	fi
	git fetch $upstream
	git checkout master
	git rebase $upstream/master
	git push origin master
	git checkout "$branch"
	git rebase master
	return 0
}
