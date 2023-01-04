public class ProsceptStudentTriggerHandler {
    
    public static void onAfterInsert(List<Prospect_Student__c> newList){
        
        for (Prospect_Student__c stud : newList) {  
            
            Approval.ProcessSubmitRequest approvalRequest = new Approval.ProcessSubmitRequest();
            approvalRequest.setComments('Offer Submitted for approval');
            approvalRequest.setObjectId(stud.Id);
            Approval.ProcessResult approvalResult = Approval.process(approvalRequest);
            System.debug('offer submitted for approval successfully: '+approvalResult .isSuccess());
        }
    }
    public static void onAfterUpdate(List<Prospect_Student__c> newList,Map<Id,Prospect_Student__c> oldMap){
        
        set<String> yearSet = new Set<String>();
        set<String> classSet = new Set<String>();
        
        List<Student__c> studentList = new List<Student__c>();
        for(Prospect_Student__c pros : newList){
            yearSet.add(pros.Joining_Year__c);
            classSet.add(pros.Class__c);
            
            Prospect_Student__c oldVal = oldMap.get(pros.Id); 
            if(pros.Status__c != oldVal.Status__c && pros.Status__c == 'Approved'){
                Student__c st = new Student__c();
                st.Name = pros.Name;
                st.DOB__c = pros.DOB__c;
                st.Gender__c = pros.Gender__c;
                
                studentList.add(st);
            }
        }
        insert  studentList;
        Map<String, Student__c> studentMap = new  Map<String, Student__c>();
        
        for(Student__c stu : studentList){
            studentMap.put(stu.Name,stu);
        }
        
        Map<String, Class__c> classMap = new  Map<String, Class__c>();
        Map<String, Class__c> yearMap = new  Map<String, Class__c>();
        
        List<Class__c> classList = [SELECT ID, Name, Class__c,Year__c FROM Class__c WHERE Class__c IN :classSet AND Year__c IN :yearSet ];
        for(Class__c cls :classList){
            classMap.put(cls.Class__c,cls);
            yearMap.put(cls.Year__c,cls);
        }
        List<StudentClass__c> studentClassList = new List<StudentClass__c>();
        
        if(!classMap.isEmpty() && !yearMap.isEmpty() && !studentList.isEmpty()){
            for(Prospect_Student__c pro : newList){
                
                StudentClass__c st = new StudentClass__c();
                if(classMap.containsKey(pro.Class__c) && yearMap.containsKey(pro.Joining_Year__c)){
                    st.Class__c = classMap.get(pro.Class__c).Id;
                    st.Student__c = studentMap.get(pro.Name).Id;
                    studentClassList.add(st);
                }
            }
            
        }
        insert studentClassList;
        /*Prospect_Student__c ps = newList.get(0);
System.debug('student'+ps);

StudentClass__c st = new StudentClass__c();

Class__c cls = [SELECT Id FROM Class__c WHERE Year__c =:ps.Joining_Year__c AND Class__c =:ps.Class__c Limit 1];

st.Class__c = cls.Id;
st.Student__c = studentList.get(0).Id;

insert st;  */
        
    }
}