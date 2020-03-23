/*********************************************************************************************************
@Class Name               : UnitTestHelperUser.cls
@Description              : Test Util methods for User
@Author                   : Stefan Stancioiu 
@Group                    :
@Last Modified By         : Stefan Stancioiu
@Last Modified On         : 21/03/2020
@Modification Log :       :
==========================================================================================
Ver           Date              Author                               Modification
==========================================================================================
1.0           21/03/2020        Stefan Stancioiu                     Initial Version
**********************************************************************************************************/
@isTest(SeeAllData=true)
public class UnitTestHelperUser {
    
    /*********************************************************************************
      Method Name    : createUser
      Author         : Stefan Stancioiu ,March 21th,2020
      Description    : method to create User
      Return Type    : User
      Parameter      : String sProfileName, String sUserName, String sAlias
      *********************************************************************************/
    public static User createUser(String sProfileName, String sUserName, String sAlias) {
        Profile p = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
        User objUser = new User();
        if (p != null) {
            objUser = new User(Alias = sAlias, email = sUserName, emailencodingkey = 'UTF-8', lastname = 'Testing', languagelocalekey = 'en_US',
                    localesidkey = 'en_US', country = 'United States', profileid = p.Id,
                    timezonesidkey = 'America/Los_Angeles', username = sUserName, UserPermissionsKnowledgeUser = true);
        }
        return objUser;
    }
}