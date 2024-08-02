output "public_subnets" {
  value = [aws_subnet.three-tier-pub-sub-1.id, aws_subnet.three-tier-pub-sub-2.id]
}

output "private_subnets" {
  value = [aws_subnet.three-tier-pvt-sub-1.id, aws_subnet.three-tier-pvt-sub-2.id]
}

output "public_subnet1" {
  value = aws_subnet.three-tier-pub-sub-1.id
}

output "public_subnet2" {
  value = aws_subnet.three-tier-pub-sub-2.id
}

output "vpc_id" {
  value = aws_vpc.three-tier-vpc.id
}

#output "vpc_name" {
#  value = aws_vpc.three-tier-vpc.name
#}

output "private_subnet1" {
  value = aws_subnet.three-tier-pvt-sub-1.id
}

output "private_subnet2" {
  value = aws_subnet.three-tier-pvt-sub-2.id
}
