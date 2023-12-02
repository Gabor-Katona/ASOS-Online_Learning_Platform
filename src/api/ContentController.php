<?php
header ("Access-Control-Allow-Origin: *");
header ("Access-Control-Expose-Headers: Content-Length, X-JSON");
header ("Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS");
header ("Access-Control-Allow-Headers: *");

require_once "Database.php";
require_once "Content.php";

class ContentController {

    private PDO $conn;

    public function __construct(){
        $this->conn = (new Database())->getConnection();
    }

    public function createOrUpdateContent(Content $content){

        $query_data = array(
            ':courseId' => $content->getCourseId(),
            ':contentType' =>  $content->getType(),
            ':text' =>  $content->getText(),
        );
        $stmt = $this->conn->prepare("INSERT INTO `content` (course_id, type, text) values (:courseId, :contentType, :text);");

        $stmt->execute($query_data);
        $courseId = $this->conn->lastInsertId();
        return $courseId;
    }

    public function getAllContents() {
        $stmt = $this->conn->prepare("SELECT * from `content` order by course_id ASC;");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getAllContentOfCourse(int $courseId) {
        $queryArr = array(
            ':courseId' => $courseId,
        );
        $stmt = $this->conn->prepare("SELECT * from `content` WHERE course_id = :courseId order by id ASC;");
        $stmt->execute($queryArr);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function deleteContent(int $id){
        $queryArr = array(
            ':id' => $id,
        );
        $stmt = $this->conn->prepare("DELETE FROM `content` WHERE id = :id;");
        return $stmt->execute($queryArr);
    }

    public function deleteContentOfCourse(int $id){
        $queryArr = array(
            ':id' => $id,
        );
        $stmt = $this->conn->prepare("DELETE FROM `content` WHERE course_id = :id;");
        return $stmt->execute($queryArr);
    }
}