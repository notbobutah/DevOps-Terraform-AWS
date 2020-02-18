
# module "eks" {
#   source       = "terraform-aws-modules/eks/aws"
#   cluster_name = "${var.region}"
#   subnets      = "${var.aws_subnet_ids}"
#   vpc_id       = "${var.vpc_id}"
#   worker_groups = [
#     {
#       autoscaling_enabled  = true
#       asg_min_size         = 3
#       asg_desired_capacity = 3
#       instance_type        = "t3.micro"
#       asg_max_size         = 20
#       key_name             = "${var.key_name}"
#     }
#   ]
#   version = "5.0.0"
# }

# # Needed for cluster-autoscaler
# resource "aws_iam_role_policy_attachment" "workers_AmazonEC2ContainerRegistryPowerUser" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
#   role       = "${module.eks.worker_iam_role_name}"
# }

