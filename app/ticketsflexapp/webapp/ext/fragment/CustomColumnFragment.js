sap.ui.define([
    "sap/m/MessageToast",
    "sap/m/Dialog",
    "sap/m/Button",
    "sap/m/ComboBox",
    "sap/ui/core/Item"
], function(MessageToast,Dialog,Button,ComboBox, Item) {
    'use strict';

    return {
        onPress: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
            if (!this.oDialog) {
				this.oDialog = new Dialog({
					title: "Rol Değişikliği",
					resizable: true,
					content: new ComboBox("userRole_combo",{
                        items: {
							path: "/UserRoles",
							template: new Item({
								key: "{code}",
								text: "{name}"
							})
						}
                    }),
                    beginButton:new Button({
                        text:"Update",
                        press: function () {
                                var oModel = this.getModel();
                                const sPath = oEvent.getSource().getParent().getBindingContextPath();
                                oModel.create(sPath, {UserRole : "0"} , {
                                    success: function () {
                                        MessageToast.show("Update was success");
                                    },
                                    error: function (oError) {
                                        MessageBox.error(JSON.parse(oError.responseText).error.innererror.errordetails[0].message.value);
                                    }
                                })
                        }.bind(this)
                    }),
					endButton: new Button({
						text: "Close",
						press: function () {
							this.oDialog.close();
						}.bind(this)
					})
				});

				//to get access to the controller's model
				this._view.addDependent(this.oDialog);
			}

			this.oDialog.open();
        }
    };
});
