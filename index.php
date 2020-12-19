<?php
define('CLASS_DIR', 'class/');
set_include_path(get_include_path().PATH_SEPARATOR.CLASS_DIR);
spl_autoload_register();

$student = 0;
if ($_GET) {
    if (isset($_GET['student']) && !empty($_GET['student'])) {
        $student_id = $_GET['student'];

        $db = new Database();
        $db->query('SELECT s.student_id, s.first_name, s.last_name, b.name AS board FROM student AS s INNER JOIN board AS B ON s.board = b.board_id WHERE s.student_id=:student_id');
        $db->bind(':student_id', $student_id);

        $student = $db->single();
        if ($student) {
            $db->query('SELECT grade FROM grade WHERE student=:student_id');
            $db->bind(':student_id', $student_id);
            $grades = $db->resultset();
            $grades = array_column($grades,'grade');

            if ($student['board'] === 'CSM') {
                $r = new Report_json($student, $grades);
                $r->report();
            } else {
                $r = new Report_xml($student, $grades);
                $r->report();
            }
        }
    } else {
        echo 'Please provide valid Student ID.';
    }
}
