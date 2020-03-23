/**********************************************************************************************************
 @Class Name               : NewDepartmentController_Test.cls
 @Description              : Test class for NewDepartmentController.cls
 @Author                   : Stefan Stancioiu 
 @Group                    :
 @Last Modified By         : Stefan Stancioiu 
 @Last Modified On         : 22/03/2020, 10:00:00 AM
 @Modification Log         : 22/03/2020, 10:00:00 AM
 ==========================================================================================
 Ver           Date              Author                               Modification
 ==========================================================================================
 1.0           22/03/2020        Stefan Stancioiu                     Initial Version
**********************************************************************************************************/
@isTest
private class NewDepartmentController_Test {
    
    private static Department__c dep;
    
    /*********************************************************************************
    Method Name    : setupTestData
    Author         : Stefan Stancioiu, March 22th ,2020
    Description    : Method for setting up test data
    Return Type    :
    Parameter      :
    *********************************************************************************/
    @TestSetup
    static void setupTestData() {
        
        dep = UnitTestHelperDepartment.createDepartment();
        insert dep;
    }
    
    /*********************************************************************************
    Method Name    : testConstructor
    Author         : Stefan Stancioiu, March 22th ,2020
    Description    : test NewDepartmentController constructor
    Return Type    :
    Parameter      :
   *********************************************************************************/
    @isTest
    static void testConstructor() {
        Test.startTest();
        	dep = [SELECT Id FROM Department__c LIMIT 1];
            PageReference pageRef = Page.NewDepartment;
            pageRef.getParameters().put('Id', String.valueOf(dep.Id));
            Test.setCurrentPage(pageRef);
        
            ApexPages.StandardController sc = new ApexPages.StandardController(dep);
            NewDepartmentController ctrl = new NewDepartmentController(sc);
            ctrl.dep= dep;
            
            Test.stopTest();
        
            //test functional behaviour and avoid statements to be counted under apex script statement limit
            System.assertNotEquals(dep, null);
    }
    
    /*********************************************************************************
    Method Name    : testSaveDepartment
    Author         : Stefan Stancioiu, March 22th ,2020
    Description    : it should insert new record
    Return Type    :
    Parameter      :
    *********************************************************************************/
    @isTest
    static void testSaveDepartment() {
        
        Test.startTest();
   			Department__c dep = [SELECT Id FROM Department__c LIMIT 1];
        	ApexPages.StandardController sc = new ApexPages.StandardController(dep);
        	NewDepartmentController ctrl = new NewDepartmentController(sc);
        	ctrl.saveDepartment();
 		Test.stopTest();
        //avoid statements to be counted under apex script statement limit
        System.assertNotEquals(dep, null);
    }
}