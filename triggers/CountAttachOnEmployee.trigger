
/**********************************************************************************************************
 @Class Name               : NewEmployeeController_Test.cls
 @Description              : Apex Trigger to count the Attachments on Employee and to delete the old one
 @Author                   : Stefan Stancioiu 
 @Group                    :
 @Last Modified By         : Stefan Stancioiu 
 @Last Modified On         : 21/03/2020, 10:00:00 AM
 @Modification Log         : 21/03/2020, 10:00:00 AM
 ==========================================================================================
 Ver           Date              Author                               Modification
 ==========================================================================================
 1.0           22/03/2020        Stefan Stancioiu                     Initial Version
**********************************************************************************************************/

trigger CountAttachOnEmployee on Attachment (before insert) {
    List<Id> empIds = new List<Id>();
    
    if (Trigger.IsInsert || Trigger.IsUpdate || Trigger.IsUnDelete) {
        
        //for the current Attachment take the parentId and add it to empIds set
        for (Attachment att : Trigger.New) {
            if (att.parentId != null && att.ParentId.getSObjectType() == Employee__c.getSObjectType()){
                empIds.add(att.parentId);
            }
        }
    }
    
    //final list of employees that will be updated
    List<Employee__c> empFinalListToUpdate = New List<Employee__c>();
    //list with Employee Id and number of related Attachments
    List<Employee__c> fetchingEachEmployee = [Select Id, Total_Attachments__c, (Select ParentId FROM Attachments) FROM Employee__c WHERE Id = :empIds];
    
    //for every Employee set the Total_Attachments__c field with the number of related Attachments 
    for(Employee__c everyEmp : fetchingEachEmployee) {
        everyEmp.Total_Attachments__c = everyEmp.Attachments.size();
        
        //if the Employee attachment exist, delete it
        if (everyEmp.Attachments.size() > 0) {
            List<Attachment> lstAtt = [SELECT Id FROM Attachment WHERE ParentId = :empIds];
            delete lstAtt;
        }
        
        empFinalListToUpdate.add(everyEmp);
    }
    //finally, update the Employee
    try{
        if (!empFinalListToUpdate.IsEmpty()) {
            update empFinalListToUpdate;
        }
    }
    catch(Exception e){
        System.debug('Thrown Error: ' + e.getMessage());
    }
}