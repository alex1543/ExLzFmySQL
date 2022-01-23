# ExLzFmySQL
This program allows you to check the connection to the MySQL database from Lazarus. Next, the first window of the program is presented, giving a general idea of ​​the program:

![1](https://user-images.githubusercontent.com/10297748/150673555-813e8ad2-0363-4eef-9a0d-7c1ffd538c85.png)

If the operation is successful, a message of the following type will be displayed:

![2](https://user-images.githubusercontent.com/10297748/150673824-6e46db1e-600d-4772-b753-703ba847df00.png)

Additional functions are available in text form:

![3](https://user-images.githubusercontent.com/10297748/150673922-ec9a4a1d-35e7-481e-b748-72e26b2a8356.png)

If there is no database, it must be created with the command "CREATE DATABASE test;" in phpMyAdmin and create a table using the command "CREATE TABLE myArtTable (id int(11) NOT NULL auto_increment, text text NOT NULL, description text NOT NULL, keywords text NOT NULL, PRIMARY KEY (id)) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=cp1251;", which can be prompted with the CREATE and RUN buttons, as shown in the following illustration:

![4](https://user-images.githubusercontent.com/10297748/150674232-453d7455-8435-4b05-84b6-3c58751674c0.png)

Summary. This program allows you to check the connection to the MySQL database from the Lazarus compiler. Indispensable for troubleshooting network problems. The program has been tested under Windows 11, XAMPP v.3.3.0 (10.4.22-MariaDB) and Lazarus 2.0.10.
