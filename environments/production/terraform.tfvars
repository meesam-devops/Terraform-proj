aws_region           = "us-east-1"
vpc_cidr             = "10.2.0.0/16"
public_subnet_cidrs  = ["10.2.1.0/24", "10.2.2.0/24"]
private_subnet_cidrs = ["10.2.10.0/24", "10.2.11.0/24"]
desired_node_count   = 3
min_node_count       = 3
max_node_count       = 10
node_instance_types  = ["t3.large"]
