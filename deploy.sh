#!/bin/sh

SRC_CONFIG_DIR='config'
FILE='init.lua'
LSP_PLUGIN='nvim-lspconfig'
UNIX=${HOME}/'.config/nvim'

DIR=${UNIX}
LSP_PLUGIN_DIR="${DIR}/pack/nvim/start/${LSP_PLUGIN}"
TARGET_FILE="${DIR}/${FILE}"

FINAL_RES_MSG=''

echo 'Deploying NeoVIM configuration ...'
echo 'Checking already existed configuration ...'

if test -d ${DIR}; then
	echo 'NeoVIM directory exists'
	FINAL_RES_MSG='Redeploy done.'
else
	echo 'There is no NeoVIM root directory'
	echo 'Creating nvim config directory ...'
	mkdir -pv ${DIR}
	FINAL_RES_MSG='Deploy done.'
fi


if  test -s ${TARGET_FILE} ; then
	echo 'Configuration already exists.'
	echo "Making backup file ... : ${TARGET_FILE}.bak"
	cp ${TARGET_FILE} ${TARGET_FILE}.bak
else
	echo 'Configureation does not exists.'
fi

echo "Copying configuration ... ${SRC_CONFIG_DIR}/${FILE} to ${TARGET_FILE}"
cp -T -r "${SRC_CONFIG_DIR}" "${DIR}"

echo 'Checking of existed nvim-lspconfig plugin ...'

if test -d ${LSP_PLUGIN_DIR}; then
	echo 'The nvim-lspconfig plugin exists'
else
	echo 'There is no nvim-lspconfig'
	echo 'Installing nvim-lspconfig ...'
	git clone https://github.com/neovim/nvim-lspconfig ~/.config/nvim/pack/nvim/start/nvim-lspconfig
fi

echo ${FINAL_RES_MSG}

