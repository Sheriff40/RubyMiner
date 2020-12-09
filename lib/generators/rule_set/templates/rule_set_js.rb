document.addEventListener('turbolinks:load', function () {
    if ($('.rule_sets').length == 0) {
        return false
    }

    //CSRF-Token
    let token = $("meta[name='csrf-token']").attr("content");

    let submitBtn = document.querySelector("#finalizeRule");
    let controllers = document.querySelectorAll(".controllers");

    // Variables to store the result in hash form with controller as key and action array as their values.
    let result = "";
    let actions = [];

    submitBtn.addEventListener("click", function () {

        // Loop through all the controller's select options
        controllers.forEach(function (controller,index) {

            // Append the selection actions(options) from the select tag to the controller
            Array.from(controller.selectedOptions).forEach(function (option) {
                actions.push("\'" + option.value + "\'");
            });

            // Append the previously selected values in case of edit, i.e to restore the previous action values
            let selectedActions = controller.querySelectorAll("."+controller["name"]);

            // push the previously selected action in edit form, if they have not been deleted from the UI and are still
            // selected in the select tag
            selectedActions.forEach(function (option) {
                if(option.classList.contains("selected")){
                    actions.push("\'" + option.value + "\'");
                }
            });

            // Appending the controller => action hash. If the hash is first of it's kind, no comma is needed
            if(index==0)
                result += "{\'" + controller["name"] + "\'=>[" + actions + "]";
            else
                result += ",\'" + String(controller["name"]) + "\'=>[" + actions + "]";
            actions = [];
        });

        // Ajax request to save the hash rule.
        saveRuleSetAjax(result+"}")
    });


    //code for removing selected actions
    let removeActionBtns = document.querySelectorAll(".removeAction");

    if (removeActionBtns != null){
        removeActionBtns.forEach(function(data){
            data.addEventListener("click",function () {

                // Controller Name and action Name are passed as to extract the exact hash value and delete them
                let controllerName = this.getAttribute("controller");
                let actionName = this.getAttribute("action");

                // Ajax request to remove the selected action from the controller(Model)
                removeSelectedAction(controllerName,actionName);
            })
        })
    }


    // Ajax request to remove the selected action from the controller(Model)
    function removeSelectedAction(controllerName, actionName){
        let request = $.ajax({
            url: "/rule_set/remove_action",
            method: "PUT",
            data: {authenticity_token: token, controller_name: controllerName, action_name: actionName}
        });

        request.success(function (data) {

            // code to remove the selected CSS from the option once it has been deleted.
            // Also remove the action from te badge
            let actionId = data["actionId"];
            let actionBtns = document.querySelectorAll("."+actionId);
            actionBtns[0].classList.remove("selected");
            actionBtns[1].classList.add("d-none");
        });

        request.error(function (data) {
            console.log(data)
        })
    }

    // Save Rule Set Hash in Ajax Request according to the controller and their actions
    function saveRuleSetAjax(result){
        let request = $.ajax({
            url: "/rule_set",
            method: "PUT",
            data: {authenticity_token: token, rule_set: result}
        });

        request.error(function (data) {
            console.log(data)
        })
    }

});