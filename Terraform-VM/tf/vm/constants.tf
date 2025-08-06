locals {
    app_id = "Test"
    required_tags = {
      APP_ID = local.app_id
      OWNER      = "Adrian Mendoza"
      ENVIRONMENT = upper(var.stage)
    }
    server_name = "VM"
    location = "Southeast Asia"
}