apt-get update
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
apt-get update
apt-get install -y dotnet-sdk-2.0.0
apt-get install -y postgresql
runuser -l postgres -c $'echo "CREATE USER vgsearch WITH PASSWORD \'mypassword\'; CREATE DATABASE vgsearch;" | psql'
useradd -m -p i.yiH7jRyi9hI -s /bin/bash vgsearch
runuser -l postgres -c 'psql -d vgsearch -a -f /vagrant/initialize_db.sql'