#!/bin/bash

# $1 - the url of the repo to clone     [required]
# $2 - the name of the project          [required]

RET_DIR=`pwd`

git clone --bare $1 /var/repo/$2.git
cd /var/repo/$2.git
mkdir -p /var/build/$2

cd hooks
cat "#!/bin/bash\ngit-work-tree=/var/build/$2 --git-dir=/var/repo/$2.git checkout -f\ndeploy_haskell_folder.sh /var/build/$2 /$2" > post-receive
chmod +x post-receive

cd $RET_DIR
