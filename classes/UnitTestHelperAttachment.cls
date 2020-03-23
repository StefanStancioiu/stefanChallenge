/**********************************************************************************************************
 @Class Name               : UnitTestHelperAttachment.cls
 @Description              : Test Util methods for Attachment
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
public with sharing class UnitTestHelperAttachment {
    
    /*********************************************************************************
      Method Name    : createAttachment
      Author         : Stefan Stancioiu, March 21rd 2020
      Description    : method to create Attachment record
      Return Type    : Attachment
      Parameter      :
      *********************************************************************************/
    public static Attachment createAttachment(Id parentId) {
        Attachment attach = new Attachment();
        attach.Name='Unit Test Attachment';
        Blob bodyBlob = Blob.valueOf('Unit Test Attachment Body');
        attach.body = bodyBlob;
        attach.ParentId = parentId;
        return attach;
    }

}