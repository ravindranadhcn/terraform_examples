// VPC RESOURCE
resource "aws_vpc" "myfirstvpc" { // title of resource
  cidr_block = var.cidr_block // accessing string variable data
  enable_dns_support = var.enabled // accessing string boolean data
  instance_tenancy = var.instance_tenancy[0] // accessing list variable data
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block["False"] // accessing map variable data
  tags = {
    Name = var.inputname // accessing input variable data
    ProjectDurationInWeeks = var.projectDuration // accessing number variable data
    LaunchDay = var.launchDate[0] // accessing tuple variable data
    LaunchMonth = var.launchDate[1] // accessing tuple variable data
    ArchitectureType = var.projectArchitecture["style"] // accessing object variable data
    NumberOfResources = var.projectArchitecture["resourceNumber"] // accessing tuple variable data
  }
}
