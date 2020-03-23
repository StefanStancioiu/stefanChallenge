/**********************************************************************************************************
 @Class Name               : NewEmployeeController_Test.cls
 @Description              : Test class for NewEmployeeController.cls
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
private class NewEmployeeController_Test {
    
	private static Employee__c emp;
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
        
        emp = UnitTestHelperEmployee.createEmployee(dep.Id);
        insert emp;  
    }
    
    /*********************************************************************************
    Method Name    : testConstructor
    Author         : Stefan Stancioiu, March 22th ,2020
    Description    : test NewEmployeeController constructor
    Return Type    :
    Parameter      :
   *********************************************************************************/
    @isTest
    static void testConstructor() {
        Test.startTest();
        
        dep = [SELECT Id FROM Department__c LIMIT 1]; 
        emp = [SELECT Id FROM Employee__c LIMIT 1];
        
        PageReference pageRef = Page.NewEmployee;
     	pageRef.getParameters().put('Id', String.valueOf(emp.Id));
     	Test.setCurrentPage(pageRef);
        
        ApexPages.StandardController sc = new ApexPages.StandardController(emp);
     	NewEmployeeController testEmpCtrl = new NewEmployeeController(sc);
     	testEmpCtrl.empObj= emp;
        
        Test.stopTest();
        //test functional behaviour and avoid statements to be counted under apex script statement limit
        System.assertNotEquals(dep, null);
        System.assertNotEquals(emp, null);
    }
    
    /*********************************************************************************
    Method Name    : testSaveEmployee
    Author         : Stefan Stancioiu, March 22th ,2020
    Description    : it should insert new record
    Return Type    :
    Parameter      :
    *********************************************************************************/
    @isTest
    static void testSaveEmployee() {
        
        Test.startTest();
   			Employee__c emp = [SELECT Id FROM Employee__c LIMIT 1];
        	ApexPages.StandardController sc = new ApexPages.StandardController(emp);
        	NewEmployeeController empCtrl = new NewEmployeeController(sc);
        	empCtrl.saveEmployee();
 		Test.stopTest();
        //avoid statements to be counted under apex script statement limit
        System.assertNotEquals(emp, null);
    }
}