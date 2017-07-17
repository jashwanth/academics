read file_name
read peter
curr=`pwd`
gpg --homedir ~/$peter -e -a -r $peter secret.txt

