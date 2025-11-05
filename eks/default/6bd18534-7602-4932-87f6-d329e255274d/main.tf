module "stackgen_013b1937-7647-5932-b6c0-c14df1bc3987" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = null
  description              = null
  from_port                = 5671
  ipv6_cidr_blocks         = null
  prefix_list_ids          = null
  protocol                 = "tcp"
  security_group_id        = module.stackgen_177f2dbf-0d1f-5f0e-a688-295555ad5a26.id
  self                     = false
  source_security_group_id = "sg-0b6c6c173f6f34d3e"
  to_port                  = 5671
  type                     = "ingress"
}

module "stackgen_02ac58b4-27d4-58e9-b21d-41690b6f2e37" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = null
  description              = "Cluster API to node 6443/tcp webhook"
  from_port                = 6443
  ipv6_cidr_blocks         = null
  prefix_list_ids          = []
  protocol                 = "tcp"
  security_group_id        = module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.id
  self                     = false
  source_security_group_id = "sg-017eaab9b23b68382"
  to_port                  = 6443
  type                     = "ingress"
}

module "stackgen_0325c2df-b5d5-54cd-ad35-e8c5e72a3631" {
  source                    = "./modules/data_aws_iam_policy_document"
  override_json             = null
  override_policy_documents = null
  policy_id                 = null
  source_json               = null
  source_policy_documents   = null
  statement = [{
    actions        = ["sts:AssumeRole"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals = [{
      identifiers = ["eks.amazonaws.com"]
      type        = "Service"
    }]
    resources = []
    sid       = "EKSClusterAssumeRole"
  }]
}

module "stackgen_04372edb-8df3-56bf-aaa4-91b9c171ba8b" {
  source = "./modules/data_aws_partition"
}

module "stackgen_07808840-5b99-5109-91b3-cd6d86dc6e46" {
  source                    = "./modules/data_aws_iam_policy_document"
  override_json             = null
  override_policy_documents = null
  policy_id                 = null
  source_json               = null
  source_policy_documents   = null
  statement = [{
    actions        = ["sts:AssumeRole"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals = [{
      identifiers = ["ec2.amazonaws.com"]
      type        = "Service"
    }]
    resources = []
    sid       = "EKSNodeAssumeRole"
  }]
}

module "stackgen_07ebdcfe-413d-5d0c-ad58-214d7f1d0cef" {
  source         = "./modules/aws_route_table_association"
  gateway_id     = ""
  route_table_id = module.stackgen_21b17b50-c073-54ab-aaf3-662db6da5665.id
  subnet_id      = module.stackgen_88bb083b-9e45-5b64-a250-ffc4d2acbe5f.id
}

module "stackgen_080ebcf6-682b-5457-a6d8-6cbdb402af3e" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_cfe3cf5d-b40f-522f-92e8-89163efbf3b0.arn
  role       = module.stackgen_1552e8e2-9c10-51ed-bbee-dccf751e63e7.name
}

module "stackgen_085052dc-7ced-556e-9d17-b5f74fa17dd0" {
  source              = "./modules/aws_kms_key"
  description         = "retail-store cluster encryption key"
  enable_key_rotation = true
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_09607291-071b-5408-8f11-ffb1ca99e744" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = ["0.0.0.0/0"]
  description              = "Node all egress"
  from_port                = 0
  ipv6_cidr_blocks         = ["::/0"]
  prefix_list_ids          = []
  protocol                 = "-1"
  security_group_id        = module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.id
  self                     = false
  source_security_group_id = null
  to_port                  = 0
  type                     = "egress"
}

module "stackgen_0a5e5e51-cb3e-5da0-8418-04f8f1d017e3" {
  source           = "./modules/time_sleep"
  create_duration  = "30s"
  destroy_duration = null
}

module "stackgen_0aa1330c-fd2c-5ac0-b84f-af0f0e72c4e4" {
  source                    = "./modules/data_aws_iam_policy_document"
  override_json             = null
  override_policy_documents = null
  policy_id                 = null
  source_json               = null
  source_policy_documents   = ["{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": \"route53:GetChange\",\n      \"Resource\": \"arn:aws:route53:::change/*\"\n    },\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"route53:ListResourceRecordSets\",\n        \"route53:ChangeResourceRecordSets\"\n      ],\n      \"Resource\": \"arn:aws:route53:::hostedzone/*\"\n    },\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": \"route53:ListHostedZonesByName\",\n      \"Resource\": \"*\"\n    }\n  ]\n}"]
  statement                 = null
}

module "stackgen_0d1ebe22-92d5-5166-9d39-32ec59adbb6c" {
  source                               = "./modules/aws_launch_template"
  block_device_mappings                = []
  capacity_reservation_specification   = []
  cpu_options                          = []
  credit_specification                 = []
  default_version                      = 1
  description                          = "Custom launch template for managed-nodegroup-2 EKS managed node group"
  disable_api_termination              = false
  ebs_optimized                        = ""
  elastic_gpu_specifications           = []
  elastic_inference_accelerator        = []
  enclave_options                      = []
  hibernation_options                  = []
  iam_instance_profile                 = []
  image_id                             = ""
  instance_initiated_shutdown_behavior = ""
  instance_market_options              = []
  instance_type                        = ""
  kernel_id                            = ""
  key_name                             = ""
  license_specification                = []
  maintenance_options                  = []
  metadata_options = [{
    http_endpoint               = "enabled"
    http_protocol_ipv6          = ""
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = ""
  }]
  monitoring = [{
    enabled = true
  }]
  name                     = "node_group_2-20251009180112665900000006"
  network_interfaces       = []
  placement                = []
  private_dns_name_options = []
  ram_disk_id              = ""
  security_group_names     = []
  tag_specifications = [{
    resource_type = "instance"
    tags = {
      Name             = "managed-nodegroup-2"
      created-by       = "retail-store-sample-app"
      environment-name = "retail-store"
    }
    }, {
    resource_type = "network-interface"
    tags = {
      Name             = "managed-nodegroup-2"
      created-by       = "retail-store-sample-app"
      environment-name = "retail-store"
    }
    }, {
    resource_type = "volume"
    tags = {
      Name             = "managed-nodegroup-2"
      created-by       = "retail-store-sample-app"
      environment-name = "retail-store"
    }
  }]
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  update_default_version = true
  user_data              = ""
  vpc_security_group_ids = [
    module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.id,
  ]
}

module "stackgen_1035c3f1-b526-555f-af0f-1f468c5d9d61" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1b"
  cidr_block              = "10.0.11.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name                                 = "retail-store-private-us-east-1b"
    created-by                           = "retail-store-sample-app"
    environment-name                     = "retail-store"
    "kubernetes.io/cluster/retail-store" = "shared"
    "kubernetes.io/role/internal-elb"    = "1"
  }
  vpc_id = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_10af7ac7-56a6-526c-b3fa-1bf022e5e06b" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_a51d54c8-fc59-5d1f-bcb5-f4c4feb742b9.name
}

module "stackgen_10b46f79-c54b-5a80-a4e1-1d437facecd0" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = null
  description              = "Node to node CoreDNS"
  from_port                = 53
  ipv6_cidr_blocks         = null
  prefix_list_ids          = []
  protocol                 = "tcp"
  security_group_id        = module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.id
  self                     = true
  source_security_group_id = null
  to_port                  = 53
  type                     = "ingress"
}

module "stackgen_1207fdd8-a4ac-57b1-bc71-5ca7e09908db" {
  source               = "./modules/aws_eks_node_group"
  ami_type             = "AL2023_x86_64_STANDARD"
  capacity_type        = "ON_DEMAND"
  cluster_name         = module.stackgen_d613e397-f4e3-54a2-af56-6c8aa0000bef.id
  disk_size            = 0
  force_update_version = true
  instance_types       = ["m5.large"]
  labels               = {}
  launch_template = [{
    id      = "lt-06b42c9bf459e136b"
    name    = "node_group_1-20251009180112665900000008"
    version = "1"
  }]
  node_group_name = "managed-nodegroup-1-20251009180120905200000010"
  node_role_arn   = module.stackgen_a51d54c8-fc59-5d1f-bcb5-f4c4feb742b9.arn
  release_version = "1.30.14-20251007"
  remote_access   = []
  scaling_config = [{
    desired_size = 1
    max_size     = 3
    min_size     = 1
  }]
  subnet_ids = [
    module.stackgen_88bb083b-9e45-5b64-a250-ffc4d2acbe5f.id,
  ]
  tags = {
    Name             = "managed-nodegroup-1"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  taint = []
  update_config = [{
    max_unavailable            = 0
    max_unavailable_percentage = 33
  }]
}

module "stackgen_1552e8e2-9c10-51ed-bbee-dccf751e63e7" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":[\"sts:TagSession\",\"sts:AssumeRoleWithWebIdentity\"],\"Condition\":{\"StringEquals\":{\"oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739:sub\":\"system:serviceaccount:carts:carts\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "retail-store-carts-dynamo"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_15599ca1-2ef6-5eb8-9437-2290f2cefc3c" {
  source = "./modules/data_aws_iam_session_context"
  arn    = "arn:aws:sts::339712749745:assumed-role/AWSReservedSSO_AdministratorAccess_90ce8fbcbe3cc328/leander@stackgen.com"
}

module "stackgen_1624c7a0-f6bd-55b1-80c2-4cf6b19d519f" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_f9fee92e-0d9b-531d-b33c-9d42bad8acb2.name
}

module "stackgen_16643503-d9d9-52f9-a530-4c1458eb9f7c" {
  source               = "./modules/aws_eks_node_group"
  ami_type             = "AL2023_x86_64_STANDARD"
  capacity_type        = "ON_DEMAND"
  cluster_name         = module.stackgen_d613e397-f4e3-54a2-af56-6c8aa0000bef.id
  disk_size            = 0
  force_update_version = true
  instance_types       = ["m5.large"]
  labels               = {}
  launch_template = [{
    id      = "lt-09b43b7b4502704c8"
    name    = "node_group_3-20251009180112665900000004"
    version = "1"
  }]
  node_group_name = "managed-nodegroup-3-2025100918012090520000000e"
  node_role_arn   = module.stackgen_6cb03677-4a41-5ff3-8394-544eaffe9a23.arn
  release_version = "1.30.14-20251007"
  remote_access   = []
  scaling_config = [{
    desired_size = 1
    max_size     = 3
    min_size     = 1
  }]
  subnet_ids = [
    module.stackgen_889eaaf4-581f-5fbe-a398-bb14b7a92ae5.id,
  ]
  tags = {
    Name             = "managed-nodegroup-3"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  taint = []
  update_config = [{
    max_unavailable            = 0
    max_unavailable_percentage = 33
  }]
}

module "stackgen_177f2dbf-0d1f-5f0e-a688-295555ad5a26" {
  source      = "./modules/aws_security_group"
  description = "Secure traffic to Rabbit MQ"
  egress      = []
  ingress = [{
    cidr_blocks      = []
    description      = ""
    from_port        = 5671
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-0b6c6c173f6f34d3e"]
    self             = false
    to_port          = 5671
  }]
  name                   = "retail-store-orders-broker"
  revoke_rules_on_delete = false
  tags = {
    Name             = "retail-store-orders-broker"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
  vpc_id   = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_198e4fa4-3952-56d4-b469-c9b9db4b0c31" {
  source = "./modules/data_aws_caller_identity"
}

module "stackgen_1b10b983-7b5e-53fc-8f77-bfd9201a4dae" {
  source = "./modules/data_aws_caller_identity"
}

module "stackgen_1e2b65bc-b7c1-5522-b349-608d50ce9d6a" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_6cb03677-4a41-5ff3-8394-544eaffe9a23.name
}

module "stackgen_21002d96-fcf7-5dd4-8843-848ba1e2ecb2" {
  source           = "./modules/random_string"
  length           = 10
  lower            = true
  min_lower        = 0
  min_numeric      = 0
  min_special      = 0
  min_upper        = 0
  numeric          = true
  override_special = null
  special          = false
  upper            = true
}

module "stackgen_21b17b50-c073-54ab-aaf3-662db6da5665" {
  source = "./modules/aws_route_table"
  route = [{
    carrier_gateway_id         = ""
    cidr_block                 = "0.0.0.0/0"
    core_network_arn           = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    gateway_id                 = ""
    ipv6_cidr_block            = ""
    local_gateway_id           = ""
    nat_gateway_id             = "nat-0bfb20d204ec247b6"
    network_interface_id       = ""
    transit_gateway_id         = ""
    vpc_endpoint_id            = ""
    vpc_peering_connection_id  = ""
  }]
  tags = {
    Name             = "retail-store-private"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  vpc_id = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_21b3f04c-abd0-5976-b9d8-37422814678d" {
  source = "./modules/data_aws_partition"
}

module "stackgen_22542c20-ea3b-5d87-8bd2-6f8ebe9d0295" {
  source                    = "./modules/aws_eip"
  address                   = null
  associate_with_private_ip = null
  customer_owned_ipv4_pool  = ""
  domain                    = "vpc"
  instance                  = ""
  network_border_group      = "us-east-1"
  network_interface         = "eni-0c2eaece3f6ff04fa"
  public_ipv4_pool          = "amazon"
  tags = {
    Name             = "retail-store-us-east-1a"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_225451b0-6ece-5b7b-9783-34eb5f9c172b" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_a51d54c8-fc59-5d1f-bcb5-f4c4feb742b9.name
}

module "stackgen_22d3d146-85e9-5050-bbd9-fa3fa66d5906" {
  source = "./modules/data_aws_partition"
}

module "stackgen_2604f6a8-dfe7-57ad-8224-2b9b16d07914" {
  source                    = "./modules/data_aws_iam_policy_document"
  override_json             = null
  override_policy_documents = null
  policy_id                 = null
  source_json               = null
  source_policy_documents   = null
  statement = [{
    actions = ["sts:AssumeRole"]
    condition = [{
      test     = "ArnLike"
      values   = ["arn:aws:iam::339712749745:role/cert-manager-*"]
      variable = "aws:PrincipalArn"
    }]
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals = [{
      identifiers = ["*"]
      type        = "AWS"
    }]
    resources = []
    sid       = "ExplicitSelfRoleAssumption"
    }, {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    condition = [{
      test     = "StringEquals"
      values   = ["sts.amazonaws.com"]
      variable = "oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739:aud"
      }, {
      test     = "StringEquals"
      values   = ["system:serviceaccount:cert-manager:cert-manager"]
      variable = "oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739:sub"
    }]
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals = [{
      identifiers = ["arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739"]
      type        = "Federated"
    }]
    resources = []
    sid       = ""
  }]
}

module "stackgen_28d19d44-138c-5fd8-8aa2-c1988bdd1caa" {
  source = "./modules/data_aws_region"
}

module "stackgen_297b1d6b-84eb-5f56-ab89-782203435d8f" {
  source      = "./modules/aws_security_group"
  description = "Control traffic to/from RDS Aurora retail-store-orders"
  egress      = []
  ingress = [{
    cidr_blocks      = []
    description      = "From allowed SGs"
    from_port        = 5432
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-0b6c6c173f6f34d3e"]
    self             = false
    to_port          = 5432
  }]
  name                   = "retail-store-orders-20251009173325013800000010"
  revoke_rules_on_delete = false
  tags = {
    Name             = "retail-store-orders"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
  vpc_id   = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_2a3747eb-2205-5e47-853d-2cb660740929" {
  source             = "./modules/data_aws_eks_addon_version"
  addon_name         = "vpc-cni"
  kubernetes_version = "1.30"
  most_recent        = true
}

module "stackgen_2b421124-e76e-5051-910c-7de9da9127cc" {
  source      = "./modules/aws_db_subnet_group"
  description = "For Aurora cluster retail-store-orders"
  name        = "retail-store-orders"
  name_prefix = ""
  subnet_ids = [
    module.stackgen_88bb083b-9e45-5b64-a250-ffc4d2acbe5f.id,
    module.stackgen_1035c3f1-b526-555f-af0f-1f468c5d9d61.id,
    module.stackgen_889eaaf4-581f-5fbe-a398-bb14b7a92ae5.id,
  ]
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_2b461a13-9153-5d8b-a4ff-b904291476be" {
  source                    = "./modules/data_aws_iam_policy_document"
  override_json             = null
  override_policy_documents = null
  policy_id                 = null
  source_json               = null
  source_policy_documents   = null
  statement = [{
    actions = ["iam:CreateServiceLinkedRole"]
    condition = [{
      test     = "StringEquals"
      values   = ["elasticloadbalancing.amazonaws.com"]
      variable = "iam:AWSServiceName"
    }]
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["*"]
    sid            = ""
    }, {
    actions        = ["ec2:DescribeAccountAttributes", "ec2:DescribeAddresses", "ec2:DescribeAvailabilityZones", "ec2:DescribeCoipPools", "ec2:DescribeInstances", "ec2:DescribeInternetGateways", "ec2:DescribeIpamPools", "ec2:DescribeNetworkInterfaces", "ec2:DescribeSecurityGroups", "ec2:DescribeSubnets", "ec2:DescribeTags", "ec2:DescribeVpcPeeringConnections", "ec2:DescribeVpcs", "ec2:GetCoipPoolUsage", "ec2:GetSecurityGroupsForVpc", "elasticloadbalancing:DescribeCapacityReservation", "elasticloadbalancing:DescribeListenerAttributes", "elasticloadbalancing:DescribeListenerCertificates", "elasticloadbalancing:DescribeListeners", "elasticloadbalancing:DescribeLoadBalancerAttributes", "elasticloadbalancing:DescribeLoadBalancers", "elasticloadbalancing:DescribeRules", "elasticloadbalancing:DescribeSSLPolicies", "elasticloadbalancing:DescribeTags", "elasticloadbalancing:DescribeTargetGroupAttributes", "elasticloadbalancing:DescribeTargetGroups", "elasticloadbalancing:DescribeTargetHealth", "elasticloadbalancing:DescribeTrustStores"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["*"]
    sid            = ""
    }, {
    actions        = ["acm:DescribeCertificate", "acm:ListCertificates", "cognito-idp:DescribeUserPoolClient", "iam:GetServerCertificate", "iam:ListServerCertificates", "shield:CreateProtection", "shield:DeleteProtection", "shield:DescribeProtection", "shield:GetSubscriptionState", "waf-regional:AssociateWebACL", "waf-regional:DisassociateWebACL", "waf-regional:GetWebACL", "waf-regional:GetWebACLForResource", "wafv2:AssociateWebACL", "wafv2:DisassociateWebACL", "wafv2:GetWebACL", "wafv2:GetWebACLForResource"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["*"]
    sid            = ""
    }, {
    actions        = ["ec2:AuthorizeSecurityGroupIngress", "ec2:RevokeSecurityGroupIngress"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["*"]
    sid            = ""
    }, {
    actions        = ["ec2:CreateSecurityGroup"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["*"]
    sid            = ""
    }, {
    actions = ["ec2:CreateTags"]
    condition = [{
      test     = "Null"
      values   = ["false"]
      variable = "aws:RequestTag/elbv2.k8s.aws/cluster"
      }, {
      test     = "StringEquals"
      values   = ["CreateSecurityGroup"]
      variable = "ec2:CreateAction"
    }]
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["arn:aws:ec2:*:*:security-group/*"]
    sid            = ""
    }, {
    actions = ["ec2:CreateTags", "ec2:DeleteTags"]
    condition = [{
      test     = "Null"
      values   = ["false"]
      variable = "aws:ResourceTag/elbv2.k8s.aws/cluster"
      }, {
      test     = "Null"
      values   = ["true"]
      variable = "aws:RequestTag/elbv2.k8s.aws/cluster"
    }]
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["arn:aws:ec2:*:*:security-group/*"]
    sid            = ""
    }, {
    actions = ["ec2:AuthorizeSecurityGroupIngress", "ec2:DeleteSecurityGroup", "ec2:RevokeSecurityGroupIngress"]
    condition = [{
      test     = "Null"
      values   = ["false"]
      variable = "aws:ResourceTag/elbv2.k8s.aws/cluster"
    }]
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["*"]
    sid            = ""
    }, {
    actions = ["elasticloadbalancing:CreateLoadBalancer", "elasticloadbalancing:CreateTargetGroup"]
    condition = [{
      test     = "Null"
      values   = ["false"]
      variable = "aws:RequestTag/elbv2.k8s.aws/cluster"
    }]
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["*"]
    sid            = ""
    }, {
    actions        = ["elasticloadbalancing:CreateListener", "elasticloadbalancing:CreateRule", "elasticloadbalancing:DeleteListener", "elasticloadbalancing:DeleteRule"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["*"]
    sid            = ""
    }, {
    actions = ["elasticloadbalancing:AddTags", "elasticloadbalancing:RemoveTags"]
    condition = [{
      test     = "Null"
      values   = ["false"]
      variable = "aws:ResourceTag/elbv2.k8s.aws/cluster"
      }, {
      test     = "Null"
      values   = ["true"]
      variable = "aws:RequestTag/elbv2.k8s.aws/cluster"
    }]
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*", "arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*", "arn:aws:elasticloadbalancing:*:*:targetgroup/*/*"]
    sid            = ""
    }, {
    actions        = ["elasticloadbalancing:AddTags", "elasticloadbalancing:RemoveTags"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["arn:aws:elasticloadbalancing:*:*:listener-rule/app/*/*/*", "arn:aws:elasticloadbalancing:*:*:listener-rule/net/*/*/*", "arn:aws:elasticloadbalancing:*:*:listener/app/*/*/*", "arn:aws:elasticloadbalancing:*:*:listener/net/*/*/*"]
    sid            = ""
    }, {
    actions = ["elasticloadbalancing:DeleteLoadBalancer", "elasticloadbalancing:DeleteTargetGroup", "elasticloadbalancing:ModifyCapacityReservation", "elasticloadbalancing:ModifyIpPools", "elasticloadbalancing:ModifyListenerAttributes", "elasticloadbalancing:ModifyLoadBalancerAttributes", "elasticloadbalancing:ModifyTargetGroup", "elasticloadbalancing:ModifyTargetGroupAttributes", "elasticloadbalancing:SetIpAddressType", "elasticloadbalancing:SetSecurityGroups", "elasticloadbalancing:SetSubnets"]
    condition = [{
      test     = "Null"
      values   = ["false"]
      variable = "aws:ResourceTag/elbv2.k8s.aws/cluster"
    }]
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["*"]
    sid            = ""
    }, {
    actions = ["elasticloadbalancing:AddTags"]
    condition = [{
      test     = "Null"
      values   = ["false"]
      variable = "aws:RequestTag/elbv2.k8s.aws/cluster"
      }, {
      test     = "StringEquals"
      values   = ["CreateTargetGroup", "CreateLoadBalancer"]
      variable = "elasticloadbalancing:CreateAction"
    }]
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*", "arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*", "arn:aws:elasticloadbalancing:*:*:targetgroup/*/*"]
    sid            = ""
    }, {
    actions        = ["elasticloadbalancing:DeregisterTargets", "elasticloadbalancing:RegisterTargets"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["arn:aws:elasticloadbalancing:*:*:targetgroup/*/*"]
    sid            = ""
    }, {
    actions        = ["elasticloadbalancing:AddListenerCertificates", "elasticloadbalancing:ModifyListener", "elasticloadbalancing:ModifyRule", "elasticloadbalancing:RemoveListenerCertificates", "elasticloadbalancing:SetRulePriorities", "elasticloadbalancing:SetWebAcl"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["*"]
    sid            = ""
  }]
}

module "stackgen_2c4b2f18-b37a-53fe-ba81-0202e2b3b76a" {
  source = "./modules/null_resource"
}

module "stackgen_2d3883cc-0285-5842-ba3e-ae5007a68352" {
  source = "./modules/data_aws_caller_identity"
}

module "stackgen_31d7ccf9-97bb-550e-881c-ea03d84d0da6" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_6cb03677-4a41-5ff3-8394-544eaffe9a23.name
}

module "stackgen_31ff0b8a-f1af-51e9-8873-b47d808f78ba" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_a51d54c8-fc59-5d1f-bcb5-f4c4feb742b9.name
}

module "stackgen_333af998-c115-5049-a4e9-ce41d79bdbfd" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_b5dcabf6-ad83-53ad-8b32-0f250aac030d.arn
  role       = module.stackgen_f9fee92e-0d9b-531d-b33c-9d42bad8acb2.name
}

module "stackgen_35f62127-f837-5e73-b62b-96327e0de448" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Sid\":\"EKSNodeAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = "EKS managed node group IAM role"
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "managed-nodegroup-2-eks-node-group-20251009173331005400000014"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_36c6525d-bb72-580e-a850-1a44af7d5a09" {
  source = "./modules/aws_internet_gateway"
  tags = {
    Name             = "retail-store"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  vpc_id = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_3c25f244-7c82-585b-b511-390b9fa1da4e" {
  source         = "./modules/aws_route_table_association"
  gateway_id     = ""
  route_table_id = module.stackgen_21b17b50-c073-54ab-aaf3-662db6da5665.id
  subnet_id      = module.stackgen_1035c3f1-b526-555f-af0f-1f468c5d9d61.id
}

module "stackgen_3d8e470a-ca07-5963-9dfa-764e42587e71" {
  source      = "./modules/aws_elasticache_subnet_group"
  description = "Elasticache subnet group for retail-store-checkout"
  name        = "retail-store-checkout"
  subnet_ids = [
    module.stackgen_88bb083b-9e45-5b64-a250-ffc4d2acbe5f.id,
    module.stackgen_1035c3f1-b526-555f-af0f-1f468c5d9d61.id,
    module.stackgen_889eaaf4-581f-5fbe-a398-bb14b7a92ae5.id,
  ]
  tags = {
    Name             = "retail-store-checkout"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_3df67ea7-856b-5767-9ae8-a3d61048515c" {
  source                 = "./modules/aws_default_route_table"
  default_route_table_id = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.default_route_table_id
  propagating_vgws       = []
  route                  = []
  tags = {
    Name             = "retail-store-default"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = {
    create = "5m"
    update = "5m"
  }
}

module "stackgen_3e78a077-0ca9-5355-b9a7-6abfa7f3100f" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = module.stackgen_35f62127-f837-5e73-b62b-96327e0de448.name
}

module "stackgen_3f237aaa-ae99-5272-b6e0-2d71d2445d38" {
  source                      = "./modules/aws_route"
  carrier_gateway_id          = ""
  core_network_arn            = ""
  destination_cidr_block      = "0.0.0.0/0"
  destination_ipv6_cidr_block = ""
  destination_prefix_list_id  = ""
  egress_only_gateway_id      = ""
  gateway_id                  = ""
  local_gateway_id            = ""
  nat_gateway_id              = "nat-0bfb20d204ec247b6"
  network_interface_id        = ""
  route_table_id              = "rtb-0608b647cda280589"
  timeouts = {
    create = "5m"
    delete = null
    update = null
  }
  transit_gateway_id        = ""
  vpc_endpoint_id           = ""
  vpc_peering_connection_id = ""
}

module "stackgen_404481e2-42c2-55fe-a560-5799749062b9" {
  source              = "./modules/aws_s3_bucket"
  bucket              = "retail-store-trace-logs"
  force_destroy       = false
  object_lock_enabled = false
  tags = {
    Environment = "Dev"
    Name        = "Environment"
  }
}

module "stackgen_410c5df7-858c-5902-b0bb-4bb44ade3ae9" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_6cb03677-4a41-5ff3-8394-544eaffe9a23.name
}

module "stackgen_4194fea2-8efb-5ccb-90d4-84e4505e1ec4" {
  source                     = "./modules/aws_elasticache_replication_group"
  apply_immediately          = true
  at_rest_encryption_enabled = "false"
  auth_token                 = var.auth_token_4194fea2-8efb-5ccb-90d4-84e4505e1ec4
  auth_token_update_strategy = "ROTATE"
  auto_minor_version_upgrade = "true"
  automatic_failover_enabled = false
  description                = "retail-store-checkout"
  engine                     = "redis"
  engine_version             = "4.0.10"
  kms_key_id                 = ""
  log_delivery_configuration = []
  maintenance_window         = "wed:03:00-wed:04:00"
  multi_az_enabled           = false
  node_type                  = "cache.t3.micro"
  num_cache_clusters         = 1
  parameter_group_name       = "retail-store-checkout"
  port                       = 6379
  replication_group_id       = "retail-store-checkout"
  snapshot_retention_limit   = 0
  tags = {
    Name             = "retail-store-checkout"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  transit_encryption_enabled = false
}

module "stackgen_427df23c-c79a-5c0e-8df7-3840c1d853cc" {
  source                    = "./modules/data_aws_iam_policy_document"
  override_json             = null
  override_policy_documents = null
  policy_id                 = null
  source_json               = null
  source_policy_documents   = null
  statement = [{
    actions = ["sts:AssumeRoleWithWebIdentity"]
    condition = [{
      test     = "StringEquals"
      values   = ["sts.amazonaws.com"]
      variable = "oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739:aud"
      }, {
      test     = "StringEquals"
      values   = ["system:serviceaccount:kube-system:aws-load-balancer-controller-sa"]
      variable = "oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739:sub"
    }]
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals = [{
      identifiers = ["arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739"]
      type        = "Federated"
    }]
    resources = []
    sid       = ""
  }]
}

module "stackgen_460edd81-a9e2-5cff-990c-e5b14ac50ac1" {
  source                    = "./modules/data_aws_iam_policy_document"
  override_json             = null
  override_policy_documents = null
  policy_id                 = null
  source_json               = null
  source_policy_documents   = null
  statement = [{
    actions        = ["kms:CancelKeyDeletion", "kms:Create*", "kms:Delete*", "kms:Describe*", "kms:Disable*", "kms:Enable*", "kms:Get*", "kms:ImportKeyMaterial", "kms:List*", "kms:Put*", "kms:ReplicateKey", "kms:Revoke*", "kms:ScheduleKeyDeletion", "kms:TagResource", "kms:UntagResource", "kms:Update*"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals = [{
      identifiers = ["arn:aws:iam::339712749745:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_AdministratorAccess_90ce8fbcbe3cc328"]
      type        = "AWS"
    }]
    resources = ["*"]
    sid       = "KeyAdministration"
    }, {
    actions        = ["kms:Decrypt", "kms:DescribeKey", "kms:Encrypt", "kms:GenerateDataKey*", "kms:ReEncrypt*"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals = [{
      identifiers = ["arn:aws:iam::339712749745:role/retail-store-cluster-20251009173123442400000005"]
      type        = "AWS"
    }]
    resources = ["*"]
    sid       = "KeyUsage"
  }]
}

module "stackgen_461fb8ac-e5c7-5efe-a73a-575940829551" {
  source                 = "./modules/data_aws_availability_zones"
  all_availability_zones = null
  exclude_names          = null
  exclude_zone_ids       = null
  state                  = "available"
}

module "stackgen_46d6e57d-08d9-5ac4-8bcf-66e52ee12c25" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = null
  description              = "Node to node all ports/protocols"
  from_port                = 0
  ipv6_cidr_blocks         = null
  prefix_list_ids          = []
  protocol                 = "-1"
  security_group_id        = module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.id
  self                     = true
  source_security_group_id = null
  to_port                  = 0
  type                     = "ingress"
}

module "stackgen_47c687cb-c230-5f90-92e2-66e7dc99054e" {
  source = "./modules/data_aws_partition"
}

module "stackgen_485611a9-ca8a-577c-b2aa-c9bc8d12fa4d" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739:sub\":\"system:serviceaccount:kube-system:aws-load-balancer-controller-sa\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739\"}}],\"Version\":\"2012-10-17\"}"
  description           = "IRSA for aws-load-balancer-controller project"
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "alb-controller-2025100918011472640000000a"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_488e85b1-9435-5dc6-ac58-3d70f55ffde6" {
  source      = "./modules/aws_ec2_tag"
  key         = "environment-name"
  resource_id = "sg-0220669a4dfafa872"
  value       = "retail-store"
}

module "stackgen_49a9acb0-3e4e-5aae-a5d7-fbfec02ac2d4" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = ["10.0.0.0/16"]
  description              = null
  from_port                = 53
  ipv6_cidr_blocks         = null
  prefix_list_ids          = null
  protocol                 = "udp"
  security_group_id        = module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.id
  self                     = false
  source_security_group_id = null
  to_port                  = 53
  type                     = "ingress"
}

module "stackgen_4b8618c5-5414-513d-8458-096ad808c215" {
  source = "./modules/data_aws_caller_identity"
}

module "stackgen_4ea98a6f-7611-5734-a6cf-67ce47e792c4" {
  source = "./modules/data_aws_partition"
}

module "stackgen_503b3840-d7d1-52b3-96ad-f9dd997db457" {
  source        = "./modules/aws_kms_alias"
  name          = "alias/eks/retail-store"
  target_key_id = module.stackgen_085052dc-7ced-556e-9d17-b5f74fa17dd0.key_id
}

module "stackgen_50c10d0b-0585-5fe7-b71c-7c1e4721a927" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/eks/retail-store/cluster"
  retention_in_days = 90
  tags = {
    Name             = "/aws/eks/retail-store/cluster"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_513fdee8-3275-583a-a5c2-977c859818a2" {
  source = "./modules/aws_route_table"
  route = [{
    carrier_gateway_id         = ""
    cidr_block                 = "0.0.0.0/0"
    core_network_arn           = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    gateway_id                 = "igw-057a68349faa17af7"
    ipv6_cidr_block            = ""
    local_gateway_id           = ""
    nat_gateway_id             = ""
    network_interface_id       = ""
    transit_gateway_id         = ""
    vpc_endpoint_id            = ""
    vpc_peering_connection_id  = ""
  }]
  tags = {
    Name             = "retail-store-public"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  vpc_id = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_5386ef77-2ecb-5529-a6e6-2c7bb45f7c30" {
  source                    = "./modules/data_aws_iam_policy_document"
  override_json             = null
  override_policy_documents = null
  policy_id                 = null
  source_json               = null
  source_policy_documents   = null
  statement = [{
    actions = ["sts:AssumeRoleWithWebIdentity", "sts:TagSession"]
    condition = [{
      test     = "StringEquals"
      values   = ["system:serviceaccount:opentelemetry-operator-system:adot-col-container-logs"]
      variable = "oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739:sub"
    }]
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals = [{
      identifiers = ["arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739"]
      type        = "Federated"
    }]
    resources = []
    sid       = ""
  }]
}

module "stackgen_5419323d-e3b5-54db-991f-7522879fa01e" {
  source      = "./modules/aws_security_group"
  description = "EKS cluster security group"
  egress      = []
  ingress = [{
    cidr_blocks      = []
    description      = "Node groups to cluster API"
    from_port        = 443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-0b6c6c173f6f34d3e"]
    self             = false
    to_port          = 443
  }]
  name                   = "retail-store-cluster-20251009173325015000000012"
  revoke_rules_on_delete = false
  tags = {
    Name             = "retail-store-cluster"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
  vpc_id   = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_543bbc87-4502-5a7d-8fba-bed2491e343f" {
  source         = "./modules/aws_route_table_association"
  gateway_id     = ""
  route_table_id = module.stackgen_513fdee8-3275-583a-a5c2-977c859818a2.id
  subnet_id      = module.stackgen_92aef2fe-54a5-5c32-b10a-6195025d7af2.id
}

module "stackgen_59e5d90c-f2b9-529f-9a3b-e23013057cfb" {
  source                    = "./modules/data_aws_iam_policy_document"
  override_json             = null
  override_policy_documents = null
  policy_id                 = null
  source_json               = null
  source_policy_documents   = null
  statement = [{
    actions        = ["sts:AssumeRole"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals = [{
      identifiers = ["monitoring.rds.amazonaws.com"]
      type        = "Service"
    }]
    resources = []
    sid       = ""
  }]
}

module "stackgen_5b5c3aa3-c776-5fa6-a444-392603620860" {
  source = "./modules/data_aws_partition"
}

module "stackgen_5db11829-c346-5c74-a079-c91ac3d0a5d4" {
  source = "./modules/aws_dynamodb_table"
  attribute = [{
    name = "customerId"
    type = "S"
    }, {
    name = "id"
    type = "S"
  }]
  billing_mode = "PAY_PER_REQUEST"
  global_secondary_index = [{
    hash_key             = "customerId"
    name                 = "idx_global_customerId"
    non_key_attributes   = []
    on_demand_throughput = []
    projection_type      = "ALL"
    range_key            = ""
    read_capacity        = 0
    write_capacity       = 0
  }]
  hash_key              = "id"
  local_secondary_index = []
  name                  = "retail-store-carts"
  point_in_time_recovery = [{
    enabled                 = false
    recovery_period_in_days = 0
  }]
  range_key              = null
  read_capacity          = 0
  server_side_encryption = []
  stream_enabled         = false
  stream_view_type       = ""
  tags = {
    Name             = "retail-store-carts"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = {
    create = "10m"
    delete = "10m"
    update = "60m"
  }
  ttl = [{
    attribute_name = ""
    enabled        = false
  }]
  write_capacity = 0
}

module "stackgen_60a63b69-1cb2-5161-911c-31012f8d14f5" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = null
  description              = "Node to node ingress on ephemeral ports"
  from_port                = 1025
  ipv6_cidr_blocks         = null
  prefix_list_ids          = []
  protocol                 = "tcp"
  security_group_id        = module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.id
  self                     = true
  source_security_group_id = null
  to_port                  = 65535
  type                     = "ingress"
}

module "stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a" {
  source                               = "./modules/aws_vpc"
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  tags = {
    Name             = "retail-store"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_61efdefc-0377-5096-88ed-9279e18a475d" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"ArnLike\":{\"aws:PrincipalArn\":\"arn:aws:iam::339712749745:role/cert-manager-*\"}},\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"*\"},\"Sid\":\"ExplicitSelfRoleAssumption\"},{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739:sub\":\"system:serviceaccount:cert-manager:cert-manager\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739\"}}],\"Version\":\"2012-10-17\"}"
  description           = "IRSA for cert-manger project"
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "cert-manager-2025100918011472660000000b"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_61fdcc58-fab7-5c58-a402-4c8be520c38d" {
  source = "./modules/data_aws_caller_identity"
}

module "stackgen_64ad3123-9b53-58ba-b3e6-3b72c0cda733" {
  source = "./modules/data_aws_partition"
}

module "stackgen_64b18fc2-6bfe-5191-8d34-477f72558cd2" {
  source = "./modules/data_aws_partition"
}

module "stackgen_6501d29c-cbf2-5728-bbde-c0646ee9fbe9" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":[\"sts:TagSession\",\"sts:AssumeRoleWithWebIdentity\"],\"Condition\":{\"StringEquals\":{\"oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739:sub\":\"system:serviceaccount:opentelemetry-operator-system:adot-col-otlp-ingest\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "retail-store-adot-col-xray"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_66458e5f-8d06-50aa-bb2c-0f1247abf8c9" {
  source = "./modules/data_aws_caller_identity"
}

module "stackgen_66ce41f3-6a50-5060-b281-0af00238fbd2" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = null
  description              = "Node groups to cluster API"
  from_port                = 443
  ipv6_cidr_blocks         = null
  prefix_list_ids          = null
  protocol                 = "tcp"
  security_group_id        = module.stackgen_5419323d-e3b5-54db-991f-7522879fa01e.id
  self                     = false
  source_security_group_id = "sg-0b6c6c173f6f34d3e"
  to_port                  = 443
  type                     = "ingress"
}

module "stackgen_68edfdb9-fb62-5a00-bfcd-095ae9464407" {
  source           = "./modules/time_sleep"
  create_duration  = "30s"
  destroy_duration = null
}

module "stackgen_69d6ce62-0148-5243-8d8d-47201d69c9a1" {
  source                               = "./modules/aws_launch_template"
  block_device_mappings                = []
  capacity_reservation_specification   = []
  cpu_options                          = []
  credit_specification                 = []
  default_version                      = 1
  description                          = "Custom launch template for managed-nodegroup-1 EKS managed node group"
  disable_api_termination              = false
  ebs_optimized                        = ""
  elastic_gpu_specifications           = []
  elastic_inference_accelerator        = []
  enclave_options                      = []
  hibernation_options                  = []
  iam_instance_profile                 = []
  image_id                             = ""
  instance_initiated_shutdown_behavior = ""
  instance_market_options              = []
  instance_type                        = ""
  kernel_id                            = ""
  key_name                             = ""
  license_specification                = []
  maintenance_options                  = []
  metadata_options = [{
    http_endpoint               = "enabled"
    http_protocol_ipv6          = ""
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = ""
  }]
  monitoring = [{
    enabled = true
  }]
  name                     = "node_group_1-20251009180112665900000008"
  network_interfaces       = []
  placement                = []
  private_dns_name_options = []
  ram_disk_id              = ""
  security_group_names     = []
  tag_specifications = [{
    resource_type = "instance"
    tags = {
      Name             = "managed-nodegroup-1"
      created-by       = "retail-store-sample-app"
      environment-name = "retail-store"
    }
    }, {
    resource_type = "network-interface"
    tags = {
      Name             = "managed-nodegroup-1"
      created-by       = "retail-store-sample-app"
      environment-name = "retail-store"
    }
    }, {
    resource_type = "volume"
    tags = {
      Name             = "managed-nodegroup-1"
      created-by       = "retail-store-sample-app"
      environment-name = "retail-store"
    }
  }]
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  update_default_version = true
  user_data              = ""
  vpc_security_group_ids = [
    module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.id,
  ]
}

module "stackgen_6a9ef1b6-d9ae-57c8-822e-4ad02775303b" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = null
  description              = "Cluster API to node 4443/tcp webhook"
  from_port                = 4443
  ipv6_cidr_blocks         = null
  prefix_list_ids          = []
  protocol                 = "tcp"
  security_group_id        = module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.id
  self                     = false
  source_security_group_id = "sg-017eaab9b23b68382"
  to_port                  = 4443
  type                     = "ingress"
}

module "stackgen_6bcf3acd-3b68-5184-a987-bef4ee02cc84" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  role       = module.stackgen_a16e4a98-b90b-5e84-a99e-5d91911017bd.name
}

module "stackgen_6cb03677-4a41-5ff3-8394-544eaffe9a23" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Sid\":\"EKSNodeAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = "EKS managed node group IAM role"
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "managed-nodegroup-3-eks-node-group-20251009173331238700000015"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf" {
  source      = "./modules/aws_security_group"
  description = "EKS node shared security group"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Node all egress"
    from_port        = 0
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["10.0.0.0/16"]
    description      = ""
    from_port        = 53
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 53
    }, {
    cidr_blocks      = ["10.0.0.0/16"]
    description      = ""
    from_port        = 53
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "udp"
    security_groups  = []
    self             = false
    to_port          = 53
    }, {
    cidr_blocks      = []
    description      = "Cluster API to Nodegroup all traffic"
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = ["sg-017eaab9b23b68382"]
    self             = false
    to_port          = 0
    }, {
    cidr_blocks      = []
    description      = "Cluster API to node 4443/tcp webhook"
    from_port        = 4443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-017eaab9b23b68382"]
    self             = false
    to_port          = 4443
    }, {
    cidr_blocks      = []
    description      = "Cluster API to node 6443/tcp webhook"
    from_port        = 6443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-017eaab9b23b68382"]
    self             = false
    to_port          = 6443
    }, {
    cidr_blocks      = []
    description      = "Cluster API to node 8443/tcp webhook"
    from_port        = 8443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-017eaab9b23b68382"]
    self             = false
    to_port          = 8443
    }, {
    cidr_blocks      = []
    description      = "Cluster API to node 9443/tcp webhook"
    from_port        = 9443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-017eaab9b23b68382"]
    self             = false
    to_port          = 9443
    }, {
    cidr_blocks      = []
    description      = "Cluster API to node groups"
    from_port        = 443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-017eaab9b23b68382"]
    self             = false
    to_port          = 443
    }, {
    cidr_blocks      = []
    description      = "Cluster API to node kubelets"
    from_port        = 10250
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-017eaab9b23b68382"]
    self             = false
    to_port          = 10250
    }, {
    cidr_blocks      = []
    description      = "Node to node CoreDNS UDP"
    from_port        = 53
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "udp"
    security_groups  = []
    self             = true
    to_port          = 53
    }, {
    cidr_blocks      = []
    description      = "Node to node CoreDNS"
    from_port        = 53
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = true
    to_port          = 53
    }, {
    cidr_blocks      = []
    description      = "Node to node all ports/protocols"
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = true
    to_port          = 0
    }, {
    cidr_blocks      = []
    description      = "Node to node ingress on ephemeral ports"
    from_port        = 1025
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = true
    to_port          = 65535
    }, {
    cidr_blocks      = []
    description      = "elbv2.k8s.aws/targetGroupBinding=shared"
    from_port        = 8080
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-088307b8e770ebcf6"]
    self             = false
    to_port          = 8080
  }]
  name                   = "retail-store-node-2025100917332501350000000f"
  revoke_rules_on_delete = false
  tags = {
    Name                                 = "retail-store-node"
    created-by                           = "retail-store-sample-app"
    environment-name                     = "retail-store"
    "kubernetes.io/cluster/retail-store" = "owned"
  }
  timeouts = null
  vpc_id   = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_6d3e2e85-c3bd-5a31-befc-5ca1b1595119" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name                                 = "retail-store-public-us-east-1a"
    created-by                           = "retail-store-sample-app"
    environment-name                     = "retail-store"
    "kubernetes.io/cluster/retail-store" = "shared"
    "kubernetes.io/role/elb"             = "1"
  }
  vpc_id = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_6dee6a07-5cce-517e-84c5-03185cbfd854" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_35f62127-f837-5e73-b62b-96327e0de448.name
}

module "stackgen_70b0aaa0-d37a-59ac-8ef1-80e70a658a5c" {
  source = "./modules/data_aws_partition"
}

module "stackgen_72464a4d-dd86-5bd4-b6e7-2b8dd6192e6c" {
  source = "./modules/data_aws_partition"
}

module "stackgen_727c86d5-8bfb-508a-be79-5e49aba69e5e" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = null
  description              = "Cluster API to Nodegroup all traffic"
  from_port                = 0
  ipv6_cidr_blocks         = null
  prefix_list_ids          = []
  protocol                 = "-1"
  security_group_id        = module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.id
  self                     = false
  source_security_group_id = "sg-017eaab9b23b68382"
  to_port                  = 0
  type                     = "ingress"
}

module "stackgen_72bdbdcd-5158-5871-8431-9851875edba4" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = null
  description              = "Cluster API to node 8443/tcp webhook"
  from_port                = 8443
  ipv6_cidr_blocks         = null
  prefix_list_ids          = []
  protocol                 = "tcp"
  security_group_id        = module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.id
  self                     = false
  source_security_group_id = "sg-017eaab9b23b68382"
  to_port                  = 8443
  type                     = "ingress"
}

module "stackgen_73753da0-5aa4-5dc9-a0d2-56efa8a29801" {
  source = "./modules/data_aws_partition"
}

module "stackgen_757a8e99-2537-5ec0-aa47-1cf8953af370" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = module.stackgen_a51d54c8-fc59-5d1f-bcb5-f4c4feb742b9.name
}

module "stackgen_766510af-3a1c-5553-b3b2-76b3a5e5d511" {
  source = "./modules/null_resource"
}

module "stackgen_788b00e0-272b-5bae-9af9-46937c8c450f" {
  source                    = "./modules/data_aws_iam_policy_document"
  override_json             = null
  override_policy_documents = null
  policy_id                 = null
  source_json               = null
  source_policy_documents   = null
  statement = [{
    actions = ["sts:AssumeRoleWithWebIdentity", "sts:TagSession"]
    condition = [{
      test     = "StringEquals"
      values   = ["system:serviceaccount:carts:carts"]
      variable = "oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739:sub"
    }]
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals = [{
      identifiers = ["arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739"]
      type        = "Federated"
    }]
    resources = []
    sid       = ""
  }]
}

module "stackgen_78ef85a1-cf50-5e55-b832-100c3003175f" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_35f62127-f837-5e73-b62b-96327e0de448.name
}

module "stackgen_791cf9ff-f969-543c-a89b-4cee88431223" {
  source      = "./modules/aws_security_group"
  description = "Security group for Elasticache Redis"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow all egress"
    from_port        = 0
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = []
    description      = "Selectively allow inbound traffic"
    from_port        = 6379
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-0b6c6c173f6f34d3e"]
    self             = false
    to_port          = 6379
  }]
  name                   = "retail-store-checkout-20251009173345434500000023"
  revoke_rules_on_delete = false
  tags = {
    Name             = "retail-store-checkout"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = {
    create = "10m"
    delete = "15m"
  }
  vpc_id = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_795eb769-4621-58a9-8b61-524a9018d83d" {
  source = "./modules/null_resource"
}

module "stackgen_7cb9d721-8b9a-5123-9074-2dd008c25702" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = null
  description              = "Node to node CoreDNS UDP"
  from_port                = 53
  ipv6_cidr_blocks         = null
  prefix_list_ids          = []
  protocol                 = "udp"
  security_group_id        = module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.id
  self                     = true
  source_security_group_id = null
  to_port                  = 53
  type                     = "ingress"
}

module "stackgen_7d00b26e-7a4f-5bbd-be2c-5fa474ca4fe7" {
  source         = "./modules/aws_route_table_association"
  gateway_id     = ""
  route_table_id = module.stackgen_513fdee8-3275-583a-a5c2-977c859818a2.id
  subnet_id      = module.stackgen_bbc52756-76a5-5d72-8f31-15c63a023515.id
}

module "stackgen_7d57e7a3-cbd7-5739-ab75-53f3e798b549" {
  source = "./modules/data_aws_caller_identity"
}

module "stackgen_7ed17ace-f1c7-5f17-a85e-3695cff5dd87" {
  source       = "./modules/aws_db_parameter_group"
  description  = "Managed by Terraform"
  family       = "aurora-postgresql15"
  name         = "retail-store-orders-20251009173123417600000003"
  name_prefix  = "retail-store-orders-"
  parameter    = []
  skip_destroy = false
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_7f744985-0b4a-5363-9ed9-88e6aa6b2a0d" {
  source                    = "./modules/data_aws_iam_policy_document"
  override_json             = null
  override_policy_documents = null
  policy_id                 = null
  source_json               = null
  source_policy_documents   = null
  statement = [{
    actions = ["sts:AssumeRoleWithWebIdentity", "sts:TagSession"]
    condition = [{
      test     = "StringEquals"
      values   = ["system:serviceaccount:opentelemetry-operator-system:adot-col-otlp-ingest"]
      variable = "oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739:sub"
    }]
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals = [{
      identifiers = ["arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739"]
      type        = "Federated"
    }]
    resources = []
    sid       = ""
  }]
}

module "stackgen_8076336a-31d7-5546-a4dc-166eada064a6" {
  source                     = "./modules/aws_mq_broker"
  apply_immediately          = true
  authentication_strategy    = "simple"
  auto_minor_version_upgrade = true
  broker_name                = "retail-store-orders-broker"
  configuration = [{
    id       = "c-dd1503dc-6243-416a-b0ad-43305eb073cc"
    revision = 1
  }]
  deployment_mode = "SINGLE_INSTANCE"
  encryption_options = [{
    kms_key_id        = ""
    use_aws_owned_key = true
  }]
  engine_type          = "RabbitMQ"
  engine_version       = "3.13"
  host_instance_type   = "mq.t3.micro"
  ldap_server_metadata = []
  logs = [{
    audit   = ""
    general = false
  }]
  maintenance_window_start_time = [{
    day_of_week = "MONDAY"
    time_of_day = "22:00"
    time_zone   = "UTC"
  }]
  publicly_accessible = false
  security_groups = [
    module.stackgen_177f2dbf-0d1f-5f0e-a688-295555ad5a26.id,
  ]
  storage_type = "ebs"
  subnet_ids   = ["subnet-017ecc38a1283e4b8"]
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  user = []
}

module "stackgen_82256cc6-29bf-5c68-badb-4ab3b98f6b51" {
  source      = "./modules/aws_rds_cluster_parameter_group"
  description = "Managed by Terraform"
  family      = "aurora-postgresql15"
  name        = "retail-store-orders-20251009173123417500000002"
  name_prefix = "retail-store-orders-"
  parameter   = []
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_840699ac-9b97-5ad5-a6a0-ff51315b0fe7" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess"
  role       = module.stackgen_6501d29c-cbf2-5728-bbde-c0646ee9fbe9.name
}

module "stackgen_84391fcc-8e8c-52a3-b09c-b08412663799" {
  source = "./modules/data_aws_eks_cluster_auth"
  name   = "retail-store"
}

module "stackgen_8701ff9d-ddbf-54e5-81aa-3b7607c1e55d" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = null
  description              = "Cluster API to node kubelets"
  from_port                = 10250
  ipv6_cidr_blocks         = null
  prefix_list_ids          = []
  protocol                 = "tcp"
  security_group_id        = module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.id
  self                     = false
  source_security_group_id = "sg-017eaab9b23b68382"
  to_port                  = 10250
  type                     = "ingress"
}

module "stackgen_889eaaf4-581f-5fbe-a398-bb14b7a92ae5" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1c"
  cidr_block              = "10.0.12.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name                                 = "retail-store-private-us-east-1c"
    created-by                           = "retail-store-sample-app"
    environment-name                     = "retail-store"
    "kubernetes.io/cluster/retail-store" = "shared"
    "kubernetes.io/role/internal-elb"    = "1"
  }
  vpc_id = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_88bb083b-9e45-5b64-a250-ffc4d2acbe5f" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.10.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name                                 = "retail-store-private-us-east-1a"
    created-by                           = "retail-store-sample-app"
    environment-name                     = "retail-store"
    "kubernetes.io/cluster/retail-store" = "shared"
    "kubernetes.io/role/internal-elb"    = "1"
  }
  vpc_id = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_8998c9cd-72ad-5c1d-8a92-e35282cb5d9c" {
  source                             = "./modules/aws_rds_cluster"
  availability_zones                 = ["us-east-1a", "us-east-1b", "us-east-1c"]
  backup_retention_period            = 7
  cluster_identifier                 = "retail-store-catalog"
  copy_tags_to_snapshot              = false
  database_name                      = "catalog"
  db_subnet_group_name               = "retail-store-catalog"
  enable_global_write_forwarding     = false
  enable_local_write_forwarding      = false
  enabled_cloudwatch_logs_exports    = []
  engine                             = "aurora-mysql"
  engine_mode                        = "provisioned"
  engine_version                     = "8.0"
  global_cluster_identifier          = ""
  kms_key_id                         = "arn:aws:kms:us-east-1:339712749745:key/102d37c1-0438-43b9-a8cc-8302cfa365cb"
  master_password                    = var.master_password_8998c9cd-72ad-5c1d-8a92-e35282cb5d9c
  master_username                    = "root"
  preferred_backup_window            = "02:00-03:00"
  preferred_maintenance_window       = "sun:05:00-sun:06:00"
  scaling_configuration              = []
  serverlessv2_scaling_configuration = []
  skip_final_snapshot                = true
  storage_encrypted                  = true
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  vpc_security_group_ids = [
    module.stackgen_d2d013e8-ef34-5243-875d-6f2ee50f0e87.id,
  ]
}

module "stackgen_8c76187a-335c-5170-a794-f32d262ef47d" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = null
  description              = "Cluster API to node 9443/tcp webhook"
  from_port                = 9443
  ipv6_cidr_blocks         = null
  prefix_list_ids          = []
  protocol                 = "tcp"
  security_group_id        = module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.id
  self                     = false
  source_security_group_id = "sg-017eaab9b23b68382"
  to_port                  = 9443
  type                     = "ingress"
}

module "stackgen_8e10ffab-d76c-5619-bd6d-1e98ba620c46" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_d630bcf0-017a-50ac-8677-8e5d2aa10825.arn
  role       = module.stackgen_485611a9-ca8a-577c-b2aa-c9bc8d12fa4d.name
}

module "stackgen_8ffa6481-28a5-5d26-bb02-927f211dc5e5" {
  source = "./modules/data_aws_caller_identity"
}

module "stackgen_917c8be5-d7a9-5b6b-91a2-0d159c15f427" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = null
  description              = "Selectively allow inbound traffic"
  from_port                = 6379
  ipv6_cidr_blocks         = null
  prefix_list_ids          = []
  protocol                 = "tcp"
  security_group_id        = module.stackgen_791cf9ff-f969-543c-a89b-4cee88431223.id
  self                     = false
  source_security_group_id = "sg-0b6c6c173f6f34d3e"
  to_port                  = 6379
  type                     = "ingress"
}

module "stackgen_9191a905-1026-5837-b177-5bf3216563a7" {
  source = "./modules/data_aws_caller_identity"
}

module "stackgen_92804688-3259-5633-8e0f-5290355c67fb" {
  source      = "./modules/aws_db_subnet_group"
  description = "For Aurora cluster retail-store-catalog"
  name        = "retail-store-catalog"
  name_prefix = ""
  subnet_ids = [
    module.stackgen_88bb083b-9e45-5b64-a250-ffc4d2acbe5f.id,
    module.stackgen_1035c3f1-b526-555f-af0f-1f468c5d9d61.id,
    module.stackgen_889eaaf4-581f-5fbe-a398-bb14b7a92ae5.id,
  ]
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_92aef2fe-54a5-5c32-b10a-6195025d7af2" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1b"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name                                 = "retail-store-public-us-east-1b"
    created-by                           = "retail-store-sample-app"
    environment-name                     = "retail-store"
    "kubernetes.io/cluster/retail-store" = "shared"
    "kubernetes.io/role/elb"             = "1"
  }
  vpc_id = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_935edbe5-4307-50f3-9d8e-aa550a229238" {
  source                    = "./modules/data_aws_iam_policy_document"
  override_json             = null
  override_policy_documents = null
  policy_id                 = null
  source_json               = null
  source_policy_documents   = ["{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": \"iam:CreateServiceLinkedRole\",\n      \"Resource\": \"*\",\n      \"Condition\": {\n        \"StringEquals\": {\n          \"iam:AWSServiceName\": \"elasticloadbalancing.amazonaws.com\"\n        }\n      }\n    },\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"elasticloadbalancing:DescribeTrustStores\",\n        \"elasticloadbalancing:DescribeTargetHealth\",\n        \"elasticloadbalancing:DescribeTargetGroups\",\n        \"elasticloadbalancing:DescribeTargetGroupAttributes\",\n        \"elasticloadbalancing:DescribeTags\",\n        \"elasticloadbalancing:DescribeSSLPolicies\",\n        \"elasticloadbalancing:DescribeRules\",\n        \"elasticloadbalancing:DescribeLoadBalancers\",\n        \"elasticloadbalancing:DescribeLoadBalancerAttributes\",\n        \"elasticloadbalancing:DescribeListeners\",\n        \"elasticloadbalancing:DescribeListenerCertificates\",\n        \"elasticloadbalancing:DescribeListenerAttributes\",\n        \"elasticloadbalancing:DescribeCapacityReservation\",\n        \"ec2:GetSecurityGroupsForVpc\",\n        \"ec2:GetCoipPoolUsage\",\n        \"ec2:DescribeVpcs\",\n        \"ec2:DescribeVpcPeeringConnections\",\n        \"ec2:DescribeTags\",\n        \"ec2:DescribeSubnets\",\n        \"ec2:DescribeSecurityGroups\",\n        \"ec2:DescribeNetworkInterfaces\",\n        \"ec2:DescribeIpamPools\",\n        \"ec2:DescribeInternetGateways\",\n        \"ec2:DescribeInstances\",\n        \"ec2:DescribeCoipPools\",\n        \"ec2:DescribeAvailabilityZones\",\n        \"ec2:DescribeAddresses\",\n        \"ec2:DescribeAccountAttributes\"\n      ],\n      \"Resource\": \"*\"\n    },\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"wafv2:GetWebACLForResource\",\n        \"wafv2:GetWebACL\",\n        \"wafv2:DisassociateWebACL\",\n        \"wafv2:AssociateWebACL\",\n        \"waf-regional:GetWebACLForResource\",\n        \"waf-regional:GetWebACL\",\n        \"waf-regional:DisassociateWebACL\",\n        \"waf-regional:AssociateWebACL\",\n        \"shield:GetSubscriptionState\",\n        \"shield:DescribeProtection\",\n        \"shield:DeleteProtection\",\n        \"shield:CreateProtection\",\n        \"iam:ListServerCertificates\",\n        \"iam:GetServerCertificate\",\n        \"cognito-idp:DescribeUserPoolClient\",\n        \"acm:ListCertificates\",\n        \"acm:DescribeCertificate\"\n      ],\n      \"Resource\": \"*\"\n    },\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"ec2:RevokeSecurityGroupIngress\",\n        \"ec2:AuthorizeSecurityGroupIngress\"\n      ],\n      \"Resource\": \"*\"\n    },\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": \"ec2:CreateSecurityGroup\",\n      \"Resource\": \"*\"\n    },\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": \"ec2:CreateTags\",\n      \"Resource\": \"arn:aws:ec2:*:*:security-group/*\",\n      \"Condition\": {\n        \"Null\": {\n          \"aws:RequestTag/elbv2.k8s.aws/cluster\": \"false\"\n        },\n        \"StringEquals\": {\n          \"ec2:CreateAction\": \"CreateSecurityGroup\"\n        }\n      }\n    },\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"ec2:DeleteTags\",\n        \"ec2:CreateTags\"\n      ],\n      \"Resource\": \"arn:aws:ec2:*:*:security-group/*\",\n      \"Condition\": {\n        \"Null\": {\n          \"aws:RequestTag/elbv2.k8s.aws/cluster\": \"true\",\n          \"aws:ResourceTag/elbv2.k8s.aws/cluster\": \"false\"\n        }\n      }\n    },\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"ec2:RevokeSecurityGroupIngress\",\n        \"ec2:DeleteSecurityGroup\",\n        \"ec2:AuthorizeSecurityGroupIngress\"\n      ],\n      \"Resource\": \"*\",\n      \"Condition\": {\n        \"Null\": {\n          \"aws:ResourceTag/elbv2.k8s.aws/cluster\": \"false\"\n        }\n      }\n    },\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"elasticloadbalancing:CreateTargetGroup\",\n        \"elasticloadbalancing:CreateLoadBalancer\"\n      ],\n      \"Resource\": \"*\",\n      \"Condition\": {\n        \"Null\": {\n          \"aws:RequestTag/elbv2.k8s.aws/cluster\": \"false\"\n        }\n      }\n    },\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"elasticloadbalancing:DeleteRule\",\n        \"elasticloadbalancing:DeleteListener\",\n        \"elasticloadbalancing:CreateRule\",\n        \"elasticloadbalancing:CreateListener\"\n      ],\n      \"Resource\": \"*\"\n    },\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"elasticloadbalancing:RemoveTags\",\n        \"elasticloadbalancing:AddTags\"\n      ],\n      \"Resource\": [\n        \"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\",\n        \"arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*\",\n        \"arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*\"\n      ],\n      \"Condition\": {\n        \"Null\": {\n          \"aws:RequestTag/elbv2.k8s.aws/cluster\": \"true\",\n          \"aws:ResourceTag/elbv2.k8s.aws/cluster\": \"false\"\n        }\n      }\n    },\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"elasticloadbalancing:RemoveTags\",\n        \"elasticloadbalancing:AddTags\"\n      ],\n      \"Resource\": [\n        \"arn:aws:elasticloadbalancing:*:*:listener/net/*/*/*\",\n        \"arn:aws:elasticloadbalancing:*:*:listener/app/*/*/*\",\n        \"arn:aws:elasticloadbalancing:*:*:listener-rule/net/*/*/*\",\n        \"arn:aws:elasticloadbalancing:*:*:listener-rule/app/*/*/*\"\n      ]\n    },\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"elasticloadbalancing:SetSubnets\",\n        \"elasticloadbalancing:SetSecurityGroups\",\n        \"elasticloadbalancing:SetIpAddressType\",\n        \"elasticloadbalancing:ModifyTargetGroupAttributes\",\n        \"elasticloadbalancing:ModifyTargetGroup\",\n        \"elasticloadbalancing:ModifyLoadBalancerAttributes\",\n        \"elasticloadbalancing:ModifyListenerAttributes\",\n        \"elasticloadbalancing:ModifyIpPools\",\n        \"elasticloadbalancing:ModifyCapacityReservation\",\n        \"elasticloadbalancing:DeleteTargetGroup\",\n        \"elasticloadbalancing:DeleteLoadBalancer\"\n      ],\n      \"Resource\": \"*\",\n      \"Condition\": {\n        \"Null\": {\n          \"aws:ResourceTag/elbv2.k8s.aws/cluster\": \"false\"\n        }\n      }\n    },\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": \"elasticloadbalancing:AddTags\",\n      \"Resource\": [\n        \"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\",\n        \"arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*\",\n        \"arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*\"\n      ],\n      \"Condition\": {\n        \"Null\": {\n          \"aws:RequestTag/elbv2.k8s.aws/cluster\": \"false\"\n        },\n        \"StringEquals\": {\n          \"elasticloadbalancing:CreateAction\": [\n            \"CreateTargetGroup\",\n            \"CreateLoadBalancer\"\n          ]\n        }\n      }\n    },\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"elasticloadbalancing:RegisterTargets\",\n        \"elasticloadbalancing:DeregisterTargets\"\n      ],\n      \"Resource\": \"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\"\n    },\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"elasticloadbalancing:SetWebAcl\",\n        \"elasticloadbalancing:SetRulePriorities\",\n        \"elasticloadbalancing:RemoveListenerCertificates\",\n        \"elasticloadbalancing:ModifyRule\",\n        \"elasticloadbalancing:ModifyListener\",\n        \"elasticloadbalancing:AddListenerCertificates\"\n      ],\n      \"Resource\": \"*\"\n    }\n  ]\n}"]
  statement                 = null
}

module "stackgen_95654f4e-c22e-51e6-a9bf-baf6956e16f4" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = ["0.0.0.0/0"]
  description              = "Allow all egress"
  from_port                = 0
  ipv6_cidr_blocks         = ["::/0"]
  prefix_list_ids          = []
  protocol                 = "-1"
  security_group_id        = module.stackgen_791cf9ff-f969-543c-a89b-4cee88431223.id
  self                     = false
  source_security_group_id = null
  to_port                  = 0
  type                     = "egress"
}

module "stackgen_9608704d-d778-5db8-b689-eede92d6da45" {
  source      = "./modules/aws_security_group"
  description = "Security group for checkout component"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow all egress"
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["10.0.0.0/16"]
    description      = "Allow inbound HTTP API traffic"
    from_port        = 8080
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 8080
    }, {
    cidr_blocks      = ["10.0.0.0/16"]
    description      = "Allow inbound Istio healthchecks"
    from_port        = 15020
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 15021
  }]
  name                   = "retail-store-checkout"
  revoke_rules_on_delete = false
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
  vpc_id   = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_96d6c021-7841-5c89-b5f4-55c68c6dc143" {
  source = "./modules/data_aws_partition"
}

module "stackgen_96f162b0-0dcc-57e1-abb3-c291f6e631fd" {
  source = "./modules/data_aws_partition"
}

module "stackgen_98a8d20f-66f7-5ac8-b8e8-6246805464db" {
  source      = "./modules/aws_ec2_tag"
  key         = "created-by"
  resource_id = "sg-0220669a4dfafa872"
  value       = "retail-store-sample-app"
}

module "stackgen_992520a7-75c5-5cf0-890b-5bf03003a9c7" {
  source           = "./modules/time_sleep"
  create_duration  = "30s"
  destroy_duration = null
}

module "stackgen_9a91c349-a860-55b8-ba35-f4eb9b699f6a" {
  source           = "./modules/random_string"
  length           = 10
  lower            = true
  min_lower        = 0
  min_numeric      = 0
  min_special      = 0
  min_upper        = 0
  numeric          = true
  override_special = null
  special          = false
  upper            = true
}

module "stackgen_9c39b20d-d008-5000-ac92-996e35933f67" {
  source      = "./modules/aws_security_group"
  description = "Security group for orders component"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow all egress"
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["10.0.0.0/16"]
    description      = "Allow inbound HTTP API traffic"
    from_port        = 8080
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 8080
    }, {
    cidr_blocks      = ["10.0.0.0/16"]
    description      = "Allow inbound Istio healthchecks"
    from_port        = 15020
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 15021
  }]
  name                   = "retail-store-orders"
  revoke_rules_on_delete = false
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
  vpc_id   = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_9d8c0267-4943-5613-97a6-5b0d439b9aa7" {
  source      = "./modules/aws_security_group"
  description = "Security group for catalog component"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow all egress"
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["10.0.0.0/16"]
    description      = "Allow inbound HTTP API traffic"
    from_port        = 8080
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 8080
    }, {
    cidr_blocks      = ["10.0.0.0/16"]
    description      = "Allow inbound Istio healthchecks"
    from_port        = 15020
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 15021
  }]
  name                   = "retail-store-catalog"
  revoke_rules_on_delete = false
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
  vpc_id   = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_9e1c24b5-fa26-5daf-8a46-0477ae77cbce" {
  source      = "./modules/aws_iam_policy"
  description = "IAM Policy for cert-manager"
  name        = "cert-manager-20251009173123454100000006"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":\"route53:GetChange\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:route53:::change/*\"},{\"Action\":[\"route53:ListResourceRecordSets\",\"route53:ChangeResourceRecordSets\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:route53:::hostedzone/*\"},{\"Action\":\"route53:ListHostedZonesByName\",\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_a16e4a98-b90b-5e84-a99e-5d91911017bd" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":[\"sts:TagSession\",\"sts:AssumeRoleWithWebIdentity\"],\"Condition\":{\"StringEquals\":{\"oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739:sub\":\"system:serviceaccount:opentelemetry-operator-system:adot-col-container-logs\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "retail-store-adot-col-logs"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_a51d54c8-fc59-5d1f-bcb5-f4c4feb742b9" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Sid\":\"EKSNodeAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = "EKS managed node group IAM role"
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "managed-nodegroup-1-eks-node-group-20251009173328865200000013"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_a5450dce-3217-59eb-bbd0-2be59482627d" {
  source      = "./modules/aws_rds_cluster_parameter_group"
  description = "Managed by Terraform"
  family      = "aurora-mysql8.0"
  name        = "retail-store-catalog-20251009173123438500000004"
  name_prefix = "retail-store-catalog-"
  parameter   = []
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_a798a11a-cdd7-57e4-92cf-59583751959e" {
  source = "./modules/data_aws_caller_identity"
}

module "stackgen_aa5505ac-352b-507c-add0-242185c9648a" {
  source = "./modules/data_aws_region"
}

module "stackgen_ab2b7356-a275-57b9-be01-e3ba69716138" {
  source                    = "./modules/data_aws_iam_policy_document"
  override_json             = null
  override_policy_documents = null
  policy_id                 = null
  source_json               = null
  source_policy_documents   = null
  statement = [{
    actions        = ["sts:AssumeRole"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals = [{
      identifiers = ["monitoring.rds.amazonaws.com"]
      type        = "Service"
    }]
    resources = []
    sid       = ""
  }]
}

module "stackgen_acc36a76-e5c5-5975-adc1-beb250c152b1" {
  source                    = "./modules/data_aws_iam_policy_document"
  override_json             = null
  override_policy_documents = null
  policy_id                 = null
  source_json               = null
  source_policy_documents   = null
  statement = [{
    actions        = ["route53:GetChange"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["arn:aws:route53:::change/*"]
    sid            = ""
    }, {
    actions        = ["route53:ChangeResourceRecordSets", "route53:ListResourceRecordSets"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["arn:aws:route53:::hostedzone/*"]
    sid            = ""
    }, {
    actions        = ["route53:ListHostedZonesByName"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals     = []
    resources      = ["*"]
    sid            = ""
  }]
}

module "stackgen_afbca3c7-f9e3-56ec-8838-d92850196ae7" {
  source = "./modules/data_aws_caller_identity"
}

module "stackgen_b04eaef4-af5c-5927-ad4f-2f3141fddd6d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = module.stackgen_f9fee92e-0d9b-531d-b33c-9d42bad8acb2.name
}

module "stackgen_b217e8ba-c097-573c-8a87-423fb3d37f11" {
  source                    = "./modules/data_aws_iam_policy_document"
  override_json             = null
  override_policy_documents = null
  policy_id                 = null
  source_json               = null
  source_policy_documents   = null
  statement = [{
    actions        = ["sts:AssumeRole"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals = [{
      identifiers = ["ec2.amazonaws.com"]
      type        = "Service"
    }]
    resources = []
    sid       = "EKSNodeAssumeRole"
  }]
}

module "stackgen_b2548492-8db5-56fb-8fa3-d067ab37f77a" {
  source                      = "./modules/aws_route"
  carrier_gateway_id          = ""
  core_network_arn            = ""
  destination_cidr_block      = "0.0.0.0/0"
  destination_ipv6_cidr_block = ""
  destination_prefix_list_id  = ""
  egress_only_gateway_id      = ""
  gateway_id                  = "igw-057a68349faa17af7"
  local_gateway_id            = ""
  nat_gateway_id              = ""
  network_interface_id        = ""
  route_table_id              = "rtb-06d295c8d20a2d6c2"
  timeouts = {
    create = "5m"
    delete = null
    update = null
  }
  transit_gateway_id        = ""
  vpc_endpoint_id           = ""
  vpc_peering_connection_id = ""
}

module "stackgen_b3d6079a-2599-53ce-86c5-c3cd77621f4b" {
  source                               = "./modules/aws_launch_template"
  block_device_mappings                = []
  capacity_reservation_specification   = []
  cpu_options                          = []
  credit_specification                 = []
  default_version                      = 1
  description                          = "Custom launch template for managed-nodegroup-3 EKS managed node group"
  disable_api_termination              = false
  ebs_optimized                        = ""
  elastic_gpu_specifications           = []
  elastic_inference_accelerator        = []
  enclave_options                      = []
  hibernation_options                  = []
  iam_instance_profile                 = []
  image_id                             = ""
  instance_initiated_shutdown_behavior = ""
  instance_market_options              = []
  instance_type                        = ""
  kernel_id                            = ""
  key_name                             = ""
  license_specification                = []
  maintenance_options                  = []
  metadata_options = [{
    http_endpoint               = "enabled"
    http_protocol_ipv6          = ""
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = ""
  }]
  monitoring = [{
    enabled = true
  }]
  name                     = "node_group_3-20251009180112665900000004"
  network_interfaces       = []
  placement                = []
  private_dns_name_options = []
  ram_disk_id              = ""
  security_group_names     = []
  tag_specifications = [{
    resource_type = "instance"
    tags = {
      Name             = "managed-nodegroup-3"
      created-by       = "retail-store-sample-app"
      environment-name = "retail-store"
    }
    }, {
    resource_type = "network-interface"
    tags = {
      Name             = "managed-nodegroup-3"
      created-by       = "retail-store-sample-app"
      environment-name = "retail-store"
    }
    }, {
    resource_type = "volume"
    tags = {
      Name             = "managed-nodegroup-3"
      created-by       = "retail-store-sample-app"
      environment-name = "retail-store"
    }
  }]
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  update_default_version = true
  user_data              = ""
  vpc_security_group_ids = [
    module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.id,
  ]
}

module "stackgen_b445b256-0544-50b6-bf65-4cc1b5c9d255" {
  source           = "./modules/time_sleep"
  create_duration  = "30s"
  destroy_duration = "60s"
}

module "stackgen_b5dcabf6-ad83-53ad-8b32-0f250aac030d" {
  source      = "./modules/aws_iam_policy"
  description = "Cluster encryption policy to allow cluster role to utilize CMK provided"
  name        = "retail-store-cluster-ClusterEncryption2025100917315515600000000d"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"kms:Encrypt\",\"kms:Decrypt\",\"kms:ListGrants\",\"kms:DescribeKey\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:kms:us-east-1:339712749745:key/20b036c8-116f-48ea-a7c1-dcf5d6bff207\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_b7a21433-ae00-5481-9306-1c659b74e1e6" {
  source                      = "./modules/aws_eks_addon"
  addon_name                  = "adot"
  addon_version               = "v0.117.0-eksbuild.1"
  cluster_name                = module.stackgen_d613e397-f4e3-54a2-af56-6c8aa0000bef.name
  resolve_conflicts_on_create = "OVERWRITE"
  service_account_role_arn    = ""
  tags = {
    ClusterRoleVersion = "1918"
    RoleVersion        = "1919"
  }
}

module "stackgen_b810b1c2-64fc-5169-865e-f04ae88be047" {
  source = "./modules/data_aws_eks_cluster_auth"
  name   = "retail-store"
}

module "stackgen_bbc52756-76a5-5d72-8f31-15c63a023515" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1c"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name                                 = "retail-store-public-us-east-1c"
    created-by                           = "retail-store-sample-app"
    environment-name                     = "retail-store"
    "kubernetes.io/cluster/retail-store" = "shared"
    "kubernetes.io/role/elb"             = "1"
  }
  vpc_id = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_bcdbeaab-ee30-552b-8fab-6a8c03fd95b4" {
  source               = "./modules/aws_eks_node_group"
  ami_type             = "AL2023_x86_64_STANDARD"
  capacity_type        = "ON_DEMAND"
  cluster_name         = module.stackgen_d613e397-f4e3-54a2-af56-6c8aa0000bef.id
  disk_size            = 0
  force_update_version = true
  instance_types       = ["m5.large"]
  labels               = {}
  launch_template = [{
    id      = "lt-05fc396f2d1fd6cd1"
    name    = "node_group_2-20251009180112665900000006"
    version = "1"
  }]
  node_group_name = "managed-nodegroup-2-20251009180120905300000012"
  node_role_arn   = module.stackgen_35f62127-f837-5e73-b62b-96327e0de448.arn
  release_version = "1.30.14-20251007"
  remote_access   = []
  scaling_config = [{
    desired_size = 1
    max_size     = 3
    min_size     = 1
  }]
  subnet_ids = [
    module.stackgen_1035c3f1-b526-555f-af0f-1f468c5d9d61.id,
  ]
  tags = {
    Name             = "managed-nodegroup-2"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  taint = []
  update_config = [{
    max_unavailable            = 0
    max_unavailable_percentage = 33
  }]
}

module "stackgen_beaa250e-3069-52b4-ad93-89587b6331d1" {
  source                             = "./modules/aws_rds_cluster"
  availability_zones                 = ["us-east-1a", "us-east-1b", "us-east-1c"]
  backup_retention_period            = 7
  cluster_identifier                 = "retail-store-orders"
  copy_tags_to_snapshot              = false
  database_name                      = "orders"
  db_subnet_group_name               = "retail-store-orders"
  enable_global_write_forwarding     = false
  enable_local_write_forwarding      = false
  enabled_cloudwatch_logs_exports    = []
  engine                             = "aurora-postgresql"
  engine_mode                        = "provisioned"
  engine_version                     = "15.10"
  global_cluster_identifier          = ""
  kms_key_id                         = "arn:aws:kms:us-east-1:339712749745:key/102d37c1-0438-43b9-a8cc-8302cfa365cb"
  master_password                    = var.master_password_beaa250e-3069-52b4-ad93-89587b6331d1
  master_username                    = "root"
  preferred_backup_window            = "02:00-03:00"
  preferred_maintenance_window       = "sun:05:00-sun:06:00"
  scaling_configuration              = []
  serverlessv2_scaling_configuration = []
  skip_final_snapshot                = true
  storage_encrypted                  = true
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  vpc_security_group_ids = [
    module.stackgen_297b1d6b-84eb-5f56-ab89-782203435d8f.id,
  ]
}

module "stackgen_bf8d7c5b-6c00-5dd2-861f-c2b6bfe2e0a6" {
  source = "./modules/data_aws_partition"
}

module "stackgen_c0b51f5d-a234-5eab-8811-5241836aec46" {
  source         = "./modules/aws_route_table_association"
  gateway_id     = ""
  route_table_id = module.stackgen_21b17b50-c073-54ab-aaf3-662db6da5665.id
  subnet_id      = module.stackgen_889eaaf4-581f-5fbe-a398-bb14b7a92ae5.id
}

module "stackgen_c46bf41d-c12e-5775-b294-cd17548f1a83" {
  source           = "./modules/random_password"
  length           = 16
  lower            = true
  min_lower        = 0
  min_numeric      = 0
  min_special      = 0
  min_upper        = 0
  numeric          = true
  override_special = "!#$%&*()-_+{}<>?"
  special          = true
  upper            = true
}

module "stackgen_cdc17417-48e9-59f6-b251-1e78bad93e54" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = ["10.0.0.0/16"]
  description              = null
  from_port                = 53
  ipv6_cidr_blocks         = null
  prefix_list_ids          = null
  protocol                 = "tcp"
  security_group_id        = module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.id
  self                     = false
  source_security_group_id = null
  to_port                  = 53
  type                     = "ingress"
}

module "stackgen_cfe3cf5d-b40f-522f-92e8-89163efbf3b0" {
  source      = "./modules/aws_iam_policy"
  description = "Dynamo policy for carts application"
  name        = "retail-store-carts-dynamo"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":\"dynamodb:*\",\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:dynamodb:us-east-1:339712749745:table/retail-store-carts\",\"arn:aws:dynamodb:us-east-1:339712749745:table/retail-store-carts/index/*\"],\"Sid\":\"AllAPIActionsOnCart\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_d025fda5-db6c-54e6-bacd-c851dc7abf3f" {
  source       = "./modules/aws_db_parameter_group"
  description  = "Managed by Terraform"
  family       = "aurora-mysql8.0"
  name         = "retail-store-catalog-20251009173123417400000001"
  name_prefix  = "retail-store-catalog-"
  parameter    = []
  skip_destroy = false
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_d1a9fd2d-dc8e-500d-a551-903c3b2afde3" {
  source                 = "./modules/aws_default_network_acl"
  default_network_acl_id = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.default_network_acl_id
  egress = [{
    action          = "allow"
    cidr_block      = ""
    from_port       = 0
    icmp_code       = 0
    icmp_type       = 0
    ipv6_cidr_block = "::/0"
    protocol        = "-1"
    rule_no         = 101
    to_port         = 0
    }, {
    action          = "allow"
    cidr_block      = "0.0.0.0/0"
    from_port       = 0
    icmp_code       = 0
    icmp_type       = 0
    ipv6_cidr_block = ""
    protocol        = "-1"
    rule_no         = 100
    to_port         = 0
  }]
  ingress = [{
    action          = "allow"
    cidr_block      = ""
    from_port       = 0
    icmp_code       = 0
    icmp_type       = 0
    ipv6_cidr_block = "::/0"
    protocol        = "-1"
    rule_no         = 101
    to_port         = 0
    }, {
    action          = "allow"
    cidr_block      = "0.0.0.0/0"
    from_port       = 0
    icmp_code       = 0
    icmp_type       = 0
    ipv6_cidr_block = ""
    protocol        = "-1"
    rule_no         = 100
    to_port         = 0
  }]
  subnet_ids = [
    module.stackgen_6d3e2e85-c3bd-5a31-befc-5ca1b1595119.id,
    module.stackgen_92aef2fe-54a5-5c32-b10a-6195025d7af2.id,
    module.stackgen_bbc52756-76a5-5d72-8f31-15c63a023515.id,
    module.stackgen_88bb083b-9e45-5b64-a250-ffc4d2acbe5f.id,
    module.stackgen_1035c3f1-b526-555f-af0f-1f468c5d9d61.id,
    module.stackgen_889eaaf4-581f-5fbe-a398-bb14b7a92ae5.id,
  ]
  tags = {
    Name             = "retail-store-default"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_d1b60c69-5ff7-5324-b97b-92cfe3a0643a" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = null
  description              = "Cluster API to node groups"
  from_port                = 443
  ipv6_cidr_blocks         = null
  prefix_list_ids          = []
  protocol                 = "tcp"
  security_group_id        = module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.id
  self                     = false
  source_security_group_id = "sg-017eaab9b23b68382"
  to_port                  = 443
  type                     = "ingress"
}

module "stackgen_d2d013e8-ef34-5243-875d-6f2ee50f0e87" {
  source      = "./modules/aws_security_group"
  description = "Control traffic to/from RDS Aurora retail-store-catalog"
  egress      = []
  ingress = [{
    cidr_blocks      = []
    description      = "From allowed SGs"
    from_port        = 3306
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-0b6c6c173f6f34d3e"]
    self             = false
    to_port          = 3306
  }]
  name                   = "retail-store-catalog-20251009173325014400000011"
  revoke_rules_on_delete = false
  tags = {
    Name             = "retail-store-catalog"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
  vpc_id   = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.id
}

module "stackgen_d54a8bdf-a6eb-5b99-99bd-b6fe455460d8" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = module.stackgen_6cb03677-4a41-5ff3-8394-544eaffe9a23.name
}

module "stackgen_d613e397-f4e3-54a2-af56-6c8aa0000bef" {
  source = "./modules/aws_eks_cluster"
  access_config = [{
    authentication_mode                         = "CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }]
  bootstrap_self_managed_addons = true
  compute_config                = []
  eks_version                   = null
  enabled_cluster_log_types     = ["api", "audit", "authenticator"]
  encryption_config = [{
    provider = [{
      key_arn = "arn:aws:kms:us-east-1:339712749745:key/20b036c8-116f-48ea-a7c1-dcf5d6bff207"
    }]
    resources = ["secrets"]
  }]
  kubernetes_network_config = [{
    elastic_load_balancing = [{
      enabled = false
    }]
    ip_family         = "ipv4"
    service_ipv4_cidr = "172.20.0.0/16"
    service_ipv6_cidr = ""
  }]
  name                  = "retail-store"
  outpost_config        = []
  remote_network_config = []
  role_arn              = "arn:aws:iam::339712749745:role/retail-store-cluster-20251009173123442400000005"
  storage_config        = []
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = {
    create = null
    delete = null
    update = null
  }
  upgrade_policy = [{
    support_type = "EXTENDED"
  }]
  vpc_config = [{
    cluster_security_group_id = "sg-0220669a4dfafa872"
    endpoint_private_access   = true
    endpoint_public_access    = true
    public_access_cidrs       = ["0.0.0.0/0"]
    security_group_ids        = ["sg-017eaab9b23b68382"]
    subnet_ids                = ["subnet-00eadf97a9b64defc", "subnet-017ecc38a1283e4b8", "subnet-0a8734128443f0ccc"]
    vpc_id                    = "vpc-0d2cf10b24184c9a6"
  }]
  zonal_shift_config = []
}

module "stackgen_d630bcf0-017a-50ac-8677-8e5d2aa10825" {
  source      = "./modules/aws_iam_policy"
  description = "IAM Policy for AWS Load Balancer Controller"
  name        = "alb-controller-20251009173124754200000007"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":\"iam:CreateServiceLinkedRole\",\"Condition\":{\"StringEquals\":{\"iam:AWSServiceName\":\"elasticloadbalancing.amazonaws.com\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:DescribeTrustStores\",\"elasticloadbalancing:DescribeTargetHealth\",\"elasticloadbalancing:DescribeTargetGroups\",\"elasticloadbalancing:DescribeTargetGroupAttributes\",\"elasticloadbalancing:DescribeTags\",\"elasticloadbalancing:DescribeSSLPolicies\",\"elasticloadbalancing:DescribeRules\",\"elasticloadbalancing:DescribeLoadBalancers\",\"elasticloadbalancing:DescribeLoadBalancerAttributes\",\"elasticloadbalancing:DescribeListeners\",\"elasticloadbalancing:DescribeListenerCertificates\",\"elasticloadbalancing:DescribeListenerAttributes\",\"elasticloadbalancing:DescribeCapacityReservation\",\"ec2:GetSecurityGroupsForVpc\",\"ec2:GetCoipPoolUsage\",\"ec2:DescribeVpcs\",\"ec2:DescribeVpcPeeringConnections\",\"ec2:DescribeTags\",\"ec2:DescribeSubnets\",\"ec2:DescribeSecurityGroups\",\"ec2:DescribeNetworkInterfaces\",\"ec2:DescribeIpamPools\",\"ec2:DescribeInternetGateways\",\"ec2:DescribeInstances\",\"ec2:DescribeCoipPools\",\"ec2:DescribeAvailabilityZones\",\"ec2:DescribeAddresses\",\"ec2:DescribeAccountAttributes\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"wafv2:GetWebACLForResource\",\"wafv2:GetWebACL\",\"wafv2:DisassociateWebACL\",\"wafv2:AssociateWebACL\",\"waf-regional:GetWebACLForResource\",\"waf-regional:GetWebACL\",\"waf-regional:DisassociateWebACL\",\"waf-regional:AssociateWebACL\",\"shield:GetSubscriptionState\",\"shield:DescribeProtection\",\"shield:DeleteProtection\",\"shield:CreateProtection\",\"iam:ListServerCertificates\",\"iam:GetServerCertificate\",\"cognito-idp:DescribeUserPoolClient\",\"acm:ListCertificates\",\"acm:DescribeCertificate\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ec2:RevokeSecurityGroupIngress\",\"ec2:AuthorizeSecurityGroupIngress\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ec2:CreateSecurityGroup\",\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ec2:CreateTags\",\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"false\"},\"StringEquals\":{\"ec2:CreateAction\":\"CreateSecurityGroup\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ec2:*:*:security-group/*\"},{\"Action\":[\"ec2:DeleteTags\",\"ec2:CreateTags\"],\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"true\",\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ec2:*:*:security-group/*\"},{\"Action\":[\"ec2:RevokeSecurityGroupIngress\",\"ec2:DeleteSecurityGroup\",\"ec2:AuthorizeSecurityGroupIngress\"],\"Condition\":{\"Null\":{\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:CreateTargetGroup\",\"elasticloadbalancing:CreateLoadBalancer\"],\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:DeleteRule\",\"elasticloadbalancing:DeleteListener\",\"elasticloadbalancing:CreateRule\",\"elasticloadbalancing:CreateListener\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:RemoveTags\",\"elasticloadbalancing:AddTags\"],\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"true\",\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*\"]},{\"Action\":[\"elasticloadbalancing:RemoveTags\",\"elasticloadbalancing:AddTags\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:elasticloadbalancing:*:*:listener/net/*/*/*\",\"arn:aws:elasticloadbalancing:*:*:listener/app/*/*/*\",\"arn:aws:elasticloadbalancing:*:*:listener-rule/net/*/*/*\",\"arn:aws:elasticloadbalancing:*:*:listener-rule/app/*/*/*\"]},{\"Action\":[\"elasticloadbalancing:SetSubnets\",\"elasticloadbalancing:SetSecurityGroups\",\"elasticloadbalancing:SetIpAddressType\",\"elasticloadbalancing:ModifyTargetGroupAttributes\",\"elasticloadbalancing:ModifyTargetGroup\",\"elasticloadbalancing:ModifyLoadBalancerAttributes\",\"elasticloadbalancing:ModifyListenerAttributes\",\"elasticloadbalancing:ModifyIpPools\",\"elasticloadbalancing:ModifyCapacityReservation\",\"elasticloadbalancing:DeleteTargetGroup\",\"elasticloadbalancing:DeleteLoadBalancer\"],\"Condition\":{\"Null\":{\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"elasticloadbalancing:AddTags\",\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"false\"},\"StringEquals\":{\"elasticloadbalancing:CreateAction\":[\"CreateTargetGroup\",\"CreateLoadBalancer\"]}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*\"]},{\"Action\":[\"elasticloadbalancing:RegisterTargets\",\"elasticloadbalancing:DeregisterTargets\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\"},{\"Action\":[\"elasticloadbalancing:SetWebAcl\",\"elasticloadbalancing:SetRulePriorities\",\"elasticloadbalancing:RemoveListenerCertificates\",\"elasticloadbalancing:ModifyRule\",\"elasticloadbalancing:ModifyListener\",\"elasticloadbalancing:AddListenerCertificates\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_d71132d1-13a5-5f17-869e-fa7ca111e7ba" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_35f62127-f837-5e73-b62b-96327e0de448.name
}

module "stackgen_d746eea8-1980-5861-a77f-fe6fe8c6705a" {
  source = "./modules/null_resource"
}

module "stackgen_d90d1b23-e7ce-5ff7-bda1-1128938c3840" {
  source                      = "./modules/aws_eks_addon"
  addon_name                  = "vpc-cni"
  addon_version               = module.stackgen_2a3747eb-2205-5e47-853d-2cb660740929.version
  cluster_name                = module.stackgen_d613e397-f4e3-54a2-af56-6c8aa0000bef.name
  resolve_conflicts_on_create = null
  service_account_role_arn    = ""
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_dc634a31-d88c-584a-8300-11a0e0535874" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = null
  description              = "From allowed SGs"
  from_port                = 5432
  ipv6_cidr_blocks         = null
  prefix_list_ids          = null
  protocol                 = "tcp"
  security_group_id        = module.stackgen_297b1d6b-84eb-5f56-ab89-782203435d8f.id
  self                     = false
  source_security_group_id = "sg-0b6c6c173f6f34d3e"
  to_port                  = 5432
  type                     = "ingress"
}

module "stackgen_dea51a16-b560-5216-89d7-d3c721911e9d" {
  source                             = "./modules/aws_nat_gateway"
  allocation_id                      = module.stackgen_22542c20-ea3b-5d87-8bd2-6f8ebe9d0295.id
  connectivity_type                  = "public"
  private_ip                         = "10.0.0.50"
  secondary_allocation_ids           = []
  secondary_private_ip_address_count = 0
  secondary_private_ip_addresses     = []
  subnet_id                          = module.stackgen_6d3e2e85-c3bd-5a31-befc-5ca1b1595119.id
  tags = {
    Name             = "retail-store-us-east-1a"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
}

module "stackgen_e2b6b6d6-fd40-572f-b506-e73cd03ecd19" {
  source         = "./modules/aws_route_table_association"
  gateway_id     = ""
  route_table_id = module.stackgen_513fdee8-3275-583a-a5c2-977c859818a2.id
  subnet_id      = module.stackgen_6d3e2e85-c3bd-5a31-befc-5ca1b1595119.id
}

module "stackgen_e3b9aa8b-31a7-586b-856a-c5c503b31002" {
  source = "./modules/data_aws_caller_identity"
}

module "stackgen_e4b03209-a71f-537b-a50e-23c84768b5cc" {
  source                    = "./modules/data_aws_iam_policy_document"
  override_json             = null
  override_policy_documents = null
  policy_id                 = null
  source_json               = null
  source_policy_documents   = null
  statement = [{
    actions        = ["sts:AssumeRole"]
    condition      = []
    effect         = "Allow"
    not_actions    = []
    not_principals = []
    not_resources  = []
    principals = [{
      identifiers = ["ec2.amazonaws.com"]
      type        = "Service"
    }]
    resources = []
    sid       = "EKSNodeAssumeRole"
  }]
}

module "stackgen_e881e6ee-dad3-5c67-a27b-ab93ad02a366" {
  source                      = "./modules/aws_eks_addon"
  addon_name                  = "aws-ebs-csi-driver"
  addon_version               = module.stackgen_ede48d99-cef7-5f36-9e2f-9d184d1c1d32.version
  cluster_name                = module.stackgen_d613e397-f4e3-54a2-af56-6c8aa0000bef.name
  resolve_conflicts_on_create = null
  service_account_role_arn    = ""
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_ea3bfe32-57ae-596a-aca7-693eb8e8c329" {
  source = "./modules/data_aws_region"
}

module "stackgen_ec05439b-d31d-5412-b207-792f0e75de0e" {
  source = "./modules/null_resource"
}

module "stackgen_ede48d99-cef7-5f36-9e2f-9d184d1c1d32" {
  source             = "./modules/data_aws_eks_addon_version"
  addon_name         = "aws-ebs-csi-driver"
  kubernetes_version = "1.30"
  most_recent        = true
}

module "stackgen_f24bbd31-cb02-5c70-af30-58f6000fab6e" {
  source         = "./modules/aws_iam_openid_connect_provider"
  client_id_list = ["sts.amazonaws.com"]
  tags = {
    Name             = "retail-store-eks-irsa"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  thumbprint_list = ["06b25927c42a721631c1efd9431e648fa62e1e39"]
  url             = "oidc.eks.us-east-1.amazonaws.com/id/C2C00990F6F011E974E0BD7BC6FB0739"
}

module "stackgen_f7443e81-ed4b-5c30-8fb6-e70da6eb1a13" {
  source                   = "./modules/aws_security_group_rule"
  cidr_blocks              = null
  description              = "From allowed SGs"
  from_port                = 3306
  ipv6_cidr_blocks         = null
  prefix_list_ids          = null
  protocol                 = "tcp"
  security_group_id        = module.stackgen_d2d013e8-ef34-5243-875d-6f2ee50f0e87.id
  self                     = false
  source_security_group_id = "sg-0b6c6c173f6f34d3e"
  to_port                  = 3306
  type                     = "ingress"
}

module "stackgen_f80d5c8a-e4bc-5e93-9acf-1fb2a7f4fdba" {
  source           = "./modules/time_sleep"
  create_duration  = "30s"
  destroy_duration = "30s"
}

module "stackgen_f9fee92e-0d9b-531d-b33c-9d42bad8acb2" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"eks.amazonaws.com\"},\"Sid\":\"EKSClusterAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = true
  inline_policy = [{
    name   = "retail-store-cluster"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:CreateLogGroup\"],\"Effect\":\"Deny\",\"Resource\":\"*\"}]}"
  }]
  max_session_duration = 3600
  name                 = "retail-store-cluster-20251009173123442400000005"
  path                 = "/"
  permissions_boundary = ""
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_fbdc3c43-709a-5adf-b8b4-dff7b94fbc6b" {
  source      = "./modules/aws_elasticache_parameter_group"
  description = "Elasticache parameter group for retail-store-checkout"
  family      = "redis4.0"
  name        = "retail-store-checkout"
  parameter   = []
  tags = {
    Name             = "retail-store-checkout"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_fc1e9f9f-2c77-5f57-9e3a-30650240d1b7" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_9e1c24b5-fa26-5daf-8a46-0477ae77cbce.arn
  role       = module.stackgen_61efdefc-0377-5096-88ed-9279e18a475d.name
}

module "stackgen_fd5873c1-c2c5-54c3-8b8e-7a5b8d2e0d38" {
  source = "./modules/data_aws_partition"
}

