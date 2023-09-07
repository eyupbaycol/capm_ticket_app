sap.ui.define(['sap/ui/core/mvc/ControllerExtension'], function (ControllerExtension) {
	'use strict';

	return ControllerExtension.extend('com.fe.ticketsflexapp.ext.controller.CustomControllerExt', {
		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		override: {
			/**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf com.fe.ticketsflexapp.ext.controller.CustomControllerExt
             */
			onInit: function () {
				// you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
				var oModel = this.base.getExtensionAPI().getModel();
			},
			onAfterRendering: function (oObjectPageEvent) {

				//Get Extension API
				var oObjectPageController = this;
				var oExtensionAPI = oObjectPageController.base.getExtensionAPI();

				//Get Geo Map Controller. Full id: "zgeomovingobjectlistv4::MovingObjectObjectPage--fe::CustomSubSection::Geomap--GeoMapControl"
				var oGeomapController = oExtensionAPI.byId("com.fe.ticketsflexapp::TicketObjectPage--fe::CustomSubSection::CustomerLocation--GeoMapControl");

				//Set Map configuration
				var oMapConfig = {
					"MapProvider": [{
						"name": "OSM",
						"type": "",
						"description": "",
						"tileX": "512",
						"tileY": "512",
						"maxLOD": "20",
						"copyright": "OpenStreetMap",
						"Source": [{
							"id": "s1",
							"url": "https://a.tile.openstreetmap.org/{LOD}/{X}/{Y}.png"
						}]
					}],
					"MapLayerStacks": [{
						"name": "DEFAULT",
						"MapLayer": [{
							"name": "OSMLayter",
							"refMapProvider": "OSM",
							"opacity": "1.0",
							"colBkgnd": "RGB(255,255,255)"
						}]
					}]
				};

				oGeomapController.setMapConfiguration(oMapConfig);
				oGeomapController.setRefMapLayerStack("DEFAULT");
			}
		}
	});
});
