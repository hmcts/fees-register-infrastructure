module "fees-register-api" {
  source   = "git::https://23a108ab5ea17c28372a130d72aa60ea0761839b@github.com/contino/moj-module-webapp?ref=0.0.78"
  product  = "${var.product}-api"
  location = "${var.location}"
  env      = "${var.env}"
  asename  = "${data.terraform_remote_state.core_apps_compute.ase_name[0]}"

  app_settings = {
    POSTGRES_HOST     = "${module.fees-register-database.host_name}"
    POSTGRES_PORT     = "${module.fees-register-database.postgresql_listen_port}"
    POSTGRES_DATABASE = "${module.fees-register-database.postgresql_database}"
    POSTGRES_USER     = "${module.fees-register-database.user_name}"
  }
}

module "fees-register-database" {
  source              = "git::https://23a108ab5ea17c28372a130d72aa60ea0761839b@github.com/contino/moj-module-postgres?ref=master"
  product             = "${var.product}"
  location            = "West Europe"
  env                 = "${var.env}"
  postgresql_user     = "fradmin"
  postgresql_password = "Password1"
}
