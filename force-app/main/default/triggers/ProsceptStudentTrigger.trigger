trigger ProsceptStudentTrigger on Prospect_Student__c (after insert,after Update)  {

    if(Trigger.isAfter && Trigger.IsInsert){
    ProsceptStudentTriggerHandler.onAfterInsert(Trigger.new);
    }
    
    if(Trigger.isAfter && Trigger.IsUpdate){
    ProsceptStudentTriggerHandler.onAfterUpdate(Trigger.new);
    }
    
}