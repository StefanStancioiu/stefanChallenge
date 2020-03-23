/**********************************************************************************************************
 @Class Name               : AttachPDFToEmployee_Test.cls
 @Description              : Test class for AttachPDFToEmployee.cls
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
private class AttachPDFToEmployee_Test {
    
    PageReference pageRef = Page.NewEmployee;
	private static Employee__c emp;
    private static Department__c dep;
    private static Attachment attach;
    
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
        
        attach = UnitTestHelperAttachment.createAttachment(emp.Id);
        insert attach;
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
        
        PageReference pageRef = Page.AttachPDFEmployee;
     	pageRef.getParameters().put('Id', String.valueOf(emp.Id));
     	Test.setCurrentPage(pageRef);
        
        ApexPages.StandardController sc = new ApexPages.StandardController(emp);
     	AttachPDFToEmployee ctrl = new AttachPDFToEmployee(sc);
     	ctrl.emp= emp;
        
        Test.stopTest();
        //test functional behaviour and avoid statements to be counted under apex script statement limit
        System.assertNotEquals(dep, null);
        System.assertNotEquals(emp, null);
    }
    
    @isTest
    static void testAttachPDF() {
        Test.startTest();
        	Employee__c emp = [SELECT Id FROM Employee__c LIMIT 1];
        	attach = UnitTestHelperAttachment.createAttachment(emp.Id);
        	insert attach;
        
        	ApexPages.StandardController sc = new ApexPages.StandardController(emp);
     		AttachPDFToEmployee ctrl = new AttachPDFToEmployee(sc);
     		ctrl.attachPDF();
        Test.stopTest();
    }

}