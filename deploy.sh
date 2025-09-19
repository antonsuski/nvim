#!/bin/sh

SRC_CONFIG_DIR='config'
FILE=${SRC_CONFIG_DIR}/'init.lua'
LSP_PLUGIN='nvim-lspconfig'
UNIX=${HOME}/'.config/nvim'

DIR=${UNIX}
LSP_PLUGIN_DIR="${DIR}/pack/nvim/start/${LSP_PLUGIN}"
TARGET_FILE="${DIR}/${FILE}"

echo 'Deploying NeoVIM configuration ...'
echo 'Checking already existed configuration ...'

if test -d ${DIR}; then
	echo 'NeoVIM directory exists'
else
	echo 'There is no NeoVIM root directory'
	echo 'Creating nvim config directory ...'
	mkdir -pv ${DIR}
fi


if  test -s ${TARGET_FILE} ; then
	echo 'Configuration already exists.'
	echo "Making backup file ... : ${TARGET_FILE}.bak"
	cp ${TARGET_FILE} ${TARGET_FILE}.bak
else
	echo 'Configureation does not exists.'
	echo "Copying configuration ... ${FILE} to ${TARGET_FILE}"
	cp "${FILE}" "${TARGET_FILE}"
fi

echo 'Checking already existed nvim-lspconfig plugins ...'

if test -d ${LSP_PLUGIN_DIR}; then
	echo 'The nvim-lspconfig plugin exists'
else
	echo 'There is no nvim-lspconfig'
	echo 'Installing nvim-lspconfig ...'
	git clone https://github.com/neovim/nvim-lspconfig ~/.config/nvim/pack/nvim/start/nvim-lspconfig
fi
