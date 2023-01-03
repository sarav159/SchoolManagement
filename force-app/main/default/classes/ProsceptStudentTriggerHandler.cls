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
}