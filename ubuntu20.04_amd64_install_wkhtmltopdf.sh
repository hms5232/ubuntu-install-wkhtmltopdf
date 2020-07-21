#!/bin/bash

# 遇到錯誤就中止
set -e


# 避免有舊版本存在
if ls wkhtmltox_*.focal_amd64.deb 1> /dev/null 2>&1; then
	echo -e "Find old version deb! This shell will remove all of them.\n"
	rm wkhtmltox_*.focal_amd64.deb
fi

# Get deb info from Github api
read -p "Input specific version or leave empty to download latest: " version
if [ -z "$version" ] ; then
	# Call Github api to download the latest version deb
	url=$(curl -s https://api.github.com/repos/wkhtmltopdf/packaging/releases/latest | sed -r -n 's/.*"browser_download_url": *"(.*\.focal_amd64\.deb)".*/\1/p')
else
	# download specific version which user designate
	url=$(curl -s https://api.github.com/repos/wkhtmltopdf/packaging/releases/tags/$version | sed -r -n 's/.*"browser_download_url": *"(.*\.focal_amd64\.deb)".*/\1/p')
	
	# Older version binary file store in other repo
	if [ -z "$url" ] ; then
		url=$(curl -s https://api.github.com/repos/wkhtmltopdf/wkhtmltopdf/releases/tags/$version | sed -r -n 's/.*"browser_download_url": *"(.*\.focal_amd64\.deb)".*/\1/p')
	fi
fi

# Check binary file of this version exist or not
if [ -z "$url" ] ; then
	echo "Not found! Please check release tag."
	exit 1
fi

# download
wget $url

# Let's install it!
sudo dpkg -i wkhtmltox_*.focal_amd64.deb

# check the default path
echo -e "\n"
if ls /usr/local/bin/wkhtmltopdf 1> /dev/null 2>&1; then
	echo -e "The latest wkhtmltopdf now is installed and path is /usr/local/bin/wkhtmltopdf \n\n"
else
	echo -e "The latest wkhtmltopdf now is installed. You can use the following command to locate path: \n"
	echo -e "\t whereis wkhtmltopdf \n"
	echo -e "\n"
fi

# remove the deb file
rm wkhtmltox_*.focal_amd64.deb

# See you~
echo -e "==========This is the end of this shell script.==========\n\n"
