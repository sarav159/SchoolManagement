@isTest
public class StudentsMarksCalculationTest {


    @isTest  
    static void calculateGradeOfStudent(){
        
        List<StudentsMarksCalculation.studentInfo>  students = new List<StudentsMarksCalculation.studentInfo>();
        StudentsMarksCalculation.studentInfo student = new StudentsMarksCalculation.studentInfo();
        student.name = 'saravana';
        student.dob = '1998-30-06';
        student.rollNo = 'ST001';
        
        List<StudentsMarksCalculation.marks>  markList = new List<StudentsMarksCalculation.marks>();
        StudentsMarksCalculation.marks mark = new StudentsMarksCalculation.marks();
        mark.mark = 80;
        mark.subject = 'Tamil';
        markList.add(mark);
        
        StudentsMarksCalculation.marks mark1 = new StudentsMarksCalculation.marks();
        mark1.mark = 39;
        mark1.subject = 'English';
        markList.add(mark1);
        
        StudentsMarksCalculation.marks mark2 = new StudentsMarksCalculation.marks();
        mark2.mark = 56;
        mark2.subject = 'Maths';
        markList.add(mark2);
        
         StudentsMarksCalculation.marks mark3 = new StudentsMarksCalculation.marks();
        mark3.mark = 76;
        mark3.subject = 'Science';
        markList.add(mark3);
        
         StudentsMarksCalculation.marks mark4 = new StudentsMarksCalculation.marks();
        mark4.mark = 89;
        mark4.subject = 'Social';
        markList.add(mark4);
        
        
        student.markList = markList;
        students.add(student);
        
        StudentsMarksCalculation.studentInfo student1 = new StudentsMarksCalculation.studentInfo();
        student1.name = 'Gokul';
        student1.dob = '1998-30-06';
        student1.rollNo = 'ST002';
        
        List<StudentsMarksCalculation.marks>  marks = new List<StudentsMarksCalculation.marks>();
        StudentsMarksCalculation.marks mar = new StudentsMarksCalculation.marks();
        mar.mark = 80;
        mar.subject = 'Tamil';
        marks.add(mar);
        
        StudentsMarksCalculation.marks mar1 = new StudentsMarksCalculation.marks();
        mar1.mark = 80;
        mar1.subject = 'English';
        marks.add(mar1);
        
        StudentsMarksCalculation.marks mar2 = new StudentsMarksCalculation.marks();
        mar2.mark = 56;
        mar2.subject = 'Maths';
        marks.add(mar2);
        
         StudentsMarksCalculation.marks mar3 = new StudentsMarksCalculation.marks();
        mar3.mark = 76;
        mar3.subject = 'Science';
        marks.add(mar3);
        
         StudentsMarksCalculation.marks mar4 = new StudentsMarksCalculation.marks();
        mar4.mark = 34;
        mar4.subject = 'Social';
        marks.add(mar4);
        
        
        student1.markList = marks;
         students.add(student1);
        
        
        
        List<StudentsMarksCalculation.grades>  gradeList = new List<StudentsMarksCalculation.grades>();
        StudentsMarksCalculation.grades grade1 = new StudentsMarksCalculation.grades();
        grade1.maxMark = 100;
        grade1.minMark = 80;
        grade1.grade = 'distinction';
        gradeList.add(grade1);
        
        StudentsMarksCalculation.grades grade2 = new StudentsMarksCalculation.grades();
        grade2.maxMark = 79;
        grade2.minMark = 60;
        grade2.grade = 'First class';
        gradeList.add(grade2);
        
        StudentsMarksCalculation.grades grade3 = new StudentsMarksCalculation.grades();
        grade3.maxMark = 59;
        grade3.minMark = 50;
        grade3.grade = 'Second class';
        gradeList.add(grade3);
        
        StudentsMarksCalculation.grades grade4 = new StudentsMarksCalculation.grades();
        grade4.maxMark = 49;
        grade4.minMark = 40;
        grade4.grade = 'Third class';
        gradeList.add(grade4);
        
        StudentsMarksCalculation.grades grade5 = new StudentsMarksCalculation.grades();
        grade5.maxMark = 39;
        grade5.minMark = 0;
        grade5.grade = 'Fail';
        gradeList.add(grade5);
        
        Test.startTest();
        List<StudentsMarksCalculation.studentInfo> studentList = StudentsMarksCalculation.calculateGradeOfStudent(students, gradeList);
        Test.stopTest();
        System.debug('studentList:' +studentList);
        
        Assert.areEqual(2, studentList.size());
    }
    
}