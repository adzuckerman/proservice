({
	doInit : function(component, event, helper) {
		
		var action = component.get("c.doCheckResult");
		action.setParams({
            "recordId": component.get("v.recordId")
        });
		
		action.setCallback(this, function(response){
			if (component.isValid() && response.getState() === "SUCCESS") {
				component.set("v.DuplicateResult", response.getReturnValue());
				var duplicateResult = component.get("v.DuplicateResult");
				component.set("v.isLoading", false);
			} else {
				component.set("v.isLoading", false);
			}
		});
		$A.enqueueAction(action);
    },
    openDCTab : function(component, event, helper) {
    			
    		if (event.target == undefined || event.target.getAttribute('name') == undefined) {
    			return;
    		}
    
        component.set("v.isLoading", true);
        var openTab = event.target.getAttribute('name');
        var oResult = component.get("v.DuplicateResult.ObjectResult");
        oResult.forEach(function(v,k){
    			v.isActive = false;
    			if (openTab === v.Prefix) {
    				v.isActive = true;
    			}
    		});
    		component.set("v.DuplicateResult.ObjectResult", oResult);
    		component.set("v.isLoading", false);
    	
    },
    openCheck : function(component, event, helper) {
    
    },
    selectRecord: function(component, event, helper) {
    	
    	var selected = 0;
    	var oResult = component.get("v.DuplicateResult.ObjectResult");
    	oResult.forEach(function(v,k){
    		if (v.isMerge) {
    		
    			v.ResultData.forEach(function(vv,kk) {
    				if (vv.isSelected) {
    					selected = selected + 1;
    				}
    			})
    		}
    	})
    	
    }
})