public with sharing class ShowPositionHandler {
    @AuraEnabled(cacheable=true)
    public static List<sObject> getPositions(Id candidateId) {
        return [SELECT Position__r.Name, Position__r.Description__c, Position__r.Min_Salary__c 
                FROM Job_Application__c 
                WHERE Candidate__c = :candidateId];
    }
}