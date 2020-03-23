/**********************************************************************************************************
 @Class Name               : NewDepartmentController.cls
 @Description              : Used in NewDepartment Visualforce page as controller to override the New functionality
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
public class NewDepartmentController {
    public Department__c dep { get; set; }
    
    public NewDepartmentController(ApexPages.StandardController controller) {
        dep = new Department__c();
    }

    /*********************************************************************************
    Method Name    : saveDepartment
    Author         : Stefan Stancioiu, March 22th ,2020
    Description    : used to Save the Department record and redirect to it
    Return Type    :
    Parameter      :
    *********************************************************************************/
    public pagereference saveDepartment() {
        insert dep;
        return new pagereference('/' + dep.Id);
    }
}