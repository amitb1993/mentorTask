public with sharing class caseWebPageClass {
@AuraEnabled
public static Boolean CSlistView (String accFNames, String accLNames,String accEmails,string accPhones,String accdecrips ){ 

list<Case> CsList = new List<Case>(); 
list<Account> AList = new list<Account>();  
list<Account> Acclist=[Select Id,Name,Phone from Account];

Map<String,Id> nameMap = new Map<String,String>();
for(Account A : Acclist){
    nameMap.put(A.Name,A.Id);
}
string AccName = accFNames+accLNames   ;
if(nameMap.containsKey(AccName)){
        System.debug(' if Account name'+AccName);
    
        Case C = new Case (Origin = 'Phone',Status = 'New',Account__c= AccName,Subject  =   accdecrips
        );
        if(CsList.size()==0){
            CsList.add(C);
        }
    }
    else if(!nameMap.containsKey(AccName)){
    System.debug(' else if Account name'+AccName);
        Account Ac = new Account();
        Ac.Name = AccName;
        Ac.Phone = accPhones;
        Ac.Email__c = accEmails;

        if(AList.size()==0){
            AList.add(Ac);
            }
            Case C = new Case (Origin = 'Phone',Status = 'New',Account__c= AccName,Subject  =   accdecrips
            );
            if(CsList.size()==0){
            CsList.add(C);
            }
       
    }
     if(!CsList.isEmpty()&&!AList.isEmpty()){
    insert CsList;
    insert AList;
    return true;
}

else if(!CsList.isEmpty()){
    insert CsList;
    return true;
}
else{
    return false;
}
   

}
}