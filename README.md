vgsearch
===================================

## Vagrant installation method

1. Download Vagrant [here](https://www.vagrantup.com/downloads.html)
2. Download [VirtualBox](https://www.virtualbox.org/wiki/Download_Old_Builds_5_1) if you do not already have it installed. **Version 5.1 is required**
3. Clone the git repository with the following command: `git clone https://github.com/burace17/vgsearch.git`
4. Open a command line window in the repository folder and type `vagrant up`
5. This will take a while. When it finishes and does not display any errors, use your SSH client (PuTTY if you are on Windows) to connect to the following server:
    Hostname: localhost
    Port: 2222
    Username: vgsearch
    Password: mypassword
6. Once logged in, change to the directory containing the app with `cd /vagrant`
7. Finally, launch the app by typing `ASPNETCORE_URLS="http://0.0.0.0:5000" dotnet run`
    The ASPNETCORE_URLS environment variable needs to be set so that the app binds to all available interfaces. If this variable is not set, the app will not be accessible from the host machine. 

## Non-vagrant

[.NET Core](https://www.microsoft.com/net/core) - you only need to do the first step.
[PostgreSQL](https://www.postgresql.org/download/)

After that, clone this repository by typing the following in your git bash terminal:

`git clone https://github.com/burace17/vgsearch.git`

Next, you will need to initialize the database. Run the following in Postgres as the `postgres` user:

~~~~
CREATE DATABASE vgsearch;
\connect vgsearch
\i initialize_db.sql
~~~~

`dotnet run`

You can then browse to [http://localhost:5000](http://localhost:5000) to use the application.
