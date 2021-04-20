please click this link for [domain model and user stories](https://docs.google.com/document/d/1wJbKZYCtzAtQvjJMoB2z82jam7BUpG7y-oK7oyS0v3Q/edit)


Database Setup
--------------
1. Connect to psql
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager;`
3. Connect to the database using the `pqsl` command `\c bookmark_manager;`
4. Run the query we have saved in the file `01_create_bookmarks_table.sql`
5. Set up a new test database using `psql` command `CREATE DATABASE "bookmark_manager_test";`
6. Create a new table inside it `CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));`
7. Set up the environment to test when running tests
8. use the bookmark_manager database when in development and bookmark_manager_test when in test phase
