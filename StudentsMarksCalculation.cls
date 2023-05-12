public with sharing class StudentsMarksCalculation {
    
    public static List<studentInfo> calculateGradeOfStudent(List<studentInfo> studentList,List<grades> gradeList) {
        
        
        Map<String,List<marks>> rollNoWithMark = new Map<String,List<marks>>();
        
        for(studentInfo stu :studentList){
            rollNoWithMark.put(stu.rollNo, stu.markList);
        }
        
        for(studentInfo stu :studentList){
            List<marks> markList = rollNoWithMark.get(stu.rollNo);
            for(Integer i=0; i<markList.size(); i++){
                for(Integer j =0;j <gradeList.size();j++){
                    if(markList[i].mark >= gradeList[j].minMark && markList[i].mark <= gradeList[j].maxMark){
                        markList[i].grade = gradeList[j].grade;
                    }
                }
            }
        }
        
        for (studentInfo stu : studentList) {
            List<marks> markList = rollNoWithMark.get(stu.rollNo);
            Integer totalMarks = 0;
            Decimal percentage;
            
            for (marks mar : markList) {
                totalMarks = totalMarks + mar.mark;
                
            }
            stu.totalMark = totalMarks;
            percentage = totalMarks/markList.size();
            stu.percentage = percentage;
        }
        
        for(studentInfo stu :studentList){
            for(Integer i =0; i<gradeList.size();i++){
                if(stu.percentage >= gradeList[i].minMark && stu.percentage <= gradeList[i].maxMark){
                    stu.overallrank = gradeList[i].grade;
                }
            }
        }
        
        return studentList;
        
    }    
    public class studentInfo{
        public String name{get;set;}
        public String dob{get;set;}
        public String rollNo{get;set;}
        public list<marks> markList{get;set;}
        public Integer totalMark{get;set;}
        public Decimal percentage{get;set;}
        public String overallrank{get;set;}
        
        
    }
    public class marks{
        public Integer mark{get;set;}
        public String subject{get;set;}
        public String grade{get;set;}
    }
    
    public class grades{
        public Integer minMark{get;set;}
        public Integer maxMark{get;set;}
        public String grade{get;set;}
    }
    
}