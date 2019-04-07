module "swmodule" {
    source = "../modules/app"
    swPublicSubnet = "${var.swPublicSubnet}"
    swPrivateSubnet = "${var.swPrivateSubnet}"
    swadmin_user = "${var.swadmin_user}"
    swadmin_password = "${var.swadmin_password}"
    sw_env_tag = "${var.sw_env_tag}"
}
