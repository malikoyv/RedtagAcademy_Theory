@isTest
private class RTA_TestJobApplicationHiredTrigger {

    @isTest
    static void changePositionStatus() {
        Position__c position = new Position__c(Name = 'Developer', Status__c = 'Opened');
        insert position;
        Job_Application__c jobApp = new Job_Application__c(Position__c = position.Id, Applying_Date__c = Date.today());
        insert jobApp;
        jobApp.Status__c = 'Hired';

        Test.startTest();
        update jobApp;
        Test.stopTest();

        Job_Application__c updatedJobApp =  [SELECT Status__c FROM Job_Application__c WHERE Id = :jobApp.Id];
        Position__c updatedPosition = [SELECT Status__c FROM Position__c WHERE Id = :position.Id];
        System.assertEquals('Closed - Filled', updatedPosition.Status__c);
        System.assertEquals('Hired', updatedJobApp.Status__c);
    }
}