<?php
header ("Access-Control-Allow-Origin: *");
header ("Access-Control-Expose-Headers: Content-Length, X-JSON");
header ("Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS");
header ("Access-Control-Allow-Headers: *");
header("content-type: application/json");

require_once "User.php";
require_once "UserController.php";
require_once "TestController.php";
require_once "CourseController.php";
require_once "ContentController.php";

$userController = new UserController();
$testController = new TestController();
$courseController = new CourseController();

if($_POST['action'] == 'login' || $_POST['action'] == 'autologin'){
    $person = null;
    if($_POST['action'] == 'login'){
        $person = $userController->login($_POST['email'],'',''); //login
    }else{
        $person = $userController->login('',$_POST['role'], $_POST['token']); //autologin
    }
    if($person){
        echo json_encode($person->expose());
    }else{
        echo json_encode($person); // return false
    }
}

if($_POST['action'] == 'register'){
    $tmp = $userController->checkIfUsernameOrEmailExists($_POST['username'], $_POST['email']);
    if($tmp == 'username and email exists'){
        echo json_encode('username and email exists');
    }
    else if($tmp == 'username exists'){
        echo json_encode('username exists');
    }
    else if($tmp == 'email exists'){
        echo json_encode('email exists');
    }
    else{
        // username and email not exists
        $user = new User();
        $user->setFirstname($_POST['firstname']);
        $user->setLastname($_POST['lastname']);
        $user->setUsername($_POST['username']);
        $user->setEmail($_POST['email']);
        $user->setPassword($_POST['password']);
        $user->setRole($_POST['role']);
        try{
            $userController->registration($user);
            echo json_encode($tmp);
        }catch(PDOException $exception){
            echo json_encode($exception->getMessage());
        }
    }
}

if($_POST['action'] == 'createNewTest' || $_POST['action'] == 'editTest'){
    $titleExists = null;
    if($_POST['action'] == 'createNewTest'){
        $titleExists = $testController->checkTestTitleExistsForCourse($_POST['title'], $_POST['course']);
        if($titleExists){
            echo json_encode('Title exists for this course');
        }
        else{
            try{
                $testController-> addNewTestOrEdit($_POST, 'create');
                echo json_encode("Test was Successfully uploaded to Database!");
            }
            catch(PDOException $exception){
                echo json_encode($exception->getMessage());
            }
        }
    }
    else{
        if($_POST['title'] != $_POST['oldTitle'] && $_POST['course'] == $_POST['oldCourse'] ||
            $_POST['title'] == $_POST['oldTitle'] && $_POST['course'] != $_POST['oldCourse'] ||
            $_POST['title'] != $_POST['oldTitle'] && $_POST['course'] != $_POST['oldCourse']
        ){
            $titleExists = $testController->checkTestTitleExistsForCourse($_POST['title'], $_POST['course']);
        }
        if($titleExists){
            echo json_encode('Title exists for this course');
        }
        else{
            try{
                $testController-> addNewTestOrEdit($_POST, 'edit');
                echo json_encode("Test was Successfully updated!");
            }
            catch(PDOException $exception){
                echo json_encode($exception->getMessage());
            }
        }
    }
}

if($_POST['action'] == 'getTestTitles'){
    echo json_encode($testController->getTestTitlesByCourse($_POST['course']));
}

if($_POST['action'] == 'getTestsByUsername'){
    echo json_encode($testController->getTestTitlesByUsername($_POST['username']));
}

if($_POST['action'] == 'getCompleteTestById' || $_POST['action'] == 'getCompleteTestsByUsername'){
    if($_POST['action'] == 'getCompleteTestById'){
        try{
            $dbData = $testController->getCompleteTestByParams($_POST['id'], '');
            echo json_encode($dbData);
        }catch(PDOException $exception){
            echo json_encode($exception->getMessage());
        }
    }
    if($_POST['action'] == 'getCompleteTestsByUsername'){
        try{
            $dbData = $testController->getCompleteTestByParams('', $_POST['username']);
            echo json_encode($dbData);
        }catch(PDOException $exception){
            echo json_encode($exception->getMessage());
        }
    }
}

if($_POST['action'] == 'getAllUsers'){
    try{
        echo json_encode($userController->getAllUsers());
    }catch(Error $exception){
        echo json_encode($exception->getMessage());
    }
}

if($_POST['action'] == 'getUserByUsername'){
    try{
        echo json_encode($userController->getUserByUsername($_POST['username']));
    }catch(Error $exception){
        echo json_encode($exception->getMessage());
    }
}

if($_POST['action'] == 'getAllTests'){
    try{
        echo json_encode($testController->getAllTests());
    }catch(Error $exception){
        echo json_encode($exception->getMessage());
    }
}

if($_POST['action'] == 'deleteTest'){
    try{
        $testController->deleteTest($_POST['id']);
    }catch(Error $exception){
        echo json_encode($exception->getMessage());
    }
}

if($_POST['action'] == 'deleteUser'){
    try{
        $userController->deleteUser($_POST['id']);
    }catch(Error $exception){
        echo json_encode($exception->getMessage());
    }
}

if($_POST['action'] == 'editUser'){
    $user = new User();
    $tmp = null;
    $email = null;
    $username = null;
    if($_POST['oldUsername'] != $_POST['username'] && $_POST['oldEmail'] != $_POST['email']){
        $tmp = $userController->checkIfUsernameOrEmailExists($_POST['username'], $_POST['email']);
        if($tmp == 'username and email exists'){
            echo json_encode('username and email exists');
        }
        else if($tmp == 'username exists'){
            echo json_encode('username exists');
        }
        else if($tmp == 'email exists'){
            echo json_encode('email exists');
        }
        else{
            $tmp = false;
        }
    }
    else if($_POST['oldUsername'] != $_POST['username'] && $_POST['oldEmail'] == $_POST['email']){
        $username = $userController->checkUsername($_POST['username'], $_POST['id']);
        if($username){
            echo json_encode("username exists");
        }
    }
    else if($_POST['oldUsername'] == $_POST['username'] && $_POST['oldEmail'] != $_POST['email']){
        $email = $userController->checkEmail($_POST['email'], $_POST['id']);
        if($email){
            echo json_encode("email exists");
        }
    }
    if(!$username && !$email && !$tmp){
        $user->setId($_POST['id']);
        $user->setFirstname($_POST['firstname']);
        $user->setLastname($_POST['lastname']);
        $user->setUsername($_POST['username']);
        $user->setEmail($_POST['email']);
        $user->setPassword($_POST['password']);
        $user->setRole($_POST['role']);
        try{
            $userController->editUser($user);
            echo json_encode('Success');
        }catch(PDOException $exception){
            echo json_encode($exception->getMessage());
        }
    }
}

if($_POST['action'] == 'save-testresult'){
    try{
        $testController->saveTestResult($_POST['username'], $_POST['course'], $_POST['testtitle'], $_POST['points']);
    }
    catch(PDOException $exception){
        echo json_encode($exception->getMessage());
    }
}

if($_POST['action'] == 'get-testResultsByUsername' ||
    $_POST['action'] == 'get-testResults' ||
    $_POST['action'] == 'get-testResults-teacher'
){
    if($_POST['action'] == 'get-testResultsByUsername'){ // for student
        try{
            echo json_encode($testController->getResultsByUsernameOrAllResults($_POST['username']));
        }
        catch(Error $exception){
            echo json_encode($exception->getMessage());
        }
    }
    if($_POST['action'] == 'get-testResults-teacher'){ // for teacher
        try{
            echo json_encode($testController->getTestResultsForTeacher($_POST['username']));
        }
        catch(Error $exception){
            echo json_encode($exception->getMessage());
        }
    }
    if($_POST['action'] == 'get-testResults'){ //all results for admin
        try{
            echo json_encode($testController->getResultsByUsernameOrAllResults(''));
        }
        catch(Error $exception){
            echo json_encode($exception->getMessage());
        }
    }

}

if($_POST['action'] == 'createCourse'){
    /*$titleExists = null;

    $titleExists = $testController->checkTestTitleExistsForCourse($_POST['title'], $_POST['course']);
    if ($titleExists) {
        echo json_encode('Title exists for this course');
    } else {
        try {
            $testController->addNewTestOrEdit($_POST, 'create');
            echo json_encode("Test was Successfully uploaded to Database!");
        } catch (PDOException $exception) {
            echo json_encode($exception->getMessage());
        }
    }*/

    try {
        $course = new Course();
        $course->setTitle($_POST['title']);
        $course->setUsername($_POST['username']);
        $id = $courseController->createOrUpdateCourse($course);

        $contentController = new ContentController();

        for ($i = 1; $i <= 1000; $i++) {
            if (isset($_POST["text" . $i])) {
                $content = new Content();
                $content->setCourseId($id);
                $content->setText($_POST["text" . $i]);
                $content->setType("text");
                $contentController->createOrUpdateContent($content);
            } elseif (isset($_POST["image" . $i])) {
                $content = new Content();
                $content->setCourseId($id);
                $content->setText($_POST["image" . $i]);
                $content->setType("image");
                $contentController->createOrUpdateContent($content);
            } else {
                break;
            }
        }

        echo json_encode("Course was Successfully uploaded to Database!");
    } catch (PDOException $exception) {
        echo json_encode($exception->getMessage());
    }
}

if($_POST['action'] == 'getAllCourses'){
    try{
        echo json_encode($courseController->getAllCourses());
    }catch(Error $exception){
        echo json_encode($exception->getMessage());
    }
}

if($_POST['action'] == 'getCompleteCourseById'){
    $contentController = new ContentController();
    try{
        $dbData = $contentController->getAllContentOfCourse($_POST['id']);
        echo json_encode($dbData);
    }catch(PDOException $exception){
        echo json_encode($exception->getMessage());
    }
}

if($_POST['action'] == 'editCourse'){

    try {
        $contentController = new ContentController();
        $contentController->deleteContentOfCourse($_POST["id"]);

        for ($i = 1; $i <= 1000; $i++) {
            if (isset($_POST["text" . $i])) {
                $content = new Content();
                $content->setCourseId($_POST["id"]);
                $content->setText($_POST["text" . $i]);
                $content->setType("text");
                $contentController->createOrUpdateContent($content);
            } elseif (isset($_POST["image" . $i])) {
                $content = new Content();
                $content->setCourseId($_POST["id"]);
                $content->setText($_POST["image" . $i]);
                $content->setType("image");
                $contentController->createOrUpdateContent($content);
            } else {
                break;
            }
        }

        echo json_encode("Course was Successfully uploaded to Database!");
    } catch (PDOException $exception) {
        echo json_encode($exception->getMessage());
    }
}

if($_POST['action'] == 'deleteCourse'){
    try{
        $courseController->deleteCourse($_POST['id']);
    }catch(Error $exception){
        echo json_encode($exception->getMessage());
    }
}
?>