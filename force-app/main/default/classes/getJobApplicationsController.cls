public with sharing class getJobApplicationsController {
    @AuraEnabled
    public static List<Job_Application__c> getJobApplications(Id recordId) {
        return [
            SELECT Name, Applying_date__c, Rating_Sum__c, Position__r.Name, Status__c
            FROM Job_Application__c
            WHERE Candidate__c = :recordId
        ];
    }
}
