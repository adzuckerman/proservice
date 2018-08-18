({
    doInit : function(component, event, helper) {
        
        var action = component.get("c.getUrlWithAuthLEX");
        action.setParams({
            "diagramId": component.get("v.diagramId")
        });
        
        // Register the callback function
        action.setCallback(this, function(response) {
            var data = JSON.parse(response.getReturnValue());
            // Set the component attributes using values returned by the API call
            component.set("v.urlWithAuth", data.url);
            component.set("v.isSuccess", data.isSuccess);
            component.set("v.message", data.message);
        });
        // Invoke the service
        $A.enqueueAction(action);
        
    }    
})