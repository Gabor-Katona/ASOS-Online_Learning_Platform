<?php
header ("Access-Control-Allow-Origin: *");
header ("Access-Control-Expose-Headers: Content-Length, X-JSON");
header ("Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS");
header ("Access-Control-Allow-Headers: *");

require_once "Database.php";
require_once "User.php";

class UserController{

    private PDO $conn;

    public function __construct(){
        $this->conn = (new Database())->getConnection();
    }

    public function login($username, string $role, string $password){
        if($username && $role === '' && $password === ''){
            $query_data = array(
                ':username' =>  $username,
            );
            $stmt = $this->conn->prepare("SELECT * FROM `login` where username = :username");
        }else{ // autologin
            $query_data = array(
                ':role' => $role,
                ':pw' =>  $password,
            );
            $stmt = $this->conn->prepare("SELECT * FROM `login` where pw = :pw and role = :role");
        }
        $stmt->execute($query_data);
        $stmt->setFetchMode(PDO::FETCH_CLASS, "User");
        $person = $stmt->fetch();
        return $person;
    }

    public function registration(User $person){
        $query_data = array(
            ':firstname' =>  $person->getFirstname(),
            ':lastname' =>  $person->getLastname(),
            ':username' =>  $person->getUsername(),
            ':email' =>  $person->getEmail(),
            ':pw' =>  $person->getPassword(),
            ':role' =>  $person->getRole(),
        );
        $stmt = $this->conn->prepare(
            "INSERT INTO `login` (firstname, lastname, username, email, pw, role)
             values (:firstname, :lastname, :username, :email, :pw, :role)");
        $stmt->execute($query_data);
    }

    public function checkIfUsernameExists(string $username):bool {
        $stmt = $this->conn->prepare("SELECT username from `login` where username = :username;");
        $stmt->bindParam(":username", $username, PDO::PARAM_STR);
        $stmt->execute();
        if($stmt->fetch(PDO::FETCH_COLUMN)){
            return true;
        }else{
            return false;
        }
    }

    // public function insertUser(User $person): int
    // {
    //     $stmt = $this->conn->prepare("insert into user (name, surname, email, username, password) values (:name, :surname, :email, :username, :password);");
    //     $name = $person->getName();
    //     $surname = $person->getSurname();
    //     $email = $person->getEmail();
    //     $username = $person->getUsername();
    //     $password = $person->getPassword();

    //     $stmt->bindParam(":name", $name, PDO::PARAM_STR);
    //     $stmt->bindParam(":surname", $surname, PDO::PARAM_STR);
    //     $stmt->bindParam(":email", $email, PDO::PARAM_STR);
    //     $stmt->bindParam(":username", $username, PDO::PARAM_STR);
    //     $stmt->bindParam(":password", $password, PDO::PARAM_STR);

    //     $stmt->execute();
    //     return $this->conn->lastInsertId();
    // }

    // public function checkIfUserExists(string $username, string $password,string $method):bool {
    //     $stmt = $this->conn->prepare("select user.* from user where user.username=:username;");
    //     $stmt->bindParam(":username", $username, PDO::PARAM_STR);
    //     $stmt->execute();
    //     $stmt->setFetchMode(PDO::FETCH_CLASS, "User");
    //     $personCheck = $stmt->fetch();
    //     switch ($method){
    //         case "login":
    //             if ($personCheck->getUsername() === $username && password_verify($password, $personCheck->getPassword())) {
    //                 return true;
    //             }else{
    //                 return false;
    //             }
    //         case "registration":
    //             if(!$personCheck){
    //                 return false;
    //             }else {
    //                 if ($personCheck->getUsername() === $username) {
    //                     return true;
    //                 } else {
    //                     return false;
    //                 }
    //             }
    //     }

    // }
    // public function getUserEmail($username):string{
    //     $stmt = $this->conn->prepare("select user.email from user where user.username=:username;");
    //     $stmt->bindParam(":username", $username, PDO::PARAM_STR);
    //     $stmt->execute();
    //     //$stmt->setFetchMode(PDO::FETCH_CLASS, "User");
    //     $tmp_email = $stmt->fetch();
    //     return $tmp_email[0];
    // }
    // public function logUser($username, $email, $logintype):void{
    //     $stmt = $this->conn->prepare("insert into login (username, email, logintype, logintime) values (:username, :email, :logintype, :logintime);");
    //     $stmt->bindParam(":username", $username, PDO::PARAM_STR);
    //     $stmt->bindParam(":email", $email, PDO::PARAM_STR);
    //     $stmt->bindParam(":logintype", $logintype, PDO::PARAM_STR);
    //     date_default_timezone_set('Europe/Bratislava');
    //     $logintime = date("d-m-Y h:i:s a", time());
    //     $stmt->bindParam(":logintime", $logintime, PDO::PARAM_STR);
    //     $stmt->execute();
    // }

    // public function getAllMyLogins ($username): array
    // {
    //     $stmt = $this->conn->prepare("select * from login where login.username=:username;");
    //     $stmt->bindParam(":username", $username, PDO::PARAM_STR);
    //     $stmt->execute();
    //     return $stmt->fetchAll(PDO::FETCH_CLASS, "Login");
    // }
    // public function getSumOfLoginTypes($type){
    //     $stmt = $this->conn->prepare("select count(login.logintype) from login where login.logintype=:logintype;");
    //     $stmt->bindParam(":logintype", $type, PDO::PARAM_STR);
    //     $stmt->execute();
    //     return $stmt->fetch();
    // }

}