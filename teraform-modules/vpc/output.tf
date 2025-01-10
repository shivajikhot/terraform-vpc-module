output "vpc_id" {
  value = aws_vpc.demo.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}


output "privet_subnet_id" {
  value = aws_subnet.privet.id
}
