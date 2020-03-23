/**********************************************************************************************************
 @Class Name               : NewEmployeeController.cls
 @Description              : Used in NewEmployee Visualforce page as controller to override the New functionality
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
public class NewEmployeeController {
    
    public Employee__c empObj { get; set; }
    
    //constructor
    public NewEmployeeController(ApexPages.StandardController controller) {
        empObj = new Employee__c();
    }
    
    /*********************************************************************************
    Method Name    : saveEmployee
    Author         : Stefan Stancioiu, March 22th ,2020
    Description    : used to Save the employee record and redirect to it
    Return Type    :
    Parameter      :
    *********************************************************************************/
    
    public PageReference saveEmployee() {
        insert empObj;
        return new pagereference('/' + empObj.Id);
    }
    
}