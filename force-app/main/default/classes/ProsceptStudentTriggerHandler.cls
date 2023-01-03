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
        
        List<Student__c> studentList = new List<Student__c>();
        for(Prospect_Student__c pros : newList){
            
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
        
        Prospect_Student__c ps = newList.get(0);
        System.debug('student'+ps);
        
        StudentClass__c st = new StudentClass__c();
        
        Class__c cls = [SELECT Id FROM Class__c WHERE Year__c =:ps.Joining_Year__c AND Class__c =:ps.Class__c Limit 1];
        
        st.Class__c = cls.Id;
        st.Student__c = studentList.get(0).Id;
        
        insert st;  
        
    }
}