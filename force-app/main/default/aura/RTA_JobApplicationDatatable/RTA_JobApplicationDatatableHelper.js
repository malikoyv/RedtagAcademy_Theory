({
    fetchJobApplications: function(component) {
        var action = component.get("c.getJobApplications");
        var recordId = component.get("v.recordId");

        action.setParams({
            recordId: recordId
        });

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var jobApplications = response.getReturnValue();
                jobApplications.forEach(function(application) {
                    application.PositionName = application.Position__r.Name;
                });
                component.set("v.jobApplications", jobApplications);
            } else {
                console.log('Error: ' + response.getError());
            }
        });

        $A.enqueueAction(action);
    }
})