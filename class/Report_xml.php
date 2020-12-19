<?php


class Report_xml
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
        $min = min($this->grades);
        $max = max($this->grades);
        unset ($this->grades[array_search($min, $this->grades)]);
        $report = [
            'studentID' => $this->student['student_id'],
            'name' => $this->student['first_name'] . ' ' . $this->student['last_name'],
            'grades' => $this->grades,
            'average' => $this->average(),
            'finalResult' => $max > 8? 'PASS': 'FAIL'

        ];

        //Header('Content-type: text/xml');
        print $this->array2xml($report);
    }

    private function array2xml($data, $root = null){
        $xml = new SimpleXMLElement($root ? '<' . $root . '/>' : '<root/>');
        array_walk_recursive($data, function($value, $key)use($xml){
            $xml->addChild($key, $value);
        });
        return $xml->asXML();
    }
}