#!/bin/bash


# 避免有舊版本存在
if ls wkhtmltox_*.bionic_amd64.deb 1> /dev/null 2>&1; then
	echo -e "Find order version deb! This shell will remove all of them.\n"
	rm wkhtmltox_*.bionic_amd64.deb
fi

# Call Github api to download the latest version deb
curl -s https://api.github.com/repos/wkhtmltopdf/wkhtmltopdf/releases/latest | sed -r -n 's/.*"browser_download_url": *"(.*\.bionic_amd64\.deb)".*/\1/p' | wget -i -

# Let's install it!
sudo dpkg -i wkhtmltox_*.bionic_amd64.deb

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
rm wkhtmltox_*.bionic_amd64.deb

# See you~
echo -e "==========This is the end of this shell script.==========\n\n"