public with sharing class RTA_IncreaseDevPositionSalary {
    public static void increaseSalary() {
        List<Position__c> openedPositions = [SELECT Id, Description__c, Min_Salary__c, Max_Salary__c FROM Position__c WHERE Status__c = 'Opened'];
        
        for (Position__c pos : openedPositions){
            if (pos.Description__c.toLowerCase().contains('dev')){
                pos.Min_Salary__c *= 1.1;
                pos.Max_Salary__c *= 1.1;
            }
        }
        
        update openedPositions;
    }
}