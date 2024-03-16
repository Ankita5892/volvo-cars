output "vpc-id-value" {
  value = aws_vpc.volvo-vpc.id
}

output "route-table-id" {
value = aws_route_table.public.id
}
