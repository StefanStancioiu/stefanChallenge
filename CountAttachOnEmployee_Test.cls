/**********************************************************************************************************
 @Class Name               : CountAttachOnEmployee_Test.cls
 @Description              : Test class for CountAttachOnEmployee.cls
 @Author                   : Stefan Stancioiu 
 @Group                    :
 @Last Modified By         : Stefan Stancioiu 
 @Last Modified On         : 21/03/2020, 10:00:00 AM
 @Modification Log         : 21/03/2020, 10:00:00 AM
 ==========================================================================================
 Ver           Date              Author                               Modification
 ==========================================================================================
 1.0           21/03/2020        Stefan Stancioiu                     Initial Version
**********************************************************************************************************/
@isTest
private class CountAttachOnEmployee_Test {
    
    private static Employee__c emp;
    private static Department__c dep;
    private static Attachment attach;
    private static User objUser;
    
    /*********************************************************************************
    Method Name    : setupTestData
    Author         : Stefan Stancioiu, March 21th ,2020
    Description    : Method for setting up test data
    Return Type    :
    Parameter      :
    *********************************************************************************/
    @TestSetup
    static void setupTestData() {
        
        dep = UnitTestHelperDepartment.createDepartment();
        Database.insert(dep, false);
        
        emp = UnitTestHelperEmployee.createEmployee(dep.Id);
        Database.insert(emp, false);
        
        attach = UnitTestHelperAttachment.createAttachment(emp.Id);
        Database.insert(attach, false);
        
        objUser = UnitTestHelperUser.createUser(Label.System_Administrator_Profile, 'user@test1.com', 'test1');
        Database.insert(objUser, false);
        
    }
    
    /*********************************************************************************
    Method Name    : itShouldTestTrigger
    Author         : Stefan Stancioiu, March 21th ,2020
    Description    : test CountAttachOnEmployee
    Return Type    :
    Parameter      :
   *********************************************************************************/
    @IsTest
    static void itShouldInsertRecords() {
        User u = [SELECT Id FROM User LIMIT 1];
        System.assertNotEquals(u, null);
        
        System.runAs(u) {

            Test.startTest();
                dep = [SELECT Id FROM Department__c LIMIT 1];
                System.assertNotEquals(dep, null);
            
                emp = [SELECT Id FROM Employee__c LIMIT 1];
                System.assertNotEquals(emp, null);
            
                attach = [SELECT Id FROM Attachment LIMIT 1];
                System.assertNotEquals(attach, null);
            
            Test.stopTest();
        }
    }
}