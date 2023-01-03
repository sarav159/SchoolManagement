trigger ProsceptStudentTrigger on Prospect_Student__c (after insert)  {

    ProsceptStudentTriggerHandler.onAfterInsert(Trigger.new);
}