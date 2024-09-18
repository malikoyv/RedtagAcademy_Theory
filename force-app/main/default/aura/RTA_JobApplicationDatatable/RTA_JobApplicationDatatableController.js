({
    doInit: function(component, event, helper) {
        var columns = [
            {label: 'Application Name', fieldName: 'Name', type: 'text'},
            {label: 'Applying Date', fieldName: 'Applying_date__c', type: 'date'},
            {label: 'Average Rating', fieldName: 'Rating_Sum__c', type: 'number', typeAttributes: { maximumFractionDigits: 2 }},
            {label: 'Position', fieldName: 'PositionName', type: 'text'},
            {label: 'Status', fieldName: 'Status__c', type: 'text'}
        ];
        
        component.set('v.columns', columns);
        
        helper.fetchJobApplications(component);
    }
})