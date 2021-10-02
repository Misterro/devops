#!/bin/sh
set -e -x

[ -z "${GIT_REPO}" ] && { echo "Need to set GIT_REPO"; exit 1; }
[ -z "${GIT_BRANCH}" ] && { echo "Need to set GIT_BRANCH"; exit 1; }
[ -z "${GIT_ORIGIN}" ] && { echo "Need to set GIT_ORIGIN"; exit 1; }
[ -z "${COMMIT_USER}" ] && { echo "Need to set COMMIT_USER"; exit 1; }
[ -z "${COMMIT_EMAIL}" ] && { echo "Need to set COMMIT_EMAIL"; exit 1; }
[ -z "${SSH_KEY}" ] && { echo "Need to set SSH_KEY"; exit 1; }
[ -z "${SSH_KEY_PUB}" ] && { echo "Need to set SSH_KEY_PUB"; exit 1; }

if [ ! -d ~/.ssh ]; then
	echo "SSH Key was not found. Configuring SSH Key."
	mkdir ~/.ssh
	echo -e "${SSH_KEY}" > ~/.ssh/id_rsa
	echo -e "${SSH_KEY_PUB}" > ~/.ssh/id_rsa.pub
	chmod 700 ~/.ssh
	chmod 600 ~/.ssh/id_rsa
	chmod 600 ~/.ssh/id_rsa.pub
fi

git init
git remote add ${GIT_ORIGIN} ${GIT_REPO}
git fetch
git checkout -t ${GIT_ORIGIN}/${GIT_BRANCH}
git config user.name "${COMMIT_USER}"
git config user.email "${COMMIT_EMAIL}"
git add .
git commit -m "Update detected changes."
ssh -T git@github.com:Misterro/s.git
git remote set-url origin git@github.com:Misterro/s.git
git push "${GIT_ORIGIN}" "${GIT_BRANCH}"