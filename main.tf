module "fees-register-api" {
  source   = "git@github.com:contino/moj-module-webapp?ref=0.0.78"
  product  = "${var.product}-api"
  location = "${var.location}"
  env      = "${var.env}"
  asename  = "${data.terraform_remote_state.core_apps_compute.ase_name[0]}"

  app_settings = {
    POSTGRES_HOST     = "${module.fees-register-database.host_name}"
    POSTGRES_PORT     = "${module.fees-register-database.postgresql_listen_port}"
    POSTGRES_DATABASE = "${module.fees-register-database.postgresql_database}"
    POSTGRES_USER     = "${module.fees-register-database.user_name}"
    SPRING_DATASOURCE_USERNAME = "${module.fees-register-database.user_name}"
    SPRING_DATASOURCE_URL = "jdbc:postgresql://${module.fees-register-database.host_name}:${module.fees-register-database.postgresql_listen_port}/${module.fees-register-database.postgresql_database}"
    SPRING_DATASOURCE_PASSWORD = "${var.database-password}"
  }
}

module "fees-register-database" {
  source              = "git@github.com:contino/moj-module-postgres?ref=master"
  product             = "${var.product}"
  location            = "West Europe"
  env                 = "${var.env}"
  postgresql_user = "fradmin"
  postgresql_password = "${var.database-password}"
  postgresql_database = "${var.database-name}"
}
