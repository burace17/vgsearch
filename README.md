vgsearch
===================================

## Prerequisites 

[.NET Core](https://www.microsoft.com/net/core) - you only need to do the first step.
[PostgreSQL](https://www.postgresql.org/download/)

After that, clone this repository by typing the following in your git bash terminal:

`git clone https://github.com/burace17/vgsearch.git`

Next, you will need to initialize the database. Run the following in Postgres as the `postgres` user:

~~~~
CREATE DATABASE vgsearch;

~~~~

`dotnet run`

You can then browse to [http://localhost:5000](http://localhost:5000) to use the application.
