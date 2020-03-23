/**********************************************************************************************************
 @Class Name               : AttachPDFToEmployee.cls
 @Description              : Visualforce page for creating a PDF file and attaching to Employee__c
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
public class AttachPDFToEmployee {
    
    public Employee__c emp { get; set; } //Employee__c object
	
	//Constructor
	public AttachPDFToEmployee(ApexPages.StandardController controller) {
		emp = (Employee__c)controller.getRecord(); //instantiate the Employee object for the current record
    }
	
	//method called from the Visualforce's action attribute
	public PageReference attachPDF() {

        // if there are attachments related to this record, delete the old ones
        /*List<Attachment> lstAttachment = [SELECT Id FROM Attachment WHERE parentId =: emp.Id];
        if(lstAttachment.size() > 0) {
            delete lstAttachment;
        } */
		
		//generate and attach the PDF document
		PageReference pdfPage = Page.GeneratePDF; //create a page reference to our pdfDemo Visualforce page
		Blob pdfBlob; //the contents of the attachment from the pdf

		if (!Test.isRunningTest()) { //if we are not in testing context
			pdfBlob = pdfPage.getContent(); //returns the output of the page as a PDF
            
		} else { //otherwise, we are in testing context and getContent() gets funky so create the blob manually
			pdfBlob = Blob.valueOf('Sample Text...');
		}
        
        // create the new attachment and attach the pdf to the Employee
		Attachment attach = new Attachment(parentId = emp.Id, Name = 'EmployeeDetails.pdf', body = pdfBlob, IsPrivate = false);
        insert attach; //insert the attachment
		
		//redirect the user. I want to redirect the User back to the Employee detail page
		PageReference pageWhereWeWantToGo = new ApexPages.StandardController(emp).view();
		pageWhereWeWantToGo.setRedirect(true); //indicate that the redirect should be performed on the client side
		return pageWhereWeWantToGo; //send the User on their way
	}

}