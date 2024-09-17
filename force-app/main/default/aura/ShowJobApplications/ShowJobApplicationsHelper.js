({
    getJobApplications: function (component) {
        var action = component.get("c.getJobApplications");
        action.setParams({
            candidateId: component.get("v.recordId")
        });
        
        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.jobApplications", response.getReturnValue());
            } else {
                console.error("Failed with state: " + state);
            }
        });

        $A.enqueueAction(action);
    }
})
