#Check if it is a git repo
if ! [ -d .git ]
then 
	echo "fatal: Not a git repository"
	return 1
fi

user=$(git config --get user.name)
repo=$(git config --get remote.origin.url)
repo=$(echo $repo | awk -F : '{print $2}')
repo=$(echo $repo | awk -F . '{print $1}')

test -e /tmp/issue_content && rm /tmp/issue_content
touch /tmp/issue_content
$EDITOR /tmp/issue_content || vi /tmp/issue_content || nano /tmp/issue_content


if [ $(cat /tmp/issue_content | wc -l) -lt 1 ]
then
	echo "error: You have to type at least a title for your issue"
	rm /tmp/issue_content
	return 1
fi

title="$(head -1 /tmp/issue_content)"

if [ $(cat /tmp/issue_content | wc -l) -gt 2 ]
then
	body="$(sed '1d;2d;s/"/\\"/g;:a;N;$!ba;s/\n/\\n/g' /tmp/issue_content)"
	content="{\"title\":\"$title\",\"body\":\"$body\"}"
else
	content="{\"title\":\"$title\"}"
fi

curl -u "$user" -X POST -d "$content" https://api.github.com/repos/$repo/issues
rm /tmp/issue_content
