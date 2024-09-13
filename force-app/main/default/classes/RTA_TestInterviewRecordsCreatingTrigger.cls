@isTest
private class RTA_TestInterviewRecordsCreatingTrigger {

    @isTest
    static void createInterviewRecords() {
        Position__c position = new Position__c(Name = 'Developer', Status__c = 'Opened');
        insert position;
        Job_Application__c jobApp = new Job_Application__c(Position__c = position.Id, Applying_Date__c = Date.today());
        
        Test.startTest();
        insert jobApp;
        Test.stopTest();

        Job_Application__c newJobApp = [SELECT Id FROM Job_Application__c WHERE Id = :jobApp.Id];
        List<Interview__c> interviews = [SELECT Type__c FROM Interview__c WHERE Job_Application__c = :newJobApp.Id];
        
        System.assertEquals(3, interviews.size());
        System.assertEquals('CV Review', interviews[0].Type__c);
        System.assertEquals('Personal Interview', interviews[1].Type__c);
        System.assertEquals('Test task review', interviews[2].Type__c);

    }
}