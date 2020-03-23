/**********************************************************************************************************
 @Class Name               : EmployeeController.cls
 @Description              : Apex Controller to get Employee details in order to create the PDF file and attaching to it
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

public with sharing class EmployeeController {

    public Employee__c emp { get; set; } 

    //constructor
	public EmployeeController() {
    	emp = [SELECT Id, Name, Department__c, Email__c, Address__c, Gender__c, Phone__c, Date_of_Birth__c, Department__r.Name
               FROM Employee__c 
               LIMIT 1];
    }
}