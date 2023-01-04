@isTest
public class ProspectStudentTriggerHandlerTest {

    @isTest
    public static void createStudentAndStudentClass() {
        
        List<Prospect_Student__c> prosList = new List<Prospect_Student__c>();
          
        for(Integer i=0;i<5;i++){
           Prospect_Student__c ps = new Prospect_Student__c();
            ps.Name = 'Raja';
            ps.Gender__c = 'Male';
            ps.Class__c = 'V';
            ps.Status__c = 'New';
            ps.Joining_Year__c = '2016';
            prosList.add(ps);
        }
        
        
        insert prosList;
        
        Class__c cls = new Class__c();
        cls.Class__c = 'V';
        cls.Year__c = '2016';
        
        insert cls;
        
        for(Prospect_Student__c ps : prosList) {
            ps.Status__c = 'Approved';
        }
        
        Test.startTest();
        update prosList;
        Test.stopTest();
        
        
        List<Student__c> studentList = [SELECT ID, Name FROM Student__c];
        System.assertEquals(5, studentList.size());
        
        List<StudentClass__c> studentClassList = [SELECT ID, Name FROM StudentClass__c];
        System.assertEquals(5, studentClassList.size());
        
    }
}