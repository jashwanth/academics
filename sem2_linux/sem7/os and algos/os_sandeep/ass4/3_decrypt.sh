read file_name
read pan
gpg --homedir ~/$pan -o file_name -d secret.txt.asc
