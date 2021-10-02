#!/bin/sh
set -e -x

[ -z "${GIT_REPO}" ] && { echo "Need to set GIT_REPO"; exit 1; }
[ -z "${GIT_BRANCH}" ] && { echo "Need to set GIT_BRANCH"; exit 1; }
[ -z "${GIT_ORIGIN}" ] && { echo "Need to set GIT_ORIGIN"; exit 1; }
[ -z "${COMMIT_USER}" ] && { echo "Need to set COMMIT_USER"; exit 1; }
[ -z "${COMMIT_EMAIL}" ] && { echo "Need to set COMMIT_EMAIL"; exit 1; }
[ -z "${WORKING_DIR}" ] && { echo "Need to set WORKING_DIR"; exit 1; }
[ -z "${SSH_KEY}" ] && { echo "Need to set SSH_KEY"; exit 1; }

cd "${WORKING_DIR}"

if [ ! -d ~/.ssh ]; then
	echo "SSH Key was not found. Configuring SSH Key."
	mkdir ~/.ssh
	echo -e "${SSH_KEY}" > ~/.ssh/id_rsa
	chmod 700 ~/.ssh
	chmod 600 ~/.ssh/id_rsa

	echo -e "Host *\n    StrictHostKeyChecking no\n    UserKnownHostsFile=/dev/null\n" > ~/.ssh/config
fi

if [ ! -d "${WORKING_DIR}/.git" ]; then
	echo "Git repository not found. Initializing repository."
	git init
	git remote add ${GIT_ORIGIN} ${GIT_REPO}
	git fetch
	git checkout -t ${GIT_ORIGIN}/${GIT_BRANCH}
fi

git config user.name "${COMMIT_USER}"
git config user.email "${COMMIT_EMAIL}"
git add .
git commit -m "Update detected changes."
git push "${GIT_ORIGIN}" "${GIT_BRANCH}"