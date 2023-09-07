const cds = require('@sap/cds');
require("./workaround")


module.exports = cds.service.impl(async function(){
    
    this.on("changeUserRole", (req) =>
      UPDATE(req._target,req.params[1]).with({ UserRole_code: req.data.User_Role })
    )
})