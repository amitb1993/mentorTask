public without sharing class mySwiggyclass {

    @AuraEnabled(cacheable=true)
    
    public static list<Swiggy__c> getSwiggy(String foodName) {
    
        string keyString = '%' +foodName+ '%';
    
        return [select Id, Name From Swiggy__c where Name like:keyString];
    
     }
    
    }