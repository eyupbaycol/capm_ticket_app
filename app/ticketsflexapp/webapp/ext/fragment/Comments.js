sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        onPost: function(oEvent) {
            var oList = this.byId("comment_list"),
				oBinding = oList.getBinding("items"),
				oContext = oBinding.create({
					"Comment" : oEvent.mParameters.value,
					"to_Personnel_PersonnelUUID":"G9H8I7J6K5L4M3N2O1P0Q1R2"
				});

			oContext.created().then(function () {
				oBinding.refresh();
			});
        }
    };
});
