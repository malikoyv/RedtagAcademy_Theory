@isTest
private class RTA_TestPositionClosedDateTrigger {

    @isTest
    static void Test_ChangeClosedDate() {
        Position__c position = new Position__c(Name = 'Developer', Status__c = 'Opened');
        insert position;
        position.Status__c = 'Closed - Filled';

        Test.startTest();
        update position;
        Test.stopTest();

        Position__c updatedPosition = [SELECT Closed_Date__c FROM Position__c WHERE Id = : position.Id];
        
        System.assertNotEquals(null, updatedPosition.Closed_Date__c);
        System.assertEquals(Date.today(), updatedPosition.Closed_Date__c);
    }
}