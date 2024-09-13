public with sharing class RTA_PositionWrapper {
    @InvocableVariable(label='Position Name')
    public global String positionName;
    
    @InvocableVariable(label='Description')
    public global String description;
    
    @InvocableVariable(label='Minimum Salary')
    public global Decimal minSalary;
    
    @InvocableVariable(label='Maximum Salary')
    public global Decimal maxSalary;
}