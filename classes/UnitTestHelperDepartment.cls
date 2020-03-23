/**********************************************************************************************************
 @Class Name               : UnitTestHelperDepartment.cls
 @Description              : Test Util methods for Department
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
public with sharing class UnitTestHelperDepartment {
    
    /*********************************************************************************
      Method Name    : createDepartment
      Author         : Stefan Stancioiu, March 21rd 2020
      Description    : method to create Department__c record
      Return Type    : Department__c
      Parameter      :
      *********************************************************************************/
    public static Department__c createDepartment() {
        Department__c dep = new Department__c();
        dep.Name = 'Test Department';
        dep.Admin_R_Dept__c = '01';
        dep.Location__c = 'Location 1';
        dep.Manager_No__c = '02';
        return dep;
    }
}