if [ -e script.sh ]
then
	cp script.sh /usr/local/bin/git-issue
	chmod +x /usr/local/bin/git-issue
else
	cp $(find . -path ./*git-issue/script.sh) /usr/local/bin/git-issue
	chmod +x /usr/local/bin/git-issue
fi

