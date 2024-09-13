public with sharing class RTA_CreatePosition {

    @InvocableMethod(label='Create new Position Record')
    public static void createOpenPosition(List<RTA_PositionWrapper> positions) {
        List<Position__c> newPositions = new List<Position__c>();
        
        for(RTA_PositionWrapper pos : positions) {
            Position__c newPosition = new Position__c(
                Name = pos.positionName,
                Description__c = pos.description,
                Min_Salary__c = pos.minSalary,
                Max_Salary__c = pos.maxSalary,
                Status__c = 'Opened' // Picklist value
            );
            newPositions.add(newPosition);
        }
        insert newPositions;

        // An example of usage:

        // RTA_PositionWrapper posWrapper = new RTA_PositionWrapper();
        // posWrapper.positionName = 'Architect';
        // posWrapper.description = 'Interesting job';
        // posWrapper.minSalary = 4000.0;
        // posWrapper.maxSalary = 8000.0;

        // RTA_CreatePosition.createOpenPosition(new List<RTA_PositionWrapper>{posWrapper});

    }
}