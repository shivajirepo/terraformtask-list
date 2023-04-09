lb_vpc_info = {
  lb_subnet_names      = ["web", "app"]
  lb_subnets_names_azs = ["a", "b"]
  lb_tg_name           = "tf_lb_tgroup"
  lb_vpc_cidr          = "192.168.0.0/16"
}