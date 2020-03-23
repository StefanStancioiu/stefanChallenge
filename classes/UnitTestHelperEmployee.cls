/**********************************************************************************************************
 @Class Name               : UnitTestHelperEmployee.cls
 @Description              : Test Util methods for Employee
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
@isTest(SeeAllData=true)
public  with sharing class UnitTestHelperEmployee {
    
    /*********************************************************************************
      Method Name    : createEmployee
      Author         : Stefan Stancioiu, March 21rd 2020
      Description    : method to create Employee record
      Return Type    : Employee__C
      Parameter      :
      *********************************************************************************/
    public static Employee__C createEmployee(Id departmentId) {
        Employee__C emp = new Employee__C();
        emp.Department__c = departmentId;
        emp.Address__c = 'Test Address';
        emp.Email__c = 'test.email@test.com';
        emp.Gender__c = 'Male';
        return emp;
    }
}