/**********************************************************************************************************
 @Class Name               : AccountMultipleSearchWithPaginationCtrl.cls
 @Description              : Apex class used as controller for filtering Acounts
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
public with sharing class AccountMultipleSearchWithPaginationCtrl {
    
    public Account acc { get; set; }
	public List<Account> accountList {get;set;}
    
	// create a list of strings to hold the conditions
	List<String> conditions = new List<String>();
	private integer totalRecs = 0;
	private integer OffsetSize = 0;
	private integer LimitSize= 10; //limit of records to be displayed in the table

	//controller
	public AccountMultipleSearchWithPaginationCtrl() {
        acc = new Account();
	}

	public void searchAcc() {
		totalRecs = 0;
		OffsetSize = 0;
		if (accountList !=null && accountList.size() > 0) {
 			accountList=null;
		}
		searchAccounts();
		conditions.clear();
	}

	/*********************************************************************************
    Methods Name   : searchAccounts
    Author         : Stefan Stancioiu, March 21th ,2020
    Description    : methods used to get the Accounts details and display them in Visualforce page
    Return Type    :
    Parameter      :
    *********************************************************************************/
	public Void searchAccounts() {
		if (accountList != null && !accountList.isEmpty()) {
  			accountList.clear();
		}
 		String strQuery ='SELECT Id, Name, BillingCity, BillingCountry, BillingState  from Account';
 		if (acc.BillingCity != null) {
            String bCity = acc.BillingCity+'';
   			conditions.add('BillingCity Like \'%' +acc.BillingCity +'%\' ');
 		}

		if (acc.BillingCountry != null) {
 			String bCountry = acc.BillingCountry+'';
   			conditions.add('BillingCountry Like \'%' +acc.BillingCountry +'%\' ');
 		}

 		if (acc.Name !=null && acc.Name !='') {
   			conditions.add('Name Like \'%' +acc.Name +'%\' ');
 		}
        
  		if (acc.BillingState != null && acc.BillingState  != ''){
   			conditions.add('BillingState  Like\'%' +acc.BillingState  +'%\' ');
 		}

  		if (conditions.size() > 0) {
   			strQuery += '  WHERE ' + conditions[0];
   			for (Integer i = 1; i < conditions.size(); i++)
            strQuery += '  AND ' + conditions[i];
  		}
        
 		if (totalRecs !=null && totalRecs == 0) {
    		List<Account> accTemp = Database.query(strQuery);
        	totalRecs = (accTemp !=null && accTemp.size() > 0)?accTemp.size():0;
 		}

 		// add sort and limits at the end  
  		strQuery += ' ORDER BY Name ASC LIMIT :LimitSize OFFSET :OffsetSize';
        accountList = Database.query(strQuery);
    }
	/*********************************************************************************
    Methods Name   : FirstPage, previous, next, LastPage, getprev, getnxt
    Author         : Stefan Stancioiu, March 21th ,2020
    Description    : methods used to controll the list of records in Visualforce page
    Return Type    :
    Parameter      :
    *********************************************************************************/
	public void FirstPage() {
		OffsetSize = 0;
		searchAccounts();
	}
	public void previous() {
		OffsetSize = (OffsetSize-LimitSize);
		searchAccounts();
	}
	public void next() {
		OffsetSize = OffsetSize + LimitSize;
		searchAccounts();
	}
	public void LastPage() {
		OffsetSize = totalrecs - math.mod(totalRecs,LimitSize);
		searchAccounts();
	}
	public boolean getprev() {
        if (OffsetSize == 0) {
            return true;
        } else { 
            return false; 
        }		
    }
	public boolean getnxt() {
		if ((OffsetSize + LimitSize) > totalRecs) {
            return true;
        } else { 
            return false; 
        }
	}
}