#!/bin/sh

FILE='init.vim'
UNIX=${HOME}/'.config/nvim'

DIR=${UNIX}
TARGET_FILE="${DIR}/${FILE}"

echo 'Deploying NeoVIM configuration ...'
echo 'Checking already existed configuration ...'

if test -d ${DIR}; then
	echo 'NeoVIM directory exists'
else
	echo 'There is no NeoVIM root directory'
	mkdir -pv ${DIR}
fi


if  test -s ${TARGET_FILE} ; then
	echo 'Configuration already exists.'
	echo "Making backup file: ${TARGET_FILE}.bak"
	cp ${TARGET_FILE} ${TARGET_FILE}.bak
else
	echo 'Configureation does not exists.'
	echo "Copying configuration ... ${FILE} to ${TARGET_FILE}"
	cp "${FILE}" "${TARGET_FILE}"
fi

