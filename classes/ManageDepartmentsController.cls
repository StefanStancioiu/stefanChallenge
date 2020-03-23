/**********************************************************************************************************
 @Class Name               : ManageDepartmentsController.cls
 @Description              : Apex class used as controller for getting Departments in Visualforce page
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

public class ManageDepartmentsController {

	// used to pass the list with Departments records
    public List<Department__c> departments { get; set; }
  
    // used to get a hold of the department record selected for deletion
    public string selectedDepId { get; set; }
  
   	public ManageDepartmentsController() {
        // load records into the DataTable
        loadData();
   	}
  
    private void loadData() {
        departments = [SELECT Id, Name, Location__c, Admin_R_Dept__c, Manager_No__c FROM Department__c LIMIT 100];
    }
    
    public void editDepartment() {
        // if for any reason we are missing the reference 
    	if (selectedDepId == null) {
            return;
      	}
        // find the department record within the collection
      	Department__c toBeEdited = null;
        for(Department__c d : departments) {
            if(d.Id == selectedDepId) {
          		toBeEdited = d;
          		break;
            }
        }
        // if department record found delete it
        if (toBeEdited != null) {
            update toBeEdited;
        }
        loadData();
    }
  
    public void deleteDepartment() {
       
        // if for any reason we are missing the reference 
    	if (selectedDepId == null) {
            return;
      	}
     
      	// find the department record within the collection
      	Department__c tobeDeleted = null;
      	for(Department__c d : departments)
       		if (d.Id == selectedDepId) {
          		tobeDeleted = d;
          		break;
       	}
      
      	// if department record found delete it
      	if (tobeDeleted != null) {
       		delete tobeDeleted;
      	}
     
      	// refresh the list with data
      	loadData();
   	}    
}