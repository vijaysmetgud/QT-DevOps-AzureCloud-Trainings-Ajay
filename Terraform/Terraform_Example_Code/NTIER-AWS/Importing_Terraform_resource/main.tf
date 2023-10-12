resource "aws_vpc" "My-VPC" {
    arn                                  = "arn:aws:ec2:us-west-2:939039194828:vpc/vpc-0665c6b26833adb4c"
    assign_generated_ipv6_cidr_block     = false
    cidr_block                           = "10.10.0.0/16"
    default_network_acl_id               = "acl-09b2522e5d6b9f74c"
    default_route_table_id               = "rtb-06a74df2611781ff3"
    default_security_group_id            = "sg-00f19cfcb19661efc"
    dhcp_options_id                      = "dopt-029a913d0ea214035"
    enable_dns_hostnames                 = false
    enable_dns_support                   = true
    enable_network_address_usage_metrics = false
    id                                   = "vpc-0665c6b26833adb4c"
    instance_tenancy                     = "default"
    ipv6_netmask_length                  = 0
    main_route_table_id                  = "rtb-06a74df2611781ff3"
    owner_id                             = "939039194828"
    tags                                 = {
        "Name" = "My-VPC"
    }
    tags_all                             = {
        "Name" = "My-VPC"
    }
}