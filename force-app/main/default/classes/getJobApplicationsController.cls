public with sharing class getJobApplicationsController {
    @AuraEnabled
    public static List<Job_Application__c> getJobApplications(Id candidateId){
        return [SELECT Position__r.Name, Link_to_application__c, Rating_Sum__c FROM Job_Application__c WHERE Candidate__c = :candidateId];
    }
}