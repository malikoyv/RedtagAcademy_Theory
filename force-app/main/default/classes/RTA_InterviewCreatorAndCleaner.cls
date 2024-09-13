public with sharing class RTA_InterviewCreatorAndCleaner {
    public static void createThreeInterviewRecords(String jobApplicationName) {
        List<Interview__c> interviews = new List<Interview__c>(); 
        List<String> types = new List<String>{'CV Review', 'Personal Interview', 'Test task review'};

        Job_Application__c jobApplication = [SELECT Id FROM Job_Application__c WHERE Name = :jobApplicationName];

        for (Integer i = 0; i < 3; i++){
            Interview__c newInterview = new Interview__c(
                Job_Application__c = jobApplication.Id,
                Type__c = types[i]
            );
            interviews.add(newInterview);
        }
        insert interviews;
    }

    public static void deleteJobRelatedInterviews(String jobApplicationName) {
        Job_Application__c jobApplication = [SELECT Id FROM Job_Application__c WHERE Name = :jobApplicationName];
        List<Interview__c> relatedInterviews = [SELECT Id FROM Interview__c WHERE Job_Application__c = :jobApplication];
        for (Integer i = 0; i < relatedInterviews.size(); i++){
            Interview__c interview = relatedInterviews[i];
            delete interview;
        }
    }
}