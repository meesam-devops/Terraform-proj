aws_region           = "us-east-1"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
desired_node_count   = 2
min_node_count       = 1
max_node_count       = 3
node_instance_types  = ["t3.small"]
