# Use the default VPC in us-east-1
data "aws_vpc" "default" {
  default = true
}

# Get the public subnets from the default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Output to confirm the subnet IDs
output "default_subnet_ids" {
  value = data.aws_subnets.default.ids
}
