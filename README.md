# ASOS-Online_Learning_Platform

## Prerequisites
Before you begin, ensure you have the following prerequisites installed:

- [XAMPP](https://www.apachefriends.org/index.html) (with PHP 8.2) for setting up the backend environment.
- [MariaDB](https://mariadb.org/) (10.6) for the database.
- [Node.js](https://nodejs.org/en) for the frontend.

## Getting Started

1. Clone this repository to your local machine to the XAMPP's htdocs directory (usually located at C:\xampp\htdocs on Windows or /opt/lampp/htdocs on Linux).

   Configure the necessary settings in XAMPP to run the backend if needed.


2. Start XAMPP and ensure that the Apache services is running.


3. Start MariaDB service.


4. Create the MariaDB database using the **olp_database.sql** file provided in the SQL folder of the project. You can use a tool like phpMyAdmin, HeidiSQL or the MariaDB command line.


5. Install the necessary dependencies for the frontend (Vue.js). Navigate to the project directory (ASOS-Online_Learning_Platform) and run:
   ```
   npm install
   ```
6. Start the frontend development server by running the following command in the project directory (ASOS-Online_Learning_Platform):
   ```
   npm run serve
   ```
7. Your web application should now be accessible at http://localhost:8080 in your web browser.

   Default users in database:
   
   Role | Email | Password |
   --- | --- | --- |
   admin | admin1@admin.com| admin1 |
   teacher | teacher1@teacher.com | newpassword |
   student | student1@student.com | newpassword |