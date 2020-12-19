<?php


class Report_json
{
    private $student;
    private $grades;

    private $average;

    public function __construct($student, $grades)
    {
        $this->student = $student;
        $this->grades = $grades;
    }

    private function average()
    {
        $this->average = array_sum($this->grades)/count($this->grades);

        return $this->average;
    }

    public function report()
    {
        $report = [
            'Student ID' => $this->student['student_id'],
            'Name' => $this->student['first_name'] . ' ' . $this->student['last_name'],
            'Grades' => $this->grades,
            'Average' => $this->average(),
            'Final result' => $this->average >= 7? 'PASS': 'FAIL'

        ];

        header("Content-type:application/json");
        print json_encode($report);
    }
}