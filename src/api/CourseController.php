<?php
header ("Access-Control-Allow-Origin: *");
header ("Access-Control-Expose-Headers: Content-Length, X-JSON");
header ("Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS");
header ("Access-Control-Allow-Headers: *");

require_once "Database.php";
require_once "Course.php";
require_once "ContentController.php";

class CourseController {

    private PDO $conn;

    public function __construct(){
        $this->conn = (new Database())->getConnection();
    }

    public function createOrUpdateCourse(Course $course){

        $query_data = array(
            ':username' => $course->getUsername(),
            ':title' =>  $course->getTitle(),
        );
        $stmt = $this->conn->prepare("INSERT INTO `courses` (username, title) values (:username, :title);");

        $stmt->execute($query_data);
        $courseId = $this->conn->lastInsertId();
        return $courseId;
    }

    public function getAllCourses() {
        $stmt = $this->conn->prepare("SELECT * from `courses` order by title ASC;");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function deleteCourse(int $id){
        $contentController = new ContentController();
        $contentController->deleteContentOfCourse($id);

        $queryArr = array(
            ':id' => $id,
        );
        $stmt = $this->conn->prepare("DELETE FROM `courses` WHERE id = :id;");
        return $stmt->execute($queryArr);
    }

}