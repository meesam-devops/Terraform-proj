aws_region           = "us-east-1"
vpc_cidr             = "10.1.0.0/16"
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnet_cidrs = ["10.1.10.0/24", "10.1.11.0/24"]
desired_node_count   = 2
min_node_count       = 2
max_node_count       = 4
node_instance_types  = ["t3.medium"]
