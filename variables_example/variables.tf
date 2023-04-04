// STRING VARIABLE
variable "cidr_block" { // name of the variable
  type = string // type of the variable (in the case string)
  default = "10.0.0.0/16" // value of the string variable, in this case the cidr block details
}

// NUMBER VARIABLE
variable "projectDuration" { // name of the variable
  type = number // type of the variable (in this case number)
  default = 28 // value of the number
}

// BOOLEAN VARIABLE
variable "enabled" { // name of the variable
  default = true // value of the variable
}

// LIST VARIABLE (ARRAY)
variable "instance_tenancy" {  // name of the variable
  type = list(string) // type of the variable, set as a list that accepts only string data
  default = ["default", "dedicated", "host"] // string values defined within the list
}

// MAP VARIABLE (key value pairs)
variable "assign_generated_ipv6_cidr_block" { // name of the variable
  type = map // type of the variable, that accepts string keys and string values 
  default = {
    "False" = "false"
    "True" = "true"
  }
}

// TUPLE VARIABLE
variable "launchDate" { // name of the variable
  type = tuple([number, string]) // type of the variable, a list that accepts two values, the first being a number and the second being a string 
  default = [4, "September"]
}

// OBJECT VARIABLE
variable "projectArchitecture" { // name of the variable
  type = object({style = string, resourceNumber = number}) // type of the variable, an object that is expecting a string variable called 'style' and a number variable called 'resourceNumber'
  default = {
    style = "Serverless"
    resourceNumber = 7
  }
}

// INPUT VARIABLE
variable "inputname" { // name of the variable
  type = string // type of the input variable, which will be string stype
  description = "Set the name of the VPC" // set the description message that appears as a prompt for when you type an input as the variables value
}

// OUTPUT VARIABLE
output "vpcid" { // name of the variable
  value = aws_vpc.myfirstvpc.id // the value that you'd like to output once the resource is created
}

// OUTPUT VARIABLE
output "vpcarn" { // name of the variable
  value = aws_vpc.myfirstvpc.arn // the value that you'd like to output once the resource is created
}
