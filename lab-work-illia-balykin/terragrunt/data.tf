# Temp data sources like vpc and subnets
# test resource
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["main"]
  }
}
