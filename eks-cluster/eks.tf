module "aws_eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "v17.20.0"

  create_eks      = true
  manage_aws_auth = false

  cluster_name    = local.cluster_name
  cluster_version = "1.21"

  # NETWORK CONFIG
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.private_subnets

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true


  worker_create_security_group         = true
  worker_additional_security_group_ids = []
  cluster_log_retention_in_days        = 90

  # IRSA
  enable_irsa = true

  node_groups = {
    default = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["t3.medium"]
      capacity_type  = "SPOT"
      labels = {
        Training = "devops"
      }

      update_config = {
        max_unavailable_percentage = 50 # or set `max_unavailable`
      }


      tags = {
        Training = "devops"
      }
    }
    nodegroup2 = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["t3.small"]
      capacity_type  = "SPOT"
      labels = {
        Training = "devops"
      }

      update_config = {
        max_unavailable_percentage = 50 # or set `max_unavailable`
      }


      tags = {
        Training = "devops"
      }
    }
  }

  # CLUSTER LOGGING
  cluster_enabled_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  tags = {
    Training = "devops"
  }
}