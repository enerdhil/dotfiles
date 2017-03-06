# Update and encrypt my hosts files, used for ssh completion
# By enerdhil <hezardj@gmail.com>

function update_hosts() {
	echo $1 >> $HOME/hosts
	TMPATH="/tmp/$(mktemp)"
	git clone http://github.com/enerdhil/dotfiles.git $TMPATH
	openssl enc -aes-256-cbc -in $HOME/.hosts -out $TMPATH/hosts.dat
	(cd $TMPATH; git add hosts.dat; git commit -m "Updated hosts file"; git push)
}
