module "stackgen_008c6a41-d7ee-5c29-b586-4d3e6da9b3d0" {
  source  = "./modules/aws_iam_access_key"
  pgp_key = null
  status  = "Active"
  user    = module.stackgen_ba731813-b5f1-5b89-b963-be0c999e4636.name
}

module "stackgen_012bc997-c8b8-5f49-84b1-ab1a45392fc6" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-ingressn-ingressn-efb5f6ecf7-a04f395ff369e7c5.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "dashboards.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_014c5c79-b363-55f2-8091-3fc0bb4891ca" {
  source    = "./modules/aws_iam_role_policy"
  name      = "AllowCrossAccountS3Access"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:Get*\",\"s3:List*\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::cross-region-default\",\"arn:aws:s3:::cross-region-default/*\"]}]}"
  role      = module.stackgen_edadc593-6390-5f1f-a41f-a8ccd8000a75.name
  role_type = "custom"
}

module "stackgen_01daba0d-bc84-5ccb-bc96-425c3d6bab7c" {
  source      = "./modules/aws_iam_policy"
  description = "IAM Policy for karpenter"
  name        = "karpenter-2024061216463935990000001c"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"ec2:DescribeSubnets\",\"ec2:DescribeSpotPriceHistory\",\"ec2:DescribeSecurityGroups\",\"ec2:DescribeLaunchTemplates\",\"ec2:DescribeInstances\",\"ec2:DescribeInstanceTypes\",\"ec2:DescribeInstanceTypeOfferings\",\"ec2:DescribeImages\",\"ec2:DescribeAvailabilityZones\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ec2:RunInstances\",\"ec2:DeleteLaunchTemplate\",\"ec2:CreateTags\",\"ec2:CreateLaunchTemplate\",\"ec2:CreateFleet\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:ec2:us-west-2::image/*\",\"arn:aws:ec2:us-west-2:339712749745:*\"]},{\"Action\":\"iam:PassRole\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::339712749745:role/karpenter-for-sks-t2-eks\"},{\"Action\":\"pricing:GetProducts\",\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ssm:GetParameter\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ssm:us-west-2::parameter/aws/service/*\"},{\"Action\":\"eks:DescribeCluster\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:eks:*:339712749745:cluster/sks-t2-eks\"},{\"Action\":\"ec2:TerminateInstances\",\"Condition\":{\"StringLike\":{\"ec2:ResourceTag/kubernetes.io/cluster/sks-t2-eks\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ec2:us-west-2:339712749745:instance/*\"},{\"Action\":[\"sqs:ReceiveMessage\",\"sqs:GetQueueUrl\",\"sqs:GetQueueAttributes\",\"sqs:DeleteMessage\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:sqs:us-west-2:339712749745:karpenter-sks-t2-eks\"},{\"Action\":[\"iam:TagInstanceProfile\",\"iam:RemoveRoleFromInstanceProfile\",\"iam:GetInstanceProfile\",\"iam:DeleteInstanceProfile\",\"iam:CreateInstanceProfile\",\"iam:AddRoleToInstanceProfile\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    appcd_module  = "vpc"
    maintained_by = "support@appcd.com"
  }
}

module "stackgen_0201591e-870a-5c51-8334-7bf33cec201c" {
  source       = "./modules/aws_db_parameter_group"
  description  = "Default parameter group for aurora-mysql8.0"
  family       = "aurora-mysql8.0"
  name         = "default.aurora-mysql8.0"
  name_prefix  = ""
  parameter    = []
  skip_destroy = false
  tags         = {}
}

module "stackgen_02d51a7a-4dfd-58e0-b1a0-200c67bf4977" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_c02144a3-6663-5440-85eb-fb26a6eea9ee.arn
  role       = module.stackgen_bd78c59d-999a-5acc-a3bf-d6679092d709.name
}

module "stackgen_0403d719-12eb-555b-b23c-040b1f167e92" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_0ccaae47-39ad-58d1-b9d9-c97e70657142.name
}

module "stackgen_04183e2c-07be-5c10-a7d6-4eee7f2143e5" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "Amazon-EventBridge-Scheduler-Execution-Policy-a87805f2-af1d-4c74-83e0-1585de8a3945"
  path        = "/service-role/"
  policy      = "{\"Statement\":[{\"Action\":[\"lambda:InvokeFunction\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:lambda:us-west-2:339712749745:function:errorqueryfunction:*\",\"arn:aws:lambda:us-west-2:339712749745:function:errorqueryfunction\"]}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_0436a601-646b-5784-b8b4-cf45db021920" {
  source      = "./modules/aws_security_group"
  description = "launch-wizard-1 created 2025-03-17T23:56:45.054Z"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
  }]
  name                   = "launch-wizard-1"
  revoke_rules_on_delete = null
  tags                   = {}
  timeouts               = null
  vpc_id                 = module.stackgen_d25a6d89-d552-5559-bfac-46df4f389650.id
}

module "stackgen_046f3ed5-e92e-58f0-96b9-5e9c28cbf536" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":[\"sts:AssumeRoleWithSAML\",\"sts:TagSession\"],\"Condition\":{\"StringEquals\":{\"SAML:aud\":\"https://signin.aws.amazon.com/saml\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:saml-provider/AWSSSO_66cb6e387e9a07b4_DO_NOT_DELETE\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 43200
  name                  = "AWSReservedSSO_ReadOnlyAccess_de1aeeec02b20bda"
  path                  = "/aws-reserved/sso.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_0546e267-a6d1-52fe-86e8-bdeed3afd338" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_e2bc9541-eda0-570e-acbb-e40eba3e17a7.arn
  role       = module.stackgen_4cdfcf82-8fbd-5f23-b7dc-089ad2257997.name
}

module "stackgen_0573fc18-dc0f-5e88-9d0d-dcdffc0d0b28" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"vpc-flow-logs.amazonaws.com\"},\"Sid\":\"AWSVPCFlowLogsAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "vpc-flow-log-role-20241213223950603700000001"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
    terraform   = "true"
  }
}

module "stackgen_05806497-b46d-5157-952b-9bd97b60567b" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_93b469d0-02d7-50d7-9f31-1129f0604334.arn
  role       = module.stackgen_c12c01d9-437e-5f17-8c34-c2a056beb229.name
}

module "stackgen_063ea0e5-c6d6-5130-96e0-bb34b72c9509" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/436E20DEC59ECD543B5C986741FD9637:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/436E20DEC59ECD543B5C986741FD9637:sub\":\"system:serviceaccount:signoz:otel-collector\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/436E20DEC59ECD543B5C986741FD9637\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "eksctl-eks-tooling-addon-iamserviceaccount-si-Role1-pEHMSbcxQDkN"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    "alpha.eksctl.io/cluster-name"                = "eks-tooling"
    "alpha.eksctl.io/eksctl-version"              = "0.205.0-dev+9e5300e5a.2025-02-28T20:10:13Z"
    "alpha.eksctl.io/iamserviceaccount-name"      = "signoz/otel-collector"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "eks-tooling"
  }
}

module "stackgen_067f6b5b-3c43-5e98-9759-d0d5ec4fa879" {
  source         = "./modules/aws_iam_openid_connect_provider"
  client_id_list = ["sts.amazonaws.com"]
  tags = {
    Name        = "developer-eks-eks-irsa"
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
  }
  thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280"]
  url             = "oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064"
}

module "stackgen_06ac6c9a-5417-50d6-9a61-1e332ceb591c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_9aa05b2b-f650-542f-b376-2b7123b70856.name
}

module "stackgen_06b66e59-5cb7-5619-8f93-28f268924d07" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "developer-eks_4067990795380418201"
  name_prefix = ""
  path        = "/"
  role        = module.stackgen_4bdadd44-ffe9-54f5-a02b-2dfccee7d6e5.name
  tags = {
    "eks:eks-cluster-name"                = "developer-eks"
    "karpenter.k8s.aws/ec2nodeclass"      = "default"
    "kubernetes.io/cluster/developer-eks" = "owned"
    "topology.kubernetes.io/region"       = "us-west-2"
  }
}

module "stackgen_0709488d-92ca-420a-b06a-b3c541cefbfb" {
  source                 = "./modules/aws_security_group"
  description            = "Managed by Terraform."
  egress                 = []
  ingress                = []
  name                   = null
  revoke_rules_on_delete = false
  tags                   = {}
  timeouts               = null
  vpc_id                 = null
}

module "stackgen_078af09e-54b2-5986-8bb2-a92aff649ac9" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = module.stackgen_722c4a85-92b8-5e1f-9058-854b7cc2330a.name
}

module "stackgen_078e4d1f-50e8-5017-85e3-d3dc58447cc7" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "dualstack.k8s-uptimekumaauthent-81bb4214d6-521776276.us-west-2.elb.amazonaws.com"
    zone_id                = "Z1H1FL5HABSF5"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "status.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_07dffd1a-55e3-5860-87e7-5e94bb10928c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  role       = module.stackgen_55658a91-7c5a-5d7d-bf65-50392bc11058.name
}

module "stackgen_07f9d97b-200d-5ece-9d65-671e7b6a88d7" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "support.stage.dev.stackgen.com"
  records                          = ["10 feedback-smtp.us-west-2.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 300
  type                             = "MX"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_08249681-feca-51ee-aec4-9a4aaa0a1a97" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_852f1f74-b8ef-5a00-a947-ae5d4565233f.name
}

module "stackgen_08e4ea48-b609-5e6a-8891-df050fcdeb6f" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_8744aa8f-5357-5e89-8a72-76dddadab10f.arn
  role       = module.stackgen_edd19903-9222-5fc5-8d98-8fb1a904a03e.name
}

module "stackgen_09432f0f-41b1-5a04-a761-9d7aa7922aae" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/CostOptimizationHubAdminAccess"
  role       = module.stackgen_71761eff-46ba-5dfd-bf6e-44191a4ed3fd.name
}

module "stackgen_09a9ccf6-90a2-570c-8bbb-dbc29d55cef7" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_0bbb4566-02cc-56f9-8511-86f67013a661.name
}

module "stackgen_09dade3f-0d86-5c0b-8ce5-2e18c400c230" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "atlantis-dev-831862695.us-east-1.elb.amazonaws.com"
    zone_id                = "Z35SXDOTRQ7X7K"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "atlantis-dev.dev.appcd.io"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_0a195a09-227f-5b39-b748-fb904418c1f5" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_431f316b-b29f-5c1b-a684-6d5269159edf.name
}

module "stackgen_0a47a628-1af8-599d-8d23-9a70f89f5a46" {
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

module "stackgen_0acffa05-af5a-5cd8-9cae-3c842161c203" {
  source    = "./modules/aws_iam_role_policy"
  name      = "AllowRoleCreationPolicy"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:CreateRole\",\"iam:TagRole\",\"iam:DeleteRolePolicy\",\"iam:DeleteRole\",\"iam:PutRolePolicy\",\"sts:AssumeRole\"],\"Condition\":{\"StringEquals\":{\"iam:ResourceTag/stackgen-managed\":\"true\"},\"StringLike\":{\"iam:ResourceTag/stackgen-reason\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:iam::339712749745:role/stackgen-managed-*\"]},{\"Action\":[\"sts:TagSession\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  role      = module.stackgen_55658a91-7c5a-5d7d-bf65-50392bc11058.name
  role_type = "custom"
}

module "stackgen_0b01e8fa-1979-5f53-a594-3e51af36502e" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"servicequotas.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "A service-linked role is required for Service Quotas to access your service limits."
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForServiceQuotas"
  path                  = "/aws-service-role/servicequotas.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_0b5c9b6b-14c6-5555-9884-aa5d912b89bf" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_c33f0deb-84a5-59d2-ad11-f54a80d445d0.name
}

module "stackgen_0ba71079-1696-5955-ae33-2f462cbd91b1" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "vpc-flow-log-to-cloudwatch-20241213223950954000000002"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"logs:PutLogEvents\",\"logs:DescribeLogStreams\",\"logs:DescribeLogGroups\",\"logs:CreateLogStream\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:logs:us-west-2:339712749745:log-group:/aws/vpc-flow-log/vpc-0b61b9b44d6b8c9fb:*\",\"Sid\":\"AWSVPCFlowLogsPushToCloudWatch\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
    terraform   = "true"
  }
}

module "stackgen_0bbb4566-02cc-56f9-8511-86f67013a661" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Sid\":\"EKSNodeAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = "EKS managed node group IAM role"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "tooling-dev-eks-node-group-2025042407285631160000000a"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    appcd_module  = "vpc"
    created_for   = "tooling-dev"
    maintained_by = "support@stackgen.com"
  }
}

module "stackgen_0bce0877-448e-524f-9420-e8734f30ae7d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSComputePolicy"
  role       = module.stackgen_e7da5ae7-3b7b-5af9-9bfc-dad2bc61c94c.name
}

module "stackgen_0cba6313-3933-57a7-97ab-f4552457815c" {
  source      = "./modules/aws_iam_policy"
  description = "IAM Policy for karpenter"
  name        = "karpenter-2025040404420695860000000a"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"ec2:DescribeSubnets\",\"ec2:DescribeSpotPriceHistory\",\"ec2:DescribeSecurityGroups\",\"ec2:DescribeLaunchTemplates\",\"ec2:DescribeInstances\",\"ec2:DescribeInstanceTypes\",\"ec2:DescribeInstanceTypeOfferings\",\"ec2:DescribeImages\",\"ec2:DescribeAvailabilityZones\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ec2:RunInstances\",\"ec2:DeleteLaunchTemplate\",\"ec2:CreateTags\",\"ec2:CreateLaunchTemplate\",\"ec2:CreateFleet\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:ec2:us-west-2::image/*\",\"arn:aws:ec2:us-west-2:339712749745:*\"]},{\"Action\":\"iam:PassRole\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::339712749745:role/karpenter-for-developer-eks\"},{\"Action\":\"pricing:GetProducts\",\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ssm:GetParameter\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ssm:us-west-2::parameter/aws/service/*\"},{\"Action\":\"eks:DescribeCluster\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:eks:*:339712749745:cluster/developer-eks\"},{\"Action\":\"ec2:TerminateInstances\",\"Condition\":{\"StringLike\":{\"ec2:ResourceTag/kubernetes.io/cluster/developer-eks\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ec2:us-west-2:339712749745:instance/*\"},{\"Action\":[\"sqs:ReceiveMessage\",\"sqs:GetQueueUrl\",\"sqs:GetQueueAttributes\",\"sqs:DeleteMessage\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:sqs:us-west-2:339712749745:karpenter-developer-eks\"},{\"Action\":[\"iam:TagInstanceProfile\",\"iam:RemoveRoleFromInstanceProfile\",\"iam:GetInstanceProfile\",\"iam:DeleteInstanceProfile\",\"iam:CreateInstanceProfile\",\"iam:AddRoleToInstanceProfile\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_0cc56b81-2049-542e-a3d9-3ca7937040cd" {
  source                  = "./modules/aws_glue_catalog_table"
  database_name           = "dev_athena_db"
  description             = ""
  name                    = "sample_data"
  open_table_format_input = []
  owner                   = "hadoop"
  parameters = {
    EXTERNAL                 = "TRUE"
    "skip.header.line.count" = "1"
    transient_lastDdlTime    = "1742370299"
  }
  partition_index = []
  partition_keys  = []
  retention       = 0
  storage_descriptor = [{
    additional_locations = []
    bucket_columns       = []
    columns = [{
      comment    = ""
      name       = "id"
      parameters = {}
      type       = "int"
      }, {
      comment    = ""
      name       = "name"
      parameters = {}
      type       = "string"
      }, {
      comment    = ""
      name       = "age"
      parameters = {}
      type       = "int"
    }]
    compressed        = false
    input_format      = "org.apache.hadoop.mapred.TextInputFormat"
    location          = "s3://cross-account-athena-data/"
    number_of_buckets = -1
    output_format     = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"
    parameters        = {}
    schema_reference  = []
    ser_de_info = [{
      name = ""
      parameters = {
        "field.delim"          = ","
        "line.delim"           = "\n"
        "serialization.format" = ","
      }
      serialization_library = "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe"
    }]
    skewed_info = [{
      skewed_column_names               = []
      skewed_column_value_location_maps = {}
      skewed_column_values              = []
    }]
    sort_columns              = []
    stored_as_sub_directories = false
  }]
  table_type         = "EXTERNAL_TABLE"
  target_table       = []
  view_expanded_text = ""
  view_original_text = ""
}

module "stackgen_0ccaae47-39ad-58d1-b9d9-c97e70657142" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "eksctl-eks-tooling-nodegroup-signo-NodeInstanceRole-GvZgp3YnuTiC"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    Name                                          = "eksctl-eks-tooling-nodegroup-signos-group/NodeInstanceRole"
    "alpha.eksctl.io/cluster-name"                = "eks-tooling"
    "alpha.eksctl.io/eksctl-version"              = "0.205.0-dev+9e5300e5a.2025-02-28T20:10:13Z"
    "alpha.eksctl.io/nodegroup-name"              = "signos-group"
    "alpha.eksctl.io/nodegroup-type"              = "managed"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "eks-tooling"
  }
}

module "stackgen_0cedae29-2b0d-5341-a4b1-11dd86f49d70" {
  source               = "./modules/aws_iam_user"
  force_destroy        = null
  name                 = "ses-smtp-user-alpha"
  path                 = "/"
  permissions_boundary = ""
  tags = {
    namespace = "appcd-alpha"
    repo      = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_0cf34458-4b1c-51e1-943d-7e73f0383b30" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_52b9b8da-dcf9-59d9-99db-9b89900d232a.arn
  role       = module.stackgen_2ec6e0a9-ee21-57d8-933a-5e70733b6d44.name
}

module "stackgen_0df81c44-1768-5ee9-8be7-b678d0872914" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "support.unstable.dev.stackgen.com"
  records                          = ["10 feedback-smtp.us-west-2.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 300
  type                             = "MX"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_0e4ba483-b645-503e-8967-78a977feef3a" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = module.stackgen_1f420006-7bc0-5d35-86e7-dfee34693398.name
}

module "stackgen_0e9edbfa-a9d2-5da4-a7c2-9c85ff546723" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodeMinimalPolicy"
  role       = module.stackgen_9a552737-152d-5c1c-8b60-276d3598af44.name
}

module "stackgen_0ee8d34d-8ce6-5297-91b0-2ce10d141e29" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_bedeb7c5-6f89-50bf-9053-03d7eb27aa69.arn
  role       = module.stackgen_c2eff8b1-c67b-5421-b877-2726bbb5f57f.name
}

module "stackgen_0f02fa32-5e27-5075-9f54-9b94287b0bb8" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = module.stackgen_431f316b-b29f-5c1b-a684-6d5269159edf.name
}

module "stackgen_0f45bae4-f371-5f37-96eb-0731dcba8bfb" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "jcywhhnssd7a7b4hbud6ygscoryl5tei._domainkey.main.dev.stackgen.com"
  records                          = ["jcywhhnssd7a7b4hbud6ygscoryl5tei.dkim.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 1800
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_0f568353-d06e-5022-8748-7ea557205d2c" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ecs.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Role to enable Amazon ECS to manage your cluster."
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForECS"
  path                  = "/aws-service-role/ecs.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_0f748b11-8108-5510-a44d-7f4aca530f26" {
  source       = "./modules/aws_db_parameter_group"
  description  = "Managed by Terraform"
  family       = "aurora-postgresql15"
  name         = "retail-store-orders-20251006122337417000000003"
  name_prefix  = "retail-store-orders-"
  parameter    = []
  skip_destroy = false
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_0f98f238-3782-57ef-ab56-f864618bf573" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_4bdadd44-ffe9-54f5-a02b-2dfccee7d6e5.name
}

module "stackgen_10555365-c597-5f3f-9e78-ddba734b4f88" {
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
  revoke_rules_on_delete = null
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
  vpc_id   = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_110a92d9-25fc-5c70-9511-5569840b97f1" {
  source  = "./modules/aws_iam_access_key"
  pgp_key = null
  status  = "Active"
  user    = module.stackgen_a5785c3e-33cb-5850-9b62-2c83fd4c4d5c.name
}

module "stackgen_112662b0-4d41-5dcf-96ce-fdbe58ca1607" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_0bbb4566-02cc-56f9-8511-86f67013a661.name
}

module "stackgen_113b4509-bac4-539a-8f7e-f972df1fa6d8" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "AmazonEKS_S3_CSI_Policy"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"s3:CreateBucket\",\"s3:DeleteBucket\",\"s3:GetBucketLocation\",\"s3:ListBucket\",\"s3:PutObject\",\"s3:GetObject\",\"s3:DeleteObject\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_11509f7e-4591-59f7-bfe8-48a4cfec1ceb" {
  source                          = "./modules/aws_cloudfront_distribution"
  aliases                         = []
  comment                         = null
  continuous_deployment_policy_id = ""
  custom_error_response           = []
  default_cache_behavior = [{
    allowed_methods           = ["GET", "HEAD"]
    cache_policy_id           = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    cached_methods            = ["GET", "HEAD"]
    compress                  = true
    default_ttl               = 0
    field_level_encryption_id = ""
    forwarded_values          = []
    function_association      = []
    grpc_config = [{
      enabled = false
    }]
    lambda_function_association = [{
      event_type   = "viewer-request"
      include_body = false
      lambda_arn   = "arn:aws:lambda:us-east-1:339712749745:function:basicauth:1"
    }]
    max_ttl                    = 0
    min_ttl                    = 0
    origin_request_policy_id   = ""
    realtime_log_config_arn    = ""
    response_headers_policy_id = ""
    smooth_streaming           = false
    target_origin_id           = "devdocs.stackgen.com.s3.us-west-2.amazonaws.com"
    trusted_key_groups         = []
    trusted_signers            = []
    viewer_protocol_policy     = "allow-all"
  }]
  default_root_object    = "index.html"
  enabled                = true
  http_version           = "http2"
  is_ipv6_enabled        = true
  logging_config         = []
  ordered_cache_behavior = []
  origin = [{
    connection_attempts      = 3
    connection_timeout       = 10
    custom_header            = []
    custom_origin_config     = []
    domain_name              = "devdocs.stackgen.com.s3.us-west-2.amazonaws.com"
    origin_access_control_id = "E1DYBISI3IUYUC"
    origin_id                = "devdocs.stackgen.com.s3.us-west-2.amazonaws.com"
    origin_path              = ""
    origin_shield            = []
    s3_origin_config         = []
    vpc_origin_config        = []
  }]
  price_class = "PriceClass_All"
  restrictions = [{
    geo_restriction = [{
      locations        = []
      restriction_type = "none"
    }]
  }]
  staging = false
  tags    = {}
  viewer_certificate = [{
    acm_certificate_arn            = ""
    cloudfront_default_certificate = true
    iam_certificate_id             = ""
    minimum_protocol_version       = "TLSv1"
    ssl_support_method             = ""
  }]
  wait_for_deployment = true
  web_acl_id          = ""
}

module "stackgen_1157df47-b953-5055-ad40-db161c176502" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_bbad1ee5-40dc-538e-aeff-f117c26a2252.name
}

module "stackgen_118ae256-b2d8-5fa4-b7bc-7914656a53bd" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_1c183b3e-0388-588e-b73b-f8cd91af5aab.name
}

module "stackgen_127c1820-77ac-58c0-b515-ebb5c13b2ce7" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/7155136752F60CAFFBFF6D38A2242E3E:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/7155136752F60CAFFBFF6D38A2242E3E:sub\":\"system:serviceaccount:kube-system:aws-for-fluent-bit-sa\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/7155136752F60CAFFBFF6D38A2242E3E\"}}],\"Version\":\"2012-10-17\"}"
  description           = "IRSA for aws-for-fluent-bit"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "aws-for-fluent-bit-20240612185636694400000003"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    appcd_module  = "vpc"
    maintained_by = "support@appcd.com"
  }
}

module "stackgen_12a40f1d-afff-5310-98c9-4d3e5811db10" {
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
    security_groups  = ["sg-0dcfa5969f791ae3e"]
    self             = false
    to_port          = 443
  }]
  name                   = "retail-store-cluster-20251006122600099600000012"
  revoke_rules_on_delete = null
  tags = {
    Name             = "retail-store-cluster"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
  vpc_id   = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_13b969b8-392c-51fc-8d7a-fff9dc379d2d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonMQServiceRolePolicy"
  role       = module.stackgen_e8a71ac7-bf19-5f45-8251-3b1076eac173.name
}

module "stackgen_141be57b-e964-58f8-bbc4-0f3d58cdf953" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/CostOptimizationHubAdminAccess"
  role       = module.stackgen_71761eff-46ba-5dfd-bf6e-44191a4ed3fd.name
}

module "stackgen_142e8be8-7837-540f-8e3f-0601d580ad48" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"spot.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Default EC2 Spot Service Linked Role"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForEC2Spot"
  path                  = "/aws-service-role/spot.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_1455ef31-6797-4d1d-81a3-6be753895e39" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = null
  map_public_ip_on_launch = false
  tags                    = {}
  vpc_id                  = null
}

module "stackgen_1481d0fc-6847-5bd6-bcc7-1bd9d49c2fc4" {
  source = "./modules/aws_iam_group_membership"
  group  = "AWSSESSendingGroupDoNotRename"
  name   = "terraform-20251007091814156500000002"
  users = [
    module.stackgen_2b2ae8eb-703f-56f8-b09e-b173fd0780f9.name,
  ]
}

module "stackgen_1499004a-8ec9-53aa-8adf-9ad8659278c1" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonEKSServiceRolePolicy"
  role       = module.stackgen_cf2fd37d-6d85-5268-841b-7d8e19c1c215.name
}

module "stackgen_151b221b-a95a-4244-94d5-a8d51e5f5a45" {
  source                               = "./modules/aws_vpc"
  cidr_block                           = null
  enable_dns_hostnames                 = false
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  tags                                 = {}
}

module "stackgen_15341f7d-838a-5947-9874-8518f685ce11" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_8bac6f88-fc0d-561d-a62a-1b8f366097f1.arn
  role       = module.stackgen_68fab510-14be-56bb-bd3f-4d912fe92d4d.name
}

module "stackgen_157ea11a-4551-543c-bc17-bd08f4e83749" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringLike\":{\"oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064:sub\":\"system:serviceaccount:kube-system:s3-csi-*\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "developer-s3-mount-role"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_159d8a90-1f01-56fb-855e-7f9a2ff08a9f" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSSOServiceRolePolicy"
  role       = module.stackgen_688f9759-285c-55ad-8c2e-e04c6a422064.name
}

module "stackgen_15b7cc87-81a2-5d0b-ae97-1851a99f0d6b" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonSSMServiceRolePolicy"
  role       = module.stackgen_57467032-089f-5bc1-9024-1afb90712e9d.name
}

module "stackgen_15be0fac-0696-58b2-9f0e-726bff56ae05" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/ServiceQuotasServiceRolePolicy"
  role       = module.stackgen_0b01e8fa-1979-5f53-a594-3e51af36502e.name
}

module "stackgen_15e13819-d8d5-5ee0-8e39-e6e30ca53faa" {
  source              = "./modules/aws_s3_bucket"
  bucket              = "sr-athena-query-bucket"
  force_destroy       = null
  object_lock_enabled = false
  tags                = {}
}

module "stackgen_16133675-d4b8-4096-bf0a-b7a4de1dc450" {
  source                             = "./modules/aws_rds_cluster"
  availability_zones                 = []
  backup_retention_period            = 9
  cluster_identifier                 = null
  copy_tags_to_snapshot              = false
  database_name                      = null
  db_subnet_group_name               = "default"
  enable_global_write_forwarding     = null
  enable_local_write_forwarding      = null
  enabled_cloudwatch_logs_exports    = null
  engine                             = null
  engine_mode                        = null
  engine_version                     = null
  global_cluster_identifier          = null
  kms_key_id                         = null
  master_password                    = var.master_password_16133675-d4b8-4096-bf0a-b7a4de1dc450
  master_username                    = null
  preferred_backup_window            = "07:00-09:00"
  preferred_maintenance_window       = "sun:05:00-sun:06:00"
  scaling_configuration              = []
  serverlessv2_scaling_configuration = []
  skip_final_snapshot                = null
  storage_encrypted                  = true
  tags                               = {}
  vpc_security_group_ids             = null
}

module "stackgen_17591a60-f41b-5910-8a5c-693a9db8de38" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_0cba6313-3933-57a7-97ab-f4552457815c.arn
  role       = module.stackgen_f0e0bc09-8d3f-5f63-bfc1-aeb5a3e3ef3c.name
}

module "stackgen_17ffe339-878b-57c0-b031-1caca5b1f6ee" {
  source                           = "./modules/aws_autoscaling_group"
  capacity_rebalance               = true
  desired_capacity                 = 1
  enabled_metrics                  = ["GroupAndWarmPoolDesiredCapacity", "GroupAndWarmPoolTotalCapacity", "GroupDesiredCapacity", "GroupInServiceCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingCapacity", "GroupPendingInstances", "GroupStandbyCapacity", "GroupStandbyInstances", "GroupTerminatingCapacity", "GroupTerminatingInstances", "GroupTotalCapacity", "GroupTotalInstances", "WarmPoolDesiredCapacity", "WarmPoolMinSize", "WarmPoolPendingCapacity", "WarmPoolTerminatingCapacity", "WarmPoolTotalCapacity", "WarmPoolWarmedCapacity"]
  force_delete                     = null
  force_delete_warm_pool           = null
  health_check_grace_period        = 15
  health_check_type                = "EC2"
  ignore_failed_scaling_activities = null
  launch_configuration             = ""
  launch_template                  = []
  max_instance_lifetime            = 0
  max_size                         = 3
  min_size                         = 1
  mixed_instances_policy = [{
    instances_distribution = [{
      on_demand_allocation_strategy            = "prioritized"
      on_demand_base_capacity                  = 0
      on_demand_percentage_above_base_capacity = 100
      spot_allocation_strategy                 = "lowest-price"
      spot_instance_pools                      = 2
      spot_max_price                           = ""
    }]
    launch_template = [{
      launch_template_specification = [{
        launch_template_id   = "lt-09d5c88199dca26a7"
        launch_template_name = "eks-caccdcc3-1181-bfb8-7f41-b9fc410eb5d6"
        version              = "1"
      }]
      override = [{
        instance_requirements         = []
        instance_type                 = "m5.large"
        launch_template_specification = []
        weighted_capacity             = ""
      }]
    }]
  }]
  protect_from_scale_in = false
  suspended_processes   = []
  tag = [{
    key                 = "eks:cluster-name"
    propagate_at_launch = true
    value               = "retail-store"
    }, {
    key                 = "eks:nodegroup-name"
    propagate_at_launch = true
    value               = "managed-nodegroup-3-20251006123639664100000035"
    }, {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = true
    value               = "true"
    }, {
    key                 = "k8s.io/cluster-autoscaler/retail-store"
    propagate_at_launch = true
    value               = "owned"
    }, {
    key                 = "kubernetes.io/cluster/retail-store"
    propagate_at_launch = true
    value               = "owned"
  }]
  target_group_arns         = []
  termination_policies      = ["AllocationStrategy", "OldestLaunchTemplate", "OldestInstance"]
  timeouts                  = null
  vpc_zone_identifier       = ["subnet-0c2d0b0d426dad687"]
  wait_for_capacity_timeout = null
}

module "stackgen_185d26eb-0f36-56fb-951d-f6964f399278" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_0bbb4566-02cc-56f9-8511-86f67013a661.name
}

module "stackgen_1899b7a3-03a3-5e5c-809d-008504ae5ded" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "eks-bccad77f-1aa7-9973-86ad-70c11178c2bb"
  name_prefix = ""
  path        = "/"
  role        = module.stackgen_eb72ead6-cac7-559a-8b9d-be1eed6fe356.name
  tags        = {}
}

module "stackgen_19575765-b850-542c-9ab0-ddfef6878f73" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = module.stackgen_552d7ce3-560a-56d3-80dd-e6e2f012a352.name
}

module "stackgen_195fb702-0a5d-5f00-901a-eb2143c8d379" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/CloudwatchApplicationInsightsServiceLinkedRolePolicy"
  role       = module.stackgen_45231a74-1177-54a2-b06b-b8375f75c220.name
}

module "stackgen_1995042a-dcca-58d6-b610-b3378f0d2414" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_0bbb4566-02cc-56f9-8511-86f67013a661.name
}

module "stackgen_19a2f6df-9a66-5d35-95f1-28543bf90312" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_9aa05b2b-f650-542f-b376-2b7123b70856.name
}

module "stackgen_19ba0129-0dad-513b-ab75-bbc991664bf0" {
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
    security_groups  = ["sg-0dcfa5969f791ae3e"]
    self             = false
    to_port          = 5432
  }]
  name                   = "retail-store-orders-20251006122600097000000011"
  revoke_rules_on_delete = null
  tags = {
    Name             = "retail-store-orders"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
  vpc_id   = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_19ba4c86-7702-54c7-8442-00aafed0df71" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":[\"sts:TagSession\",\"sts:AssumeRole\"],\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"eks.amazonaws.com\"},\"Sid\":\"EKSClusterAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "tooling-dev-eks-cluster-20250424072824915000000006"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    appcd_module  = "vpc"
    created_for   = "tooling-dev"
    maintained_by = "support@stackgen.com"
  }
}

module "stackgen_19e38c7e-51ca-552d-9410-e37c916e8e4b" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "eks-caccdcc3-1181-bfb8-7f41-b9fc410eb5d6"
  name_prefix = ""
  path        = "/"
  role        = module.stackgen_1c183b3e-0388-588e-b73b-f8cd91af5aab.name
  tags        = {}
}

module "stackgen_1a3a1b32-a26b-593c-9d3f-a038b5e3e095" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_9aa05b2b-f650-542f-b376-2b7123b70856.name
}

module "stackgen_1ab75cc9-8354-5594-873d-2e78cfcbc709" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  role       = module.stackgen_55658a91-7c5a-5d7d-bf65-50392bc11058.name
}

module "stackgen_1acbc27b-0898-5a5b-bff6-7d9be2262e13" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_553bc7df-4f50-52c5-9f05-3f914d5a1b2f.arn
  role       = module.stackgen_2ec6e0a9-ee21-57d8-933a-5e70733b6d44.name
}

module "stackgen_1b8403f2-d340-588f-b297-e58cf420133e" {
  source    = "./modules/aws_iam_role_policy"
  name      = "DenyDataAccessPolicy"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"cloudformation:GetTemplate\",\"dynamodb:GetItem\",\"dynamodb:BatchGetItem\",\"dynamodb:Query\",\"dynamodb:Scan\",\"ec2:GetConsoleOutput\",\"ec2:GetConsoleScreenshot\",\"ecr:BatchGetImage\",\"ecr:GetAuthorizationToken\",\"ecr:GetDownloadUrlForLayer\",\"kinesis:Get*\",\"lambda:GetFunction\",\"logs:GetLogEvents\",\"s3:GetObject\",\"sdb:Select*\",\"sqs:ReceiveMessage\"],\"Effect\":\"Deny\",\"Resource\":[\"*\"]}]}"
  role      = module.stackgen_55658a91-7c5a-5d7d-bf65-50392bc11058.name
  role_type = "custom"
}

module "stackgen_1b967ab1-3a45-58ef-8a57-8aac46442217" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_dcb10c96-bd8f-5a2d-9008-93634a24d80e.arn
  role       = module.stackgen_e2586edb-0f9c-56df-8103-d321aa064c33.name
}

module "stackgen_1c183b3e-0388-588e-b73b-f8cd91af5aab" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Sid\":\"EKSNodeAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = "EKS managed node group IAM role"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "managed-nodegroup-3-eks-node-group-20251006122606287400000013"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_1e03b169-771b-5ab5-8d09-0cabb903a156" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/D7B7E856ABEFFE50EBC5A9A4A5B116E5:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/D7B7E856ABEFFE50EBC5A9A4A5B116E5:sub\":\"system:serviceaccount:external-secrets:external-secrets-sa\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/D7B7E856ABEFFE50EBC5A9A4A5B116E5\"}}],\"Version\":\"2012-10-17\"}"
  description           = "IRSA for external-secrets operator"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "external-secrets-2024012019293941320000002f"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_1e392e5d-2802-5216-a458-95c9b8684852" {
  source         = "./modules/aws_iam_openid_connect_provider"
  client_id_list = ["sts.amazonaws.com"]
  tags = {
    Name       = "engineering-eks-eks-irsa"
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
  thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280", "06b25927c42a721631c1efd9431e648fa62e1e39", "2ad974a775f73cbdbbd8f5ac3a49255fa8fb1f8c", "e1d31a1f94725daaef02dcf1c1bb0ff4a28a6060"]
  url             = "oidc.eks.us-west-2.amazonaws.com/id/9F6122F9541B250B932EB737FC42D4F4"
}

module "stackgen_1e4710ad-6363-57e8-8eca-f137f5cb0fa1" {
  source      = "./modules/aws_iam_policy"
  description = "Cluster encryption policy to allow cluster role to utilize CMK provided"
  name        = "developer-eks-cluster-ClusterEncryption2024021207251415930000000b"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"kms:Encrypt\",\"kms:Decrypt\",\"kms:ListGrants\",\"kms:DescribeKey\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:kms:us-west-2:339712749745:key/c98bbc54-71d9-4e31-b922-8b1660204479\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_1e88b453-294b-5398-8df5-dc6c7c6cdae5" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "appcd-installer_delete_policy"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"s3:DeleteBucket\",\"kms:DeleteAlias\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"Global\"},{\"Action\":[\"sqs:deletequeue\",\"s3:DeleteBucket\",\"rds:DeleteDBSubnetGroup\",\"rds:DeleteDBParameterGroup\",\"rds:DeleteDBInstance\",\"logs:DeleteLogGroup\",\"iam:RemoveRoleFromInstanceProfile\",\"iam:DetachRolePolicy\",\"iam:DeleteRolePolicy\",\"iam:DeleteRole\",\"iam:DeletePolicy\",\"iam:DeleteOpenIDConnectProvider\",\"iam:DeleteInstanceProfile\",\"events:RemoveTargets\",\"events:DeleteRule\",\"ec2:RevokeSecurityGroupIngress\",\"ec2:RevokeSecurityGroupEgress\",\"ec2:ReleaseAddress\",\"ec2:DisassociateRouteTable\",\"ec2:DisassociateAddress\",\"ec2:DetachInternetGateway\",\"ec2:DeleteVpc\",\"ec2:DeleteTags\",\"ec2:DeleteSubnet\",\"ec2:DeleteSecurityGroup\",\"ec2:DeleteRouteTable\",\"ec2:DeleteRoute\",\"ec2:DeleteNatGateway\",\"ec2:DeleteLaunchTemplate\",\"ec2:DeleteInternetGateway\"],\"Condition\":{\"StringEquals\":{\"aws:ResourceTag/maintained_by\":\"support@appcd.com\"}},\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"DeleteAppCD\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    CreatedBy     = "AROAU6GDVGCYSVDDDSNQA:sks@appcd.com"
    Name          = "appcd-installer"
    Reason        = "appcd installer"
    maintained_by = "support@appcd.com"
  }
}

module "stackgen_1e9854cc-9f50-50d5-9aab-b8eea9ef8cf9" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"eks.amazonaws.com\"},\"Sid\":\"EKSClusterAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "dev-eks-cluster"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:CreateLogGroup\"],\"Effect\":\"Deny\",\"Resource\":\"*\"}]}"
  }]
  max_session_duration = 3600
  name                 = "dev-eks-cluster-20240120191851669500000004"
  path                 = "/"
  permissions_boundary = ""
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_1e9e8439-e537-5f04-8798-f81cd4074e05" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = module.stackgen_984453ee-883f-5434-bacf-95de97e68779.name
}

module "stackgen_1edcb463-5101-5631-bfc3-25a250acc358" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_e7da5ae7-3b7b-5af9-9bfc-dad2bc61c94c.name
}

module "stackgen_1f420006-7bc0-5d35-86e7-dfee34693398" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"monitoring.rds.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "terraform-20240130221510521800000005"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_1f677ded-20df-4828-8dbc-c59cab458307" {
  source                     = "./modules/aws_mq_broker"
  apply_immediately          = false
  authentication_strategy    = "simple"
  auto_minor_version_upgrade = true
  broker_name                = null
  configuration              = []
  deployment_mode            = "ACTIVE_STANDBY_MULTI_AZ"
  encryption_options = [{
    use_aws_owned_key = false
  }]
  engine_type          = null
  engine_version       = null
  host_instance_type   = null
  ldap_server_metadata = []
  logs = [{
    general = true
  }]
  maintenance_window_start_time = []
  publicly_accessible           = false
  security_groups               = null
  storage_type                  = null
  subnet_ids                    = null
  tags                          = {}
  user                          = []
}

module "stackgen_1f7e3335-0725-52e8-b57a-6b84a291428b" {
  source      = "./modules/aws_iam_policy"
  description = "CloudTrail role to Import events into Lake"
  name        = "LakeImport-76e86f82-ba9f-4ed2-b503-3a7e5a140269"
  path        = "/service-role/"
  policy      = "{\"Statement\":[{\"Action\":[\"s3:ListBucket\",\"s3:GetBucketAcl\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::aws-cloudtrail-logs-339712749745-a4d3425f\"],\"Sid\":\"AWSCloudTrailImportBucketAccess20220706\"},{\"Action\":[\"s3:GetObject\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::aws-cloudtrail-logs-339712749745-a4d3425f/AWSLogs/339712749745/CloudTrail\",\"arn:aws:s3:::aws-cloudtrail-logs-339712749745-a4d3425f/AWSLogs/339712749745/CloudTrail/*\"],\"Sid\":\"AWSCloudTrailImportGetObject20220706\"}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_1f8874a0-1f2a-5af8-91cc-4ea5f42134b4" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "ks2eayyyu2fgfhmgowchluqyfkb6rjep._domainkey.unstable.dev.stackgen.com"
  records                          = ["ks2eayyyu2fgfhmgowchluqyfkb6rjep.dkim.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 1800
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_1ff50c97-541f-59a1-84e4-7810e5617d7b" {
  source  = "./modules/aws_iam_access_key"
  pgp_key = null
  status  = "Active"
  user    = module.stackgen_4ec19b0a-a8cf-5f76-8042-c90c7768da48.name
}

module "stackgen_2069eb0a-6d6e-53fd-83b7-24d8327ecc94" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = false
    name                   = "a4e778d2769fe4f4d84c7c1557eb2f2f-30bd8612c6ebf7de.elb.ap-south-1.amazonaws.com"
    zone_id                = "ZVDDRBQ08TROA"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "sks.dev.appcd.io"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_207033f3-ff41-4b18-a3b2-76e92fac3c6c" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = null
  map_public_ip_on_launch = false
  tags                    = {}
  vpc_id                  = null
}

module "stackgen_21142e65-bfae-56de-a280-b63711f630bf" {
  source                      = "./modules/aws_instance"
  ami                         = "ami-0372948d8ff019232"
  associate_public_ip_address = false
  availability_zone           = "us-east-1c"
  capacity_reservation_specification = [{
    capacity_reservation_preference = "open"
    capacity_reservation_target     = []
  }]
  cpu_options = [{
    amd_sev_snp      = ""
    core_count       = 1
    threads_per_core = 2
  }]
  credit_specification    = []
  disable_api_stop        = false
  disable_api_termination = false
  ebs_block_device        = []
  ebs_optimized           = false
  enable_primary_ipv6     = null
  enclave_options = [{
    enabled = false
  }]
  ephemeral_block_device               = []
  get_password_data                    = false
  hibernation                          = false
  host_id                              = ""
  host_resource_group_arn              = null
  iam_instance_profile                 = "eks-caccdcc3-1181-bfb8-7f41-b9fc410eb5d6"
  instance_initiated_shutdown_behavior = "stop"
  instance_market_options              = []
  instance_type                        = "m5.large"
  ipv6_address_count                   = 0
  ipv6_addresses                       = []
  key_name                             = ""
  launch_template = [{
    id      = "lt-09d5c88199dca26a7"
    name    = "eks-caccdcc3-1181-bfb8-7f41-b9fc410eb5d6"
    version = "1"
  }]
  maintenance_options = [{
    auto_recovery = "default"
  }]
  metadata_options = [{
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }]
  monitoring                 = true
  network_interface          = []
  placement_group            = ""
  placement_partition_number = 0
  private_dns_name_options = [{
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }]
  private_ip = "10.0.12.25"
  root_block_device = [{
    delete_on_termination = true
    device_name           = "/dev/xvda"
    encrypted             = false
    iops                  = 3000
    kms_key_id            = ""
    tags = {
      Name                 = "managed-nodegroup-3"
      created-by           = "retail-store-sample-app"
      "eks:cluster-name"   = "retail-store"
      "eks:nodegroup-name" = "managed-nodegroup-3-20251006123639664100000035"
      environment-name     = "retail-store"
    }
    tags_all = {
      Name                 = "managed-nodegroup-3"
      created-by           = "retail-store-sample-app"
      "eks:cluster-name"   = "retail-store"
      "eks:nodegroup-name" = "managed-nodegroup-3-20251006123639664100000035"
      environment-name     = "retail-store"
    }
    throughput  = 125
    volume_id   = "vol-047de6aae4ca6d0de"
    volume_size = 20
    volume_type = "gp3"
  }]
  secondary_private_ips = ["10.0.12.112", "10.0.12.164", "10.0.12.20", "10.0.12.209", "10.0.12.245", "10.0.12.36", "10.0.12.76", "10.0.12.88", "10.0.12.91"]
  security_groups       = []
  source_dest_check     = true
  subnet_id             = module.stackgen_9d425fc1-ba64-5441-a24a-bceed3c5fff0.id
  tags = {
    Name                                     = "managed-nodegroup-3"
    created-by                               = "retail-store-sample-app"
    "eks:cluster-name"                       = "retail-store"
    "eks:nodegroup-name"                     = "managed-nodegroup-3-20251006123639664100000035"
    environment-name                         = "retail-store"
    "k8s.io/cluster-autoscaler/enabled"      = "true"
    "k8s.io/cluster-autoscaler/retail-store" = "owned"
    "kubernetes.io/cluster/retail-store"     = "owned"
  }
  tenancy                     = "default"
  timeouts                    = null
  user_data                   = null
  user_data_base64            = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiBhcHBsaWNhdGlvbi9ub2RlLmVrcy5hd3MKCi0tLQphcGlWZXJzaW9uOiBub2RlLmVrcy5hd3MvdjFhbHBoYTEKa2luZDogTm9kZUNvbmZpZwpzcGVjOgogIGNsdXN0ZXI6CiAgICBhcGlTZXJ2ZXJFbmRwb2ludDogaHR0cHM6Ly9GM0Y0OTBCMEJGMTEyNUM0MjU1ODVFMjM3NkFBMDIyMC5ncjcudXMtZWFzdC0xLmVrcy5hbWF6b25hd3MuY29tCiAgICBjZXJ0aWZpY2F0ZUF1dGhvcml0eTogTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUkNWRU5EUVdVeVowRjNTVUpCWjBsSlNVWjJjREo0Y2xGdlpWbDNSRkZaU2t0dldrbG9kbU5PUVZGRlRFSlJRWGRHVkVWVVRVSkZSMEV4VlVVS1FYaE5TMkV6Vm1sYVdFcDFXbGhTYkdONlFXVkdkekI1VGxSRmQwMUVXWGhOYWtrelRWUlNZVVozTUhwT1ZFVjNUVVJSZUUxcVRYbE5WRkpoVFVKVmVBcEZla0ZTUW1kT1ZrSkJUVlJEYlhReFdXMVdlV0p0VmpCYVdFMTNaMmRGYVUxQk1FZERVM0ZIVTBsaU0wUlJSVUpCVVZWQlFUUkpRa1IzUVhkblowVkxDa0Z2U1VKQlVVUm9ka280UzNZeVVVbHZWMDVuV1cwelMwaFNNbkZqZFhwREszbHliVUV4VFZKNk9XWjROV1p0VG5GQlQzWnZjVFJ4UXpJMlIwZG1kMHdLZEVGVVZsZGhMelpuZDJOSmIyMW5iRlpPUkVoRGN6ZFNWemRtVmtzdmNGcGFNblJyVkZsdmVrRnJRV28zYUZZMVV6ZEtaRE5NUlhkTGNWbEVOMDlIY1FwSFRHTXJkVmh6WVRkUmExWjFjRzFJV1hkTFJ6TnVXazFEV0VKb2RpOXRjbFJpVW5CNlNHRlVVVEk1ZG1GVFpreHBiVGhVWkUxdVFsUmxLemRhT1c0NENsY3hSMFpaVlZCS1JIb3dWbmh4UWxCbU5ITXlTV2N4YTNoSVFuWmFhWHBJYVcxb016VlNPRlpaWmpGUWJFVkNVVzVOVkRWeFltVlhUa3RLTTB0V2JHTUtNQ3RuV1VwVVozQnNUekJGWVRKVWRsbEVRV2xQTVcxck4zTmlWazlRVjJOU1F5dEhUM0pVTUZvM2FWY3dTemwyYkZrM1VGZHlRa3AwZG1wd05VWlJiQXA0YlZNMlZ6VmFUMmtyWkVVNFZGcDBaVmR5TjFFMGRHMUVjRmQwUVdkTlFrRkJSMnBYVkVKWVRVRTBSMEV4VldSRWQwVkNMM2RSUlVGM1NVTndSRUZRQ2tKblRsWklVazFDUVdZNFJVSlVRVVJCVVVndlRVSXdSMEV4VldSRVoxRlhRa0pSWjNOdlQxSTFOVEJCUVV4UlkwWkJNalYzTUVWblJHZGlkV3hVUVZZS1FtZE9Wa2hTUlVWRWFrRk5aMmR3Y21SWFNteGpiVFZzWkVkV2VrMUJNRWREVTNGSFUwbGlNMFJSUlVKRGQxVkJRVFJKUWtGUlFsWXdZakJLVTBaeVR3cEtlSEYzTVc5RlQwRndkMFZ6UkdKSVlYb3hVMlYyTHpSRlpFRjFZbEZqTjBWWk4xbzVZVkpoTjBoU016TXdZWFUwTlc4eldFbHlkSE12WTJsQ0sybHJDbEJQYVVOTWFVSlZibFpYV1ROSWRXTTBMekVyZW5BNWJXZDBiSEZETVVRcmFtYzNVSE56ZUhoVlpXSlpRVEUxVVU5NkwyTlVNMVF5YkhwNmJGSTRUWE1LYkVSUmEweExVRlJ5TTAwd01VUXZSWFJaYzJaVVowYzRZalJqUkZabmNuTlFkamRIVDBWUmVHeENNa2RIYUU5ck1ESXlORlJIT0c0MVpYUTVOa1pEWVFwdU5FZ3ZLMGt5YlZCRmVuRXdkMkpRZGtOak9YTjBWekp5ZDJGMFF6WlpXRWhwYmtkNk5EUkdhams1ZUdoQ1VqSlZRbWhSZEdKU01YWktTMFZDYUdJdkNqaEdNV0kxVGxCb1ZVazFSeTlpZUUxdFJFWkdiR1JGUVZCb05XZEpaemh2YlU4d2VVdEhTUzlYVW5CaE0zSkJiU3RXYjNGdE15dDNkbmRRTlZoVVVEa0tkVGRCUlhWeGVVdzNla05wQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLCiAgICBjaWRyOiAxNzIuMjAuMC4wLzE2CiAgICBuYW1lOiByZXRhaWwtc3RvcmUKICBrdWJlbGV0OgogICAgY29uZmlnOgogICAgICBtYXhQb2RzOiAyOQogICAgICBjbHVzdGVyRE5TOgogICAgICAtIDE3Mi4yMC4wLjEwCiAgICBmbGFnczoKICAgIC0gIi0tbm9kZS1sYWJlbHM9ZWtzLmFtYXpvbmF3cy5jb20vc291cmNlTGF1bmNoVGVtcGxhdGVWZXJzaW9uPTEsZWtzLmFtYXpvbmF3cy5jb20vbm9kZWdyb3VwLWltYWdlPWFtaS0wMzcyOTQ4ZDhmZjAxOTIzMixla3MuYW1hem9uYXdzLmNvbS9jYXBhY2l0eVR5cGU9T05fREVNQU5ELGVrcy5hbWF6b25hd3MuY29tL25vZGVncm91cD1tYW5hZ2VkLW5vZGVncm91cC0zLTIwMjUxMDA2MTIzNjM5NjY0MTAwMDAwMDM1LGVrcy5hbWF6b25hd3MuY29tL3NvdXJjZUxhdW5jaFRlbXBsYXRlSWQ9bHQtMDg2NDg5ZmYwY2VjYjQ0YWEiCgotLS8vLS0="
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-0dcfa5969f791ae3e"]
}

module "stackgen_211ef080-5ac4-598c-bb2b-e81dd68c3916" {
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
    enabled = false
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
  timeouts = null
  ttl = [{
    attribute_name = ""
    enabled        = false
  }]
  write_capacity = 0
}

module "stackgen_213dffb0-89f4-4167-a0c2-0fee8c2a7ff4" {
  source = "./modules/aws_dynamodb_table"
  attribute = [{
    name = "id"
    type = "S"
  }]
  billing_mode           = "PROVISIONED"
  global_secondary_index = []
  hash_key               = "id"
  local_secondary_index  = []
  name                   = "my-table"
  point_in_time_recovery = [{
    enabled = true
  }]
  range_key     = ""
  read_capacity = 1
  server_side_encryption = [{
    enabled = true
  }]
  stream_enabled   = null
  stream_view_type = "NEW_IMAGE"
  tags             = {}
  timeouts         = null
  ttl              = []
  write_capacity   = 1
}

module "stackgen_214170c8-59eb-5cd4-8afb-ff0aa8573e9c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/ServiceQuotasServiceRolePolicy"
  role       = module.stackgen_0b01e8fa-1979-5f53-a594-3e51af36502e.name
}

module "stackgen_218b5daa-6cf3-599e-9fca-bf81fda19fdf" {
  source                      = "./modules/aws_instance"
  ami                         = "ami-0372948d8ff019232"
  associate_public_ip_address = false
  availability_zone           = "us-east-1b"
  capacity_reservation_specification = [{
    capacity_reservation_preference = "open"
    capacity_reservation_target     = []
  }]
  cpu_options = [{
    amd_sev_snp      = ""
    core_count       = 1
    threads_per_core = 2
  }]
  credit_specification    = []
  disable_api_stop        = false
  disable_api_termination = false
  ebs_block_device = [{
    delete_on_termination = false
    device_name           = "/dev/xvdaa"
    encrypted             = false
    iops                  = 100
    kms_key_id            = ""
    snapshot_id           = ""
    tags = {
      CSIVolumeName                             = "pvc-e66f9814-b8e6-47ce-8593-6703c908e803"
      KubernetesCluster                         = "retail-store"
      Name                                      = "retail-store-dynamic-pvc-e66f9814-b8e6-47ce-8593-6703c908e803"
      "ebs.csi.aws.com/cluster"                 = "true"
      "kubernetes.io/cluster/retail-store"      = "owned"
      "kubernetes.io/created-for/pv/name"       = "pvc-e66f9814-b8e6-47ce-8593-6703c908e803"
      "kubernetes.io/created-for/pvc/name"      = "devopsnow-vmagent"
      "kubernetes.io/created-for/pvc/namespace" = "devopsnow"
    }
    tags_all = {
      CSIVolumeName                             = "pvc-e66f9814-b8e6-47ce-8593-6703c908e803"
      KubernetesCluster                         = "retail-store"
      Name                                      = "retail-store-dynamic-pvc-e66f9814-b8e6-47ce-8593-6703c908e803"
      "ebs.csi.aws.com/cluster"                 = "true"
      "kubernetes.io/cluster/retail-store"      = "owned"
      "kubernetes.io/created-for/pv/name"       = "pvc-e66f9814-b8e6-47ce-8593-6703c908e803"
      "kubernetes.io/created-for/pvc/name"      = "devopsnow-vmagent"
      "kubernetes.io/created-for/pvc/namespace" = "devopsnow"
    }
    throughput  = 0
    volume_id   = "vol-0878a9f75f2c9b548"
    volume_size = 10
    volume_type = "gp2"
  }]
  ebs_optimized       = false
  enable_primary_ipv6 = null
  enclave_options = [{
    enabled = false
  }]
  ephemeral_block_device               = []
  get_password_data                    = false
  hibernation                          = false
  host_id                              = ""
  host_resource_group_arn              = null
  iam_instance_profile                 = "eks-aaccdcc3-1186-ec63-632e-e55f8bc1abde"
  instance_initiated_shutdown_behavior = "stop"
  instance_market_options              = []
  instance_type                        = "m5.large"
  ipv6_address_count                   = 0
  ipv6_addresses                       = []
  key_name                             = ""
  launch_template = [{
    id      = "lt-06ab3c2debfd087cb"
    name    = "eks-aaccdcc3-1186-ec63-632e-e55f8bc1abde"
    version = "1"
  }]
  maintenance_options = [{
    auto_recovery = "default"
  }]
  metadata_options = [{
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }]
  monitoring                 = true
  network_interface          = []
  placement_group            = ""
  placement_partition_number = 0
  private_dns_name_options = [{
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }]
  private_ip = "10.0.11.117"
  root_block_device = [{
    delete_on_termination = true
    device_name           = "/dev/xvda"
    encrypted             = false
    iops                  = 3000
    kms_key_id            = ""
    tags = {
      Name                 = "managed-nodegroup-2"
      created-by           = "retail-store-sample-app"
      "eks:cluster-name"   = "retail-store"
      "eks:nodegroup-name" = "managed-nodegroup-2-20251006123639664000000033"
      environment-name     = "retail-store"
    }
    tags_all = {
      Name                 = "managed-nodegroup-2"
      created-by           = "retail-store-sample-app"
      "eks:cluster-name"   = "retail-store"
      "eks:nodegroup-name" = "managed-nodegroup-2-20251006123639664000000033"
      environment-name     = "retail-store"
    }
    throughput  = 125
    volume_id   = "vol-01379ed603a3e000b"
    volume_size = 20
    volume_type = "gp3"
  }]
  secondary_private_ips = ["10.0.11.10", "10.0.11.137", "10.0.11.138", "10.0.11.171", "10.0.11.177", "10.0.11.233", "10.0.11.238", "10.0.11.240", "10.0.11.243"]
  security_groups       = []
  source_dest_check     = true
  subnet_id             = module.stackgen_a3505971-d83d-5873-a44c-5b6f1898daa8.id
  tags = {
    Name                                     = "managed-nodegroup-2"
    created-by                               = "retail-store-sample-app"
    "eks:cluster-name"                       = "retail-store"
    "eks:nodegroup-name"                     = "managed-nodegroup-2-20251006123639664000000033"
    environment-name                         = "retail-store"
    "k8s.io/cluster-autoscaler/enabled"      = "true"
    "k8s.io/cluster-autoscaler/retail-store" = "owned"
    "kubernetes.io/cluster/retail-store"     = "owned"
  }
  tenancy                     = "default"
  timeouts                    = null
  user_data                   = null
  user_data_base64            = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiBhcHBsaWNhdGlvbi9ub2RlLmVrcy5hd3MKCi0tLQphcGlWZXJzaW9uOiBub2RlLmVrcy5hd3MvdjFhbHBoYTEKa2luZDogTm9kZUNvbmZpZwpzcGVjOgogIGNsdXN0ZXI6CiAgICBhcGlTZXJ2ZXJFbmRwb2ludDogaHR0cHM6Ly9GM0Y0OTBCMEJGMTEyNUM0MjU1ODVFMjM3NkFBMDIyMC5ncjcudXMtZWFzdC0xLmVrcy5hbWF6b25hd3MuY29tCiAgICBjZXJ0aWZpY2F0ZUF1dGhvcml0eTogTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUkNWRU5EUVdVeVowRjNTVUpCWjBsSlNVWjJjREo0Y2xGdlpWbDNSRkZaU2t0dldrbG9kbU5PUVZGRlRFSlJRWGRHVkVWVVRVSkZSMEV4VlVVS1FYaE5TMkV6Vm1sYVdFcDFXbGhTYkdONlFXVkdkekI1VGxSRmQwMUVXWGhOYWtrelRWUlNZVVozTUhwT1ZFVjNUVVJSZUUxcVRYbE5WRkpoVFVKVmVBcEZla0ZTUW1kT1ZrSkJUVlJEYlhReFdXMVdlV0p0VmpCYVdFMTNaMmRGYVUxQk1FZERVM0ZIVTBsaU0wUlJSVUpCVVZWQlFUUkpRa1IzUVhkblowVkxDa0Z2U1VKQlVVUm9ka280UzNZeVVVbHZWMDVuV1cwelMwaFNNbkZqZFhwREszbHliVUV4VFZKNk9XWjROV1p0VG5GQlQzWnZjVFJ4UXpJMlIwZG1kMHdLZEVGVVZsZGhMelpuZDJOSmIyMW5iRlpPUkVoRGN6ZFNWemRtVmtzdmNGcGFNblJyVkZsdmVrRnJRV28zYUZZMVV6ZEtaRE5NUlhkTGNWbEVOMDlIY1FwSFRHTXJkVmh6WVRkUmExWjFjRzFJV1hkTFJ6TnVXazFEV0VKb2RpOXRjbFJpVW5CNlNHRlVVVEk1ZG1GVFpreHBiVGhVWkUxdVFsUmxLemRhT1c0NENsY3hSMFpaVlZCS1JIb3dWbmh4UWxCbU5ITXlTV2N4YTNoSVFuWmFhWHBJYVcxb016VlNPRlpaWmpGUWJFVkNVVzVOVkRWeFltVlhUa3RLTTB0V2JHTUtNQ3RuV1VwVVozQnNUekJGWVRKVWRsbEVRV2xQTVcxck4zTmlWazlRVjJOU1F5dEhUM0pVTUZvM2FWY3dTemwyYkZrM1VGZHlRa3AwZG1wd05VWlJiQXA0YlZNMlZ6VmFUMmtyWkVVNFZGcDBaVmR5TjFFMGRHMUVjRmQwUVdkTlFrRkJSMnBYVkVKWVRVRTBSMEV4VldSRWQwVkNMM2RSUlVGM1NVTndSRUZRQ2tKblRsWklVazFDUVdZNFJVSlVRVVJCVVVndlRVSXdSMEV4VldSRVoxRlhRa0pSWjNOdlQxSTFOVEJCUVV4UlkwWkJNalYzTUVWblJHZGlkV3hVUVZZS1FtZE9Wa2hTUlVWRWFrRk5aMmR3Y21SWFNteGpiVFZzWkVkV2VrMUJNRWREVTNGSFUwbGlNMFJSUlVKRGQxVkJRVFJKUWtGUlFsWXdZakJLVTBaeVR3cEtlSEYzTVc5RlQwRndkMFZ6UkdKSVlYb3hVMlYyTHpSRlpFRjFZbEZqTjBWWk4xbzVZVkpoTjBoU016TXdZWFUwTlc4eldFbHlkSE12WTJsQ0sybHJDbEJQYVVOTWFVSlZibFpYV1ROSWRXTTBMekVyZW5BNWJXZDBiSEZETVVRcmFtYzNVSE56ZUhoVlpXSlpRVEUxVVU5NkwyTlVNMVF5YkhwNmJGSTRUWE1LYkVSUmEweExVRlJ5TTAwd01VUXZSWFJaYzJaVVowYzRZalJqUkZabmNuTlFkamRIVDBWUmVHeENNa2RIYUU5ck1ESXlORlJIT0c0MVpYUTVOa1pEWVFwdU5FZ3ZLMGt5YlZCRmVuRXdkMkpRZGtOak9YTjBWekp5ZDJGMFF6WlpXRWhwYmtkNk5EUkdhams1ZUdoQ1VqSlZRbWhSZEdKU01YWktTMFZDYUdJdkNqaEdNV0kxVGxCb1ZVazFSeTlpZUUxdFJFWkdiR1JGUVZCb05XZEpaemh2YlU4d2VVdEhTUzlYVW5CaE0zSkJiU3RXYjNGdE15dDNkbmRRTlZoVVVEa0tkVGRCUlhWeGVVdzNla05wQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLCiAgICBjaWRyOiAxNzIuMjAuMC4wLzE2CiAgICBuYW1lOiByZXRhaWwtc3RvcmUKICBrdWJlbGV0OgogICAgY29uZmlnOgogICAgICBtYXhQb2RzOiAyOQogICAgICBjbHVzdGVyRE5TOgogICAgICAtIDE3Mi4yMC4wLjEwCiAgICBmbGFnczoKICAgIC0gIi0tbm9kZS1sYWJlbHM9ZWtzLmFtYXpvbmF3cy5jb20vc291cmNlTGF1bmNoVGVtcGxhdGVWZXJzaW9uPTEsZWtzLmFtYXpvbmF3cy5jb20vbm9kZWdyb3VwLWltYWdlPWFtaS0wMzcyOTQ4ZDhmZjAxOTIzMixla3MuYW1hem9uYXdzLmNvbS9jYXBhY2l0eVR5cGU9T05fREVNQU5ELGVrcy5hbWF6b25hd3MuY29tL25vZGVncm91cD1tYW5hZ2VkLW5vZGVncm91cC0yLTIwMjUxMDA2MTIzNjM5NjY0MDAwMDAwMDMzLGVrcy5hbWF6b25hd3MuY29tL3NvdXJjZUxhdW5jaFRlbXBsYXRlSWQ9bHQtMGI4MzRiMWMzMTg2MzRkNjAiCgotLS8vLS0="
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-0dcfa5969f791ae3e"]
}

module "stackgen_2197d64c-7001-5200-941d-e3966857e1f0" {
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
  vpc_id = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_21e2fb6b-3f7e-57f6-93dd-33d21ba8d405" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_e75c73a8-0830-5ebf-b3db-92386e7d1c53.arn
  role       = module.stackgen_eebc175f-c339-5fbc-a7ef-83f96dbe693e.name
}

module "stackgen_22f8c5ae-00c2-5dad-b37b-08f14d282d88" {
  source    = "./modules/aws_iam_role_policy"
  name      = "cloud2code"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ec2:DescribeRegions\"],\"Effect\":\"Allow\",\"Resource\":[\"*\"],\"Sid\":\"Statement1\"}]}"
  role      = module.stackgen_2d919c3d-0fec-55f6-8e0a-eb4a6a16cc6d.name
  role_type = "custom"
}

module "stackgen_231a49a3-76f1-5e48-a016-ed17657ae27b" {
  source                          = "./modules/aws_cloudfront_distribution"
  aliases                         = ["stage.dev.appcd.io"]
  comment                         = null
  continuous_deployment_policy_id = ""
  custom_error_response           = []
  default_cache_behavior = [{
    allowed_methods           = ["GET", "HEAD", "OPTIONS"]
    cache_policy_id           = ""
    cached_methods            = ["GET", "HEAD"]
    compress                  = true
    default_ttl               = 0
    field_level_encryption_id = ""
    forwarded_values = [{
      cookies = [{
        forward           = "none"
        whitelisted_names = []
      }]
      headers                 = []
      query_string            = false
      query_string_cache_keys = []
    }]
    function_association = []
    grpc_config = [{
      enabled = false
    }]
    lambda_function_association = []
    max_ttl                     = 0
    min_ttl                     = 0
    origin_request_policy_id    = ""
    realtime_log_config_arn     = ""
    response_headers_policy_id  = ""
    smooth_streaming            = false
    target_origin_id            = "stage.dev.appcd.io.s3-website-us-west-2.amazonaws.com"
    trusted_key_groups          = []
    trusted_signers             = []
    viewer_protocol_policy      = "allow-all"
  }]
  default_root_object    = ""
  enabled                = true
  http_version           = "http2"
  is_ipv6_enabled        = true
  logging_config         = []
  ordered_cache_behavior = []
  origin = [{
    connection_attempts = 3
    connection_timeout  = 10
    custom_header       = []
    custom_origin_config = [{
      http_port                = 80
      https_port               = 443
      origin_keepalive_timeout = 5
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = 30
      origin_ssl_protocols     = ["SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"]
    }]
    domain_name              = "stage.dev.appcd.io.s3-website-us-west-2.amazonaws.com"
    origin_access_control_id = ""
    origin_id                = "stage.dev.appcd.io.s3-website-us-west-2.amazonaws.com"
    origin_path              = ""
    origin_shield            = []
    s3_origin_config         = []
    vpc_origin_config        = []
  }]
  price_class = "PriceClass_100"
  restrictions = [{
    geo_restriction = [{
      locations        = []
      restriction_type = "none"
    }]
  }]
  staging = false
  tags    = {}
  viewer_certificate = [{
    acm_certificate_arn            = "arn:aws:acm:us-east-1:339712749745:certificate/d3389a2d-1171-43a7-843a-cded95a3bac7"
    cloudfront_default_certificate = false
    iam_certificate_id             = ""
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }]
  wait_for_deployment = true
  web_acl_id          = ""
}

module "stackgen_234aaf5b-781d-523f-8331-71781c8201eb" {
  source      = "./modules/aws_security_group"
  description = "[k8s] Managed SecurityGroup for LoadBalancer"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
  }]
  name                   = "k8s-ui-ui-56cd47babe"
  revoke_rules_on_delete = null
  tags = {
    "elbv2.k8s.aws/cluster"    = "retail-store"
    "service.k8s.aws/resource" = "ManagedLBSecurityGroup"
    "service.k8s.aws/stack"    = "ui/ui"
  }
  timeouts = null
  vpc_id   = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_23638c57-07b3-5f56-bdc5-00ec670a2e81" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_fa16772f-5e83-5f83-9b41-d443b19840d1.name
}

module "stackgen_23952e20-d6bf-5907-b109-bc663914cbb0" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "n3l64ywhteoikonk7tkvcvzpzsirm6rm._domainkey.stage.dev.stackgen.com"
  records                          = ["n3l64ywhteoikonk7tkvcvzpzsirm6rm.dkim.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 1800
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_23ebbbc9-e380-5163-8a5d-2fc2ae194e61" {
  source  = "./modules/aws_cloudfront_origin_access_identity"
  comment = "OAI for prashant-test20-1993"
}

module "stackgen_24aee93a-7c9c-5d38-b396-50fa8145898e" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_93e2e838-d1d8-55b2-b38d-2e7b60591bd2.arn
  role       = module.stackgen_4456c39a-e8b3-50e8-85c6-81c48e5f8c79.name
}

module "stackgen_24c93baf-fb71-5a7e-9c36-ac198b645c77" {
  source      = "./modules/aws_iam_policy"
  description = "Cluster encryption policy to allow cluster role to utilize CMK provided"
  name        = "tooling-dev-eks-cluster-ClusterEncryption20250424072856302800000009"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"kms:Encrypt\",\"kms:Decrypt\",\"kms:ListGrants\",\"kms:DescribeKey\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:kms:us-west-2:339712749745:key/9ce6b2ba-8118-42b9-881e-4bcfc83063ae\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    appcd_module  = "vpc"
    created_for   = "tooling-dev"
    maintained_by = "support@stackgen.com"
  }
}

module "stackgen_2517a1cb-91da-52b6-8ff6-8bc2b2430cd5" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSLoadBalancingPolicy"
  role       = module.stackgen_e7da5ae7-3b7b-5af9-9bfc-dad2bc61c94c.name
}

module "stackgen_25181e55-8b0f-5f0e-bf07-35d99b1b7824" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_880be9b2-8513-53d7-94ad-0d769b00d2e4.name
}

module "stackgen_2536e0ce-afef-59fc-834b-f6b5f671ac21" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSElasticLoadBalancingServiceRolePolicy"
  role       = module.stackgen_4cc0e8b1-5567-544f-a17e-04d76ef86e92.name
}

module "stackgen_254bec10-bf21-5e04-b466-883308a2e56a" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = false
    name                   = "d25s6lb8o63ptg.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "main.dev.appcd.io"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_2556d107-d254-56be-b31d-5114418f4dc7" {
  source      = "./modules/aws_iam_policy"
  description = "Policy for accessing evaluation secrets"
  name        = "evaluation-secrets-access"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"secretsmanager:GetSecretValue\",\"secretsmanager:DescribeSecret\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:secretsmanager:us-west-2:339712749745:secret:unstable/rds_*\"]}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_2671cb5f-d5de-5387-859f-b64a2e842146" {
  source                     = "./modules/aws_mq_broker"
  apply_immediately          = null
  authentication_strategy    = "simple"
  auto_minor_version_upgrade = true
  broker_name                = "retail-store-orders-broker"
  configuration = [{
    id       = "c-5e1e7d14-bfa6-40dd-8296-d4fc8c04ed11"
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
    day_of_week = "FRIDAY"
    time_of_day = "19:00"
    time_zone   = "UTC"
  }]
  publicly_accessible = false
  security_groups = [
    module.stackgen_d3f12d1e-ef5e-5ebe-bc09-7f653a8e8598.id,
  ]
  storage_type = "ebs"
  subnet_ids   = ["subnet-03075069b8559b824"]
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  user = []
}

module "stackgen_26c06e18-159a-5773-8ef1-e311fc7b99f9" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "karpenter-engineering-eks-20240212002502245700000007"
  name_prefix = "karpenter-engineering-eks-"
  path        = "/"
  role        = null
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_2710af38-6089-5ea8-823c-aebe619b70b4" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":[\"sts:TagSession\",\"sts:AssumeRoleWithWebIdentity\"],\"Condition\":{\"StringEquals\":{\"oidc.eks.us-east-1.amazonaws.com/id/F3F490B0BF1125C425585E2376AA0220:sub\":\"system:serviceaccount:opentelemetry-operator-system:adot-col-container-logs\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/F3F490B0BF1125C425585E2376AA0220\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "retail-store-adot-col-logs"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_271d9303-f8ac-5b8b-bb61-c639d7fa050a" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:sts::339712749745:assumed-role/AWSReservedSSO_AdministratorAccess_90ce8fbcbe3cc328/sks@stackgen.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "read-tfstate"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:PutObject\",\"s3:ListObjects*\",\"s3:ListBucket*\",\"s3:HeadObject\",\"s3:Get*\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::339712749745-states/*\",\"arn:aws:s3:::339712749745-states\"]}]}"
    }, {
    name   = "topology-deployer"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"sts:GetCallerIdentity\",\"s3:PutBucketVersioning\",\"s3:PutBucketTagging\",\"s3:GetObject\",\"s3:GetBucketVersioning\",\"s3:CreateBucket\",\"kms:ListResourceTags\",\"s3:GetBucketPolicy\",\"kms:ListAliases\",\"kms:GetPublicKey\",\"kms:GetKeyRotationStatus\",\"kms:GetKeyPolicy\",\"kms:Encrypt\",\"kms:DescribeKey\",\"kms:CreateKey\",\"kms:CreateAlias\",\"s3:ListBucket\",\"s3:GetBucketAcl\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  }]
  max_session_duration = 3600
  name                 = "developer-deployer-role"
  path                 = "/"
  permissions_boundary = ""
  tags                 = {}
}

module "stackgen_276c25c2-14ec-55de-9941-4e149bf7d846" {
  source  = "./modules/aws_cloudfront_origin_access_identity"
  comment = "OAI for prashant-test20aug"
}

module "stackgen_278ab95c-2568-5802-a977-27abea942383" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_c252080d-87a2-54fe-8f43-5b725d327987.name
}

module "stackgen_27f34db1-9759-5219-a912-5db85ce9351a" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringLike\":{\"token.actions.githubusercontent.com:sub\":\"repo:appcd-dev/appcd-dist:*\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/token.actions.githubusercontent.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "developer-github-oidc-eks-policy"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"eks:DescribeCluster\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:eks:*:*:cluster/*\",\"Sid\":\"DescribeCluster\"},{\"Action\":\"eks:ListClusters\",\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"ListClusters\"}]}"
  }]
  max_session_duration = 3600
  name                 = "developer-github-oidc-auth-role"
  path                 = "/"
  permissions_boundary = ""
  tags                 = {}
}

module "stackgen_293db8cb-6cba-5a7d-8737-723a3095f8d3" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_c1fe0eb4-fe2d-56b2-a8af-1a983c553b50.arn
  role       = module.stackgen_fa16772f-5e83-5f83-9b41-d443b19840d1.name
}

module "stackgen_2a7764ff-e36e-5ce3-8c39-b313b75b17a4" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"eks.amazonaws.com\"},\"Sid\":\"EKSClusterAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "engineering-eks-cluster"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:CreateLogGroup\"],\"Effect\":\"Deny\",\"Resource\":\"*\"}]}"
  }]
  max_session_duration = 3600
  name                 = "engineering-eks-cluster-20240130212103561100000007"
  path                 = "/"
  permissions_boundary = ""
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_2b2ae8eb-703f-56f8-b09e-b173fd0780f9" {
  source               = "./modules/aws_iam_user"
  force_destroy        = null
  name                 = "aarav"
  path                 = "/"
  permissions_boundary = ""
  tags                 = {}
}

module "stackgen_2b701ccd-2ed4-5a6c-91f2-ac2c2fd09201" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "support.main.dev.stackgen.com"
  records                          = ["v=spf1 include:amazonses.com ~all"]
  set_identifier                   = ""
  ttl                              = 300
  type                             = "TXT"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_2b9d2365-9db7-5318-974b-2fb96ba74856" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "observe.dev.stackgen.com"
  records                          = ["k8s-ingressn-ingressn-efb5f6ecf7-a04f395ff369e7c5.elb.us-west-2.amazonaws.com"]
  set_identifier                   = ""
  ttl                              = 300
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_2baf0f8d-8c51-588a-b303-144ce48b8c11" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_8744aa8f-5357-5e89-8a72-76dddadab10f.arn
  role       = module.stackgen_edd19903-9222-5fc5-8d98-8fb1a904a03e.name
}

module "stackgen_2bec3f41-d7d0-54b9-aab9-2fcdba3bd8f9" {
  source      = "./modules/aws_iam_group_policy"
  group       = module.stackgen_f32d66e2-c131-51de-8904-511b356cdd1e.name
  name        = "s3_kms_key_management"
  name_prefix = ""
  policy      = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"kms:CreateKey\",\"kms:ListKeys\",\"kms:ListAliases\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"KMSCreateAndListGlobal\"},{\"Action\":[\"kms:DescribeKey\",\"kms:GetKeyPolicy\",\"kms:PutKeyPolicy\",\"kms:TagResource\",\"kms:UntagResource\",\"kms:ListResourceTags\",\"kms:UpdateKeyDescription\",\"kms:EnableKey\",\"kms:DisableKey\",\"kms:EnableKeyRotation\",\"kms:GetKeyRotationStatus\",\"kms:ScheduleKeyDeletion\",\"kms:CancelKeyDeletion\",\"kms:CreateAlias\",\"kms:UpdateAlias\",\"kms:DeleteAlias\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:kms:*:339712749745:key/*\",\"Sid\":\"ManageCustomerManagedKeys\"},{\"Action\":[\"kms:CreateAlias\",\"kms:UpdateAlias\",\"kms:DeleteAlias\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:kms:*:339712749745:alias/*\",\"Sid\":\"ManageAliasesInAccount\"}]}"
}

module "stackgen_2bed61ce-fbd3-59d2-a376-5173f5588c1c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_52b9b8da-dcf9-59d9-99db-9b89900d232a.arn
  role       = module.stackgen_2ec6e0a9-ee21-57d8-933a-5e70733b6d44.name
}

module "stackgen_2c625846-ff6f-57e3-952d-b4fe4b473dc1" {
  source      = "./modules/aws_iam_user_policy"
  name        = "AmazonSesSendingAccess"
  name_prefix = ""
  policy      = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"ses:SendRawEmail\",\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  user        = module.stackgen_9b516195-78a4-552e-b062-5bdddeecd86c.name
}

module "stackgen_2d919c3d-0fec-55f6-8e0a-eb4a6a16cc6d" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}},{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::339712749745:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_AdministratorAccess_90ce8fbcbe3cc328\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "cloud2code"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ec2:DescribeRegions\"],\"Effect\":\"Allow\",\"Resource\":[\"*\"],\"Sid\":\"Statement1\"}]}"
  }]
  max_session_duration = 3600
  name                 = "appcd-installer"
  path                 = "/"
  permissions_boundary = ""
  tags                 = {}
}

module "stackgen_2da6a23c-a0d1-5d6e-bdba-4e00a1ded87a" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-ingressn-ingressn-d40c055cd3-ed9f7678f3083a51.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "atlantis.dev.appcd.io"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_2e38de21-ceb2-5b55-a669-5daf2297b893" {
  source                          = "./modules/aws_cloudfront_distribution"
  aliases                         = []
  comment                         = null
  continuous_deployment_policy_id = ""
  custom_error_response           = []
  default_cache_behavior = [{
    allowed_methods           = ["GET", "HEAD"]
    cache_policy_id           = ""
    cached_methods            = ["GET", "HEAD"]
    compress                  = true
    default_ttl               = 86400
    field_level_encryption_id = ""
    forwarded_values = [{
      cookies = [{
        forward           = "none"
        whitelisted_names = []
      }]
      headers                 = []
      query_string            = false
      query_string_cache_keys = []
    }]
    function_association = []
    grpc_config = [{
      enabled = false
    }]
    lambda_function_association = []
    max_ttl                     = 31536000
    min_ttl                     = 0
    origin_request_policy_id    = ""
    realtime_log_config_arn     = ""
    response_headers_policy_id  = ""
    smooth_streaming            = false
    target_origin_id            = "339712749745-states.s3.us-west-2.amazonaws.com"
    trusted_key_groups          = []
    trusted_signers             = []
    viewer_protocol_policy      = "redirect-to-https"
  }]
  default_root_object    = ""
  enabled                = false
  http_version           = "http2"
  is_ipv6_enabled        = true
  logging_config         = []
  ordered_cache_behavior = []
  origin = [{
    connection_attempts      = 3
    connection_timeout       = 10
    custom_header            = []
    custom_origin_config     = []
    domain_name              = "339712749745-states.s3.us-west-2.amazonaws.com"
    origin_access_control_id = "E2Q5T53WE4QTSX"
    origin_id                = "339712749745-states.s3.us-west-2.amazonaws.com"
    origin_path              = ""
    origin_shield            = []
    s3_origin_config         = []
    vpc_origin_config        = []
  }]
  price_class = "PriceClass_All"
  restrictions = [{
    geo_restriction = [{
      locations        = []
      restriction_type = "none"
    }]
  }]
  staging = false
  tags    = {}
  viewer_certificate = [{
    acm_certificate_arn            = "arn:aws:acm:us-east-1:339712749745:certificate/d3389a2d-1171-43a7-843a-cded95a3bac7"
    cloudfront_default_certificate = false
    iam_certificate_id             = ""
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }]
  wait_for_deployment = true
  web_acl_id          = ""
}

module "stackgen_2e9058b0-2694-5538-b1ca-de6b6cc29aa7" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = module.stackgen_1e9854cc-9f50-50d5-9aab-b8eea9ef8cf9.name
}

module "stackgen_2e9328f5-6094-5b40-8a46-75e99ca4c554" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_7520b91e-8d5e-57f8-ad2c-2049a31ca03d.name
}

module "stackgen_2ec6e0a9-ee21-57d8-933a-5e70733b6d44" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/B2AF2CBCB3EF8145FAF788AA62E612A0:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/B2AF2CBCB3EF8145FAF788AA62E612A0:sub\":\"system:serviceaccount:external-secrets:external-secrets-sa\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/B2AF2CBCB3EF8145FAF788AA62E612A0\"}}],\"Version\":\"2012-10-17\"}"
  description           = "IRSA for external-secrets operator"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "external-secrets-20240130213123524500000033"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf" {
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

module "stackgen_300faf64-76b4-53e8-bbfe-754a469381de" {
  source      = "./modules/aws_iam_policy"
  description = "Cluster encryption policy to allow cluster role to utilize CMK provided"
  name        = "sks-eks-cluster-ClusterEncryption2024083023233194460000000e"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"kms:Encrypt\",\"kms:Decrypt\",\"kms:ListGrants\",\"kms:DescribeKey\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:kms:ap-south-1:339712749745:key/a9b021f9-1ee7-46c5-97ec-b892d7ccb8da\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    appcd_module  = "vpc"
    created_for   = "sks"
    maintained_by = "support@appcd.com"
  }
}

module "stackgen_31199003-ead2-5977-8d5d-afe6cc3aedfd" {
  source    = "./modules/aws_iam_role_policy"
  name      = "developer-github-oidc-eks-policy"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"eks:DescribeCluster\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:eks:*:*:cluster/*\",\"Sid\":\"DescribeCluster\"},{\"Action\":\"eks:ListClusters\",\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"ListClusters\"}]}"
  role      = module.stackgen_27f34db1-9759-5219-a912-5db85ce9351a.name
  role_type = "custom"
}

module "stackgen_311a92fb-cf71-50b0-a0d6-4a79c7f384a7" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_c252080d-87a2-54fe-8f43-5b725d327987.name
}

module "stackgen_31696028-f419-555f-81eb-7a73580fa977" {
  source                             = "./modules/aws_launch_template"
  block_device_mappings              = []
  capacity_reservation_specification = []
  cpu_options                        = []
  credit_specification               = []
  default_version                    = 1
  description                        = ""
  disable_api_termination            = false
  ebs_optimized                      = ""
  elastic_gpu_specifications         = []
  elastic_inference_accelerator      = []
  enclave_options                    = []
  hibernation_options                = []
  iam_instance_profile = [{
    arn  = ""
    name = "eks-caccdcc3-1181-bfb8-7f41-b9fc410eb5d6"
  }]
  image_id                             = "ami-0372948d8ff019232"
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
    instance_metadata_tags      = "disabled"
  }]
  monitoring = [{
    enabled = true
  }]
  name                     = "eks-caccdcc3-1181-bfb8-7f41-b9fc410eb5d6"
  network_interfaces       = []
  placement                = []
  private_dns_name_options = []
  ram_disk_id              = ""
  security_group_names     = []
  tag_specifications = [{
    resource_type = "volume"
    tags = {
      Name                 = "managed-nodegroup-3"
      created-by           = "retail-store-sample-app"
      "eks:cluster-name"   = "retail-store"
      "eks:nodegroup-name" = "managed-nodegroup-3-20251006123639664100000035"
      environment-name     = "retail-store"
    }
    }, {
    resource_type = "instance"
    tags = {
      Name                 = "managed-nodegroup-3"
      created-by           = "retail-store-sample-app"
      "eks:cluster-name"   = "retail-store"
      "eks:nodegroup-name" = "managed-nodegroup-3-20251006123639664100000035"
      environment-name     = "retail-store"
    }
    }, {
    resource_type = "network-interface"
    tags = {
      Name                 = "managed-nodegroup-3"
      created-by           = "retail-store-sample-app"
      "eks:cluster-name"   = "retail-store"
      "eks:nodegroup-name" = "managed-nodegroup-3-20251006123639664100000035"
      environment-name     = "retail-store"
    }
  }]
  tags = {
    "eks:cluster-name"   = "retail-store"
    "eks:nodegroup-name" = "managed-nodegroup-3-20251006123639664100000035"
  }
  update_default_version = null
  user_data              = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiBhcHBsaWNhdGlvbi9ub2RlLmVrcy5hd3MKCi0tLQphcGlWZXJzaW9uOiBub2RlLmVrcy5hd3MvdjFhbHBoYTEKa2luZDogTm9kZUNvbmZpZwpzcGVjOgogIGNsdXN0ZXI6CiAgICBhcGlTZXJ2ZXJFbmRwb2ludDogaHR0cHM6Ly9GM0Y0OTBCMEJGMTEyNUM0MjU1ODVFMjM3NkFBMDIyMC5ncjcudXMtZWFzdC0xLmVrcy5hbWF6b25hd3MuY29tCiAgICBjZXJ0aWZpY2F0ZUF1dGhvcml0eTogTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUkNWRU5EUVdVeVowRjNTVUpCWjBsSlNVWjJjREo0Y2xGdlpWbDNSRkZaU2t0dldrbG9kbU5PUVZGRlRFSlJRWGRHVkVWVVRVSkZSMEV4VlVVS1FYaE5TMkV6Vm1sYVdFcDFXbGhTYkdONlFXVkdkekI1VGxSRmQwMUVXWGhOYWtrelRWUlNZVVozTUhwT1ZFVjNUVVJSZUUxcVRYbE5WRkpoVFVKVmVBcEZla0ZTUW1kT1ZrSkJUVlJEYlhReFdXMVdlV0p0VmpCYVdFMTNaMmRGYVUxQk1FZERVM0ZIVTBsaU0wUlJSVUpCVVZWQlFUUkpRa1IzUVhkblowVkxDa0Z2U1VKQlVVUm9ka280UzNZeVVVbHZWMDVuV1cwelMwaFNNbkZqZFhwREszbHliVUV4VFZKNk9XWjROV1p0VG5GQlQzWnZjVFJ4UXpJMlIwZG1kMHdLZEVGVVZsZGhMelpuZDJOSmIyMW5iRlpPUkVoRGN6ZFNWemRtVmtzdmNGcGFNblJyVkZsdmVrRnJRV28zYUZZMVV6ZEtaRE5NUlhkTGNWbEVOMDlIY1FwSFRHTXJkVmh6WVRkUmExWjFjRzFJV1hkTFJ6TnVXazFEV0VKb2RpOXRjbFJpVW5CNlNHRlVVVEk1ZG1GVFpreHBiVGhVWkUxdVFsUmxLemRhT1c0NENsY3hSMFpaVlZCS1JIb3dWbmh4UWxCbU5ITXlTV2N4YTNoSVFuWmFhWHBJYVcxb016VlNPRlpaWmpGUWJFVkNVVzVOVkRWeFltVlhUa3RLTTB0V2JHTUtNQ3RuV1VwVVozQnNUekJGWVRKVWRsbEVRV2xQTVcxck4zTmlWazlRVjJOU1F5dEhUM0pVTUZvM2FWY3dTemwyYkZrM1VGZHlRa3AwZG1wd05VWlJiQXA0YlZNMlZ6VmFUMmtyWkVVNFZGcDBaVmR5TjFFMGRHMUVjRmQwUVdkTlFrRkJSMnBYVkVKWVRVRTBSMEV4VldSRWQwVkNMM2RSUlVGM1NVTndSRUZRQ2tKblRsWklVazFDUVdZNFJVSlVRVVJCVVVndlRVSXdSMEV4VldSRVoxRlhRa0pSWjNOdlQxSTFOVEJCUVV4UlkwWkJNalYzTUVWblJHZGlkV3hVUVZZS1FtZE9Wa2hTUlVWRWFrRk5aMmR3Y21SWFNteGpiVFZzWkVkV2VrMUJNRWREVTNGSFUwbGlNMFJSUlVKRGQxVkJRVFJKUWtGUlFsWXdZakJLVTBaeVR3cEtlSEYzTVc5RlQwRndkMFZ6UkdKSVlYb3hVMlYyTHpSRlpFRjFZbEZqTjBWWk4xbzVZVkpoTjBoU016TXdZWFUwTlc4eldFbHlkSE12WTJsQ0sybHJDbEJQYVVOTWFVSlZibFpYV1ROSWRXTTBMekVyZW5BNWJXZDBiSEZETVVRcmFtYzNVSE56ZUhoVlpXSlpRVEUxVVU5NkwyTlVNMVF5YkhwNmJGSTRUWE1LYkVSUmEweExVRlJ5TTAwd01VUXZSWFJaYzJaVVowYzRZalJqUkZabmNuTlFkamRIVDBWUmVHeENNa2RIYUU5ck1ESXlORlJIT0c0MVpYUTVOa1pEWVFwdU5FZ3ZLMGt5YlZCRmVuRXdkMkpRZGtOak9YTjBWekp5ZDJGMFF6WlpXRWhwYmtkNk5EUkdhams1ZUdoQ1VqSlZRbWhSZEdKU01YWktTMFZDYUdJdkNqaEdNV0kxVGxCb1ZVazFSeTlpZUUxdFJFWkdiR1JGUVZCb05XZEpaemh2YlU4d2VVdEhTUzlYVW5CaE0zSkJiU3RXYjNGdE15dDNkbmRRTlZoVVVEa0tkVGRCUlhWeGVVdzNla05wQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLCiAgICBjaWRyOiAxNzIuMjAuMC4wLzE2CiAgICBuYW1lOiByZXRhaWwtc3RvcmUKICBrdWJlbGV0OgogICAgY29uZmlnOgogICAgICBtYXhQb2RzOiAyOQogICAgICBjbHVzdGVyRE5TOgogICAgICAtIDE3Mi4yMC4wLjEwCiAgICBmbGFnczoKICAgIC0gIi0tbm9kZS1sYWJlbHM9ZWtzLmFtYXpvbmF3cy5jb20vc291cmNlTGF1bmNoVGVtcGxhdGVWZXJzaW9uPTEsZWtzLmFtYXpvbmF3cy5jb20vbm9kZWdyb3VwLWltYWdlPWFtaS0wMzcyOTQ4ZDhmZjAxOTIzMixla3MuYW1hem9uYXdzLmNvbS9jYXBhY2l0eVR5cGU9T05fREVNQU5ELGVrcy5hbWF6b25hd3MuY29tL25vZGVncm91cD1tYW5hZ2VkLW5vZGVncm91cC0zLTIwMjUxMDA2MTIzNjM5NjY0MTAwMDAwMDM1LGVrcy5hbWF6b25hd3MuY29tL3NvdXJjZUxhdW5jaFRlbXBsYXRlSWQ9bHQtMDg2NDg5ZmYwY2VjYjQ0YWEiCgotLS8vLS0="
  vpc_security_group_ids = [
    module.stackgen_fe56c635-6ab8-5e34-afad-bcaf895afc4b.id,
  ]
}

module "stackgen_31715465-c08f-5ae9-8897-0fc5c16c01ac" {
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
  revoke_rules_on_delete = null
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
  vpc_id   = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_31b12530-7b25-572c-ba5b-5ba9ea55543f" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "_67597cced75a963d754056b9ec9819f7.atlantis-test.dev.appcd.io"
  records                          = ["_9dd0bda1adcae749496dd2bd1891ed3c.djqtsrsxkq.acm-validations.aws."]
  set_identifier                   = ""
  ttl                              = 300
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_320c37d3-bdec-4d59-bb99-67ea6977ed42" {
  source                     = "./modules/aws_mq_broker"
  apply_immediately          = false
  authentication_strategy    = "simple"
  auto_minor_version_upgrade = true
  broker_name                = null
  configuration              = []
  deployment_mode            = "ACTIVE_STANDBY_MULTI_AZ"
  encryption_options = [{
    use_aws_owned_key = false
  }]
  engine_type          = null
  engine_version       = null
  host_instance_type   = null
  ldap_server_metadata = []
  logs = [{
    general = true
  }]
  maintenance_window_start_time = []
  publicly_accessible           = false
  security_groups               = null
  storage_type                  = null
  subnet_ids                    = null
  tags                          = {}
  user                          = []
}

module "stackgen_32770aae-b967-5a82-b337-b1ecea0ec9b2" {
  source = "./modules/aws_route_table"
  route = [{
    carrier_gateway_id         = ""
    cidr_block                 = "0.0.0.0/0"
    core_network_arn           = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    gateway_id                 = "igw-08a3ecb0de53975ef"
    ipv6_cidr_block            = ""
    local_gateway_id           = ""
    nat_gateway_id             = ""
    network_interface_id       = ""
    transit_gateway_id         = ""
    vpc_endpoint_id            = ""
    vpc_peering_connection_id  = ""
  }]
  tags   = {}
  vpc_id = module.stackgen_d25a6d89-d552-5559-bfac-46df4f389650.id
}

module "stackgen_32acd621-cf19-5025-917b-7948480ecb13" {
  source     = "./modules/aws_iam_user_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSESFullAccess"
  user       = module.stackgen_9d5060b7-0540-52f4-9250-5e4e6b9b4bca.name
}

module "stackgen_33b7ace3-c0bd-54f0-ad6f-a7ff04ef6d14" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = module.stackgen_2a7764ff-e36e-5ce3-8c39-b313b75b17a4.name
}

module "stackgen_341b3957-9e1d-5905-be01-32dfe70080cb" {
  source                          = "./modules/aws_cloudfront_distribution"
  aliases                         = []
  comment                         = null
  continuous_deployment_policy_id = ""
  custom_error_response           = []
  default_cache_behavior = [{
    allowed_methods           = ["GET", "HEAD", "OPTIONS"]
    cache_policy_id           = ""
    cached_methods            = ["GET", "HEAD"]
    compress                  = false
    default_ttl               = 0
    field_level_encryption_id = ""
    forwarded_values = [{
      cookies = [{
        forward           = "none"
        whitelisted_names = []
      }]
      headers                 = []
      query_string            = false
      query_string_cache_keys = []
    }]
    function_association = []
    grpc_config = [{
      enabled = false
    }]
    lambda_function_association = []
    max_ttl                     = 0
    min_ttl                     = 0
    origin_request_policy_id    = ""
    realtime_log_config_arn     = ""
    response_headers_policy_id  = ""
    smooth_streaming            = false
    target_origin_id            = "NLB-Origin"
    trusted_key_groups          = []
    trusted_signers             = []
    viewer_protocol_policy      = "redirect-to-https"
  }]
  default_root_object    = ""
  enabled                = true
  http_version           = "http2"
  is_ipv6_enabled        = true
  logging_config         = []
  ordered_cache_behavior = []
  origin = [{
    connection_attempts = 3
    connection_timeout  = 10
    custom_header       = []
    custom_origin_config = [{
      http_port                = 80
      https_port               = 443
      origin_keepalive_timeout = 5
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = 30
      origin_ssl_protocols     = ["TLSv1.1", "TLSv1.2"]
    }]
    domain_name              = "k8s-atlantis-atlantis-e443d5cd25-63d0eca952046063.elb.us-west-2.amazonaws.com"
    origin_access_control_id = ""
    origin_id                = "NLB-Origin"
    origin_path              = ""
    origin_shield            = []
    s3_origin_config         = []
    vpc_origin_config        = []
  }]
  price_class = "PriceClass_All"
  restrictions = [{
    geo_restriction = [{
      locations        = []
      restriction_type = "none"
    }]
  }]
  staging = false
  tags    = {}
  viewer_certificate = [{
    acm_certificate_arn            = ""
    cloudfront_default_certificate = true
    iam_certificate_id             = ""
    minimum_protocol_version       = "TLSv1"
    ssl_support_method             = ""
  }]
  wait_for_deployment = true
  web_acl_id          = "arn:aws:wafv2:us-east-1:339712749745:global/webacl/stackgen-dev/a13d9c7d-cf92-4561-ad84-fa1bff9acc46"
}

module "stackgen_3461cff3-5af3-5b75-9ea2-91d19b015000" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-atlantis-atlantis-e443d5cd25-63d0eca952046063.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "atlantis-test.dev.appcd.io"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_34688871-e914-5ca1-b56d-5ac8067a06e4" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSOrganizationsServiceTrustPolicy"
  role       = module.stackgen_925e3503-8b4f-53c6-b129-93f36d8de4e9.name
}

module "stackgen_34eeb00a-b182-5f09-a3cb-1d0f1ce63dba" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonRDSServiceRolePolicy"
  role       = module.stackgen_c8e63dfb-f895-5356-98a0-4b1e16862db1.name
}

module "stackgen_34f8dc1c-7f4c-5eda-9a8c-9b74c9ca472d" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1d"
  cidr_block              = "172.31.32.0/20"
  map_public_ip_on_launch = true
  tags                    = {}
  vpc_id                  = module.stackgen_d25a6d89-d552-5559-bfac-46df4f389650.id
}

module "stackgen_3501c599-f36e-52d3-9034-4d49b358c453" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"ArnLike\":{\"aws:SourceArn\":\"arn:aws:cloudtrail:*:339712749745:eventdatastore/*\"},\"StringEquals\":{\"aws:SourceAccount\":\"339712749745\"}},\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"cloudtrail.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "CloudTrailLake-eu-north-1-cloudtrail-iamrole"
  path                  = "/service-role/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_3589aee6-6eaa-5658-847b-6196bdf880f8" {
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
  name                     = "node_group_3-20251006123631435900000029"
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
  update_default_version = null
  user_data              = ""
  vpc_security_group_ids = [
    module.stackgen_fe56c635-6ab8-5e34-afad-bcaf895afc4b.id,
  ]
}

module "stackgen_35dbcdd3-8dbe-5a45-a800-330592e1af65" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonRedshiftServiceLinkedRolePolicy"
  role       = module.stackgen_7bf162a0-2f33-547b-b14c-4c9bf951e8bc.name
}

module "stackgen_365f47fd-ed20-5201-93ef-8e445a2d808f" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly"
  role       = module.stackgen_9a552737-152d-5c1c-8b60-276d3598af44.name
}

module "stackgen_36a7fd91-b9dd-598c-97d4-b45fe88156ac" {
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
  name                     = "node_group_1-20251006123631435900000027"
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
  update_default_version = null
  user_data              = ""
  vpc_security_group_ids = [
    module.stackgen_fe56c635-6ab8-5e34-afad-bcaf895afc4b.id,
  ]
}

module "stackgen_36ba1495-15e3-5d36-8a9e-da9f665598cb" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/CostOptimizationHubReadOnlyAccess"
  role       = module.stackgen_71761eff-46ba-5dfd-bf6e-44191a4ed3fd.name
}

module "stackgen_36f09d6a-7e68-5988-8445-c5de859f3297" {
  source      = "./modules/aws_db_parameter_group"
  description = "Example DB parameter group for MySQL 8.0"
  family      = "mysql8.0"
  name        = "example-db-parameter-group"
  name_prefix = ""
  parameter = [{
    apply_method = "immediate"
    name         = "autocommit"
    value        = "1"
    }, {
    apply_method = "immediate"
    name         = "connect_timeout"
    value        = "10"
    }, {
    apply_method = "immediate"
    name         = "max_allowed_packet"
    value        = "67108864"
    }, {
    apply_method = "immediate"
    name         = "max_connections"
    value        = "1000"
    }, {
    apply_method = "pending-reboot"
    name         = "character_set_server"
    value        = "utf8mb4"
  }]
  skip_destroy = false
  tags = {
    Application  = "core-banking"
    BackupWindow = "03:00-04:00"
    Compliance   = "pci"
    CostCenter   = "12345"
    Department   = "engineering"
    Environment  = "production"
    Maintenance  = "sun:04:00-sun:05:00"
    Owner        = "database-team"
    Project      = "example"
    Security     = "high"
    Terraform    = "true"
  }
}

module "stackgen_37970739-e6dc-52c1-9f0a-e5c11678d8d4" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = module.stackgen_9db334f6-9d78-5cc1-b2c2-a026436062e5.name
}

module "stackgen_37991be3-ebf8-576e-b55e-bb9614ed13f5" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"token.actions.githubusercontent.com:aud\":\"sts.amazonaws.com\"},\"StringLike\":{\"token.actions.githubusercontent.com:sub\":\"repo:appcd-dev/sgai-evaluator:ref:refs/heads/MVP\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/token.actions.githubusercontent.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "role for github actions to access RDS"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "GitHubActionsRDSRole"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_37a374ff-ab49-5571-8839-bd158ebfaa44" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = module.stackgen_19ba4c86-7702-54c7-8442-00aafed0df71.name
}

module "stackgen_38199a24-b058-5d49-91ec-e0b935bcbd91" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSResourceExplorerServiceRolePolicy"
  role       = module.stackgen_b958334b-a435-578d-a13f-74e5adc65726.name
}

module "stackgen_38ae2d44-e444-5e8a-8b12-ad4f8f36ad38" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_e7da5ae7-3b7b-5af9-9bfc-dad2bc61c94c.name
}

module "stackgen_38f735f5-a11b-5ced-a6d4-c9b85493ac1c" {
  source               = "./modules/aws_iam_user"
  force_destroy        = null
  name                 = "dhairya"
  path                 = "/"
  permissions_boundary = ""
  tags                 = {}
}

module "stackgen_390b92db-2aaa-5e3e-89b7-3ec9f4b997fe" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_113b4509-bac4-539a-8f7e-f972df1fa6d8.arn
  role       = module.stackgen_b6b350b0-2f73-52e1-bddc-d0fb25dac337.name
}

module "stackgen_39288165-8382-5827-8dc9-8025f6660f81" {
  source     = "./modules/aws_iam_user_policy_attachment"
  policy_arn = module.stackgen_73656f61-fb25-528e-99e0-674b58af4862.arn
  user       = module.stackgen_9d5060b7-0540-52f4-9250-5e4e6b9b4bca.name
}

module "stackgen_392a7ed8-3d85-5d60-a509-e51c24faea14" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/Ec2InstanceConnectEndpoint"
  role       = module.stackgen_629596a3-4e2d-520b-932e-4bfadbcde9dd.name
}

module "stackgen_3960e4a3-b084-5c89-977e-9a85961cb815" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_7520b91e-8d5e-57f8-ad2c-2049a31ca03d.name
}

module "stackgen_39906a28-3684-5038-a934-b916e248bd83" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "karpenter-for-developer-eks"
  name_prefix = ""
  path        = "/"
  role        = module.stackgen_4bdadd44-ffe9-54f5-a02b-2dfccee7d6e5.name
  tags = {
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_39a7a0a5-6841-5a1c-90d1-49b58ce4eb56" {
  source                             = "./modules/aws_rds_cluster"
  availability_zones                 = ["us-east-1a", "us-east-1b", "us-east-1c"]
  backup_retention_period            = 7
  cluster_identifier                 = "retail-store-catalog"
  copy_tags_to_snapshot              = false
  database_name                      = "catalog"
  db_subnet_group_name               = "retail-store-catalog"
  enable_global_write_forwarding     = null
  enable_local_write_forwarding      = null
  enabled_cloudwatch_logs_exports    = []
  engine                             = "aurora-mysql"
  engine_mode                        = "provisioned"
  engine_version                     = "8.0.mysql_aurora.3.08.2"
  global_cluster_identifier          = ""
  kms_key_id                         = "arn:aws:kms:us-east-1:339712749745:key/102d37c1-0438-43b9-a8cc-8302cfa365cb"
  master_password                    = var.master_password_39a7a0a5-6841-5a1c-90d1-49b58ce4eb56
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
    module.stackgen_3a9b607d-04b1-57f0-9862-ecc070161e5b.id,
  ]
}

module "stackgen_39bfebdd-63ef-59cd-b072-69cc51c559b5" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"sts:ExternalId\":\"qMs61XBhrvDWFqlY\"}},\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::584974133937:role/stackgen-system\"}},{\"Action\":\"sts:TagSession\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::584974133937:role/stackgen-system\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "DenyDataAccessPolicy"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"cloudformation:GetTemplate\",\"dynamodb:GetItem\",\"dynamodb:BatchGetItem\",\"dynamodb:Query\",\"dynamodb:Scan\",\"ec2:GetConsoleOutput\",\"ec2:GetConsoleScreenshot\",\"ecr:BatchGetImage\",\"ecr:GetAuthorizationToken\",\"ecr:GetDownloadUrlForLayer\",\"kinesis:Get*\",\"lambda:GetFunction\",\"logs:GetLogEvents\",\"s3:GetObject\",\"sdb:Select*\",\"sqs:ReceiveMessage\"],\"Effect\":\"Deny\",\"Resource\":[\"*\"]}]}"
    }, {
    name   = "ManageDeploymentPolicy"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:CreateRole\",\"iam:TagRole\",\"iam:DeleteRolePolicy\",\"iam:DeleteRole\",\"iam:PutRolePolicy\",\"sts:AssumeRole\"],\"Condition\":{\"StringEquals\":{\"iam:ResourceTag/stackgen-managed\":\"true\"},\"StringLike\":{\"iam:ResourceTag/stackgen-reason\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:iam::339712749745:role/stackgen-managed-*\"]},{\"Action\":[\"sts:TagSession\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  }]
  max_session_duration = 3600
  name                 = "stackgen-system-access"
  path                 = "/"
  permissions_boundary = ""
  tags                 = {}
}

module "stackgen_39e55b82-4fb2-5fda-bb49-7179d8021e87" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-east-1.amazonaws.com/id/F3F490B0BF1125C425585E2376AA0220:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-east-1.amazonaws.com/id/F3F490B0BF1125C425585E2376AA0220:sub\":\"system:serviceaccount:kube-system:aws-load-balancer-controller-sa\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/F3F490B0BF1125C425585E2376AA0220\"}}],\"Version\":\"2012-10-17\"}"
  description           = "IRSA for aws-load-balancer-controller project"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "alb-controller-2025100612363603510000002d"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_39e761c3-bfb5-5341-9265-ff1a1dc7d8fe" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = module.stackgen_4bdadd44-ffe9-54f5-a02b-2dfccee7d6e5.name
}

module "stackgen_3a1ab668-99a7-57f2-bed3-9b3fc7dde311" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringLike\":{\"oidc.eks.us-west-2.amazonaws.com/id/B2AF2CBCB3EF8145FAF788AA62E612A0:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/B2AF2CBCB3EF8145FAF788AA62E612A0:sub\":\"system:serviceaccount:kube-system:s3-csi-*\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/B2AF2CBCB3EF8145FAF788AA62E612A0\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "engineering-s3-mount-role"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_3a74a333-14ae-4bd2-bf5d-8bf9c8645fb4" {
  source                     = "./modules/aws_lb"
  access_logs                = []
  enable_deletion_protection = false
  enable_http2               = true
  internal                   = false
  load_balancer_type         = "application"
  name                       = null
  security_groups            = null
  subnets                    = null
  tags                       = {}
}

module "stackgen_3a9b607d-04b1-57f0-9862-ecc070161e5b" {
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
    security_groups  = ["sg-0dcfa5969f791ae3e"]
    self             = false
    to_port          = 3306
  }]
  name                   = "retail-store-catalog-2025100612260009380000000f"
  revoke_rules_on_delete = null
  tags = {
    Name             = "retail-store-catalog"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
  vpc_id   = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_3b2b3a46-4b72-5b5d-b6d9-67b141d084d5" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = module.stackgen_9aa05b2b-f650-542f-b376-2b7123b70856.name
}

module "stackgen_3b4f228b-5354-5352-9486-d3839b4250f7" {
  source         = "./modules/aws_iam_openid_connect_provider"
  client_id_list = ["sts.amazonaws.com"]
  tags = {
    Name             = "retail-store-eks-irsa"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280"]
  url             = "oidc.eks.us-east-1.amazonaws.com/id/F3F490B0BF1125C425585E2376AA0220"
}

module "stackgen_3b932138-3bf3-5a2c-8787-ba0e87addbb3" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_19ba4c86-7702-54c7-8442-00aafed0df71.name
}

module "stackgen_3be52c00-188b-55fc-987f-484b62526b7e" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"eks.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "test_role312"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    tag-key = "tag-value"
  }
}

module "stackgen_3bf1912b-ab9f-51c1-9b73-6e6dc681cd83" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"monitoring.rds.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "terraform-20240927004755340200000006"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    namespace = "appcd-onprem"
    repo      = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_3c1c2474-90d0-5f16-a604-2967324d994d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/CostOptimizationHubReadOnlyAccess"
  role       = module.stackgen_71761eff-46ba-5dfd-bf6e-44191a4ed3fd.name
}

module "stackgen_3c6b93ab-33b6-5e76-af84-d87f7d59c746" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::368945481389:root\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "OrganizationAccountAccessRole"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_3d24aebd-2dba-5e55-bb48-948300e95584" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSSOServiceRolePolicy"
  role       = module.stackgen_688f9759-285c-55ad-8c2e-e04c6a422064.name
}

module "stackgen_3d7465d6-7e5a-53ea-8163-0df2d5092284" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSNetworkingPolicy"
  role       = module.stackgen_e7da5ae7-3b7b-5af9-9bfc-dad2bc61c94c.name
}

module "stackgen_3df7cbe1-4fdc-56e6-a822-a44b19261786" {
  source                    = "./modules/aws_eip"
  address                   = null
  associate_with_private_ip = null
  customer_owned_ipv4_pool  = ""
  domain                    = "vpc"
  instance                  = ""
  network_border_group      = "us-east-1"
  network_interface         = "eni-03c5cae30a02ba93e"
  public_ipv4_pool          = "amazon"
  tags = {
    Name             = "retail-store-us-east-1a"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_3e62290b-fa9e-56b4-a77b-022ad4a7e4da" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSNetworkingPolicy"
  role       = module.stackgen_e7da5ae7-3b7b-5af9-9bfc-dad2bc61c94c.name
}

module "stackgen_3e919590-3a14-584f-9811-1ac30a707d3c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_7e20a179-a540-505e-8b72-fc6e0f0fb730.arn
  role       = module.stackgen_157ea11a-4551-543c-bc17-bd08f4e83749.name
}

module "stackgen_3f668dba-ff7b-5c78-822f-fe8e75a1bd75" {
  source      = "./modules/aws_security_group"
  description = "Allow SSH (22) and Ollama (11434) from specific IP"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["74.140.6.160/32"]
    description      = "Allow Ollama API from my IP"
    from_port        = 11434
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 11434
    }, {
    cidr_blocks      = ["74.140.6.160/32"]
    description      = "Allow SSH from my IP"
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
  }]
  name                   = "ollama-robust-sg"
  revoke_rules_on_delete = null
  tags = {
    Name = "ollama-robust-sg"
  }
  timeouts = null
  vpc_id   = module.stackgen_d25a6d89-d552-5559-bfac-46df4f389650.id
}

module "stackgen_3fb61296-4b4c-5e7f-9fc9-18b4eba8f9bd" {
  source  = "./modules/aws_iam_access_key"
  pgp_key = null
  status  = "Active"
  user    = module.stackgen_38f735f5-a11b-5ced-a6d4-c9b85493ac1c.name
}

module "stackgen_3fcb681b-f935-5f35-9ac3-0e979f38a566" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_eb72ead6-cac7-559a-8b9d-be1eed6fe356.name
}

module "stackgen_3ff676f1-566e-5d08-9f05-63c40b5b40de" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/D027B653E35BDB1E89302EE39F5D9803:sub\":\"system:serviceaccount:kube-system:aws-load-balancer-controller\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/D027B653E35BDB1E89302EE39F5D9803\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "aws-load-balancer-controller-tooling"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_4053bed7-1ad4-5c22-9ea0-e9e9c15f7f2c" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "_5e0af4c8acf0e2a61bf9e530ccbe1f77.atlantis-dev.dev.appcd.io"
  records                          = ["_9d0a9a6280dfba24c8a61240ceef702a.fcgjwsnkyp.acm-validations.aws"]
  set_identifier                   = ""
  ttl                              = 300
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_40d708f7-3ac0-50d0-9826-4f6a6b88948e" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-ingressn-ingressn-d40c055cd3-ed9f7678f3083a51.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "playground.dev.appcd.io"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_40fc4057-6530-551c-b018-716b9656e9a8" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = module.stackgen_bbad1ee5-40dc-538e-aeff-f117c26a2252.name
}

module "stackgen_415f112b-2d41-5257-937e-6e074ca985db" {
  source    = "./modules/aws_iam_role_policy"
  name      = "assume"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"sts:AssumeRole\",\"sts:AssumeRoleWithWebIdentity\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"VisualEditor0\"}]}"
  role      = module.stackgen_e50bceeb-1c07-57de-b3c0-da7d5e76d54f.name
  role_type = "custom"
}

module "stackgen_418459d6-9fe5-56fe-afe4-ee6da0a9fcb8" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_666d4be7-d006-5c45-b82e-23259c852de6.arn
  role       = module.stackgen_9ea9d9c2-9bef-54b6-827b-134f067e940c.name
}

module "stackgen_41bc8274-5f1e-5605-8779-57eb1e5ef563" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_927ecb03-73b9-598f-b3da-3f3bbe775e05.arn
  role       = module.stackgen_127c1820-77ac-58c0-b515-ebb5c13b2ce7.name
}

module "stackgen_41c577ab-8b86-5d29-a4c8-8cdb3ad2279c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_984453ee-883f-5434-bacf-95de97e68779.name
}

module "stackgen_427f353c-a6d0-5d2c-a3f2-cc6b0536a09e" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_4bdadd44-ffe9-54f5-a02b-2dfccee7d6e5.name
}

module "stackgen_42954303-e731-5b84-a34d-53b700575738" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodeMinimalPolicy"
  role       = module.stackgen_9a552737-152d-5c1c-8b60-276d3598af44.name
}

module "stackgen_42b107cc-5134-5a16-838b-c69a54d97892" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_c252080d-87a2-54fe-8f43-5b725d327987.name
}

module "stackgen_431f316b-b29f-5c1b-a684-6d5269159edf" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":[\"sts:AssumeRole\",\"sts:TagSession\"],\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"eks.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "eksctl-eks-tooling-cluster-ServiceRole-GshnPsTdfpUb"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    Name                                          = "eksctl-eks-tooling-cluster/ServiceRole"
    "alpha.eksctl.io/cluster-name"                = "eks-tooling"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.205.0-dev+9e5300e5a.2025-02-28T20:10:13Z"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "eks-tooling"
  }
}

module "stackgen_43bd9198-71d1-59f0-b6c4-a9d9615f5558" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_fdd7bdab-c110-508d-9e80-db8191e8feb6.arn
  role       = module.stackgen_7db562c2-d100-517e-9c7f-49e634bb2c49.name
}

module "stackgen_43d4e2ea-829d-5b53-88c9-cc9cb0ee5c51" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_1c183b3e-0388-588e-b73b-f8cd91af5aab.name
}

module "stackgen_43fe21b2-93cd-589c-b2ba-439006a161bd" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = module.stackgen_dd0b97cb-f569-5b99-904b-70d7e1b497d4.name
}

module "stackgen_4409134e-d4ed-5aa3-acf5-98f1e52dc9c7" {
  source                  = "./modules/aws_glue_catalog_table"
  database_name           = "dev_athena_db"
  description             = ""
  name                    = "sample_data_2"
  open_table_format_input = []
  owner                   = "hadoop"
  parameters = {
    EXTERNAL                 = "TRUE"
    "skip.header.line.count" = "1"
    transient_lastDdlTime    = "1742370668"
  }
  partition_index = []
  partition_keys  = []
  retention       = 0
  storage_descriptor = [{
    additional_locations = []
    bucket_columns       = []
    columns = [{
      comment    = ""
      name       = "id"
      parameters = {}
      type       = "int"
      }, {
      comment    = ""
      name       = "name"
      parameters = {}
      type       = "string"
      }, {
      comment    = ""
      name       = "age"
      parameters = {}
      type       = "int"
    }]
    compressed        = false
    input_format      = "org.apache.hadoop.mapred.TextInputFormat"
    location          = "s3://cross-account-athena-data-as/"
    number_of_buckets = -1
    output_format     = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"
    parameters        = {}
    schema_reference  = []
    ser_de_info = [{
      name = ""
      parameters = {
        "field.delim"          = ","
        "line.delim"           = "\n"
        "serialization.format" = ","
      }
      serialization_library = "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe"
    }]
    skewed_info = [{
      skewed_column_names               = []
      skewed_column_value_location_maps = {}
      skewed_column_values              = []
    }]
    sort_columns              = []
    stored_as_sub_directories = false
  }]
  table_type         = "EXTERNAL_TABLE"
  target_table       = []
  view_expanded_text = ""
  view_original_text = ""
}

module "stackgen_4456c39a-e8b3-50e8-85c6-81c48e5f8c79" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"ArnLike\":{\"aws:PrincipalArn\":\"arn:aws:iam::339712749745:role/cert-manager-*\"}},\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"*\"},\"Sid\":\"ExplicitSelfRoleAssumption\"},{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-east-1.amazonaws.com/id/F3F490B0BF1125C425585E2376AA0220:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-east-1.amazonaws.com/id/F3F490B0BF1125C425585E2376AA0220:sub\":\"system:serviceaccount:cert-manager:cert-manager\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/F3F490B0BF1125C425585E2376AA0220\"}}],\"Version\":\"2012-10-17\"}"
  description           = "IRSA for cert-manger project"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "cert-manager-2025100612363603520000002e"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_44edbd09-c07e-53b1-83ac-2890081202f0" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_1e9854cc-9f50-50d5-9aab-b8eea9ef8cf9.name
}

module "stackgen_45231a74-1177-54a2-b06b-b8375f75c220" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"application-insights.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Allows Cloudwatch Application Insights to call AWS services on customer's behalf"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForApplicationInsights"
  path                  = "/aws-service-role/application-insights.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_45500e3c-006a-5102-aff3-649ed8f173da" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_c33f0deb-84a5-59d2-ad11-f54a80d445d0.name
}

module "stackgen_45f462ee-32d4-5af9-b5a9-d62da63e713c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = module.stackgen_3c6b93ab-33b6-5e76-af84-d87f7d59c746.name
}

module "stackgen_45fa43be-0891-5826-bb45-eb78c1ce2392" {
  source      = "./modules/aws_iam_policy"
  description = "IAM policy for AWS Load Balancer Controller"
  name        = "aws-load-balancer-controller-tooling-dev"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"acm:DescribeCertificate\",\"acm:ListCertificates\",\"ec2:AuthorizeSecurityGroupIngress\",\"ec2:CreateSecurityGroup\",\"ec2:CreateTags\",\"ec2:DeleteSecurityGroup\",\"ec2:DeleteTags\",\"elasticloadbalancing:DescribeTags\",\"elasticloadbalancing:DescribeLoadBalancerAttributes\",\"elasticloadbalancing:DescribeListeners\",\"elasticloadbalancing:DescribeListenerCertificates\",\"elasticloadbalancing:DescribeSSLPolicies\",\"elasticloadbalancing:DescribeRules\",\"elasticloadbalancing:DescribeTargetGroup\",\"elasticloadbalancing:DescribeTargetGroups\",\"elasticloadbalancing:DescribeTargetHealth\",\"elasticloadbalancing:DescribeLoadBalancerAttributes\",\"ec2:DescribeInstances\",\"ec2:DescribeSecurityGroups\",\"ec2:DescribeSubnets\",\"ec2:DescribeTags\",\"ec2:DescribeVpcs\",\"ec2:DescribeAvailabilityZones\",\"elasticloadbalancing:DescribeTargetGroupAttributes\",\"ec2:ModifySecurityGroupRules\",\"ec2:RevokeSecurityGroupIngress\",\"elasticloadbalancing:AddListenerCertificates\",\"elasticloadbalancing:AddTags\",\"elasticloadbalancing:CreateListener\",\"elasticloadbalancing:CreateLoadBalancer\",\"elasticloadbalancing:CreateTargetGroup\",\"elasticloadbalancing:DeleteListener\",\"elasticloadbalancing:DeleteLoadBalancer\",\"elasticloadbalancing:DeleteTargetGroup\",\"elasticloadbalancing:DeregisterTargets\",\"elasticloadbalancing:DescribeListeners\",\"elasticloadbalancing:DescribeLoadBalancers\",\"elasticloadbalancing:DescribeTargetGroups\",\"elasticloadbalancing:DescribeTargetHealth\",\"elasticloadbalancing:ModifyListener\",\"elasticloadbalancing:CreateRule\",\"elasticloadbalancing:DeleteRule\",\"elasticloadbalancing:ModifyRule\",\"elasticloadbalancing:ModifyLoadBalancerAttributes\",\"elasticloadbalancing:ModifyTargetGroup\",\"elasticloadbalancing:ModifyTargetGroupAttributes\",\"elasticloadbalancing:RegisterTargets\",\"elasticloadbalancing:RemoveListenerCertificates\",\"elasticloadbalancing:RemoveTags\",\"shield:GetSubscriptionState\",\"wafv2:GetWebACLForResource\",\"route53:ChangeResourceRecordSets\",\"route53:ListHostedZones\",\"route53:ListResourceRecordSets\",\"wafv2:GetWebACL\",\"waf-regional:GetWebACLForResource\",\"wafv2:ListWebACLs\",\"waf-regional:GetWebACL\",\"waf-regional:ListWebACLs\",\"iam:CreateServiceLinkedRole\",\"ssm:GetParameters\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_465e6520-a0fd-5d82-8d23-03eb22cd4618" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_1e4710ad-6363-57e8-8eca-f137f5cb0fa1.arn
  role       = module.stackgen_880be9b2-8513-53d7-94ad-0d769b00d2e4.name
}

module "stackgen_469da22d-5874-5e23-a2ab-95a40b9de50a" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_c1fe0eb4-fe2d-56b2-a8af-1a983c553b50.arn
  role       = module.stackgen_fa16772f-5e83-5f83-9b41-d443b19840d1.name
}

module "stackgen_477cd60c-ab3a-55c9-800d-2c42d96deeac" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"support.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Enables resource access for AWS to provide billing, administrative and support services"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForSupport"
  path                  = "/aws-service-role/support.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_47a9236f-0c50-5776-b387-3068e4d61d42" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AccessAnalyzerServiceRolePolicy"
  role       = module.stackgen_b64d0046-831f-5dc4-a389-f3b6cf944416.name
}

module "stackgen_488c2d20-17ce-5797-abf3-61501917ef1e" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = module.stackgen_6fac6601-e034-5bd3-a7db-6d84742d872a.name
}

module "stackgen_492daec3-8d30-5d30-9854-ecae2bc173b9" {
  source  = "./modules/aws_cloudfront_origin_access_identity"
  comment = "CloudFront access identity"
}

module "stackgen_4934b3bb-6325-5073-a7fe-39b5c18ab943" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/Ec2InstanceConnectEndpoint"
  role       = module.stackgen_629596a3-4e2d-520b-932e-4bfadbcde9dd.name
}

module "stackgen_495e455f-ccc0-54f5-a246-175722f0368b" {
  source = "./modules/aws_dynamodb_table"
  attribute = [{
    name = "id"
    type = "S"
  }]
  billing_mode           = "PAY_PER_REQUEST"
  global_secondary_index = []
  hash_key               = "id"
  local_secondary_index  = []
  name                   = "example_table-dev-us-east-1"
  point_in_time_recovery = [{
    enabled = true
  }]
  range_key     = null
  read_capacity = 0
  server_side_encryption = [{
    enabled     = true
    kms_key_arn = ""
  }]
  stream_enabled   = false
  stream_view_type = ""
  tags = {
    Environment = "dev"
    Region      = "us-east-1"
    appstack    = "aws-boto"
  }
  timeouts = null
  ttl = [{
    attribute_name = ""
    enabled        = false
  }]
  write_capacity = 0
}

module "stackgen_4a0b6317-6f96-503d-8194-8ea922e5c4d9" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = module.stackgen_7c3b371c-f06f-5da9-ac30-d5d5c43a85a5.name
}

module "stackgen_4a619047-59e2-545b-b5f2-9422db65868e" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = module.stackgen_1c183b3e-0388-588e-b73b-f8cd91af5aab.name
}

module "stackgen_4a768540-7339-52f7-80ad-0a2b429e166a" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = module.stackgen_fa16772f-5e83-5f83-9b41-d443b19840d1.name
}

module "stackgen_4a884182-e3fe-5e43-9918-e74aea0a248a" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "dualstack.k8s-signoz-signozin-6a1a0f49a9-2132275888.us-west-2.elb.amazonaws.com"
    zone_id                = "Z1H1FL5HABSF5"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "logging.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_4b2c2826-732d-5acf-80aa-c6f6d19c40db" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_113b4509-bac4-539a-8f7e-f972df1fa6d8.arn
  role       = module.stackgen_431f316b-b29f-5c1b-a684-6d5269159edf.name
}

module "stackgen_4b4a4b67-87c7-5ce5-a475-30a9120e0443" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_4bdadd44-ffe9-54f5-a02b-2dfccee7d6e5.name
}

module "stackgen_4bb3e8ea-da70-569a-bb04-521262045ec1" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSLambdaReplicator"
  role       = module.stackgen_f0ce5767-0f96-5d02-b24d-edea88e881c4.name
}

module "stackgen_4bdadd44-ffe9-54f5-a02b-2dfccee7d6e5" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Sid\":\"KarpenterNodeAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = "Karpenter EC2 node IAM role"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "karpenter-for-developer-eks"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_4cc0e8b1-5567-544f-a17e-04d76ef86e92" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"elasticloadbalancing.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Allows ELB to call AWS services on your behalf."
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForElasticLoadBalancing"
  path                  = "/aws-service-role/elasticloadbalancing.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_4cdfcf82-8fbd-5f23-b7dc-089ad2257997" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Allows Lambda functions to call AWS services on your behalf."
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "query_lamda_role"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_4d1041f4-0b3a-5891-a279-a6a314b4fbd6" {
  source                           = "./modules/aws_autoscaling_group"
  capacity_rebalance               = true
  desired_capacity                 = 1
  enabled_metrics                  = ["GroupAndWarmPoolDesiredCapacity", "GroupAndWarmPoolTotalCapacity", "GroupDesiredCapacity", "GroupInServiceCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingCapacity", "GroupPendingInstances", "GroupStandbyCapacity", "GroupStandbyInstances", "GroupTerminatingCapacity", "GroupTerminatingInstances", "GroupTotalCapacity", "GroupTotalInstances", "WarmPoolDesiredCapacity", "WarmPoolMinSize", "WarmPoolPendingCapacity", "WarmPoolTerminatingCapacity", "WarmPoolTotalCapacity", "WarmPoolWarmedCapacity"]
  force_delete                     = null
  force_delete_warm_pool           = null
  health_check_grace_period        = 15
  health_check_type                = "EC2"
  ignore_failed_scaling_activities = null
  launch_configuration             = ""
  launch_template                  = []
  max_instance_lifetime            = 0
  max_size                         = 3
  min_size                         = 1
  mixed_instances_policy = [{
    instances_distribution = [{
      on_demand_allocation_strategy            = "prioritized"
      on_demand_base_capacity                  = 0
      on_demand_percentage_above_base_capacity = 100
      spot_allocation_strategy                 = "lowest-price"
      spot_instance_pools                      = 2
      spot_max_price                           = ""
    }]
    launch_template = [{
      launch_template_specification = [{
        launch_template_id   = "lt-04927366ac0ff7891"
        launch_template_name = "eks-86ccdcc3-1183-e049-47ec-0db98d33dbc7"
        version              = "1"
      }]
      override = [{
        instance_requirements         = []
        instance_type                 = "m5.large"
        launch_template_specification = []
        weighted_capacity             = ""
      }]
    }]
  }]
  protect_from_scale_in = false
  suspended_processes   = []
  tag = [{
    key                 = "eks:cluster-name"
    propagate_at_launch = true
    value               = "retail-store"
    }, {
    key                 = "eks:nodegroup-name"
    propagate_at_launch = true
    value               = "managed-nodegroup-1-20251006123639663900000031"
    }, {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = true
    value               = "true"
    }, {
    key                 = "k8s.io/cluster-autoscaler/retail-store"
    propagate_at_launch = true
    value               = "owned"
    }, {
    key                 = "kubernetes.io/cluster/retail-store"
    propagate_at_launch = true
    value               = "owned"
  }]
  target_group_arns         = []
  termination_policies      = ["AllocationStrategy", "OldestLaunchTemplate", "OldestInstance"]
  timeouts                  = null
  vpc_zone_identifier       = ["subnet-03075069b8559b824"]
  wait_for_capacity_timeout = null
}

module "stackgen_4d681287-9805-59ab-af1e-1eacd0bc6206" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"transitgateway.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForVPCTransitGateway"
  path                  = "/aws-service-role/transitgateway.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_4dfe65a9-64ab-41ba-9ec1-52aea6f4d4b1" {
  source = "./modules/aws_dynamodb_table"
  attribute = [{
    name = "id"
    type = "S"
  }]
  billing_mode           = "PROVISIONED"
  global_secondary_index = []
  hash_key               = "id"
  local_secondary_index  = []
  name                   = "my-table"
  point_in_time_recovery = [{
    enabled = true
  }]
  range_key     = ""
  read_capacity = 1
  server_side_encryption = [{
    enabled = true
  }]
  stream_enabled   = null
  stream_view_type = "NEW_IMAGE"
  tags             = {}
  timeouts         = null
  ttl              = []
  write_capacity   = 1
}

module "stackgen_4e7f7451-2c72-581e-aaf8-e41cceda1a3e" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonRDSServiceRolePolicy"
  role       = module.stackgen_c8e63dfb-f895-5356-98a0-4b1e16862db1.name
}

module "stackgen_4ec19b0a-a8cf-5f76-8042-c90c7768da48" {
  source               = "./modules/aws_iam_user"
  force_destroy        = null
  name                 = "nikhilpk"
  path                 = "/"
  permissions_boundary = ""
  tags = {
    access_key_id = "tf"
  }
}

module "stackgen_4ee8af93-ca80-5545-9c6e-bc6ed7fcdec1" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AWSBillingConductorFullAccess"
  role       = module.stackgen_71761eff-46ba-5dfd-bf6e-44191a4ed3fd.name
}

module "stackgen_4f00631c-f2f0-5809-b5a1-6735fa7524ee" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":[\"sts:TagSession\",\"sts:AssumeRoleWithWebIdentity\"],\"Condition\":{\"StringEquals\":{\"oidc.eks.us-east-1.amazonaws.com/id/F3F490B0BF1125C425585E2376AA0220:sub\":\"system:serviceaccount:carts:carts\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/F3F490B0BF1125C425585E2376AA0220\"}}],\"Version\":\"2012-10-17\"}"
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

module "stackgen_4f21787d-7f82-5cbf-8604-bf94ed7397cd" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_4bdadd44-ffe9-54f5-a02b-2dfccee7d6e5.name
}

module "stackgen_4f54ee14-0989-532b-a4f1-12b31a304f52" {
  source                          = "./modules/aws_cloudfront_distribution"
  aliases                         = []
  comment                         = null
  continuous_deployment_policy_id = ""
  custom_error_response           = []
  default_cache_behavior = [{
    allowed_methods           = ["GET", "HEAD"]
    cache_policy_id           = ""
    cached_methods            = ["GET", "HEAD"]
    compress                  = true
    default_ttl               = 86400
    field_level_encryption_id = ""
    forwarded_values = [{
      cookies = [{
        forward           = "none"
        whitelisted_names = []
      }]
      headers                 = []
      query_string            = false
      query_string_cache_keys = []
    }]
    function_association = []
    grpc_config = [{
      enabled = false
    }]
    lambda_function_association = []
    max_ttl                     = 31536000
    min_ttl                     = 0
    origin_request_policy_id    = ""
    realtime_log_config_arn     = ""
    response_headers_policy_id  = ""
    smooth_streaming            = false
    target_origin_id            = "339712749745-states.s3.us-west-2.amazonaws.com"
    trusted_key_groups          = []
    trusted_signers             = []
    viewer_protocol_policy      = "redirect-to-https"
  }]
  default_root_object    = ""
  enabled                = true
  http_version           = "http2"
  is_ipv6_enabled        = true
  logging_config         = []
  ordered_cache_behavior = []
  origin = [{
    connection_attempts      = 3
    connection_timeout       = 10
    custom_header            = []
    custom_origin_config     = []
    domain_name              = "339712749745-states.s3.us-west-2.amazonaws.com"
    origin_access_control_id = "E1AE3NNXKXRKNP"
    origin_id                = "339712749745-states.s3.us-west-2.amazonaws.com"
    origin_path              = ""
    origin_shield            = []
    s3_origin_config         = []
    vpc_origin_config        = []
  }]
  price_class = "PriceClass_All"
  restrictions = [{
    geo_restriction = [{
      locations        = []
      restriction_type = "none"
    }]
  }]
  staging = false
  tags    = {}
  viewer_certificate = [{
    acm_certificate_arn            = ""
    cloudfront_default_certificate = true
    iam_certificate_id             = ""
    minimum_protocol_version       = "TLSv1"
    ssl_support_method             = ""
  }]
  wait_for_deployment = true
  web_acl_id          = ""
}

module "stackgen_4f95fc4a-48e7-5a49-9cbe-9cb173ff467a" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "OtelCloudWatchPolicy"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"logs:GetLogEvents\",\"logs:DescribeLogGroups\",\"logs:DescribeLogStreams\",\"logs:StartQuery\",\"logs:StopQuery\",\"logs:GetQueryResults\",\"logs:FilterLogEvents\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_506b969f-1bf4-56e4-b9d9-a4a4bbba6795" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}},{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/*:sub\":\"system:serviceaccount:appcd-unstable:evaluation-service-account\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/*\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "evaluation-service-role"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_5294a513-b2ad-5da7-b3d2-52d8177caf55" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
  role       = module.stackgen_71761eff-46ba-5dfd-bf6e-44191a4ed3fd.name
}

module "stackgen_52b9b8da-dcf9-59d9-99db-9b89900d232a" {
  source      = "./modules/aws_iam_policy"
  description = "IAM Policy for external-secrets operator"
  name        = "external-secrets-20240130212104132000000008"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":\"ssm:DescribeParameters\",\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ssm:GetParameters\",\"ssm:GetParameter\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ssm:*:*:parameter/*\"},{\"Action\":\"secretsmanager:ListSecrets\",\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"secretsmanager:ListSecretVersionIds\",\"secretsmanager:GetSecretValue\",\"secretsmanager:GetResourcePolicy\",\"secretsmanager:DescribeSecret\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:secretsmanager:*:*:secret:*\"},{\"Action\":\"kms:Decrypt\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:kms:*:*:key/*\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_53366827-a07d-576b-b5c0-c7f69522873b" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = module.stackgen_0bbb4566-02cc-56f9-8511-86f67013a661.name
}

module "stackgen_550e1831-6172-5b0d-b242-d931e47ea84d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AWSBillingConductorFullAccess"
  role       = module.stackgen_71761eff-46ba-5dfd-bf6e-44191a4ed3fd.name
}

module "stackgen_552d7ce3-560a-56d3-80dd-e6e2f012a352" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"monitoring.rds.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "terraform-20250120130251923600000006"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    namespace = "appcd-unstable"
    repo      = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_553bc7df-4f50-52c5-9f05-3f914d5a1b2f" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "rds_secrets_policy_engineering"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"secretsmanager:GetResourcePolicy\",\"secretsmanager:GetSecretValue\",\"secretsmanager:DescribeSecret\",\"secretsmanager:ListSecretVersionIds\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:secretsmanager:us-west-2:339712749745:secret:/engineering/temporal_rds_endpoint-RQyKZ2\",\"arn:aws:secretsmanager:us-west-2:339712749745:secret:/engineering/temporal_rds_port-NMiTI0\",\"arn:aws:secretsmanager:us-west-2:339712749745:secret:/engineering/temporal_rds_read_endpoint-U7vqrb\",\"arn:aws:secretsmanager:us-west-2:339712749745:secret:rds!cluster-26794260-8933-4cae-919e-518b27c88890-ZBcRmq\"],\"Sid\":\"rdssecretspolicy\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_55658a91-7c5a-5d7d-bf65-50392bc11058" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"sts:ExternalId\":\"dnI8rfxvV73tHlgT\"}},\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::584974133937:role/stackgen-system\"}},{\"Action\":\"sts:TagSession\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::584974133937:role/stackgen-system\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "AllowRoleCreationPolicy"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:CreateRole\",\"iam:TagRole\",\"iam:DeleteRolePolicy\",\"iam:DeleteRole\",\"iam:PutRolePolicy\",\"sts:AssumeRole\"],\"Condition\":{\"StringEquals\":{\"iam:ResourceTag/stackgen-managed\":\"true\"},\"StringLike\":{\"iam:ResourceTag/stackgen-reason\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:iam::339712749745:role/stackgen-managed-*\"]},{\"Action\":[\"sts:TagSession\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
    }, {
    name   = "DenyDataAccessPolicy"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"cloudformation:GetTemplate\",\"dynamodb:GetItem\",\"dynamodb:BatchGetItem\",\"dynamodb:Query\",\"dynamodb:Scan\",\"ec2:GetConsoleOutput\",\"ec2:GetConsoleScreenshot\",\"ecr:BatchGetImage\",\"ecr:GetAuthorizationToken\",\"ecr:GetDownloadUrlForLayer\",\"kinesis:Get*\",\"lambda:GetFunction\",\"logs:GetLogEvents\",\"s3:GetObject\",\"sdb:Select*\",\"sqs:ReceiveMessage\"],\"Effect\":\"Deny\",\"Resource\":[\"*\"]}]}"
  }]
  max_session_duration = 21600
  name                 = "sample-customer-role-main-devops-tools"
  path                 = "/"
  permissions_boundary = ""
  tags                 = {}
}

module "stackgen_55cbf6b5-1622-5183-842a-e6fda2c4804b" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_0ccaae47-39ad-58d1-b9d9-c97e70657142.name
}

module "stackgen_55f1b249-12bc-503e-bdd7-9cee77165dbc" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_d2b54a32-21a6-5843-8a31-6bbf034dd917.arn
  role       = module.stackgen_1e03b169-771b-5ab5-8d09-0cabb903a156.name
}

module "stackgen_56b56466-cede-53d6-8e8d-e8d78105d66f" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_eb72ead6-cac7-559a-8b9d-be1eed6fe356.name
}

module "stackgen_57021d62-7d87-55ae-a274-c9721789d2a1" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_113b4509-bac4-539a-8f7e-f972df1fa6d8.arn
  role       = module.stackgen_b6b350b0-2f73-52e1-bddc-d0fb25dac337.name
}

module "stackgen_57467032-089f-5bc1-9024-1afb90712e9d" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ssm.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Provides access to AWS Resources managed or used by Amazon SSM."
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForAmazonSSM"
  path                  = "/aws-service-role/ssm.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_57503438-73d1-538b-b658-99800804d3f3" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/APIGatewayServiceRolePolicy"
  role       = module.stackgen_7854771e-316d-516f-9c25-f7945a25702b.name
}

module "stackgen_582656da-e3ca-5e11-8e46-0b59dc55abc5" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "appcd-installer_create_policy"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"sqs:tagqueue\",\"sqs:setqueueattributes\",\"sqs:createqueue\",\"s3:PutBucketTagging\",\"s3:PutBucketPublicAccessBlock\",\"s3:CreateBucket\",\"rds:ModifyDBParameterGroup\",\"rds:CreateDBSubnetGroup\",\"rds:CreateDBParameterGroup\",\"rds:CreateDBInstance\",\"rds:AddTagsToResource\",\"logs:TagResource\",\"logs:PutRetentionPolicy\",\"logs:CreateLogGroup\",\"kms:TagResource\",\"kms:EnableKeyRotation\",\"kms:CreateKey\",\"kms:CreateAlias\",\"iam:TagRole\",\"iam:TagPolicy\",\"iam:TagOpenIDConnectProvider\",\"iam:TagInstanceProfile\",\"iam:PutRolePolicy\",\"iam:PassRole\",\"iam:CreateRole\",\"iam:CreatePolicy\",\"iam:CreateOpenIDConnectProvider\",\"iam:CreateInstanceProfile\",\"iam:AttachRolePolicy\",\"iam:AddRoleToInstanceProfile\",\"events:TagResource\",\"events:PutTargets\",\"events:PutRule\",\"eks:*\",\"ec2:ModifyVpcAttribute\",\"ec2:DeleteNetworkAclEntry\",\"ec2:CreateVpc\",\"ec2:CreateTags\",\"ec2:CreateSubnet\",\"ec2:CreateSecurityGroup\",\"ec2:CreateRouteTable\",\"ec2:CreateRoute\",\"ec2:CreateNetworkAclEntry\",\"ec2:CreateNatGateway\",\"ec2:CreateLaunchTemplate\",\"ec2:CreateInternetGateway\",\"ec2:AuthorizeSecurityGroupIngress\",\"ec2:AuthorizeSecurityGroupEgress\",\"ec2:AttachInternetGateway\",\"ec2:AssociateRouteTable\",\"ec2:AllocateAddress\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"InstallAppCD\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    CreatedBy     = "AROAU6GDVGCYSVDDDSNQA:sks@appcd.com"
    Name          = "appcd-installer"
    Reason        = "appcd installer"
    maintained_by = "support@appcd.com"
  }
}

module "stackgen_5879877a-d6c9-5895-8256-c3844f9a0438" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "dev.appcd.io"
  records                          = ["ns-1512.awsdns-61.org. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  set_identifier                   = ""
  ttl                              = 900
  type                             = "SOA"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_5890a8a4-0a02-4293-8849-9b1cc021ee0e" {
  source                             = "./modules/aws_rds_cluster"
  availability_zones                 = []
  backup_retention_period            = 9
  cluster_identifier                 = null
  copy_tags_to_snapshot              = false
  database_name                      = null
  db_subnet_group_name               = "default"
  enable_global_write_forwarding     = null
  enable_local_write_forwarding      = null
  enabled_cloudwatch_logs_exports    = null
  engine                             = null
  engine_mode                        = null
  engine_version                     = null
  global_cluster_identifier          = null
  kms_key_id                         = null
  master_password                    = var.master_password_5890a8a4-0a02-4293-8849-9b1cc021ee0e
  master_username                    = null
  preferred_backup_window            = "07:00-09:00"
  preferred_maintenance_window       = "sun:05:00-sun:06:00"
  scaling_configuration              = []
  serverlessv2_scaling_configuration = []
  skip_final_snapshot                = null
  storage_encrypted                  = true
  tags                               = {}
  vpc_security_group_ids             = null
}

module "stackgen_58c1b181-fcb8-575f-8dea-b7981f02d20a" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = module.stackgen_c33f0deb-84a5-59d2-ad11-f54a80d445d0.name
}

module "stackgen_5954b3c2-0c44-5a8f-bc2e-2ba86c13c958" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:sts::339712749745:assumed-role/stackgen-system-access/stackgen-access-20250925080646\"},\"Sid\":\"AssumeRolePermission\"}],\"Version\":\"2012-10-17\"}"
  description           = "Role for appstack deployment: e2e test "
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "stackgen-managed-40d33fa3-98b5-4610-b610-779f415b55e9"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created-on           = "2025-09-25T08:06:46Z"
    stackgen-appstack-id = "40d33fa3-98b5-4610-b610-779f415b55e9"
    stackgen-deploy-id   = "1160a667-1656-4c62-bf8f-ce51c0dc63f0"
    stackgen-managed     = "true"
    stackgen-reason      = "e2e test"
  }
}

module "stackgen_59644440-661d-422d-8d70-9a71174480fe" {
  source = "./modules/aws_internet_gateway"
  tags   = null
  vpc_id = module.stackgen_712f0693-28f2-4aa3-89b2-575b47fe1642.vpc_id
}

module "stackgen_5aae0830-99db-5772-ba71-96e251989242" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "rds_secrets_policy_main"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"secretsmanager:GetResourcePolicy\",\"secretsmanager:GetSecretValue\",\"secretsmanager:DescribeSecret\",\"secretsmanager:ListSecretVersionIds\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:secretsmanager:us-west-2:339712749745:secret:/appcd-main/rds_endpoint-3ZH0ct\",\"arn:aws:secretsmanager:us-west-2:339712749745:secret:/appcd-main/rds_port-f8AzYy\",\"arn:aws:secretsmanager:us-west-2:339712749745:secret:/appcd-main/rds_read_endpoint-eZEeKu\",\"arn:aws:secretsmanager:us-west-2:339712749745:secret:rds!cluster-18ad590b-4e62-468c-8a39-0429d5c80b92-NsO523\"],\"Sid\":\"rdssecretspolicy\"}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_5ac93638-8687-5cfe-88c4-279df455f851" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  role       = module.stackgen_39bfebdd-63ef-59cd-b072-69cc51c559b5.name
}

module "stackgen_5ad8b89e-d3e2-5111-b4ae-990c8f1d13a7" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_c33f0deb-84a5-59d2-ad11-f54a80d445d0.name
}

module "stackgen_5b3abc24-25dc-5ef3-9a0b-3ac0f8361e63" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_eb72ead6-cac7-559a-8b9d-be1eed6fe356.name
}

module "stackgen_5b5625e2-cf13-50c6-8b75-19595686ea60" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:sts::339712749745:assumed-role/stackgen-system-access/stackgen-access-20251002165023\"},\"Sid\":\"AssumeRolePermission\"}],\"Version\":\"2012-10-17\"}"
  description           = "Role for appstack deployment: e2e test "
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "stackgen-managed-057d0c9c-b610-4655-ad84-2ff1543cb1c9"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created-on           = "2025-10-02T16:50:23Z"
    stackgen-appstack-id = "057d0c9c-b610-4655-ad84-2ff1543cb1c9"
    stackgen-deploy-id   = "0229c892-a0e2-4178-96cf-7c88a9fca7b6"
    stackgen-managed     = "true"
    stackgen-reason      = "e2e test"
  }
}

module "stackgen_5b5f3c33-1fde-5ef4-bcf2-cd23796b9abd" {
  source            = "./modules/aws_route53_zone"
  comment           = ""
  delegation_set_id = ""
  force_destroy     = null
  name              = "dev.stackgen.com"
  tags              = {}
  vpc               = []
}

module "stackgen_5b9ce193-56b5-5fe7-9b25-5a27ba46d639" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "dev.stackgen.com"
  records                          = ["ns-873.awsdns-45.net. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  set_identifier                   = ""
  ttl                              = 900
  type                             = "SOA"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_5bcee584-1537-5c90-8b95-281be7875dc5" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_bbad1ee5-40dc-538e-aeff-f117c26a2252.name
}

module "stackgen_5c2fb5e1-1630-5b9b-b9ad-5b90d3dcb91a" {
  source      = "./modules/aws_security_group"
  description = "default VPC security group"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = []
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = true
    to_port          = 0
  }]
  name                   = "default"
  revoke_rules_on_delete = null
  tags                   = {}
  timeouts               = null
  vpc_id                 = module.stackgen_d25a6d89-d552-5559-bfac-46df4f389650.id
}

module "stackgen_5c5538fd-b634-58b8-8a2e-f0b5025de6ed" {
  source              = "./modules/aws_s3_bucket"
  bucket              = "test-template-bucket-dev-us-east-1"
  force_destroy       = null
  object_lock_enabled = false
  tags = {
    Environment = "dev"
    Region      = "us-east-1"
    appstack    = "aws-boto"
  }
}

module "stackgen_5c922627-b440-514f-a290-b3b7b9744513" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1e"
  cidr_block              = "172.31.48.0/20"
  map_public_ip_on_launch = true
  tags                    = {}
  vpc_id                  = module.stackgen_d25a6d89-d552-5559-bfac-46df4f389650.id
}

module "stackgen_5cb03f56-9562-56bf-b8b6-3aba4bf0ccfa" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCostAndUsageReportAutomationPolicy"
  role       = module.stackgen_71761eff-46ba-5dfd-bf6e-44191a4ed3fd.name
}

module "stackgen_5ccb8e9b-6cce-5aff-a63a-42e0f1c83ac8" {
  source    = "./modules/aws_iam_role_policy"
  name      = "dev-eks-cluster"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:CreateLogGroup\"],\"Effect\":\"Deny\",\"Resource\":\"*\"}]}"
  role      = module.stackgen_1e9854cc-9f50-50d5-9aab-b8eea9ef8cf9.name
  role_type = "custom"
}

module "stackgen_5cf195c3-3416-5224-9d45-11040dc7f463" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "dualstack.k8s-stackgen-stackgen-02c9a93c0d-1126699637.us-west-2.elb.amazonaws.com"
    zone_id                = "Z1H1FL5HABSF5"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "traces-stackgen-observe.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_5d5e0065-2dc1-5150-b8f3-6fb468fcd651" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"aws:SourceAccount\":\"339712749745\"}},\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"scheduler.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "Amazon_EventBridge_Scheduler_LAMBDA_2a3ded38b5"
  path                  = "/service-role/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_5d8885bf-d6b9-5a83-9fd9-3bda96bc87a9" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"eks.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "eksClusterRole"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_5e5589d4-ea11-56fb-92a3-c0dd9ba7fb46" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "on-prem-eks_6029909036736629111"
  name_prefix = ""
  path        = "/"
  role        = null
  tags = {
    "karpenter.k8s.aws/ec2nodeclass"    = "default"
    "karpenter.sh/managed-by"           = "on-prem-eks"
    "kubernetes.io/cluster/on-prem-eks" = "owned"
    "topology.kubernetes.io/region"     = "ap-south-1"
  }
}

module "stackgen_5e7cf1a9-631d-5cbe-8a28-cdf7cb19a93a" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "appcd-installer"
  name_prefix = ""
  path        = "/"
  role        = module.stackgen_2d919c3d-0fec-55f6-8e0a-eb4a6a16cc6d.name
  tags        = {}
}

module "stackgen_5ef6548f-d5e5-57b1-98a0-df39ad54241b" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_1c183b3e-0388-588e-b73b-f8cd91af5aab.name
}

module "stackgen_5f9d235d-5cb1-5324-ba21-96d143c72341" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = module.stackgen_3c6b93ab-33b6-5e76-af84-d87f7d59c746.name
}

module "stackgen_60610a29-33c1-5fe9-8c82-5855a0dbdf1b" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-nginxing-nginxing-5bcc97d528-8c5ddc36e39e5068.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "metrics-stackgen-observe.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_6126f512-8822-579b-bc18-64e45fe73458" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_3be52c00-188b-55fc-987f-484b62526b7e.name
}

module "stackgen_6185f279-a39d-566d-b9e4-4b9bc4a1a1a1" {
  source    = "./modules/aws_iam_role_policy"
  name      = "flow_role_policy"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:PutLogEvents\",\"logs:DescribeLogStreams\",\"logs:DescribeLogGroups\",\"logs:CreateLogStream\",\"logs:CreateLogGroup\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  role      = module.stackgen_b6ab893e-f4e0-5247-9910-e9ed60af9760.name
  role_type = "custom"
}

module "stackgen_61fbaf71-0783-5ec2-bd21-d64eebd04718" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = module.stackgen_c252080d-87a2-54fe-8f43-5b725d327987.name
}

module "stackgen_620a4299-b645-5deb-b155-428d1e9660e3" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "sks-log-muncher-s3-policy"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:ListBucket\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::stackgen-main-sks-exporter-test\",\"Sid\":\"ListObjectsInBucket\"},{\"Action\":[\"s3:PutObject\",\"s3:GetObject\",\"s3:DeleteObject\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::stackgen-main-sks-exporter-test/*\",\"arn:aws:s3:::stackgen-main-sks-exporter-test/**/*\"],\"Sid\":\"ManageBucketObjects\"},{\"Action\":[\"kms:GenerateDataKey\",\"kms:Decrypt\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"KMSPermissions\"}]}"
  }]
  max_session_duration = 3600
  name                 = "sks-log-muncher-role"
  path                 = "/"
  permissions_boundary = ""
  tags                 = {}
}

module "stackgen_629596a3-4e2d-520b-932e-4bfadbcde9dd" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2-instance-connect.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "The Service Linked Role used by EC2 Instance Connect Endpoint."
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForEc2InstanceConnect"
  path                  = "/aws-service-role/ec2-instance-connect.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_63076b60-936f-5f84-bd55-f8941084f5b5" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_9aa05b2b-f650-542f-b376-2b7123b70856.name
}

module "stackgen_635c513d-7750-4922-9e81-faf6cf8f0a8c" {
  source                        = "./modules/aws_eks_cluster"
  access_config                 = []
  bootstrap_self_managed_addons = true
  compute_config                = []
  eks_version                   = null
  enabled_cluster_log_types     = null
  encryption_config             = []
  kubernetes_network_config     = []
  name                          = null
  outpost_config                = []
  remote_network_config         = []
  role_arn                      = null
  storage_config                = []
  tags                          = null
  timeouts                      = null
  upgrade_policy                = []
  vpc_config                    = []
  zonal_shift_config            = []
}

module "stackgen_636b8331-caea-5584-a810-41313eb13838" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:sts::339712749745:assumed-role/stackgen-system-access/stackgen-access-20251003001152\"},\"Sid\":\"AssumeRolePermission\"}],\"Version\":\"2012-10-17\"}"
  description           = "Role for appstack deployment: e2e test "
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "stackgen-managed-4073ef15-5a74-4f88-8e26-e3958cece9bb"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created-on           = "2025-10-03T00:11:53Z"
    stackgen-appstack-id = "4073ef15-5a74-4f88-8e26-e3958cece9bb"
    stackgen-deploy-id   = "c9654d3e-4867-4246-90ee-99bb16af889b"
    stackgen-managed     = "true"
    stackgen-reason      = "e2e test"
  }
}

module "stackgen_6390eeb2-963e-53ec-b066-31a7f57a4ee2" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = module.stackgen_722c4a85-92b8-5e1f-9058-854b7cc2330a.name
}

module "stackgen_63f8ed93-eeb4-5e31-bdf6-780e4d70f722" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.ap-south-1.amazonaws.com/id/86DB6AC1226AF27A629837EE0A5BE166:aud\":\"sts.amazonaws.com\",\"oidc.eks.ap-south-1.amazonaws.com/id/86DB6AC1226AF27A629837EE0A5BE166:sub\":\"system:serviceaccount:kube-system:aws-for-fluent-bit-sa\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.ap-south-1.amazonaws.com/id/86DB6AC1226AF27A629837EE0A5BE166\"}}],\"Version\":\"2012-10-17\"}"
  description           = "IRSA for aws-for-fluent-bit"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "aws-for-fluent-bit-20240830233125935400000022"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    appcd_module  = "vpc"
    created_for   = "sks"
    maintained_by = "support@appcd.com"
  }
}

module "stackgen_651aa739-9ebc-52dd-95fc-d35943581459" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_1c183b3e-0388-588e-b73b-f8cd91af5aab.name
}

module "stackgen_6540fd76-6a9b-5f54-a22b-b7de41837c43" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_dfbfbdda-35e7-50f3-ad6f-30d4808ec839.arn
  role       = module.stackgen_c2eff8b1-c67b-5421-b877-2726bbb5f57f.name
}

module "stackgen_65b32b9c-69c1-5c4e-8ba0-623a575d0c6a" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonEKSServiceRolePolicy"
  role       = module.stackgen_cf2fd37d-6d85-5268-841b-7d8e19c1c215.name
}

module "stackgen_65faaf8c-f843-50c2-b560-78049e5c3f74" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/eks/retail-store/cluster"
  retention_in_days = 90
  tags = {
    Name             = "/aws/eks/retail-store/cluster"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_661832ab-82c4-5383-ac3e-30dd29e33ae7" {
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
    nat_gateway_id             = "nat-0e66607861996d1b5"
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
  vpc_id = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_6622862a-6f99-5b22-9283-b924316c7ee8" {
  source = "./modules/aws_route_table"
  route  = []
  tags = {
    Name = "test-rt"
  }
  vpc_id = module.stackgen_d25a6d89-d552-5559-bfac-46df4f389650.id
}

module "stackgen_666d4be7-d006-5c45-b82e-23259c852de6" {
  source      = "./modules/aws_iam_policy"
  description = "IAM Policy for cluster-autoscaler operator"
  name        = "cluster-autoscaler-20240212014355966400000001"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"eks:DescribeNodegroup\",\"ec2:GetInstanceTypesFromInstanceRequirements\",\"ec2:DescribeLaunchTemplateVersions\",\"ec2:DescribeInstanceTypes\",\"ec2:DescribeImages\",\"autoscaling:DescribeTags\",\"autoscaling:DescribeScalingActivities\",\"autoscaling:DescribeLaunchConfigurations\",\"autoscaling:DescribeAutoScalingInstances\",\"autoscaling:DescribeAutoScalingGroups\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"autoscaling:UpdateAutoScalingGroup\",\"autoscaling:TerminateInstanceInAutoScalingGroup\",\"autoscaling:SetDesiredCapacity\"],\"Condition\":{\"StringEquals\":{\"autoscaling:ResourceTag/kubernetes.io/cluster/engineering-eks\":\"owned\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_66a971c6-acf2-57b6-a018-aedb072b82ff" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_bbad1ee5-40dc-538e-aeff-f117c26a2252.name
}

module "stackgen_67652319-3156-52a0-a5fd-e115ed8f53c2" {
  source                           = "./modules/aws_autoscaling_group"
  capacity_rebalance               = true
  desired_capacity                 = 1
  enabled_metrics                  = ["GroupAndWarmPoolDesiredCapacity", "GroupAndWarmPoolTotalCapacity", "GroupDesiredCapacity", "GroupInServiceCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingCapacity", "GroupPendingInstances", "GroupStandbyCapacity", "GroupStandbyInstances", "GroupTerminatingCapacity", "GroupTerminatingInstances", "GroupTotalCapacity", "GroupTotalInstances", "WarmPoolDesiredCapacity", "WarmPoolMinSize", "WarmPoolPendingCapacity", "WarmPoolTerminatingCapacity", "WarmPoolTotalCapacity", "WarmPoolWarmedCapacity"]
  force_delete                     = null
  force_delete_warm_pool           = null
  health_check_grace_period        = 15
  health_check_type                = "EC2"
  ignore_failed_scaling_activities = null
  launch_configuration             = ""
  launch_template                  = []
  max_instance_lifetime            = 0
  max_size                         = 3
  min_size                         = 1
  mixed_instances_policy = [{
    instances_distribution = [{
      on_demand_allocation_strategy            = "prioritized"
      on_demand_base_capacity                  = 0
      on_demand_percentage_above_base_capacity = 100
      spot_allocation_strategy                 = "lowest-price"
      spot_instance_pools                      = 2
      spot_max_price                           = ""
    }]
    launch_template = [{
      launch_template_specification = [{
        launch_template_id   = "lt-06ab3c2debfd087cb"
        launch_template_name = "eks-aaccdcc3-1186-ec63-632e-e55f8bc1abde"
        version              = "1"
      }]
      override = [{
        instance_requirements         = []
        instance_type                 = "m5.large"
        launch_template_specification = []
        weighted_capacity             = ""
      }]
    }]
  }]
  protect_from_scale_in = false
  suspended_processes   = []
  tag = [{
    key                 = "eks:cluster-name"
    propagate_at_launch = true
    value               = "retail-store"
    }, {
    key                 = "eks:nodegroup-name"
    propagate_at_launch = true
    value               = "managed-nodegroup-2-20251006123639664000000033"
    }, {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = true
    value               = "true"
    }, {
    key                 = "k8s.io/cluster-autoscaler/retail-store"
    propagate_at_launch = true
    value               = "owned"
    }, {
    key                 = "kubernetes.io/cluster/retail-store"
    propagate_at_launch = true
    value               = "owned"
  }]
  target_group_arns         = []
  termination_policies      = ["AllocationStrategy", "OldestLaunchTemplate", "OldestInstance"]
  timeouts                  = null
  vpc_zone_identifier       = ["subnet-0367501afc74e2ef5"]
  wait_for_capacity_timeout = null
}

module "stackgen_67beab27-c96b-5e9b-975c-f9ffc6925685" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_880be9b2-8513-53d7-94ad-0d769b00d2e4.name
}

module "stackgen_67f967b5-4169-5138-882d-5b04490851ac" {
  source         = "./modules/aws_iam_openid_connect_provider"
  client_id_list = ["sts.amazonaws.com"]
  tags = {
    Name       = "dev-eks-eks-irsa"
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
  thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280", "06b25927c42a721631c1efd9431e648fa62e1e39", "2ad974a775f73cbdbbd8f5ac3a49255fa8fb1f8c", "e1d31a1f94725daaef02dcf1c1bb0ff4a28a6060"]
  url             = "oidc.eks.us-west-2.amazonaws.com/id/D7B7E856ABEFFE50EBC5A9A4A5B116E5"
}

module "stackgen_6844e683-c360-5cf3-a271-90bdc266616a" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = module.stackgen_880be9b2-8513-53d7-94ad-0d769b00d2e4.name
}

module "stackgen_688f9759-285c-55ad-8c2e-e04c6a422064" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"sso.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Service-linked role used by AWS SSO to manage AWS resources, including IAM roles, policies and SAML IdP on your behalf."
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForSSO"
  path                  = "/aws-service-role/sso.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_68daf5ea-d541-5f37-b9cb-7af5270ba885" {
  source     = "./modules/aws_iam_user_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  user       = module.stackgen_38f735f5-a11b-5ced-a6d4-c9b85493ac1c.name
}

module "stackgen_68fab510-14be-56bb-bd3f-4d912fe92d4d" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringLike\":{\"oidc.eks.us-west-2.amazonaws.com/id/D027B653E35BDB1E89302EE39F5D9803:sub\":\"system:serviceaccount:*:*\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/D027B653E35BDB1E89302EE39F5D9803\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "eks-tooling-dev-eks-s3-pod-role"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    ClusterName = "tooling-dev-eks"
    Environment = "opsverse-cluster"
    GeneratedBy = "OpsVerse"
    Name        = "eks-tooling-dev-eks-s3-pod-role"
  }
}

module "stackgen_6940bf2e-3b95-50ce-b1bd-47aef747c918" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"sts:ExternalId\":\"qMs61XBhrvDWFqlY\"}},\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::584974133937:role/stackgen-system\"}},{\"Action\":[\"sts:AssumeRole\",\"sts:TagSession\"],\"Effect\":\"Allow\",\"Principal\":{\"AWS\":[\"arn:aws:iam::339712749745:role/stackgen-system-access\",\"arn:aws:iam::339712749745:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_AdministratorAccess_90ce8fbcbe3cc328\"]},\"Sid\":\"AllowStackgenSystemToAssume\"}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "eks-cluster-access"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"eks:DescribeCluster\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:eks:us-west-2:339712749745:cluster/developer-eks\"},{\"Action\":\"eks:List*\",\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  }]
  max_session_duration = 3600
  name                 = "stackhealer-cluster-access-role"
  path                 = "/"
  permissions_boundary = ""
  tags                 = {}
}

module "stackgen_69ab79a8-d171-544a-99b5-58227aba691d" {
  source            = "./modules/aws_route53_zone"
  comment           = "Managed by Terraform"
  delegation_set_id = ""
  force_destroy     = null
  name              = "dev.appcd.io"
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
  vpc = []
}

module "stackgen_6a17b276-087d-574f-9a84-7cf88c305d92" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "sks-t2-eks_6795124765534763251"
  name_prefix = ""
  path        = "/"
  role        = null
  tags = {
    "karpenter.k8s.aws/ec2nodeclass"   = "default"
    "karpenter.sh/discovery"           = "sks-t2-eks"
    "karpenter.sh/managed-by"          = "sks-t2-eks"
    "kubernetes.io/cluster/sks-t2-eks" = "owned"
    "topology.kubernetes.io/region"    = "us-east-2"
  }
}

module "stackgen_6a27f733-f127-559c-92af-cbdeaf508e3f" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-ingressn-ingressn-efb5f6ecf7-a04f395ff369e7c5.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "main.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_6ab635ab-e396-5254-a5bb-0968a0abd409" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_0ccaae47-39ad-58d1-b9d9-c97e70657142.name
}

module "stackgen_6aef4fb5-4c62-56f0-95fe-8700803d5435" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_eb72ead6-cac7-559a-8b9d-be1eed6fe356.name
}

module "stackgen_6b6614e6-8cf6-4c5c-adc5-8154b6af6669" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = null
  map_public_ip_on_launch = false
  tags                    = {}
  vpc_id                  = module.stackgen_712f0693-28f2-4aa3-89b2-575b47fe1642.vpc_id
}

module "stackgen_6b82346f-f499-4e29-b73e-3646fb5318fa" {
  source                             = "./modules/aws_nat_gateway"
  allocation_id                      = null
  connectivity_type                  = null
  private_ip                         = null
  secondary_allocation_ids           = null
  secondary_private_ip_address_count = null
  secondary_private_ip_addresses     = null
  subnet_id                          = null
  tags                               = null
  timeouts                           = null
}

module "stackgen_6c3e1a46-606f-53b0-a0f9-fa1d3380431a" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"cost-optimization-hub.bcm.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Allows Cost Optimization Hub to retrieve organization information and collect optimization-related data and metadata."
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForCostOptimizationHub"
  path                  = "/aws-service-role/cost-optimization-hub.bcm.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_6c758958-f1d6-55ef-91cc-4bf7cb332e60" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_a35aa9b8-5884-5aaf-a493-7ebb093a9924.arn
  role       = module.stackgen_d0b8a631-87da-5263-834a-5e5566b8524c.name
}

module "stackgen_6ccfa8fc-0103-525d-84fc-e28a957c15ba" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "_fda656971f31a5c9bc86db12eeecaba1.dev.appcd.io"
  records                          = ["_e51d52946df1fc466c46c5687c6411b5.mhbtsbpdnt.acm-validations.aws."]
  set_identifier                   = ""
  ttl                              = 300
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_6d1a42e3-b8be-5d08-944b-8e7c8a907ea0" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_fa16772f-5e83-5f83-9b41-d443b19840d1.name
}

module "stackgen_6d219e2a-51cb-553f-b786-83f17f308703" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = module.stackgen_1c183b3e-0388-588e-b73b-f8cd91af5aab.name
}

module "stackgen_6d53f530-c619-41ee-8afa-7f6ee3ea07dc" {
  source                       = "./modules/aws_elasticache_cluster"
  apply_immediately            = null
  auto_minor_version_upgrade   = null
  availability_zone            = null
  az_mode                      = null
  cluster_id                   = null
  engine                       = "valkey"
  engine_version               = null
  final_snapshot_identifier    = null
  ip_discovery                 = null
  log_delivery_configuration   = []
  maintenance_window           = null
  network_type                 = null
  node_type                    = null
  notification_topic_arn       = null
  num_cache_nodes              = null
  outpost_mode                 = null
  parameter_group_name         = null
  port                         = null
  preferred_availability_zones = null
  preferred_outpost_arn        = null
  replication_group_id         = null
  security_group_ids           = null
  snapshot_arns                = null
  snapshot_name                = null
  snapshot_retention_limit     = null
  snapshot_window              = null
  subnet_group_name            = null
  tags                         = null
  timeouts                     = null
  transit_encryption_enabled   = null
}

module "stackgen_6d7336f3-22d5-54f2-928e-4192b42ea13d" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "dev.appcd.io"
  records                          = ["ns-1512.awsdns-61.org.", "ns-2040.awsdns-63.co.uk.", "ns-480.awsdns-60.com.", "ns-601.awsdns-11.net."]
  set_identifier                   = ""
  ttl                              = 172800
  type                             = "NS"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_6d8182b6-18c9-5f02-bd2a-5f816cb553b8" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_24c93baf-fb71-5a7e-9c36-ac198b645c77.arn
  role       = module.stackgen_19ba4c86-7702-54c7-8442-00aafed0df71.name
}

module "stackgen_6d944644-2496-549c-baa7-a957e99e1d48" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = module.stackgen_2a7764ff-e36e-5ce3-8c39-b313b75b17a4.name
}

module "stackgen_6dc828e2-a8f2-5560-b778-b3eef49b47d1" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_2a7764ff-e36e-5ce3-8c39-b313b75b17a4.name
}

module "stackgen_6e17611d-eb4a-4b1a-ac6c-13d532150f0d" {
  source                       = "./modules/aws_elasticache_cluster"
  apply_immediately            = null
  auto_minor_version_upgrade   = null
  availability_zone            = null
  az_mode                      = null
  cluster_id                   = null
  engine                       = "valkey"
  engine_version               = null
  final_snapshot_identifier    = null
  ip_discovery                 = null
  log_delivery_configuration   = []
  maintenance_window           = null
  network_type                 = null
  node_type                    = null
  notification_topic_arn       = null
  num_cache_nodes              = null
  outpost_mode                 = null
  parameter_group_name         = null
  port                         = null
  preferred_availability_zones = null
  preferred_outpost_arn        = null
  replication_group_id         = null
  security_group_ids           = null
  snapshot_arns                = null
  snapshot_name                = null
  snapshot_retention_limit     = null
  snapshot_window              = null
  subnet_group_name            = null
  tags                         = null
  timeouts                     = null
  transit_encryption_enabled   = null
}

module "stackgen_6ec7ff86-adcd-5f73-854d-12a3d0dc7121" {
  source                      = "./modules/aws_instance"
  ami                         = "ami-05ac965fc0f5788ba"
  associate_public_ip_address = false
  availability_zone           = "us-east-1d"
  capacity_reservation_specification = [{
    capacity_reservation_preference = "open"
    capacity_reservation_target     = []
  }]
  cpu_options = [{
    amd_sev_snp      = ""
    core_count       = 1
    threads_per_core = 2
  }]
  credit_specification = [{
    cpu_credits = "unlimited"
  }]
  disable_api_stop        = false
  disable_api_termination = false
  ebs_block_device        = []
  ebs_optimized           = false
  enable_primary_ipv6     = null
  enclave_options = [{
    enabled = false
  }]
  ephemeral_block_device               = []
  get_password_data                    = false
  hibernation                          = false
  host_id                              = ""
  host_resource_group_arn              = null
  iam_instance_profile                 = ""
  instance_initiated_shutdown_behavior = "stop"
  instance_market_options              = []
  instance_type                        = "t3.medium"
  ipv6_address_count                   = 0
  ipv6_addresses                       = []
  key_name                             = module.stackgen_cd786bc0-62b9-5a5a-b73a-e7479cd82195.key_name
  launch_template                      = []
  maintenance_options = [{
    auto_recovery = "default"
  }]
  metadata_options = [{
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }]
  monitoring                 = false
  network_interface          = []
  placement_group            = ""
  placement_partition_number = 0
  private_dns_name_options = [{
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }]
  private_ip = "172.31.45.162"
  root_block_device = [{
    delete_on_termination = true
    device_name           = "/dev/xvda"
    encrypted             = false
    iops                  = 3000
    kms_key_id            = ""
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_id             = "vol-0455a55f5e360895c"
    volume_size           = 30
    volume_type           = "gp3"
  }]
  secondary_private_ips = []
  security_groups       = ["neo4j-docker-sg"]
  source_dest_check     = true
  subnet_id             = module.stackgen_34f8dc1c-7f4c-5eda-9a8c-9b74c9ca472d.id
  tags = {
    Name = "neo4j-docker"
  }
  tenancy                     = "default"
  timeouts                    = null
  user_data                   = null
  user_data_base64            = ""
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-0cbf59a49f9b84c50"]
}

module "stackgen_6f00e3f7-1571-5b40-8a0b-6619edcf3adc" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_4f95fc4a-48e7-5a49-9cbe-9cb173ff467a.arn
  role       = module.stackgen_063ea0e5-c6d6-5130-96e0-bb34b72c9509.name
}

module "stackgen_6fac6601-e034-5bd3-a7db-6d84742d872a" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"monitoring.rds.amazonaws.com\"},\"Sid\":\"\"}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "rds-monitoring-role"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_7048be66-3568-4b0a-bb06-fc45a9072597" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = null
  map_public_ip_on_launch = false
  tags                    = {}
  vpc_id                  = null
}

module "stackgen_705ec2e8-5862-5288-8b03-52859abaf27f" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_bedeb7c5-6f89-50bf-9053-03d7eb27aa69.arn
  role       = module.stackgen_c2eff8b1-c67b-5421-b877-2726bbb5f57f.name
}

module "stackgen_706a3ae0-26c5-5e96-9a3c-812addcd4566" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_eb72ead6-cac7-559a-8b9d-be1eed6fe356.name
}

module "stackgen_70af7119-8b48-57bd-99b7-4fa76925c92e" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = module.stackgen_3be52c00-188b-55fc-987f-484b62526b7e.name
}

module "stackgen_70fee619-6d37-53e6-8518-53754e8c6389" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_1e88b453-294b-5398-8df5-dc6c7c6cdae5.arn
  role       = module.stackgen_2d919c3d-0fec-55f6-8e0a-eb4a6a16cc6d.name
}

module "stackgen_712f0693-28f2-4aa3-89b2-575b47fe1642" {
  source                               = "./modules/aws_vpc"
  cidr_block                           = null
  enable_dns_hostnames                 = false
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  tags                                 = {}
}

module "stackgen_71761eff-46ba-5dfd-bf6e-44191a4ed3fd" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":[\"sts:AssumeRoleWithSAML\",\"sts:TagSession\"],\"Condition\":{\"StringEquals\":{\"SAML:aud\":\"https://signin.aws.amazon.com/saml\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:saml-provider/AWSSSO_66cb6e387e9a07b4_DO_NOT_DELETE\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 43200
  name                  = "AWSReservedSSO_AdministratorAccess_90ce8fbcbe3cc328"
  path                  = "/aws-reserved/sso.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_722c4a85-92b8-5e1f-9058-854b7cc2330a" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"monitoring.rds.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "terraform-20240130233046296400000001"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_73220380-5d16-5bd6-a557-db03e2a07144" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "appcd.dev.appcd.io"
  records                          = ["v=spf1 include:amazonses.com ~all"]
  set_identifier                   = ""
  ttl                              = 300
  type                             = "TXT"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_7355bfee-55a9-5f2e-94b3-f9dcbd840a4d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = module.stackgen_4bdadd44-ffe9-54f5-a02b-2dfccee7d6e5.name
}

module "stackgen_73656f61-fb25-528e-99e0-674b58af4862" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "unstable-email-sender"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":\"ses:SendRawEmail\",\"Condition\":{\"StringLike\":{\"ses:FromAddress\":\"*@support.unstable.dev.stackgen.com\"}},\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"SendEmail\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    namespace = "appcd-unstable"
    repo      = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_7400a76e-cd91-4c9d-aac0-708aed6ba9b2" {
  source                         = "./modules/aws_xray_sampling_rule"
  attributes                     = null
  aws_xray_sampling_rule_version = null
  fixed_rate                     = null
  host                           = null
  http_method                    = null
  priority                       = null
  reservoir_size                 = null
  resource_arn                   = null
  rule_name                      = null
  service_name                   = null
  service_type                   = null
  tags                           = null
  url_path                       = null
}

module "stackgen_74485c17-20a1-57c6-aefd-12dfc82412d4" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "eks-64cccd9f-cd7d-4e9b-faec-2b04c229d32f"
  name_prefix = ""
  path        = "/"
  role        = module.stackgen_0bbb4566-02cc-56f9-8511-86f67013a661.name
  tags        = {}
}

module "stackgen_746f36ad-514b-5599-9954-c80a64d2ff7d" {
  source               = "./modules/aws_iam_user"
  force_destroy        = null
  name                 = "ses-smtp-user-onprem"
  path                 = "/"
  permissions_boundary = ""
  tags = {
    namespace = "appcd-onprem"
    repo      = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_7520b91e-8d5e-57f8-ad2c-2049a31ca03d" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/436E20DEC59ECD543B5C986741FD9637:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/436E20DEC59ECD543B5C986741FD9637:sub\":\"system:serviceaccount:kube-system:aws-node\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/436E20DEC59ECD543B5C986741FD9637\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "eksctl-eks-tooling-addon-vpc-cni-Role1-A6LRDu0bCgjf"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    "alpha.eksctl.io/addon-name"                  = "vpc-cni"
    "alpha.eksctl.io/cluster-name"                = "eks-tooling"
    "alpha.eksctl.io/eksctl-version"              = "0.205.0-dev+9e5300e5a.2025-02-28T20:10:13Z"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "eks-tooling"
  }
}

module "stackgen_752ae506-8094-5a85-aa53-a610fce318c8" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSGlobalAcceleratorSLRPolicy"
  role       = module.stackgen_f63463b1-30b7-58b9-95a7-a669ed91bb38.name
}

module "stackgen_758705b8-cc62-5629-bedc-ef952fe15a21" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"spotfleet.amazonaws.com\"},\"Sid\":\"\"}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "aws-ec2-spot-fleet-tagging-role"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_75a0612c-570a-5164-96ae-2e35673b2dff" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "p2czmmnwwoyc7bj7ijifgvwlesgiagyn._domainkey.stage.dev.stackgen.com"
  records                          = ["p2czmmnwwoyc7bj7ijifgvwlesgiagyn.dkim.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 1800
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_7620af1b-e4ca-52c5-9e94-520efc7598de" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_e7c96bfb-2406-59db-80d4-2a5801d1a145.arn
  role       = module.stackgen_1e03b169-771b-5ab5-8d09-0cabb903a156.name
}

module "stackgen_767d9859-91dc-54f3-98ee-edf7f6065c1b" {
  source     = "./modules/aws_iam_user_policy_attachment"
  policy_arn = module.stackgen_98730184-d7b8-583d-a0f8-ac37cc3ebfb2.arn
  user       = module.stackgen_0cedae29-2b0d-5341-a4b1-11dd86f49d70.name
}

module "stackgen_76838fa9-4540-53ff-903b-996ac4c6e647" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSBlockStoragePolicy"
  role       = module.stackgen_e7da5ae7-3b7b-5af9-9bfc-dad2bc61c94c.name
}

module "stackgen_76a7caa1-0965-57ee-9d7d-6395d4fdfe7f" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-ingressn-ingressn-efb5f6ecf7-a04f395ff369e7c5.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "unstable.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_76c5b841-b280-41de-8952-e80c98d4dc15" {
  source                             = "./modules/aws_rds_cluster"
  availability_zones                 = []
  backup_retention_period            = 9
  cluster_identifier                 = null
  copy_tags_to_snapshot              = false
  database_name                      = null
  db_subnet_group_name               = "default"
  enable_global_write_forwarding     = null
  enable_local_write_forwarding      = null
  enabled_cloudwatch_logs_exports    = null
  engine                             = null
  engine_mode                        = null
  engine_version                     = null
  global_cluster_identifier          = null
  kms_key_id                         = null
  master_password                    = var.master_password_76c5b841-b280-41de-8952-e80c98d4dc15
  master_username                    = null
  preferred_backup_window            = "07:00-09:00"
  preferred_maintenance_window       = "sun:05:00-sun:06:00"
  scaling_configuration              = []
  serverlessv2_scaling_configuration = []
  skip_final_snapshot                = null
  storage_encrypted                  = true
  tags                               = {}
  vpc_security_group_ids = [
    module.stackgen_151b221b-a95a-4244-94d5-a8d51e5f5a45.vpc_id,
  ]
}

module "stackgen_7709aeb2-e144-5b61-af26-907f6c0458dc" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "eks-9acccd9b-36a0-4bfe-9d0b-390835eb01f5"
  name_prefix = ""
  path        = "/"
  role        = module.stackgen_0bbb4566-02cc-56f9-8511-86f67013a661.name
  tags        = {}
}

module "stackgen_773de70b-b068-53cd-ab41-55640275768f" {
  source  = "./modules/aws_cloudfront_origin_access_identity"
  comment = "docs"
}

module "stackgen_77825f20-fae0-55c5-a0b0-72bc7fc0b6c3" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = module.stackgen_71761eff-46ba-5dfd-bf6e-44191a4ed3fd.name
}

module "stackgen_77a22135-4048-51a6-b14f-4df30d958e1a" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/APIGatewayServiceRolePolicy"
  role       = module.stackgen_7854771e-316d-516f-9c25-f7945a25702b.name
}

module "stackgen_77c9dcb8-87db-5502-9995-0bfc45b4839b" {
  source     = "./modules/aws_iam_user_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  user       = module.stackgen_4ec19b0a-a8cf-5f76-8042-c90c7768da48.name
}

module "stackgen_782795af-d1f5-4f84-ba76-2bc80bb998cb" {
  source                 = "./modules/aws_security_group"
  description            = "Managed by Terraform."
  egress                 = []
  ingress                = []
  name                   = null
  revoke_rules_on_delete = false
  tags                   = {}
  timeouts               = null
  vpc_id                 = null
}

module "stackgen_784acf88-5b8f-5b3c-9b9b-db8042f389c2" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_bbad1ee5-40dc-538e-aeff-f117c26a2252.name
}

module "stackgen_7854771e-316d-516f-9c25-f7945a25702b" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ops.apigateway.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "The Service Linked Role is used by Amazon API Gateway."
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForAPIGateway"
  path                  = "/aws-service-role/ops.apigateway.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_788887e6-7a66-512d-bd2b-72720deeb7ab" {
  source      = "./modules/aws_security_group"
  description = "[k8s] Shared Backend SecurityGroup for LoadBalancer"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress                = []
  name                   = "k8s-traffic-retailstore-06033bc72f"
  revoke_rules_on_delete = null
  tags = {
    "elbv2.k8s.aws/cluster"  = "retail-store"
    "elbv2.k8s.aws/resource" = "backend-sg"
  }
  timeouts = null
  vpc_id   = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_790e41a2-5965-5ce4-ae6b-ce3b16c74f30" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_5aae0830-99db-5772-ba71-96e251989242.arn
  role       = module.stackgen_2ec6e0a9-ee21-57d8-933a-5e70733b6d44.name
}

module "stackgen_796e351c-0179-52ec-8bd6-323adcf6f1e8" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonSSMServiceRolePolicy"
  role       = module.stackgen_57467032-089f-5bc1-9024-1afb90712e9d.name
}

module "stackgen_79fe3448-c15b-59c9-b4a4-16a9d28ccbae" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = module.stackgen_b85d53be-d3b0-59a3-be06-3738f279dfbc.name
}

module "stackgen_7b1b6068-f684-59d2-bf62-16df215bdad4" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_2a7764ff-e36e-5ce3-8c39-b313b75b17a4.name
}

module "stackgen_7b4f53b0-de26-523a-9572-52fe8c349344" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSReadOnlyAccess"
  role       = module.stackgen_37991be3-ebf8-576e-b55e-bb9614ed13f5.name
}

module "stackgen_7bf162a0-2f33-547b-b14c-4c9bf951e8bc" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"redshift.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Allows Amazon Redshift to call AWS services on your behalf "
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForRedshift"
  path                  = "/aws-service-role/redshift.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_7bf732d4-1e3d-52e9-bbca-e51f1e339a78" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "dev.stackgen.com"
  records                          = ["ns-1198.awsdns-21.org.", "ns-1542.awsdns-00.co.uk.", "ns-26.awsdns-03.com.", "ns-873.awsdns-45.net."]
  set_identifier                   = ""
  ttl                              = 172800
  type                             = "NS"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_7c3b371c-f06f-5da9-ac30-d5d5c43a85a5" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":[\"sts:AssumeRole\",\"sts:TagSession\"],\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"pods.eks.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Allows pods running in Amazon EKS cluster to access AWS resources."
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AmazonEKSPodIdentityAmazonEBSCSIDriverRole"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_7d8d63d7-fa91-534a-a747-475763de245d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = module.stackgen_c33aeea4-628c-59cc-b1f6-5e612be6586c.name
}

module "stackgen_7db562c2-d100-517e-9c7f-49e634bb2c49" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/B41C32B08508FF458AD3826D050B4390:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/B41C32B08508FF458AD3826D050B4390:sub\":\"system:serviceaccount:kube-system:aws-for-fluent-bit-sa\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/B41C32B08508FF458AD3826D050B4390\"}}],\"Version\":\"2012-10-17\"}"
  description           = "IRSA for aws-for-fluent-bit"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "aws-for-fluent-bit-20240801181410940800000003"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    appcd_module  = "vpc"
    created_for   = "on-prem"
    maintained_by = "support@appcd.com"
  }
}

module "stackgen_7de2fdea-ad5b-59da-a12a-f64398504f3f" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  role       = module.stackgen_2710af38-6089-5ea8-823c-aebe619b70b4.name
}

module "stackgen_7e20a179-a540-505e-8b72-fc6e0f0fb730" {
  source      = "./modules/aws_iam_policy"
  description = "IAM policy for S3 bucket access"
  name        = "appcd-blobs-developer-s3-mount-policy"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"s3:ListBucket\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::appcd-blobs-developer\"],\"Sid\":\"MountpointFullBucketAccess\"},{\"Action\":[\"s3:GetObject\",\"s3:PutObject\",\"s3:AbortMultipartUpload\",\"s3:DeleteObject\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::appcd-blobs-developer/*\"],\"Sid\":\"MountpointFullObjectAccess\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_7e94c4d2-48e6-572d-9633-a7df2c4c619d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_bbad1ee5-40dc-538e-aeff-f117c26a2252.name
}

module "stackgen_7e9d7355-5cb4-5e15-80a2-a43da9038b0c" {
  source  = "./modules/aws_iam_access_key"
  pgp_key = null
  status  = "Active"
  user    = module.stackgen_746f36ad-514b-5599-9954-c80a64d2ff7d.name
}

module "stackgen_7ebbe1c1-b52f-5ac7-99ea-b5734844d82a" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-ingressn-ingressn-efb5f6ecf7-a04f395ff369e7c5.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "onprem.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_7ee7fda2-2723-4fe3-be75-c6a20465a657" {
  source                        = "./modules/aws_eks_cluster"
  access_config                 = []
  bootstrap_self_managed_addons = true
  compute_config                = []
  eks_version                   = null
  enabled_cluster_log_types     = null
  encryption_config             = []
  kubernetes_network_config     = []
  name                          = null
  outpost_config                = []
  remote_network_config         = []
  role_arn                      = null
  storage_config                = []
  tags                          = null
  timeouts                      = null
  upgrade_policy                = []
  vpc_config                    = []
  zonal_shift_config            = []
}

module "stackgen_7eeca88e-2719-5dab-b6a1-3f00037d2f4c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = module.stackgen_3bf1912b-ab9f-51c1-9b73-6e6dc681cd83.name
}

module "stackgen_7fdbd29a-a961-57b0-801c-2b346149c1f3" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_4bdadd44-ffe9-54f5-a02b-2dfccee7d6e5.name
}

module "stackgen_7ffa92ae-c4e3-59fb-9e20-8d47ddf4aecc" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "dev-stackgen-onprem-eks_6029909036736629111"
  name_prefix = ""
  path        = "/"
  role        = null
  tags = {
    "karpenter.k8s.aws/ec2nodeclass"                = "default"
    "karpenter.sh/managed-by"                       = "dev-stackgen-onprem-eks"
    "kubernetes.io/cluster/dev-stackgen-onprem-eks" = "owned"
    "topology.kubernetes.io/region"                 = "ap-south-1"
  }
}

module "stackgen_807c8600-579b-5116-a412-44b8451201a1" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"logger.cloudfront.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForCloudFrontLogger"
  path                  = "/aws-service-role/logger.cloudfront.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_808f4482-2475-5a64-84e3-8b6482dfe707" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "ah4a4tkfjtt6try6qwihus7cc25vlfuv._domainkey.main.dev.appcd.io"
  records                          = ["ah4a4tkfjtt6try6qwihus7cc25vlfuv.dkim.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 1800
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_80949217-6428-59df-b5f5-c739775d1f13" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonMQServiceRolePolicy"
  role       = module.stackgen_e8a71ac7-bf19-5f45-8251-3b1076eac173.name
}

module "stackgen_80cef759-f1f8-5076-b056-bbeac0f907f1" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "zpqpfhir5h5smadmyt6i3uoj7a4t5w24._domainkey.playground.dev.appcd.io"
  records                          = ["zpqpfhir5h5smadmyt6i3uoj7a4t5w24.dkim.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 1800
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_81255901-aa1e-59c6-b929-4259708fd6cb" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "lambda_exec_role_developer"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_81274bad-9d1e-5382-9713-c6061032c492" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_1c183b3e-0388-588e-b73b-f8cd91af5aab.name
}

module "stackgen_81446bcb-aab7-5220-90e2-de9691e7f6fc" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = false
    name                   = "d1439hwp503tuh.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "stage.dev.appcd.io"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_8209a220-e180-5345-9beb-16e2496cd509" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = module.stackgen_0ccaae47-39ad-58d1-b9d9-c97e70657142.name
}

module "stackgen_820c3aca-bffa-581c-b7e0-42c6b2b0036e" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = module.stackgen_c252080d-87a2-54fe-8f43-5b725d327987.name
}

module "stackgen_821dccb7-3053-591f-97d1-f8ca7d79b0af" {
  source      = "./modules/aws_iam_policy"
  description = "Cluster encryption policy to allow cluster role to utilize CMK provided"
  name        = "retail-store-cluster-ClusterEncryption2025100612240753300000000d"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"kms:Encrypt\",\"kms:Decrypt\",\"kms:ListGrants\",\"kms:DescribeKey\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:kms:us-east-1:339712749745:key/18b0c4ac-74ba-4bd2-aa9d-8fe2a9222af6\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_82337260-27c3-51aa-87b3-108cffca9fa4" {
  source      = "./modules/aws_iam_policy"
  description = "Allow AWS Step Functions to call X-Ray daemon on your behalf"
  name        = "XRayAccessPolicy-cb5413ad-6de4-44e1-a37e-d39e514a498a"
  path        = "/service-role/"
  policy      = "{\"Statement\":[{\"Action\":[\"xray:PutTraceSegments\",\"xray:PutTelemetryRecords\",\"xray:GetSamplingRules\",\"xray:GetSamplingTargets\"],\"Effect\":\"Allow\",\"Resource\":[\"*\"]}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_826c91f0-b614-5440-a8c9-7e6509c6eb50" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "eks-aaccdcc3-1186-ec63-632e-e55f8bc1abde"
  name_prefix = ""
  path        = "/"
  role        = module.stackgen_c252080d-87a2-54fe-8f43-5b725d327987.name
  tags        = {}
}

module "stackgen_829c8b70-893c-5c9e-ae44-cb44abd70026" {
  source                      = "./modules/aws_instance"
  ami                         = "ami-0372948d8ff019232"
  associate_public_ip_address = false
  availability_zone           = "us-east-1a"
  capacity_reservation_specification = [{
    capacity_reservation_preference = "open"
    capacity_reservation_target     = []
  }]
  cpu_options = [{
    amd_sev_snp      = ""
    core_count       = 1
    threads_per_core = 2
  }]
  credit_specification    = []
  disable_api_stop        = false
  disable_api_termination = false
  ebs_block_device        = []
  ebs_optimized           = false
  enable_primary_ipv6     = null
  enclave_options = [{
    enabled = false
  }]
  ephemeral_block_device               = []
  get_password_data                    = false
  hibernation                          = false
  host_id                              = ""
  host_resource_group_arn              = null
  iam_instance_profile                 = "eks-86ccdcc3-1183-e049-47ec-0db98d33dbc7"
  instance_initiated_shutdown_behavior = "stop"
  instance_market_options              = []
  instance_type                        = "m5.large"
  ipv6_address_count                   = 0
  ipv6_addresses                       = []
  key_name                             = ""
  launch_template = [{
    id      = "lt-04927366ac0ff7891"
    name    = "eks-86ccdcc3-1183-e049-47ec-0db98d33dbc7"
    version = "1"
  }]
  maintenance_options = [{
    auto_recovery = "default"
  }]
  metadata_options = [{
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }]
  monitoring                 = true
  network_interface          = []
  placement_group            = ""
  placement_partition_number = 0
  private_dns_name_options = [{
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }]
  private_ip = "10.0.10.63"
  root_block_device = [{
    delete_on_termination = true
    device_name           = "/dev/xvda"
    encrypted             = false
    iops                  = 3000
    kms_key_id            = ""
    tags = {
      Name                 = "managed-nodegroup-1"
      created-by           = "retail-store-sample-app"
      "eks:cluster-name"   = "retail-store"
      "eks:nodegroup-name" = "managed-nodegroup-1-20251006123639663900000031"
      environment-name     = "retail-store"
    }
    tags_all = {
      Name                 = "managed-nodegroup-1"
      created-by           = "retail-store-sample-app"
      "eks:cluster-name"   = "retail-store"
      "eks:nodegroup-name" = "managed-nodegroup-1-20251006123639663900000031"
      environment-name     = "retail-store"
    }
    throughput  = 125
    volume_id   = "vol-0a3cdf9b8a40138cc"
    volume_size = 20
    volume_type = "gp3"
  }]
  secondary_private_ips = ["10.0.10.121", "10.0.10.125", "10.0.10.20", "10.0.10.23", "10.0.10.43", "10.0.10.50", "10.0.10.61", "10.0.10.74", "10.0.10.77"]
  security_groups       = []
  source_dest_check     = true
  subnet_id             = module.stackgen_a4632096-f217-5670-8040-5afc23611f74.id
  tags = {
    Name                                     = "managed-nodegroup-1"
    created-by                               = "retail-store-sample-app"
    "eks:cluster-name"                       = "retail-store"
    "eks:nodegroup-name"                     = "managed-nodegroup-1-20251006123639663900000031"
    environment-name                         = "retail-store"
    "k8s.io/cluster-autoscaler/enabled"      = "true"
    "k8s.io/cluster-autoscaler/retail-store" = "owned"
    "kubernetes.io/cluster/retail-store"     = "owned"
  }
  tenancy                     = "default"
  timeouts                    = null
  user_data                   = null
  user_data_base64            = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiBhcHBsaWNhdGlvbi9ub2RlLmVrcy5hd3MKCi0tLQphcGlWZXJzaW9uOiBub2RlLmVrcy5hd3MvdjFhbHBoYTEKa2luZDogTm9kZUNvbmZpZwpzcGVjOgogIGNsdXN0ZXI6CiAgICBhcGlTZXJ2ZXJFbmRwb2ludDogaHR0cHM6Ly9GM0Y0OTBCMEJGMTEyNUM0MjU1ODVFMjM3NkFBMDIyMC5ncjcudXMtZWFzdC0xLmVrcy5hbWF6b25hd3MuY29tCiAgICBjZXJ0aWZpY2F0ZUF1dGhvcml0eTogTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUkNWRU5EUVdVeVowRjNTVUpCWjBsSlNVWjJjREo0Y2xGdlpWbDNSRkZaU2t0dldrbG9kbU5PUVZGRlRFSlJRWGRHVkVWVVRVSkZSMEV4VlVVS1FYaE5TMkV6Vm1sYVdFcDFXbGhTYkdONlFXVkdkekI1VGxSRmQwMUVXWGhOYWtrelRWUlNZVVozTUhwT1ZFVjNUVVJSZUUxcVRYbE5WRkpoVFVKVmVBcEZla0ZTUW1kT1ZrSkJUVlJEYlhReFdXMVdlV0p0VmpCYVdFMTNaMmRGYVUxQk1FZERVM0ZIVTBsaU0wUlJSVUpCVVZWQlFUUkpRa1IzUVhkblowVkxDa0Z2U1VKQlVVUm9ka280UzNZeVVVbHZWMDVuV1cwelMwaFNNbkZqZFhwREszbHliVUV4VFZKNk9XWjROV1p0VG5GQlQzWnZjVFJ4UXpJMlIwZG1kMHdLZEVGVVZsZGhMelpuZDJOSmIyMW5iRlpPUkVoRGN6ZFNWemRtVmtzdmNGcGFNblJyVkZsdmVrRnJRV28zYUZZMVV6ZEtaRE5NUlhkTGNWbEVOMDlIY1FwSFRHTXJkVmh6WVRkUmExWjFjRzFJV1hkTFJ6TnVXazFEV0VKb2RpOXRjbFJpVW5CNlNHRlVVVEk1ZG1GVFpreHBiVGhVWkUxdVFsUmxLemRhT1c0NENsY3hSMFpaVlZCS1JIb3dWbmh4UWxCbU5ITXlTV2N4YTNoSVFuWmFhWHBJYVcxb016VlNPRlpaWmpGUWJFVkNVVzVOVkRWeFltVlhUa3RLTTB0V2JHTUtNQ3RuV1VwVVozQnNUekJGWVRKVWRsbEVRV2xQTVcxck4zTmlWazlRVjJOU1F5dEhUM0pVTUZvM2FWY3dTemwyYkZrM1VGZHlRa3AwZG1wd05VWlJiQXA0YlZNMlZ6VmFUMmtyWkVVNFZGcDBaVmR5TjFFMGRHMUVjRmQwUVdkTlFrRkJSMnBYVkVKWVRVRTBSMEV4VldSRWQwVkNMM2RSUlVGM1NVTndSRUZRQ2tKblRsWklVazFDUVdZNFJVSlVRVVJCVVVndlRVSXdSMEV4VldSRVoxRlhRa0pSWjNOdlQxSTFOVEJCUVV4UlkwWkJNalYzTUVWblJHZGlkV3hVUVZZS1FtZE9Wa2hTUlVWRWFrRk5aMmR3Y21SWFNteGpiVFZzWkVkV2VrMUJNRWREVTNGSFUwbGlNMFJSUlVKRGQxVkJRVFJKUWtGUlFsWXdZakJLVTBaeVR3cEtlSEYzTVc5RlQwRndkMFZ6UkdKSVlYb3hVMlYyTHpSRlpFRjFZbEZqTjBWWk4xbzVZVkpoTjBoU016TXdZWFUwTlc4eldFbHlkSE12WTJsQ0sybHJDbEJQYVVOTWFVSlZibFpYV1ROSWRXTTBMekVyZW5BNWJXZDBiSEZETVVRcmFtYzNVSE56ZUhoVlpXSlpRVEUxVVU5NkwyTlVNMVF5YkhwNmJGSTRUWE1LYkVSUmEweExVRlJ5TTAwd01VUXZSWFJaYzJaVVowYzRZalJqUkZabmNuTlFkamRIVDBWUmVHeENNa2RIYUU5ck1ESXlORlJIT0c0MVpYUTVOa1pEWVFwdU5FZ3ZLMGt5YlZCRmVuRXdkMkpRZGtOak9YTjBWekp5ZDJGMFF6WlpXRWhwYmtkNk5EUkdhams1ZUdoQ1VqSlZRbWhSZEdKU01YWktTMFZDYUdJdkNqaEdNV0kxVGxCb1ZVazFSeTlpZUUxdFJFWkdiR1JGUVZCb05XZEpaemh2YlU4d2VVdEhTUzlYVW5CaE0zSkJiU3RXYjNGdE15dDNkbmRRTlZoVVVEa0tkVGRCUlhWeGVVdzNla05wQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLCiAgICBjaWRyOiAxNzIuMjAuMC4wLzE2CiAgICBuYW1lOiByZXRhaWwtc3RvcmUKICBrdWJlbGV0OgogICAgY29uZmlnOgogICAgICBtYXhQb2RzOiAyOQogICAgICBjbHVzdGVyRE5TOgogICAgICAtIDE3Mi4yMC4wLjEwCiAgICBmbGFnczoKICAgIC0gIi0tbm9kZS1sYWJlbHM9ZWtzLmFtYXpvbmF3cy5jb20vc291cmNlTGF1bmNoVGVtcGxhdGVWZXJzaW9uPTEsZWtzLmFtYXpvbmF3cy5jb20vbm9kZWdyb3VwLWltYWdlPWFtaS0wMzcyOTQ4ZDhmZjAxOTIzMixla3MuYW1hem9uYXdzLmNvbS9jYXBhY2l0eVR5cGU9T05fREVNQU5ELGVrcy5hbWF6b25hd3MuY29tL25vZGVncm91cD1tYW5hZ2VkLW5vZGVncm91cC0xLTIwMjUxMDA2MTIzNjM5NjYzOTAwMDAwMDMxLGVrcy5hbWF6b25hd3MuY29tL3NvdXJjZUxhdW5jaFRlbXBsYXRlSWQ9bHQtMGVkNjg2NmE0OTlhZjEwYmQiCgotLS8vLS0="
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-0dcfa5969f791ae3e"]
}

module "stackgen_82b0bc24-300c-5c69-9e4f-9f0b8f612817" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_821dccb7-3053-591f-97d1-f8ca7d79b0af.arn
  role       = module.stackgen_b85d53be-d3b0-59a3-be06-3738f279dfbc.name
}

module "stackgen_83ef55a0-3af2-5a69-9f47-44d0577e169e" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1a"
  cidr_block              = "172.31.0.0/20"
  map_public_ip_on_launch = true
  tags                    = {}
  vpc_id                  = module.stackgen_d25a6d89-d552-5559-bfac-46df4f389650.id
}

module "stackgen_8425b148-f561-5706-8254-5e2db8b7d126" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_8bac6f88-fc0d-561d-a62a-1b8f366097f1.arn
  role       = module.stackgen_68fab510-14be-56bb-bd3f-4d912fe92d4d.name
}

module "stackgen_846b7977-3a44-5d56-8fdb-16938e189e3d" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "ett6qhkrbxfjheyjfeuzc3oegkhso5da._domainkey.main.dev.appcd.io"
  records                          = ["ett6qhkrbxfjheyjfeuzc3oegkhso5da.dkim.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 1800
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_84b43203-1078-5fea-a3ff-f53ece86bd95" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSEC2SpotServiceRolePolicy"
  role       = module.stackgen_142e8be8-7837-540f-8e3f-0601d580ad48.name
}

module "stackgen_85224949-0df9-5a21-a176-df60cdff8e24" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCostAndUsageReportAutomationPolicy"
  role       = module.stackgen_71761eff-46ba-5dfd-bf6e-44191a4ed3fd.name
}

module "stackgen_852f1f74-b8ef-5a00-a947-ae5d4565233f" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Sid\":\"EKSNodeAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = "EKS managed node group IAM role"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "m7g_node-eks-node-group-20240313011648168700000001"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    appcd_module  = "vpc"
    maintained_by = "support@appcd.com"
  }
}

module "stackgen_85437f7a-06a5-501d-adbe-446f436dfcf6" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_c02144a3-6663-5440-85eb-fb26a6eea9ee.arn
  role       = module.stackgen_bd78c59d-999a-5acc-a3bf-d6679092d709.name
}

module "stackgen_8637f17c-57e6-5d80-8442-9643ff95e83c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_e7c96bfb-2406-59db-80d4-2a5801d1a145.arn
  role       = module.stackgen_1e03b169-771b-5ab5-8d09-0cabb903a156.name
}

module "stackgen_86878c39-cc26-4860-9b47-a9aeab593738" {
  source                     = "./modules/aws_lb"
  access_logs                = []
  enable_deletion_protection = false
  enable_http2               = true
  internal                   = false
  load_balancer_type         = "application"
  name                       = null
  security_groups            = null
  subnets                    = null
  tags                       = {}
}

module "stackgen_868f0c4e-1de6-5be3-9031-ceb3ff80b958" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "e5zxkjxq5ytlwelji36nw77xzhhwzbf3._domainkey.unstable.dev.stackgen.com"
  records                          = ["e5zxkjxq5ytlwelji36nw77xzhhwzbf3.dkim.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 1800
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_869ae5d8-e650-580f-8df2-bab170518161" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = module.stackgen_d0cacf81-26e2-57f9-88f1-3d4e2125fbed.name
}

module "stackgen_86e1c982-0c23-507e-b13c-8a0ef693a303" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "ff3kghturp4wnf6f5oan44sugamu4s3s._domainkey.unstable.dev.stackgen.com"
  records                          = ["ff3kghturp4wnf6f5oan44sugamu4s3s.dkim.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 1800
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_8744aa8f-5357-5e89-8a72-76dddadab10f" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "AWSLambdaBasicExecutionRole-4e080415-64c2-42e0-8481-b2436643ca76"
  path        = "/service-role/"
  policy      = "{\"Statement\":[{\"Action\":\"logs:CreateLogGroup\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:logs:us-west-2:339712749745:*\"},{\"Action\":[\"logs:CreateLogStream\",\"logs:PutLogEvents\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:logs:us-west-2:339712749745:log-group:/aws/lambda/BasicAuthEdgeFunction:*\"]}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_8793dd33-64ac-5cc6-b6d1-bc11596cdc46" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSLambdaReplicator"
  role       = module.stackgen_f0ce5767-0f96-5d02-b24d-edea88e881c4.name
}

module "stackgen_87aac8e5-6f2c-5502-9586-3529ae419046" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "KarpenterControllerPolicy-developer-eks"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"ec2:RunInstances\",\"ec2:CreateFleet\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:ec2:us-west-2::image/*\",\"arn:aws:ec2:us-west-2::snapshot/*\",\"arn:aws:ec2:us-west-2:*:security-group/*\",\"arn:aws:ec2:us-west-2:*:subnet/*\"],\"Sid\":\"AllowScopedEC2InstanceAccessActions\"},{\"Action\":[\"ec2:RunInstances\",\"ec2:CreateFleet\"],\"Condition\":{\"StringEquals\":{\"aws:ResourceTag/kubernetes.io/cluster/developer-eks\":\"owned\"},\"StringLike\":{\"aws:ResourceTag/karpenter.sh/nodepool\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ec2:us-west-2:*:launch-template/*\",\"Sid\":\"AllowScopedEC2LaunchTemplateAccessActions\"},{\"Action\":[\"ec2:RunInstances\",\"ec2:CreateFleet\",\"ec2:CreateLaunchTemplate\"],\"Condition\":{\"StringEquals\":{\"aws:RequestTag/eks:eks-cluster-name\":\"developer-eks\",\"aws:RequestTag/kubernetes.io/cluster/developer-eks\":\"owned\"},\"StringLike\":{\"aws:RequestTag/karpenter.sh/nodepool\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:ec2:us-west-2:*:fleet/*\",\"arn:aws:ec2:us-west-2:*:instance/*\",\"arn:aws:ec2:us-west-2:*:volume/*\",\"arn:aws:ec2:us-west-2:*:network-interface/*\",\"arn:aws:ec2:us-west-2:*:launch-template/*\",\"arn:aws:ec2:us-west-2:*:spot-instances-request/*\"],\"Sid\":\"AllowScopedEC2InstanceActionsWithTags\"},{\"Action\":\"ec2:CreateTags\",\"Condition\":{\"StringEquals\":{\"aws:RequestTag/eks:eks-cluster-name\":\"developer-eks\",\"aws:RequestTag/kubernetes.io/cluster/developer-eks\":\"owned\",\"ec2:CreateAction\":[\"RunInstances\",\"CreateFleet\",\"CreateLaunchTemplate\"]},\"StringLike\":{\"aws:RequestTag/karpenter.sh/nodepool\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:ec2:us-west-2:*:fleet/*\",\"arn:aws:ec2:us-west-2:*:instance/*\",\"arn:aws:ec2:us-west-2:*:volume/*\",\"arn:aws:ec2:us-west-2:*:network-interface/*\",\"arn:aws:ec2:us-west-2:*:launch-template/*\",\"arn:aws:ec2:us-west-2:*:spot-instances-request/*\"],\"Sid\":\"AllowScopedResourceCreationTagging\"},{\"Action\":\"ec2:CreateTags\",\"Condition\":{\"ForAllValues:StringEquals\":{\"aws:TagKeys\":[\"eks:eks-cluster-name\",\"karpenter.sh/nodeclaim\",\"Name\"]},\"StringEquals\":{\"aws:ResourceTag/kubernetes.io/cluster/developer-eks\":\"owned\"},\"StringEqualsIfExists\":{\"aws:RequestTag/eks:eks-cluster-name\":\"developer-eks\"},\"StringLike\":{\"aws:ResourceTag/karpenter.sh/nodepool\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ec2:us-west-2:*:instance/*\",\"Sid\":\"AllowScopedResourceTagging\"},{\"Action\":[\"ec2:TerminateInstances\",\"ec2:DeleteLaunchTemplate\"],\"Condition\":{\"StringEquals\":{\"aws:ResourceTag/kubernetes.io/cluster/developer-eks\":\"owned\"},\"StringLike\":{\"aws:ResourceTag/karpenter.sh/nodepool\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:ec2:us-west-2:*:instance/*\",\"arn:aws:ec2:us-west-2:*:launch-template/*\"],\"Sid\":\"AllowScopedDeletion\"},{\"Action\":[\"ec2:DescribeAvailabilityZones\",\"ec2:DescribeImages\",\"ec2:DescribeInstances\",\"ec2:DescribeInstanceTypeOfferings\",\"ec2:DescribeInstanceTypes\",\"ec2:DescribeLaunchTemplates\",\"ec2:DescribeSecurityGroups\",\"ec2:DescribeSpotPriceHistory\",\"ec2:DescribeSubnets\"],\"Condition\":{\"StringEquals\":{\"aws:RequestedRegion\":\"us-west-2\"}},\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"AllowRegionalReadActions\"},{\"Action\":\"ssm:GetParameter\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ssm:us-west-2::parameter/aws/service/*\",\"Sid\":\"AllowSSMReadActions\"},{\"Action\":\"pricing:GetProducts\",\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"AllowPricingReadActions\"},{\"Action\":[\"sqs:DeleteMessage\",\"sqs:GetQueueUrl\",\"sqs:ReceiveMessage\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:sqs:us-west-2:339712749745:developer-eks\",\"Sid\":\"AllowInterruptionQueueActions\"},{\"Action\":\"iam:PassRole\",\"Condition\":{\"StringEquals\":{\"iam:PassedToService\":\"ec2.amazonaws.com\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::339712749745:role/KarpenterNodeRole-developer-eks\",\"Sid\":\"AllowPassingInstanceRole\"},{\"Action\":[\"iam:CreateInstanceProfile\"],\"Condition\":{\"StringEquals\":{\"aws:RequestTag/eks:eks-cluster-name\":\"developer-eks\",\"aws:RequestTag/kubernetes.io/cluster/developer-eks\":\"owned\",\"aws:RequestTag/topology.kubernetes.io/region\":\"us-west-2\"},\"StringLike\":{\"aws:RequestTag/karpenter.k8s.aws/ec2nodeclass\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::339712749745:instance-profile/*\",\"Sid\":\"AllowScopedInstanceProfileCreationActions\"},{\"Action\":[\"iam:TagInstanceProfile\"],\"Condition\":{\"StringEquals\":{\"aws:RequestTag/eks:eks-cluster-name\":\"developer-eks\",\"aws:RequestTag/kubernetes.io/cluster/developer-eks\":\"owned\",\"aws:RequestTag/topology.kubernetes.io/region\":\"us-west-2\",\"aws:ResourceTag/kubernetes.io/cluster/developer-eks\":\"owned\",\"aws:ResourceTag/topology.kubernetes.io/region\":\"us-west-2\"},\"StringLike\":{\"aws:RequestTag/karpenter.k8s.aws/ec2nodeclass\":\"*\",\"aws:ResourceTag/karpenter.k8s.aws/ec2nodeclass\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::339712749745:instance-profile/*\",\"Sid\":\"AllowScopedInstanceProfileTagActions\"},{\"Action\":[\"iam:AddRoleToInstanceProfile\",\"iam:RemoveRoleFromInstanceProfile\",\"iam:DeleteInstanceProfile\"],\"Condition\":{\"StringEquals\":{\"aws:ResourceTag/kubernetes.io/cluster/developer-eks\":\"owned\",\"aws:ResourceTag/topology.kubernetes.io/region\":\"us-west-2\"},\"StringLike\":{\"aws:ResourceTag/karpenter.k8s.aws/ec2nodeclass\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::339712749745:instance-profile/*\",\"Sid\":\"AllowScopedInstanceProfileActions\"},{\"Action\":\"iam:GetInstanceProfile\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::339712749745:instance-profile/*\",\"Sid\":\"AllowInstanceProfileReadActions\"},{\"Action\":\"eks:DescribeCluster\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:eks:us-west-2:339712749745:cluster/developer-eks\",\"Sid\":\"AllowAPIServerEndpointDiscovery\"}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_87aeebfb-cdb6-5bd1-a103-1c52ed3540dd" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_431f316b-b29f-5c1b-a684-6d5269159edf.name
}

module "stackgen_880be9b2-8513-53d7-94ad-0d769b00d2e4" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"eks.amazonaws.com\"},\"Sid\":\"EKSClusterAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "developer-eks-cluster"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:CreateLogGroup\"],\"Effect\":\"Deny\",\"Resource\":\"*\"}]}"
  }]
  max_session_duration = 3600
  name                 = "developer-eks-cluster-20240212072451812100000002"
  path                 = "/"
  permissions_boundary = ""
  tags = {
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_885d0e1a-e23a-5c1a-b36a-9f50ae1b1397" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"sts:ExternalId\":\"dnI8rfxvV73tHlgT\"}},\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::584974133937:role/stackgen-system\"},\"Sid\":\"AllowAssumeRoleWithExternalId\"},{\"Action\":\"sts:TagSession\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::584974133937:role/stackgen-system\"},\"Sid\":\"AllowTagSession\"}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "s3-bucket-metadata-access"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:ListAllMyBuckets\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"ListBuckets\"},{\"Action\":[\"s3:GetBucketLocation\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"GetBucketLocations\"}]}"
  }]
  max_session_duration = 3600
  name                 = "sample-customer-role"
  path                 = "/"
  permissions_boundary = ""
  tags                 = {}
}

module "stackgen_88aaad31-f131-4b4f-a4d4-a05681d3ab9e" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = null
  map_public_ip_on_launch = false
  tags                    = {}
  vpc_id                  = module.stackgen_151b221b-a95a-4244-94d5-a8d51e5f5a45.vpc_id
}

module "stackgen_89a903a1-6ed6-5594-9d6d-1142b6e8a69d" {
  source                             = "./modules/aws_launch_template"
  block_device_mappings              = []
  capacity_reservation_specification = []
  cpu_options                        = []
  credit_specification               = []
  default_version                    = 1
  description                        = ""
  disable_api_termination            = false
  ebs_optimized                      = ""
  elastic_gpu_specifications         = []
  elastic_inference_accelerator      = []
  enclave_options                    = []
  hibernation_options                = []
  iam_instance_profile = [{
    arn  = ""
    name = "eks-86ccdcc3-1183-e049-47ec-0db98d33dbc7"
  }]
  image_id                             = "ami-0372948d8ff019232"
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
    instance_metadata_tags      = "disabled"
  }]
  monitoring = [{
    enabled = true
  }]
  name                     = "eks-86ccdcc3-1183-e049-47ec-0db98d33dbc7"
  network_interfaces       = []
  placement                = []
  private_dns_name_options = []
  ram_disk_id              = ""
  security_group_names     = []
  tag_specifications = [{
    resource_type = "volume"
    tags = {
      Name                 = "managed-nodegroup-1"
      created-by           = "retail-store-sample-app"
      "eks:cluster-name"   = "retail-store"
      "eks:nodegroup-name" = "managed-nodegroup-1-20251006123639663900000031"
      environment-name     = "retail-store"
    }
    }, {
    resource_type = "instance"
    tags = {
      Name                 = "managed-nodegroup-1"
      created-by           = "retail-store-sample-app"
      "eks:cluster-name"   = "retail-store"
      "eks:nodegroup-name" = "managed-nodegroup-1-20251006123639663900000031"
      environment-name     = "retail-store"
    }
    }, {
    resource_type = "network-interface"
    tags = {
      Name                 = "managed-nodegroup-1"
      created-by           = "retail-store-sample-app"
      "eks:cluster-name"   = "retail-store"
      "eks:nodegroup-name" = "managed-nodegroup-1-20251006123639663900000031"
      environment-name     = "retail-store"
    }
  }]
  tags = {
    "eks:cluster-name"   = "retail-store"
    "eks:nodegroup-name" = "managed-nodegroup-1-20251006123639663900000031"
  }
  update_default_version = null
  user_data              = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiBhcHBsaWNhdGlvbi9ub2RlLmVrcy5hd3MKCi0tLQphcGlWZXJzaW9uOiBub2RlLmVrcy5hd3MvdjFhbHBoYTEKa2luZDogTm9kZUNvbmZpZwpzcGVjOgogIGNsdXN0ZXI6CiAgICBhcGlTZXJ2ZXJFbmRwb2ludDogaHR0cHM6Ly9GM0Y0OTBCMEJGMTEyNUM0MjU1ODVFMjM3NkFBMDIyMC5ncjcudXMtZWFzdC0xLmVrcy5hbWF6b25hd3MuY29tCiAgICBjZXJ0aWZpY2F0ZUF1dGhvcml0eTogTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUkNWRU5EUVdVeVowRjNTVUpCWjBsSlNVWjJjREo0Y2xGdlpWbDNSRkZaU2t0dldrbG9kbU5PUVZGRlRFSlJRWGRHVkVWVVRVSkZSMEV4VlVVS1FYaE5TMkV6Vm1sYVdFcDFXbGhTYkdONlFXVkdkekI1VGxSRmQwMUVXWGhOYWtrelRWUlNZVVozTUhwT1ZFVjNUVVJSZUUxcVRYbE5WRkpoVFVKVmVBcEZla0ZTUW1kT1ZrSkJUVlJEYlhReFdXMVdlV0p0VmpCYVdFMTNaMmRGYVUxQk1FZERVM0ZIVTBsaU0wUlJSVUpCVVZWQlFUUkpRa1IzUVhkblowVkxDa0Z2U1VKQlVVUm9ka280UzNZeVVVbHZWMDVuV1cwelMwaFNNbkZqZFhwREszbHliVUV4VFZKNk9XWjROV1p0VG5GQlQzWnZjVFJ4UXpJMlIwZG1kMHdLZEVGVVZsZGhMelpuZDJOSmIyMW5iRlpPUkVoRGN6ZFNWemRtVmtzdmNGcGFNblJyVkZsdmVrRnJRV28zYUZZMVV6ZEtaRE5NUlhkTGNWbEVOMDlIY1FwSFRHTXJkVmh6WVRkUmExWjFjRzFJV1hkTFJ6TnVXazFEV0VKb2RpOXRjbFJpVW5CNlNHRlVVVEk1ZG1GVFpreHBiVGhVWkUxdVFsUmxLemRhT1c0NENsY3hSMFpaVlZCS1JIb3dWbmh4UWxCbU5ITXlTV2N4YTNoSVFuWmFhWHBJYVcxb016VlNPRlpaWmpGUWJFVkNVVzVOVkRWeFltVlhUa3RLTTB0V2JHTUtNQ3RuV1VwVVozQnNUekJGWVRKVWRsbEVRV2xQTVcxck4zTmlWazlRVjJOU1F5dEhUM0pVTUZvM2FWY3dTemwyYkZrM1VGZHlRa3AwZG1wd05VWlJiQXA0YlZNMlZ6VmFUMmtyWkVVNFZGcDBaVmR5TjFFMGRHMUVjRmQwUVdkTlFrRkJSMnBYVkVKWVRVRTBSMEV4VldSRWQwVkNMM2RSUlVGM1NVTndSRUZRQ2tKblRsWklVazFDUVdZNFJVSlVRVVJCVVVndlRVSXdSMEV4VldSRVoxRlhRa0pSWjNOdlQxSTFOVEJCUVV4UlkwWkJNalYzTUVWblJHZGlkV3hVUVZZS1FtZE9Wa2hTUlVWRWFrRk5aMmR3Y21SWFNteGpiVFZzWkVkV2VrMUJNRWREVTNGSFUwbGlNMFJSUlVKRGQxVkJRVFJKUWtGUlFsWXdZakJLVTBaeVR3cEtlSEYzTVc5RlQwRndkMFZ6UkdKSVlYb3hVMlYyTHpSRlpFRjFZbEZqTjBWWk4xbzVZVkpoTjBoU016TXdZWFUwTlc4eldFbHlkSE12WTJsQ0sybHJDbEJQYVVOTWFVSlZibFpYV1ROSWRXTTBMekVyZW5BNWJXZDBiSEZETVVRcmFtYzNVSE56ZUhoVlpXSlpRVEUxVVU5NkwyTlVNMVF5YkhwNmJGSTRUWE1LYkVSUmEweExVRlJ5TTAwd01VUXZSWFJaYzJaVVowYzRZalJqUkZabmNuTlFkamRIVDBWUmVHeENNa2RIYUU5ck1ESXlORlJIT0c0MVpYUTVOa1pEWVFwdU5FZ3ZLMGt5YlZCRmVuRXdkMkpRZGtOak9YTjBWekp5ZDJGMFF6WlpXRWhwYmtkNk5EUkdhams1ZUdoQ1VqSlZRbWhSZEdKU01YWktTMFZDYUdJdkNqaEdNV0kxVGxCb1ZVazFSeTlpZUUxdFJFWkdiR1JGUVZCb05XZEpaemh2YlU4d2VVdEhTUzlYVW5CaE0zSkJiU3RXYjNGdE15dDNkbmRRTlZoVVVEa0tkVGRCUlhWeGVVdzNla05wQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLCiAgICBjaWRyOiAxNzIuMjAuMC4wLzE2CiAgICBuYW1lOiByZXRhaWwtc3RvcmUKICBrdWJlbGV0OgogICAgY29uZmlnOgogICAgICBtYXhQb2RzOiAyOQogICAgICBjbHVzdGVyRE5TOgogICAgICAtIDE3Mi4yMC4wLjEwCiAgICBmbGFnczoKICAgIC0gIi0tbm9kZS1sYWJlbHM9ZWtzLmFtYXpvbmF3cy5jb20vc291cmNlTGF1bmNoVGVtcGxhdGVWZXJzaW9uPTEsZWtzLmFtYXpvbmF3cy5jb20vbm9kZWdyb3VwLWltYWdlPWFtaS0wMzcyOTQ4ZDhmZjAxOTIzMixla3MuYW1hem9uYXdzLmNvbS9jYXBhY2l0eVR5cGU9T05fREVNQU5ELGVrcy5hbWF6b25hd3MuY29tL25vZGVncm91cD1tYW5hZ2VkLW5vZGVncm91cC0xLTIwMjUxMDA2MTIzNjM5NjYzOTAwMDAwMDMxLGVrcy5hbWF6b25hd3MuY29tL3NvdXJjZUxhdW5jaFRlbXBsYXRlSWQ9bHQtMGVkNjg2NmE0OTlhZjEwYmQiCgotLS8vLS0="
  vpc_security_group_ids = [
    module.stackgen_fe56c635-6ab8-5e34-afad-bcaf895afc4b.id,
  ]
}

module "stackgen_89cd05b4-e14e-5cd6-a9c9-039047b88885" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_c252080d-87a2-54fe-8f43-5b725d327987.name
}

module "stackgen_8a485c86-4e69-53cf-bcef-8b4dd72adc41" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:sts::339712749745:assumed-role/stackgen-system-access/stackgen-access-20251001213302\"},\"Sid\":\"AssumeRolePermission\"}],\"Version\":\"2012-10-17\"}"
  description           = "Role for appstack deployment: e2e test "
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "stackgen-managed-ace8b08b-c4be-400c-8116-78af49a3072a"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created-on           = "2025-10-01T21:33:02Z"
    stackgen-appstack-id = "ace8b08b-c4be-400c-8116-78af49a3072a"
    stackgen-deploy-id   = "f7ba32c3-39d3-41cc-84ee-86ee41279b2c"
    stackgen-managed     = "true"
    stackgen-reason      = "e2e test"
  }
}

module "stackgen_8b418d26-8f2b-5703-8fe5-a26cfe6ea023" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "support.playground.dev.appcd.io"
  records                          = ["10 feedback-smtp.us-west-2.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 300
  type                             = "MX"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_8b667ba9-affa-5d86-a018-c1fc6fd2a6d9" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "S3AccessPolicy"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:GetObject\",\"s3:PutObject\",\"s3:ListBucket\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::newbucket-name\",\"arn:aws:s3:::newbucket-name/*\"]}]}"
  }]
  max_session_duration = 3600
  name                 = "OpsVerseS3Role"
  path                 = "/"
  permissions_boundary = ""
  tags                 = {}
}

module "stackgen_8ba7bc86-0ef4-5916-89fa-71cf90023218" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonElasticFileSystemServiceRolePolicy"
  role       = module.stackgen_c878a175-e16e-5cd1-946f-5fca170f34fc.name
}

module "stackgen_8bab4adf-2395-5e3e-b532-76e25e29c5dd" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = module.stackgen_431f316b-b29f-5c1b-a684-6d5269159edf.name
}

module "stackgen_8bac6f88-fc0d-561d-a62a-1b8f366097f1" {
  source      = "./modules/aws_iam_policy"
  description = "IAM policy for Loki pods to access S3 bucket"
  name        = "tooling-dev-eks-loki-pod-permissions"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"s3:GetObject\",\"s3:PutObject\",\"s3:DeleteObject\",\"s3:ListBucket\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::devopsnow-loki-stackgen/*\"]},{\"Action\":[\"s3:ListBucket\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::devopsnow-loki-stackgen\"]},{\"Action\":[\"tag:GetResources\",\"cloudwatch:GetMetricData\",\"cloudwatch:GetMetricStatistics\",\"cloudwatch:ListMetrics\"],\"Effect\":\"Allow\",\"Resource\":[\"*\"]}],\"Version\":\"2012-10-17\"}"
  tags = {
    ClusterName = "tooling-dev-eks"
    Environment = "opsverse-cluster"
    GeneratedBy = "OpsVerse"
    Name        = "tooling-dev-eks-loki-pod-permissions"
  }
}

module "stackgen_8befba9b-e145-5e71-94e9-f5845cc38d44" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "tooling-dev-eks-cluster-20250710112706549600000001"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"ec2:RunInstances\",\"ec2:CreateLaunchTemplate\",\"ec2:CreateFleet\"],\"Condition\":{\"StringEquals\":{\"aws:RequestTag/eks:eks-cluster-name\":\"$$${aws:PrincipalTag/eks:eks-cluster-name}\"},\"StringLike\":{\"aws:RequestTag/eks:kubernetes-node-class-name\":\"*\",\"aws:RequestTag/eks:kubernetes-node-pool-name\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"Compute\"},{\"Action\":[\"ec2:CreateVolume\",\"ec2:CreateSnapshot\"],\"Condition\":{\"StringEquals\":{\"aws:RequestTag/eks:eks-cluster-name\":\"$$${aws:PrincipalTag/eks:eks-cluster-name}\"}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:ec2:*:*:volume/*\",\"arn:aws:ec2:*:*:snapshot/*\"],\"Sid\":\"Storage\"},{\"Action\":\"ec2:CreateNetworkInterface\",\"Condition\":{\"StringEquals\":{\"aws:RequestTag/eks:eks-cluster-name\":\"$$${aws:PrincipalTag/eks:eks-cluster-name}\",\"aws:RequestTag/eks:kubernetes-cni-node-name\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"Networking\"},{\"Action\":[\"elasticloadbalancing:CreateTargetGroup\",\"elasticloadbalancing:CreateRule\",\"elasticloadbalancing:CreateLoadBalancer\",\"elasticloadbalancing:CreateListener\",\"ec2:CreateSecurityGroup\"],\"Condition\":{\"StringEquals\":{\"aws:RequestTag/eks:eks-cluster-name\":\"$$${aws:PrincipalTag/eks:eks-cluster-name}\"}},\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"LoadBalancer\"},{\"Action\":\"shield:CreateProtection\",\"Condition\":{\"StringEquals\":{\"aws:RequestTag/eks:eks-cluster-name\":\"$$${aws:PrincipalTag/eks:eks-cluster-name}\"}},\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"ShieldProtection\"},{\"Action\":\"shield:TagResource\",\"Condition\":{\"StringEquals\":{\"aws:RequestTag/eks:eks-cluster-name\":\"$$${aws:PrincipalTag/eks:eks-cluster-name}\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:shield::*:protection/*\",\"Sid\":\"ShieldTagResource\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    appcd_module  = "vpc"
    created_for   = "tooling-dev"
    maintained_by = "support@stackgen.com"
  }
}

module "stackgen_8bf61111-b0a2-5681-9518-97b6ee193bcb" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_93b469d0-02d7-50d7-9f31-1129f0604334.arn
  role       = module.stackgen_c12c01d9-437e-5f17-8c34-c2a056beb229.name
}

module "stackgen_8c1519c9-e471-5556-9c62-07a9994c6751" {
  source      = "./modules/aws_iam_group_policy"
  group       = module.stackgen_cb82488e-2109-57d0-ba1a-bc88ea971116.name
  name        = "AmazonSesSendingAccess"
  name_prefix = ""
  policy      = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"ses:SendRawEmail\",\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
}

module "stackgen_8c4abce1-cf71-52f6-beda-6b3960efbf55" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_1f7e3335-0725-52e8-b57a-6b84a291428b.arn
  role       = module.stackgen_3501c599-f36e-52d3-9034-4d49b358c453.name
}

module "stackgen_8c5902de-84f2-586e-a0c6-bffa37f6baa4" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-ingressn-ingressn-efb5f6ecf7-a04f395ff369e7c5.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "sks.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_8ca3cc07-e413-4b82-8302-9b12e514418f" {
  source                             = "./modules/aws_nat_gateway"
  allocation_id                      = null
  connectivity_type                  = null
  private_ip                         = null
  secondary_allocation_ids           = null
  secondary_private_ip_address_count = null
  secondary_private_ip_addresses     = null
  subnet_id                          = null
  tags                               = null
  timeouts                           = null
}

module "stackgen_8cd53073-c798-5abc-92bd-59948d47b97e" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_45fa43be-0891-5826-bb45-eb78c1ce2392.arn
  role       = module.stackgen_3ff676f1-566e-5d08-9f05-63c40b5b40de.name
}

module "stackgen_8d35d9ee-7761-5265-9706-ce4ee9b15266" {
  source                          = "./modules/aws_cloudfront_distribution"
  aliases                         = []
  comment                         = null
  continuous_deployment_policy_id = ""
  custom_error_response           = []
  default_cache_behavior = [{
    allowed_methods           = ["GET", "HEAD"]
    cache_policy_id           = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    cached_methods            = ["GET", "HEAD"]
    compress                  = true
    default_ttl               = 0
    field_level_encryption_id = ""
    forwarded_values          = []
    function_association      = []
    grpc_config = [{
      enabled = false
    }]
    lambda_function_association = []
    max_ttl                     = 0
    min_ttl                     = 0
    origin_request_policy_id    = ""
    realtime_log_config_arn     = ""
    response_headers_policy_id  = ""
    smooth_streaming            = false
    target_origin_id            = "devdocs.stackgen.com.s3.us-west-2.amazonaws.com"
    trusted_key_groups          = []
    trusted_signers             = []
    viewer_protocol_policy      = "allow-all"
  }]
  default_root_object    = ""
  enabled                = true
  http_version           = "http2"
  is_ipv6_enabled        = true
  logging_config         = []
  ordered_cache_behavior = []
  origin = [{
    connection_attempts      = 3
    connection_timeout       = 10
    custom_header            = []
    custom_origin_config     = []
    domain_name              = "devdocs.stackgen.com.s3.us-west-2.amazonaws.com"
    origin_access_control_id = ""
    origin_id                = "devdocs.stackgen.com.s3.us-west-2.amazonaws.com"
    origin_path              = ""
    origin_shield            = []
    s3_origin_config         = []
    vpc_origin_config        = []
  }]
  price_class = "PriceClass_All"
  restrictions = [{
    geo_restriction = [{
      locations        = []
      restriction_type = "none"
    }]
  }]
  staging = false
  tags    = {}
  viewer_certificate = [{
    acm_certificate_arn            = "arn:aws:acm:us-east-1:339712749745:certificate/d3389a2d-1171-43a7-843a-cded95a3bac7"
    cloudfront_default_certificate = false
    iam_certificate_id             = ""
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }]
  wait_for_deployment = true
  web_acl_id          = ""
}

module "stackgen_8d6553ab-fa65-503b-b9ad-3b8dda5a1b8b" {
  source      = "./modules/aws_vpc_endpoint"
  auto_accept = null
  dns_options = [{
    dns_record_ip_type                             = "ipv4"
    private_dns_only_for_inbound_resolver_endpoint = false
  }]
  ip_address_type     = "ipv4"
  policy              = "{\"Statement\":[{\"Action\":\"*\",\"Effect\":\"Allow\",\"Principal\":\"*\",\"Resource\":\"*\"}]}"
  private_dns_enabled = false
  route_table_ids     = []
  security_group_ids  = ["sg-04afc23c1b2c7c4ed"]
  service_name        = "com.amazonaws.vpce.us-east-1.vpce-svc-0e6e9b042dbcc6120"
  subnet_configuration = [{
    ipv4      = "10.0.10.177"
    ipv6      = ""
    subnet_id = "subnet-03075069b8559b824"
  }]
  subnet_ids = ["subnet-03075069b8559b824"]
  tags = {
    AMQManaged = "true"
    Broker     = "b-88aea692-4e64-4158-b755-ea53d1d5f365"
  }
  vpc_endpoint_type = "Interface"
  vpc_id            = "vpc-0c814e31af38fe08e"
}

module "stackgen_8d8913da-f6bc-55b9-943a-6d093cd7e3bc" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  role       = module.stackgen_2710af38-6089-5ea8-823c-aebe619b70b4.name
}

module "stackgen_8db1b774-3ed1-5592-89be-252ce3979e17" {
  source      = "./modules/aws_iam_policy"
  description = "Cluster encryption policy to allow cluster role to utilize CMK provided"
  name        = "engineering-eks-cluster-ClusterEncryption20240130212121737300000017"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"kms:Encrypt\",\"kms:Decrypt\",\"kms:ListGrants\",\"kms:DescribeKey\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:kms:us-west-2:339712749745:key/6dfcda2c-2195-4931-9dc7-de02dda63757\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_8ecd04ff-f092-5fcf-aad9-adb8e6e4856e" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "dualstack.k8s-signoz-signozin-55c5020bf4-428106674.us-west-2.elb.amazonaws.com"
    zone_id                = "Z1H1FL5HABSF5"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "meta.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_8f9a4fe1-407b-55db-8c30-cb1da6a55f89" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
  role       = module.stackgen_81255901-aa1e-59c6-b929-4259708fd6cb.name
}

module "stackgen_9008005d-74f6-56c8-b388-224c127c2188" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = module.stackgen_0bbb4566-02cc-56f9-8511-86f67013a661.name
}

module "stackgen_9020e3de-0e5b-50d5-9e25-09b80138d38c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = module.stackgen_c33f0deb-84a5-59d2-ad11-f54a80d445d0.name
}

module "stackgen_902abfea-24d8-5d88-81d1-f8e2b0f03be3" {
  source  = "./modules/aws_iam_access_key"
  pgp_key = null
  status  = "Active"
  user    = module.stackgen_9b516195-78a4-552e-b062-5bdddeecd86c.name
}

module "stackgen_90e0a16a-d7af-5226-93d8-b55d100651c9" {
  source         = "./modules/aws_iam_openid_connect_provider"
  client_id_list = ["sts.amazonaws.com"]
  tags = {
    "alpha.eksctl.io/cluster-name"   = "eks-tooling"
    "alpha.eksctl.io/eksctl-version" = "0.205.0-dev+9e5300e5a.2025-02-28T20:10:13Z"
  }
  thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280"]
  url             = "oidc.eks.us-west-2.amazonaws.com/id/436E20DEC59ECD543B5C986741FD9637"
}

module "stackgen_91c56e80-c94c-5985-a92e-1f8ed32285bc" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_4f95fc4a-48e7-5a49-9cbe-9cb173ff467a.arn
  role       = module.stackgen_063ea0e5-c6d6-5130-96e0-bb34b72c9509.name
}

module "stackgen_91cbfe66-56ff-5917-a50d-8737fa60f6fc" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1b"
  cidr_block              = "172.31.80.0/20"
  map_public_ip_on_launch = true
  tags                    = {}
  vpc_id                  = module.stackgen_d25a6d89-d552-5559-bfac-46df4f389650.id
}

module "stackgen_9246d5e0-f739-5639-9f19-a297a0bffd46" {
  source           = "./modules/aws_route53_resolver_rule_association"
  name             = "System Rule Association"
  resolver_rule_id = "rslvr-autodefined-rr-internet-resolver"
  vpc_id           = "vpc-0c814e31af38fe08e"
}

module "stackgen_925e3503-8b4f-53c6-b129-93f36d8de4e9" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"organizations.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Service-linked role used by AWS Organizations to enable integration of other AWS services with Organizations."
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForOrganizations"
  path                  = "/aws-service-role/organizations.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_927ecb03-73b9-598f-b3da-3f3bbe775e05" {
  source      = "./modules/aws_iam_policy"
  description = "IAM Policy for AWS Fluentbit"
  name        = "aws-for-fluent-bit-20240612185636692400000001"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":\"logs:PutLogEvents\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:logs:us-west-2:339712749745:log-group:*:log-stream:*\",\"Sid\":\"PutLogEvents\"},{\"Action\":[\"logs:PutRetentionPolicy\",\"logs:DescribeLogStreams\",\"logs:DescribeLogGroups\",\"logs:CreateLogStream\",\"logs:CreateLogGroup\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:logs:us-west-2:339712749745:log-group:*:*\",\"Sid\":\"CreateCWLogs\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    appcd_module  = "vpc"
    maintained_by = "support@appcd.com"
  }
}

module "stackgen_9372d15c-15d0-5cf1-8c59-9d1675121b15" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly"
  role       = module.stackgen_9a552737-152d-5c1c-8b60-276d3598af44.name
}

module "stackgen_93b469d0-02d7-50d7-9f31-1129f0604334" {
  source      = "./modules/aws_iam_policy"
  description = "IAM Policy for AWS Load Balancer Controller"
  name        = "alb-controller-20240212143602373900000003"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":\"iam:CreateServiceLinkedRole\",\"Condition\":{\"StringEquals\":{\"iam:AWSServiceName\":\"elasticloadbalancing.amazonaws.com\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:DescribeTrustStores\",\"elasticloadbalancing:DescribeTargetHealth\",\"elasticloadbalancing:DescribeTargetGroups\",\"elasticloadbalancing:DescribeTargetGroupAttributes\",\"elasticloadbalancing:DescribeTags\",\"elasticloadbalancing:DescribeSSLPolicies\",\"elasticloadbalancing:DescribeRules\",\"elasticloadbalancing:DescribeLoadBalancers\",\"elasticloadbalancing:DescribeLoadBalancerAttributes\",\"elasticloadbalancing:DescribeListeners\",\"elasticloadbalancing:DescribeListenerCertificates\",\"elasticloadbalancing:DescribeListenerAttributes\",\"elasticloadbalancing:DescribeCapacityReservation\",\"ec2:GetSecurityGroupsForVpc\",\"ec2:GetCoipPoolUsage\",\"ec2:DescribeVpcs\",\"ec2:DescribeVpcPeeringConnections\",\"ec2:DescribeTags\",\"ec2:DescribeSubnets\",\"ec2:DescribeSecurityGroups\",\"ec2:DescribeNetworkInterfaces\",\"ec2:DescribeIpamPools\",\"ec2:DescribeInternetGateways\",\"ec2:DescribeInstances\",\"ec2:DescribeCoipPools\",\"ec2:DescribeAvailabilityZones\",\"ec2:DescribeAddresses\",\"ec2:DescribeAccountAttributes\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"wafv2:GetWebACLForResource\",\"wafv2:GetWebACL\",\"wafv2:DisassociateWebACL\",\"wafv2:AssociateWebACL\",\"waf-regional:GetWebACLForResource\",\"waf-regional:GetWebACL\",\"waf-regional:DisassociateWebACL\",\"waf-regional:AssociateWebACL\",\"shield:GetSubscriptionState\",\"shield:DescribeProtection\",\"shield:DeleteProtection\",\"shield:CreateProtection\",\"iam:ListServerCertificates\",\"iam:GetServerCertificate\",\"cognito-idp:DescribeUserPoolClient\",\"acm:ListCertificates\",\"acm:DescribeCertificate\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ec2:RevokeSecurityGroupIngress\",\"ec2:AuthorizeSecurityGroupIngress\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ec2:CreateSecurityGroup\",\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ec2:CreateTags\",\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"false\"},\"StringEquals\":{\"ec2:CreateAction\":\"CreateSecurityGroup\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ec2:*:*:security-group/*\"},{\"Action\":[\"ec2:DeleteTags\",\"ec2:CreateTags\"],\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"true\",\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ec2:*:*:security-group/*\"},{\"Action\":[\"ec2:RevokeSecurityGroupIngress\",\"ec2:DeleteSecurityGroup\",\"ec2:AuthorizeSecurityGroupIngress\"],\"Condition\":{\"Null\":{\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:CreateTargetGroup\",\"elasticloadbalancing:CreateLoadBalancer\"],\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:DeleteRule\",\"elasticloadbalancing:DeleteListener\",\"elasticloadbalancing:CreateRule\",\"elasticloadbalancing:CreateListener\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:RemoveTags\",\"elasticloadbalancing:AddTags\"],\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"true\",\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*\"]},{\"Action\":[\"elasticloadbalancing:RemoveTags\",\"elasticloadbalancing:AddTags\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:elasticloadbalancing:*:*:listener/net/*/*/*\",\"arn:aws:elasticloadbalancing:*:*:listener/app/*/*/*\",\"arn:aws:elasticloadbalancing:*:*:listener-rule/net/*/*/*\",\"arn:aws:elasticloadbalancing:*:*:listener-rule/app/*/*/*\"]},{\"Action\":[\"elasticloadbalancing:SetSubnets\",\"elasticloadbalancing:SetSecurityGroups\",\"elasticloadbalancing:SetIpAddressType\",\"elasticloadbalancing:ModifyTargetGroupAttributes\",\"elasticloadbalancing:ModifyTargetGroup\",\"elasticloadbalancing:ModifyLoadBalancerAttributes\",\"elasticloadbalancing:ModifyListenerAttributes\",\"elasticloadbalancing:ModifyIpPools\",\"elasticloadbalancing:ModifyCapacityReservation\",\"elasticloadbalancing:DeleteTargetGroup\",\"elasticloadbalancing:DeleteLoadBalancer\"],\"Condition\":{\"Null\":{\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"elasticloadbalancing:AddTags\",\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"false\"},\"StringEquals\":{\"elasticloadbalancing:CreateAction\":[\"CreateTargetGroup\",\"CreateLoadBalancer\"]}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*\"]},{\"Action\":[\"elasticloadbalancing:RegisterTargets\",\"elasticloadbalancing:DeregisterTargets\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\"},{\"Action\":[\"elasticloadbalancing:SetWebAcl\",\"elasticloadbalancing:SetRulePriorities\",\"elasticloadbalancing:RemoveListenerCertificates\",\"elasticloadbalancing:ModifyRule\",\"elasticloadbalancing:ModifyListener\",\"elasticloadbalancing:AddListenerCertificates\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_93c88de7-afe4-54f0-b352-0537dce4399a" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = module.stackgen_1f420006-7bc0-5d35-86e7-dfee34693398.name
}

module "stackgen_93c9150c-c40e-5bb3-9391-e861da8b8296" {
  source = "./modules/aws_athena_workgroup"
  configuration = [{
    bytes_scanned_cutoff_per_query  = 0
    enforce_workgroup_configuration = true
    engine_version = [{
      effective_engine_version = "Athena engine version 3"
      selected_engine_version  = "AUTO"
    }]
    execution_role                     = ""
    publish_cloudwatch_metrics_enabled = true
    requester_pays_enabled             = false
    result_configuration = [{
      acl_configuration        = []
      encryption_configuration = []
      expected_bucket_owner    = ""
      output_location          = "s3://cross-account-athena-data-as/athena-results/"
    }]
  }]
  description   = ""
  force_destroy = false
  name          = "dev-athena-workgroup"
  state         = "ENABLED"
  tags          = {}
}

module "stackgen_93e2e838-d1d8-55b2-b38d-2e7b60591bd2" {
  source      = "./modules/aws_iam_policy"
  description = "IAM Policy for cert-manager"
  name        = "cert-manager-20251006122337450400000006"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":\"route53:GetChange\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:route53:::change/*\"},{\"Action\":[\"route53:ListResourceRecordSets\",\"route53:ChangeResourceRecordSets\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:route53:::hostedzone/*\"},{\"Action\":\"route53:ListHostedZonesByName\",\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_93e98665-cbe7-53f4-a5db-8138d420e4c4" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSServiceRoleForAmazonEKSNodegroup"
  role       = module.stackgen_9d972170-fbc1-5a4d-878a-bea3bdb8e0c3.name
}

module "stackgen_942adef3-6c5e-50e9-a38e-fe17a8f993db" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSBlockStoragePolicy"
  role       = module.stackgen_e7da5ae7-3b7b-5af9-9bfc-dad2bc61c94c.name
}

module "stackgen_94ab6a88-da07-40fe-b2b3-4b15be4e2bbe" {
  source                             = "./modules/aws_rds_cluster"
  availability_zones                 = []
  backup_retention_period            = 9
  cluster_identifier                 = null
  copy_tags_to_snapshot              = false
  database_name                      = null
  db_subnet_group_name               = "default"
  enable_global_write_forwarding     = null
  enable_local_write_forwarding      = null
  enabled_cloudwatch_logs_exports    = null
  engine                             = null
  engine_mode                        = null
  engine_version                     = null
  global_cluster_identifier          = null
  kms_key_id                         = null
  master_password                    = var.master_password_94ab6a88-da07-40fe-b2b3-4b15be4e2bbe
  master_username                    = null
  preferred_backup_window            = "07:00-09:00"
  preferred_maintenance_window       = "sun:05:00-sun:06:00"
  scaling_configuration              = []
  serverlessv2_scaling_configuration = []
  skip_final_snapshot                = null
  storage_encrypted                  = true
  tags                               = {}
  vpc_security_group_ids = [
    module.stackgen_712f0693-28f2-4aa3-89b2-575b47fe1642.vpc_id,
  ]
}

module "stackgen_953dd234-8800-51bf-94ce-5e1cc1554708" {
  source    = "./modules/aws_iam_role_policy"
  name      = "ManageDeploymentPolicy"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"iam:CreateRole\",\"iam:TagRole\",\"iam:DeleteRolePolicy\",\"iam:DeleteRole\",\"iam:PutRolePolicy\",\"sts:AssumeRole\"],\"Condition\":{\"StringEquals\":{\"iam:ResourceTag/stackgen-managed\":\"true\"},\"StringLike\":{\"iam:ResourceTag/stackgen-reason\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:iam::339712749745:role/stackgen-managed-*\"]},{\"Action\":[\"sts:TagSession\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  role      = module.stackgen_39bfebdd-63ef-59cd-b072-69cc51c559b5.name
  role_type = "custom"
}

module "stackgen_95fe289f-4b06-5a22-a265-c137217dc078" {
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
  vpc_id = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_97d8ea2e-95d8-42ad-8e21-48e52aab0a2c" {
  source = "./modules/aws_internet_gateway"
  tags   = null
  vpc_id = module.stackgen_151b221b-a95a-4244-94d5-a8d51e5f5a45.vpc_id
}

module "stackgen_9809fc58-f655-5fe1-b186-12558279bab1" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_8befba9b-e145-5e71-94e9-f5845cc38d44.arn
  role       = module.stackgen_19ba4c86-7702-54c7-8442-00aafed0df71.name
}

module "stackgen_98276cbb-b812-55ec-bb7d-e4d853749c93" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/ElastiCacheServiceRolePolicy"
  role       = module.stackgen_c670c9c7-8f66-5fd6-9609-d0815ee84698.name
}

module "stackgen_984453ee-883f-5434-bacf-95de97e68779" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "KarpenterNodeRole-developer-ek"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_984ce959-d8e2-5054-9898-8381ea091297" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSResourceExplorerServiceRolePolicy"
  role       = module.stackgen_b958334b-a435-578d-a13f-74e5adc65726.name
}

module "stackgen_98730184-d7b8-583d-a0f8-ac37cc3ebfb2" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "alpha-email-sender"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":\"ses:SendRawEmail\",\"Condition\":{\"StringLike\":{\"ses:FromAddress\":\"*@support.main.dev.stackgen.com\"}},\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"SendEmail\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    namespace = "appcd-alpha"
    repo      = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_991256c6-2e15-5e62-93c9-e2c44e5a6741" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_582656da-e3ca-5e11-8e46-0b59dc55abc5.arn
  role       = module.stackgen_2d919c3d-0fec-55f6-8e0a-eb4a6a16cc6d.name
}

module "stackgen_9a15ec1a-f0a4-5250-bd5d-a9ca97b04296" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-nginxing-nginxing-5bcc97d528-8c5ddc36e39e5068.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "stackgen-observe.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_9a510222-2330-57c0-89cf-0a21f85e6a1d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSCloudFrontLogger"
  role       = module.stackgen_807c8600-579b-5116-a412-44b8451201a1.name
}

module "stackgen_9a552737-152d-5c1c-8b60-276d3598af44" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Allows EKS nodes to connect to EKS Auto Mode clusters and to pull container images from ECR."
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AmazonEKSAutoNodeRole"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_9a5ae475-0f2b-5c4c-b226-78151c7ec034" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_c252080d-87a2-54fe-8f43-5b725d327987.name
}

module "stackgen_9aa05b2b-f650-542f-b376-2b7123b70856" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "KarpenterNodeRole-developer-eks"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_9ab2bb8d-a66a-5baf-ba10-0e6de7745ce3" {
  source                          = "./modules/aws_cloudfront_distribution"
  aliases                         = ["main.dev.appcd.io"]
  comment                         = null
  continuous_deployment_policy_id = ""
  custom_error_response           = []
  default_cache_behavior = [{
    allowed_methods           = ["GET", "HEAD", "OPTIONS"]
    cache_policy_id           = ""
    cached_methods            = ["GET", "HEAD"]
    compress                  = true
    default_ttl               = 0
    field_level_encryption_id = ""
    forwarded_values = [{
      cookies = [{
        forward           = "none"
        whitelisted_names = []
      }]
      headers                 = []
      query_string            = false
      query_string_cache_keys = []
    }]
    function_association = []
    grpc_config = [{
      enabled = false
    }]
    lambda_function_association = []
    max_ttl                     = 0
    min_ttl                     = 0
    origin_request_policy_id    = ""
    realtime_log_config_arn     = ""
    response_headers_policy_id  = ""
    smooth_streaming            = false
    target_origin_id            = "main.dev.appcd.io.s3-website-us-west-2.amazonaws.com"
    trusted_key_groups          = []
    trusted_signers             = []
    viewer_protocol_policy      = "allow-all"
  }]
  default_root_object    = ""
  enabled                = true
  http_version           = "http2"
  is_ipv6_enabled        = true
  logging_config         = []
  ordered_cache_behavior = []
  origin = [{
    connection_attempts = 3
    connection_timeout  = 10
    custom_header       = []
    custom_origin_config = [{
      http_port                = 80
      https_port               = 443
      origin_keepalive_timeout = 5
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = 30
      origin_ssl_protocols     = ["SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"]
    }]
    domain_name              = "main.dev.appcd.io.s3-website-us-west-2.amazonaws.com"
    origin_access_control_id = ""
    origin_id                = "main.dev.appcd.io.s3-website-us-west-2.amazonaws.com"
    origin_path              = ""
    origin_shield            = []
    s3_origin_config         = []
    vpc_origin_config        = []
  }]
  price_class = "PriceClass_100"
  restrictions = [{
    geo_restriction = [{
      locations        = []
      restriction_type = "none"
    }]
  }]
  staging = false
  tags    = {}
  viewer_certificate = [{
    acm_certificate_arn            = "arn:aws:acm:us-east-1:339712749745:certificate/d3389a2d-1171-43a7-843a-cded95a3bac7"
    cloudfront_default_certificate = false
    iam_certificate_id             = ""
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }]
  wait_for_deployment = true
  web_acl_id          = ""
}

module "stackgen_9b287048-efb5-5544-8dbf-fa6e8e110210" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_e1663bb6-71af-552b-a2e5-12546d3dbe59.arn
  role       = module.stackgen_39e55b82-4fb2-5fda-bb49-7179d8021e87.name
}

module "stackgen_9b516195-78a4-552e-b062-5bdddeecd86c" {
  source               = "./modules/aws_iam_user"
  force_destroy        = null
  name                 = "ses-smtp-user.20240220-163610"
  path                 = "/"
  permissions_boundary = ""
  tags = {
    InvokedBy = "SESConsole"
  }
}

module "stackgen_9b8f5194-5de9-5790-ae90-f94929918b9d" {
  source      = "./modules/aws_db_subnet_group"
  description = "For Aurora cluster retail-store-catalog"
  name        = "retail-store-catalog"
  name_prefix = ""
  subnet_ids = [
    module.stackgen_9d425fc1-ba64-5441-a24a-bceed3c5fff0.id,
    module.stackgen_a4632096-f217-5670-8040-5afc23611f74.id,
    module.stackgen_a3505971-d83d-5873-a44c-5b6f1898daa8.id,
  ]
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_9c2e30ad-366d-4e9d-a3c9-29817dbed4be" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = null
  retention_in_days = 7
  tags              = {}
}

module "stackgen_9c5e2151-0f27-5e5b-b881-c15d4ba2ac6d" {
  source  = "./modules/aws_iam_access_key"
  pgp_key = null
  status  = "Active"
  user    = module.stackgen_9d5060b7-0540-52f4-9250-5e4e6b9b4bca.name
}

module "stackgen_9d425fc1-ba64-5441-a24a-bceed3c5fff0" {
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
  vpc_id = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_9d5060b7-0540-52f4-9250-5e4e6b9b4bca" {
  source               = "./modules/aws_iam_user"
  force_destroy        = null
  name                 = "ses-smtp-user-unstable"
  path                 = "/"
  permissions_boundary = ""
  tags = {
    namespace = "appcd-unstable"
    repo      = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_9d972170-fbc1-5a4d-878a-bea3bdb8e0c3" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"eks-nodegroup.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "This policy allows Amazon EKS to create and manage Nodegroups"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForAmazonEKSNodegroup"
  path                  = "/aws-service-role/eks-nodegroup.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_9db334f6-9d78-5cc1-b2c2-a026436062e5" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"monitoring.rds.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "terraform-20240212065107464800000005"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_9df7e731-1406-5b61-9a90-b3f86288dbf3" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSEC2SpotServiceRolePolicy"
  role       = module.stackgen_142e8be8-7837-540f-8e3f-0601d580ad48.name
}

module "stackgen_9e36abe7-5689-583e-ba39-a5eb63f23cf8" {
  source           = "./modules/aws_route53_resolver_rule_association"
  name             = "System Rule Association"
  resolver_rule_id = "rslvr-autodefined-rr-internet-resolver"
  vpc_id           = "vpc-0991a2c06be4a0332"
}

module "stackgen_9e49fbef-0a42-5fdd-8533-bc0f3d8c6695" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-ingressn-ingressn-efb5f6ecf7-a04f395ff369e7c5.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "getmyiac.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_9ea9d9c2-9bef-54b6-827b-134f067e940c" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/B2AF2CBCB3EF8145FAF788AA62E612A0:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/B2AF2CBCB3EF8145FAF788AA62E612A0:sub\":\"system:serviceaccount:kube-system:cluster-autoscaler-sa\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/B2AF2CBCB3EF8145FAF788AA62E612A0\"}}],\"Version\":\"2012-10-17\"}"
  description           = "IRSA for cluster-autoscaler operator"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "cluster-autoscaler-20240212014355980500000002"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_9f76075d-333a-5ebc-8e4f-25f1c9979fea" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "dualstack.k8s-stackgen-stackgen-02c9a93c0d-1126699637.us-west-2.elb.amazonaws.com"
    zone_id                = "Z1H1FL5HABSF5"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "otel-stackgen-observe.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_9fb13327-79f2-5079-827d-fb941f3fbed7" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSVPCTransitGatewayServiceRolePolicy"
  role       = module.stackgen_4d681287-9805-59ab-af1e-1eacd0bc6206.name
}

module "stackgen_a01b96e0-5419-58db-ae25-4028eeb95829" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":[\"sts:TagSession\",\"sts:AssumeRoleWithWebIdentity\"],\"Condition\":{\"StringEquals\":{\"oidc.eks.us-east-1.amazonaws.com/id/F3F490B0BF1125C425585E2376AA0220:sub\":\"system:serviceaccount:opentelemetry-operator-system:adot-col-otlp-ingest\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/F3F490B0BF1125C425585E2376AA0220\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "retail-store-adot-col-xray"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_a11a165c-c493-5db5-8474-9b8fe4ae24f0" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_19ba4c86-7702-54c7-8442-00aafed0df71.name
}

module "stackgen_a1c562be-e5d6-5185-85b8-2f094a4270d7" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "r3bztimd7xm7iys7emn2qmuogjdwpzvq._domainkey.main.dev.stackgen.com"
  records                          = ["r3bztimd7xm7iys7emn2qmuogjdwpzvq.dkim.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 1800
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_a1f28ae8-e1d8-5c0e-a080-65aa62ed2115" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/ComputeOptimizerServiceRolePolicy"
  role       = module.stackgen_afb7bd77-3073-5286-84cb-e995c9d380dc.name
}

module "stackgen_a2a58d8f-17e1-51e6-aa83-b4276e4b303d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSGlobalAcceleratorSLRPolicy"
  role       = module.stackgen_f63463b1-30b7-58b9-95a7-a669ed91bb38.name
}

module "stackgen_a2c27c10-4348-5a13-b4c2-e3ac10f93230" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_4bdadd44-ffe9-54f5-a02b-2dfccee7d6e5.name
}

module "stackgen_a2ee7e51-cba7-4ce4-a6af-dc954ca4b382" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = null
  map_public_ip_on_launch = false
  tags                    = {}
  vpc_id                  = module.stackgen_151b221b-a95a-4244-94d5-a8d51e5f5a45.vpc_id
}

module "stackgen_a318e764-d488-5f90-a50f-4ed849948b15" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = module.stackgen_71761eff-46ba-5dfd-bf6e-44191a4ed3fd.name
}

module "stackgen_a3505971-d83d-5873-a44c-5b6f1898daa8" {
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
  vpc_id = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_a35aa9b8-5884-5aaf-a493-7ebb093a9924" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "ClickHouseS3AccessPolicy"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"s3:ListBucket\",\"s3:GetObject\",\"s3:PutObject\",\"s3:DeleteObject\",\"s3:ListBucketMultipartUploads\",\"s3:AbortMultipartUpload\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::clickhouse-coldstorage-tooling-dev-eks\",\"arn:aws:s3:::clickhouse-coldstorage-tooling-dev-eks/*\"]}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_a39ea493-7123-5c60-b1db-27c6567144da" {
  source    = "./modules/aws_iam_role_policy"
  name      = "AllowAssumeToDemo"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::180217099948:role/test-cross-account-role\",\"Sid\":\"AllowAssume\"}]}"
  role      = module.stackgen_edadc593-6390-5f1f-a41f-a8ccd8000a75.name
  role_type = "custom"
}

module "stackgen_a40a9fe3-5a59-5270-94a0-de084b23604c" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "ea4epmzy3urc6lz7ztgbdk5cru4umfya._domainkey.main.dev.stackgen.com"
  records                          = ["ea4epmzy3urc6lz7ztgbdk5cru4umfya.dkim.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 1800
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_a4128955-9062-5117-a180-45076e2e83dd" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_e1663bb6-71af-552b-a2e5-12546d3dbe59.arn
  role       = module.stackgen_39e55b82-4fb2-5fda-bb49-7179d8021e87.name
}

module "stackgen_a4632096-f217-5670-8040-5afc23611f74" {
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
  vpc_id = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_a4671014-2800-5d03-9794-d5f6e915e895" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-ingressn-ingressn-efb5f6ecf7-a04f395ff369e7c5.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "redash.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_a4ba2bb5-18cb-54ca-836b-6d1095739881" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_d7bd5b7b-7e91-54b3-8b6d-747584caa04b.name
}

module "stackgen_a4d918bc-26d5-5723-8bb2-91a4fc13e4d8" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "sks-t2-eks_4067990795380418201"
  name_prefix = ""
  path        = "/"
  role        = null
  tags = {
    "karpenter.k8s.aws/ec2nodeclass"   = "default"
    "karpenter.sh/managed-by"          = "sks-t2-eks"
    "kubernetes.io/cluster/sks-t2-eks" = "owned"
    "topology.kubernetes.io/region"    = "us-west-2"
  }
}

module "stackgen_a4e01a22-fa43-53fe-9a31-69ff5feeef13" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_7e20a179-a540-505e-8b72-fc6e0f0fb730.arn
  role       = module.stackgen_157ea11a-4551-543c-bc17-bd08f4e83749.name
}

module "stackgen_a5785c3e-33cb-5850-9b62-2c83fd4c4d5c" {
  source               = "./modules/aws_iam_user"
  force_destroy        = null
  name                 = "terraform-cloud-deployer"
  path                 = "/"
  permissions_boundary = ""
  tags = {
    access_key_id = "used in terraform cloud variable set as a simple way to get access"
    creator       = "Sean Gahagan"
    usage         = "Terrafom cloud deployments"
  }
}

module "stackgen_a5ac0c6a-9304-58c4-83a4-c5a54887163e" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = module.stackgen_1e9854cc-9f50-50d5-9aab-b8eea9ef8cf9.name
}

module "stackgen_a7193de3-b5cc-5d0d-a146-bca2833bbd39" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_d7bd5b7b-7e91-54b3-8b6d-747584caa04b.name
}

module "stackgen_a7224fb9-2376-5c48-81b3-14324b0ca906" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"autoscaling.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Default Service-Linked Role enables access to AWS Services and Resources used or managed by Auto Scaling"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForAutoScaling"
  path                  = "/aws-service-role/autoscaling.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_a73bb139-3b6e-5238-893c-b822b06a2e06" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
  role       = module.stackgen_81255901-aa1e-59c6-b929-4259708fd6cb.name
}

module "stackgen_a78ad8a8-0049-567c-ad84-e3c83f4a8387" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"trustedadvisor.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Access for the AWS Trusted Advisor Service to help reduce cost, increase performance, and improve security of your AWS environment."
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForTrustedAdvisor"
  path                  = "/aws-service-role/trustedadvisor.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_a87ea9ab-bd1f-5503-bcd9-acfa64626030" {
  source         = "./modules/aws_iam_openid_connect_provider"
  client_id_list = ["sts.amazonaws.com"]
  tags = {
    Name          = "sks-t2-eks-eks-irsa"
    appcd_module  = "vpc"
    maintained_by = "support@appcd.com"
  }
  thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280"]
  url             = "oidc.eks.us-west-2.amazonaws.com/id/7155136752F60CAFFBFF6D38A2242E3E"
}

module "stackgen_a8c254fa-8f83-5d2a-9c04-86715af99c5f" {
  source    = "./modules/aws_iam_role_policy"
  name      = "topology-deployer"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"sts:GetCallerIdentity\",\"s3:PutBucketVersioning\",\"s3:PutBucketTagging\",\"s3:GetObject\",\"s3:GetBucketVersioning\",\"s3:CreateBucket\",\"kms:ListResourceTags\",\"s3:GetBucketPolicy\",\"kms:ListAliases\",\"kms:GetPublicKey\",\"kms:GetKeyRotationStatus\",\"kms:GetKeyPolicy\",\"kms:Encrypt\",\"kms:DescribeKey\",\"kms:CreateKey\",\"kms:CreateAlias\",\"s3:ListBucket\",\"s3:GetBucketAcl\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  role      = module.stackgen_271d9303-f8ac-5b8b-bb61-c639d7fa050a.name
  role_type = "custom"
}

module "stackgen_a8cfc1e9-2ef3-5fbd-8f79-d34fd55a9682" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-ingressn-ingressn-efb5f6ecf7-a04f395ff369e7c5.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "\\052.main.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_a92aa0ce-5b4d-5fc8-a3eb-82cfb38210af" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_d7bd5b7b-7e91-54b3-8b6d-747584caa04b.name
}

module "stackgen_a9cd307a-0e0f-5b20-a9e3-a01a1f29e786" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_dcb10c96-bd8f-5a2d-9008-93634a24d80e.arn
  role       = module.stackgen_e2586edb-0f9c-56df-8103-d321aa064c33.name
}

module "stackgen_aa4ce075-12d0-5707-8253-72a922bb502b" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"
  role       = module.stackgen_477cd60c-ab3a-55c9-800d-2c42d96deeac.name
}

module "stackgen_aa622e29-8e4f-5fff-bdbb-91e0103a3156" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSCloudFrontLogger"
  role       = module.stackgen_807c8600-579b-5116-a412-44b8451201a1.name
}

module "stackgen_aad12086-a729-5fa8-a989-a0fd455ccb9f" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_1c183b3e-0388-588e-b73b-f8cd91af5aab.name
}

module "stackgen_aae86570-d07c-5279-bd5f-93a35f489ae4" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_82337260-27c3-51aa-87b3-108cffca9fa4.arn
  role       = module.stackgen_eebc175f-c339-5fbc-a7ef-83f96dbe693e.name
}

module "stackgen_ab37ea5a-7cd4-58a9-ab7a-d8897a685d8f" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = module.stackgen_fa16772f-5e83-5f83-9b41-d443b19840d1.name
}

module "stackgen_ac93bc51-6d83-47e0-b994-f62f2fb38678" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = null
  map_public_ip_on_launch = false
  tags                    = {}
  vpc_id                  = module.stackgen_712f0693-28f2-4aa3-89b2-575b47fe1642.vpc_id
}

module "stackgen_ad21c497-3102-5e7f-932c-01183f7a55d2" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AutoScalingServiceRolePolicy"
  role       = module.stackgen_a7224fb9-2376-5c48-81b3-14324b0ca906.name
}

module "stackgen_ad31f670-b84b-5f15-a3ec-378803e5da40" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "on-prem-eks_4067990795380418201"
  name_prefix = ""
  path        = "/"
  role        = null
  tags = {
    "karpenter.k8s.aws/ec2nodeclass"    = "default"
    "karpenter.sh/managed-by"           = "on-prem-eks"
    "kubernetes.io/cluster/on-prem-eks" = "owned"
    "topology.kubernetes.io/region"     = "us-west-2"
  }
}

module "stackgen_ad4ff148-56cc-5907-8ef6-c1d191ca1b19" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "_dmarc.unstable.dev.stackgen.com"
  records                          = ["v=DMARC1; p=none;"]
  set_identifier                   = ""
  ttl                              = 300
  type                             = "TXT"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_adc63ff7-56f5-5e78-a156-8e32b59057c1" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = module.stackgen_984453ee-883f-5434-bacf-95de97e68779.name
}

module "stackgen_aeab1366-23df-5d31-8c37-1bd8b0776f83" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_666d4be7-d006-5c45-b82e-23259c852de6.arn
  role       = module.stackgen_9ea9d9c2-9bef-54b6-827b-134f067e940c.name
}

module "stackgen_af8d96dd-efa5-5304-8869-9146c7ea4d36" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-nginxing-nginxing-5bcc97d528-8c5ddc36e39e5068.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "logs-stackgen-observe.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_afb10a50-dfdf-558a-856e-655ad7c67435" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:sts::339712749745:assumed-role/stackgen-system-access/stackgen-access-20250925081202\"},\"Sid\":\"AssumeRolePermission\"}],\"Version\":\"2012-10-17\"}"
  description           = "Role for appstack deployment: e2e test "
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "stackgen-managed-edb5eac5-b369-4daa-ae39-abc895dd70b5"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created-on           = "2025-09-25T08:12:02Z"
    stackgen-appstack-id = "edb5eac5-b369-4daa-ae39-abc895dd70b5"
    stackgen-deploy-id   = "d128a382-7c05-479b-bdbc-3b212da55da6"
    stackgen-managed     = "true"
    stackgen-reason      = "e2e test"
  }
}

module "stackgen_afb7bd77-3073-5286-84cb-e995c9d380dc" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"compute-optimizer.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForComputeOptimizer"
  path                  = "/aws-service-role/compute-optimizer.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_afe19031-ff04-5e01-8456-bbe1066d152d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_0bbb4566-02cc-56f9-8511-86f67013a661.name
}

module "stackgen_afedca20-9cd2-5ae3-b4e8-412581310e34" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_927ecb03-73b9-598f-b3da-3f3bbe775e05.arn
  role       = module.stackgen_127c1820-77ac-58c0-b515-ebb5c13b2ce7.name
}

module "stackgen_b019a3b9-2c41-568d-8f6b-ed8877086bc9" {
  source               = "./modules/aws_ebs_volume"
  availability_zone    = "us-east-1a"
  encrypted            = false
  final_snapshot       = null
  iops                 = 100
  kms_key_id           = ""
  multi_attach_enabled = false
  outpost_arn          = ""
  size                 = 10
  snapshot_id          = ""
  tags = {
    CSIVolumeName                             = "pvc-d68d0490-3962-484c-99cd-9c099aa248e6"
    "ebs.csi.aws.com/cluster"                 = "true"
    "kubernetes.io/created-for/pv/name"       = "pvc-d68d0490-3962-484c-99cd-9c099aa248e6"
    "kubernetes.io/created-for/pvc/name"      = "devopsnow-vmagent"
    "kubernetes.io/created-for/pvc/namespace" = "devopsnow"
  }
  throughput = 0
  type       = "gp2"
}

module "stackgen_b065797f-734f-5c62-bb6b-cb5d91768a4a" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/CloudwatchApplicationInsightsServiceLinkedRolePolicy"
  role       = module.stackgen_45231a74-1177-54a2-b06b-b8375f75c220.name
}

module "stackgen_b085e0b0-18a0-5f81-833b-83831492ff31" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_852f1f74-b8ef-5a00-a947-ae5d4565233f.name
}

module "stackgen_b0984210-55fc-5be6-a5f8-9db834c7d01a" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_1e9854cc-9f50-50d5-9aab-b8eea9ef8cf9.name
}

module "stackgen_b0d22969-d770-5cca-86e3-beaedd0adba0" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-ingressn-ingressn-efb5f6ecf7-a04f395ff369e7c5.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "stage.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_b13dae59-9a13-53e1-b475-b843f2594461" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AccessAnalyzerServiceRolePolicy"
  role       = module.stackgen_b64d0046-831f-5dc4-a389-f3b6cf944416.name
}

module "stackgen_b14df02a-3176-5814-8c0b-62e3d381acbf" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.ap-south-1.amazonaws.com/id/86DB6AC1226AF27A629837EE0A5BE166:aud\":\"sts.amazonaws.com\",\"oidc.eks.ap-south-1.amazonaws.com/id/86DB6AC1226AF27A629837EE0A5BE166:sub\":\"system:serviceaccount:karpenter:karpenter\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.ap-south-1.amazonaws.com/id/86DB6AC1226AF27A629837EE0A5BE166\"}}],\"Version\":\"2012-10-17\"}"
  description           = "IRSA for Karpenter"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "karpenter-20240830233125927600000021"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    appcd_module  = "vpc"
    created_for   = "sks"
    maintained_by = "support@appcd.com"
  }
}

module "stackgen_b16aff3f-214e-58b3-a7d0-a67ec401a733" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_b85d53be-d3b0-59a3-be06-3738f279dfbc.name
}

module "stackgen_b1b55f64-462b-5ede-ba40-a769ae7b7583" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_e75c73a8-0830-5ebf-b3db-92386e7d1c53.arn
  role       = module.stackgen_eebc175f-c339-5fbc-a7ef-83f96dbe693e.name
}

module "stackgen_b1e9fb7d-e60f-52f9-bac6-5a2b38db0c59" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "eks-86ccdcc3-1183-e049-47ec-0db98d33dbc7"
  name_prefix = ""
  path        = "/"
  role        = module.stackgen_bbad1ee5-40dc-538e-aeff-f117c26a2252.name
  tags        = {}
}

module "stackgen_b288460b-a9dd-4ff1-9cd7-3ed3925ca47b" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = null
  map_public_ip_on_launch = false
  tags                    = {}
  vpc_id                  = null
}

module "stackgen_b3637285-b016-5019-9bad-618dfc1f80dc" {
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
    security_groups  = ["sg-0dcfa5969f791ae3e"]
    self             = false
    to_port          = 6379
  }]
  name                   = "retail-store-checkout-20251006122625475300000023"
  revoke_rules_on_delete = null
  tags = {
    Name             = "retail-store-checkout"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
  vpc_id   = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_b3860781-04ca-573d-8297-642384179687" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_d20b7dd4-d97e-551b-a53c-73e5e54b9bcb.arn
  role       = module.stackgen_3a1ab668-99a7-57f2-bed3-9b3fc7dde311.name
}

module "stackgen_b3d922bd-0101-5484-8fcd-91b9b93a6ea6" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:sts::339712749745:assumed-role/AWSReservedSSO_AdministratorAccess_90ce8fbcbe3cc328/yusuf@appcd.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Test role to test cross-account"
  force_detach_policies = false
  inline_policy = [{
    name   = "Reader"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:Get*\",\"s3:List*\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::cross-region-default\",\"arn:aws:s3:::cross-region-default/*\"],\"Sid\":\"ab39fb0b00074ec18f450207cd17d81f\"}]}"
  }]
  max_session_duration = 3600
  name                 = "appcd_b441f1-role-cross-account"
  path                 = "/"
  permissions_boundary = ""
  tags = {
    appstack  = "eks-dnd"
    component = "appcd_b441f1"
  }
}

module "stackgen_b49fe4dd-3997-5d11-a696-e83e633f2f0e" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_d7bd5b7b-7e91-54b3-8b6d-747584caa04b.name
}

module "stackgen_b4daecd6-136a-58d1-a7db-5ad952dcaa71" {
  source      = "./modules/aws_security_group"
  description = "Security group for Neo4j Docker deployment"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["12.202.45.221/32"]
    description      = "Vishwajeets Office IP"
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
    }, {
    cidr_blocks      = ["12.202.45.221/32"]
    description      = "Vishwajeets Office IP"
    from_port        = 7474
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 7474
    }, {
    cidr_blocks      = ["12.202.45.221/32"]
    description      = "Vishwajeets Office IP"
    from_port        = 7687
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 7687
    }, {
    cidr_blocks      = ["12.202.45.221/32"]
    description      = "Vishwajeets Office IP"
    from_port        = 8000
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 8000
    }, {
    cidr_blocks      = ["12.233.199.146/32"]
    description      = ""
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
    }, {
    cidr_blocks      = ["12.233.199.146/32"]
    description      = ""
    from_port        = 7474
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 7474
    }, {
    cidr_blocks      = ["12.233.199.146/32"]
    description      = ""
    from_port        = 7687
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 7687
    }, {
    cidr_blocks      = ["12.233.199.146/32"]
    description      = ""
    from_port        = 8000
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 8000
  }]
  name                   = "neo4j-docker-sg"
  revoke_rules_on_delete = null
  tags                   = {}
  timeouts               = null
  vpc_id                 = module.stackgen_d25a6d89-d552-5559-bfac-46df4f389650.id
}

module "stackgen_b63c8071-ceff-511b-88e2-da88449c76b9" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_984453ee-883f-5434-bacf-95de97e68779.name
}

module "stackgen_b64d0046-831f-5dc4-a389-f3b6cf944416" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"access-analyzer.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForAccessAnalyzer"
  path                  = "/aws-service-role/access-analyzer.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_b663ff3a-09ce-5c9e-93f5-7b6f1440d70c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_93e2e838-d1d8-55b2-b38d-2e7b60591bd2.arn
  role       = module.stackgen_4456c39a-e8b3-50e8-85c6-81c48e5f8c79.name
}

module "stackgen_b6ab893e-f4e0-5247-9910-e9ed60af9760" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"vpc-flow-logs.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "flow_role_policy"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:PutLogEvents\",\"logs:DescribeLogStreams\",\"logs:DescribeLogGroups\",\"logs:CreateLogStream\",\"logs:CreateLogGroup\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  }]
  max_session_duration = 3600
  name                 = "appcd-installer_flow_logs"
  path                 = "/"
  permissions_boundary = ""
  tags                 = {}
}

module "stackgen_b6b350b0-2f73-52e1-bddc-d0fb25dac337" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/436E20DEC59ECD543B5C986741FD9637:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/436E20DEC59ECD543B5C986741FD9637:sub\":\"system:serviceaccount:kube-system:s3-csi-sa\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/436E20DEC59ECD543B5C986741FD9637\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "eksctl-eks-tooling-addon-iamserviceaccount-ku-Role1-OoJzaXnmAt8i"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    "alpha.eksctl.io/cluster-name"                = "eks-tooling"
    "alpha.eksctl.io/eksctl-version"              = "0.205.0-dev+9e5300e5a.2025-02-28T20:10:13Z"
    "alpha.eksctl.io/iamserviceaccount-name"      = "kube-system/s3-csi-sa"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "eks-tooling"
  }
}

module "stackgen_b70aac98-f7c4-51aa-9ad5-a3862dc268a6" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_9aa05b2b-f650-542f-b376-2b7123b70856.name
}

module "stackgen_b82f6c60-3423-5251-b653-dcad1e869cc9" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_0bbb4566-02cc-56f9-8511-86f67013a661.name
}

module "stackgen_b85d53be-d3b0-59a3-be06-3738f279dfbc" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"eks.amazonaws.com\"},\"Sid\":\"EKSClusterAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "retail-store-cluster"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:CreateLogGroup\"],\"Effect\":\"Deny\",\"Resource\":\"*\"}]}"
  }]
  max_session_duration = 3600
  name                 = "retail-store-cluster-20251006122337416100000002"
  path                 = "/"
  permissions_boundary = ""
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_b8fb2327-45b0-5db8-87a1-cad90172bc36" {
  source = "./modules/aws_internet_gateway"
  tags   = {}
  vpc_id = module.stackgen_d25a6d89-d552-5559-bfac-46df4f389650.id
}

module "stackgen_b91a91d8-fa51-5d00-a1ed-bae6d73ac3c1" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_24c93baf-fb71-5a7e-9c36-ac198b645c77.arn
  role       = module.stackgen_19ba4c86-7702-54c7-8442-00aafed0df71.name
}

module "stackgen_b9368067-1938-539b-b397-3892063b3485" {
  source                 = "./modules/aws_iam_saml_provider"
  name                   = "AWSSSO_66cb6e387e9a07b4_DO_NOT_DELETE"
  saml_metadata_document = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><md:EntityDescriptor xmlns:md=\"urn:oasis:names:tc:SAML:2.0:metadata\" entityID=\"https://portal.sso.us-east-1.amazonaws.com/saml/assertion/MzY4OTQ1NDgxMzg5X2lucy0wOTFlNjQzMWRmYjM2NTQz\">\n  <md:IDPSSODescriptor WantAuthnRequestsSigned=\"false\" protocolSupportEnumeration=\"urn:oasis:names:tc:SAML:2.0:protocol\">\n    <md:KeyDescriptor use=\"signing\">\n      <ds:KeyInfo xmlns:ds=\"http://www.w3.org/2000/09/xmldsig#\">\n        <ds:X509Data>\n          <ds:X509Certificate>MIIDBjCCAe6gAwIBAgIEc9cq3zANBgkqhkiG9w0BAQsFADBFMRYwFAYDVQQDDA1hbWF6b25hd3MuY29tMQ0wCwYDVQQLDARJREFTMQ8wDQYDVQQKDAZBbWF6b24xCzAJBgNVBAYTAlVTMB4XDTI0MDExNDA0NTY1NFoXDTI5MDExNDA0NTY1NFowRTEWMBQGA1UEAwwNYW1hem9uYXdzLmNvbTENMAsGA1UECwwESURBUzEPMA0GA1UECgwGQW1hem9uMQswCQYDVQQGEwJVUzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALh8/55wz7jkY7VGt/uNzftSij6edOmyjRLl2n1O/QXEMjQOyKkkbw/7a49ZhVM0vwEYYrfOjnjJEtLeKVk04li4X0GEkEUDLcmMtmJyz0YXq3wKp7jpO5jJSmzqDzCrUGSrTB6/sNz09YTx+/8JlzCEljwpLfLxhBFW7DOf3E0a4lbxClfY9D4a5W6C1/CTXZHiBpdHg6SUd4rKuVM4O8IeGGvvHEUmWgaJPRRF/0iVUfk5eSx7qh7yZQQTloF/4Dz9kJddy3zmDi6SsKtChRjB2XCpnExBZzB1qU+mIMK0xrhpGcrEXw1igSMCeSaEMYD3VWHtfAgCOr9/p0eUwD0CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAbq+c129qobQ3YL6uarP3XOWPQ+rArRcmC3vuc8qDbetdookJ54ymrXII6vblJTEprlu1XaU6mSjqanaEhJ1KUtR4ImIP5GJpuWUrPoq6nKA1Y3bDNTw/e4dK3rFlH9hyNPYuXxoDQ66t7vs6OI36kp2lIQCO+ViprK86nWhk5OswfXuyf0f+tamgq+4T6VGmfQchkuMV3pKY0cF5k0c+8Am9q67m2QV1FnLKS3Rpn+0vsKqkFcoCyDrv6xZxgxC4LfwPSX+5tCvWL3oUBClR7Du0pTPE9EprzHQi5hx7LzhVtEbWZ5hZWELjwI4PvD1ezNaiigDRb95v3edloOSgog==</ds:X509Certificate>\n        </ds:X509Data>\n      </ds:KeyInfo>\n    </md:KeyDescriptor>\n    <md:SingleLogoutService Binding=\"urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST\" Location=\"https://portal.sso.us-east-1.amazonaws.com/saml/logout/MzY4OTQ1NDgxMzg5X2lucy0wOTFlNjQzMWRmYjM2NTQz\"/>\n    <md:SingleLogoutService Binding=\"urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect\" Location=\"https://portal.sso.us-east-1.amazonaws.com/saml/logout/MzY4OTQ1NDgxMzg5X2lucy0wOTFlNjQzMWRmYjM2NTQz\"/>\n    <md:NameIDFormat>urn:oasis:names:tc:SAML:2.0:nameid-format:persistent</md:NameIDFormat>\n    <md:SingleSignOnService Binding=\"urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST\" Location=\"https://portal.sso.us-east-1.amazonaws.com/saml/assertion/MzY4OTQ1NDgxMzg5X2lucy0wOTFlNjQzMWRmYjM2NTQz\"/>\n    <md:SingleSignOnService Binding=\"urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect\" Location=\"https://portal.sso.us-east-1.amazonaws.com/saml/assertion/MzY4OTQ1NDgxMzg5X2lucy0wOTFlNjQzMWRmYjM2NTQz\"/>\n  </md:IDPSSODescriptor>\n</md:EntityDescriptor>\n"
  tags                   = {}
}

module "stackgen_b958334b-a435-578d-a13f-74e5adc65726" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"resource-explorer-2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForResourceExplorer"
  path                  = "/aws-service-role/resource-explorer-2.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_b95be495-c843-5d96-a888-d548b3783545" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2SpotFleetTaggingRole"
  role       = module.stackgen_758705b8-cc62-5629-bedc-ef952fe15a21.name
}

module "stackgen_b9d386ff-ba6f-55bb-b432-5e8d380625e1" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_113b4509-bac4-539a-8f7e-f972df1fa6d8.arn
  role       = module.stackgen_431f316b-b29f-5c1b-a684-6d5269159edf.name
}

module "stackgen_ba731813-b5f1-5b89-b963-be0c999e4636" {
  source               = "./modules/aws_iam_user"
  force_destroy        = null
  name                 = "ses-smtp-user-stage"
  path                 = "/"
  permissions_boundary = ""
  tags = {
    namespace = "appcd-stage"
    repo      = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_badf2e23-5cc5-5604-9677-3c80a7b14493" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_e2bc9541-eda0-570e-acbb-e40eba3e17a7.arn
  role       = module.stackgen_4cdfcf82-8fbd-5f23-b7dc-089ad2257997.name
}

module "stackgen_bb8598aa-b145-5a17-a3d0-5d5a9e998074" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_2556d107-d254-56be-b31d-5114418f4dc7.arn
  role       = module.stackgen_506b969f-1bf4-56e4-b9d9-a4a4bbba6795.name
}

module "stackgen_bb9e5c8e-0a04-5bd4-a3a0-5ccc0f79c6a3" {
  source = "./modules/aws_glue_catalog_database"
  create_table_default_permission = [{
    permissions = ["ALL"]
    principal = [{
      data_lake_principal_identifier = "IAM_ALLOWED_PRINCIPALS"
    }]
  }]
  description        = ""
  federated_database = []
  name               = "dev_athena_db"
  parameters         = {}
  tags               = {}
  target_database    = []
}

module "stackgen_bbad1ee5-40dc-538e-aeff-f117c26a2252" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Sid\":\"EKSNodeAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = "EKS managed node group IAM role"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "managed-nodegroup-1-eks-node-group-20251006122607501300000014"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_bc271a8b-51d5-5005-b4b0-3906766ebe5a" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonRedshiftServiceLinkedRolePolicy"
  role       = module.stackgen_7bf162a0-2f33-547b-b14c-4c9bf951e8bc.name
}

module "stackgen_bd08c127-67ae-5a17-9389-9098d3bc6995" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/ElastiCacheServiceRolePolicy"
  role       = module.stackgen_c670c9c7-8f66-5fd6-9609-d0815ee84698.name
}

module "stackgen_bd458480-fd6a-5c9d-9a71-13abb48af55f" {
  source      = "./modules/aws_iam_policy"
  description = "Policy for GitHub runner to access AWS resources"
  name        = "github-runner-policy"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"ecr:GetAuthorizationToken\",\"ecr:BatchCheckLayerAvailability\",\"ecr:GetDownloadUrlForLayer\",\"ecr:BatchGetImage\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"secretsmanager:GetSecretValue\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:secretsmanager:us-west-2:*:secret:*/unstable/rds_endpoint*\",\"arn:aws:secretsmanager:us-west-2:*:secret:*/unstable/rds_port*\",\"arn:aws:secretsmanager:us-west-2:*:secret:*/unstable/rds_username*\",\"arn:aws:secretsmanager:us-west-2:*:secret:*/unstable/rds_password*\"]}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_bd78c59d-999a-5acc-a3bf-d6679092d709" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/436E20DEC59ECD543B5C986741FD9637:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/436E20DEC59ECD543B5C986741FD9637:sub\":\"system:serviceaccount:kube-system:aws-load-balancer-controller\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/436E20DEC59ECD543B5C986741FD9637\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "eksctl-eks-tooling-addon-iamserviceaccount-ku-Role1-r6IQFsEi2F0I"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    "alpha.eksctl.io/cluster-name"                = "eks-tooling"
    "alpha.eksctl.io/eksctl-version"              = "0.205.0-dev+9e5300e5a.2025-02-28T20:10:13Z"
    "alpha.eksctl.io/iamserviceaccount-name"      = "kube-system/aws-load-balancer-controller"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "eks-tooling"
  }
}

module "stackgen_bdc49e34-85d1-5942-bf82-cd10a0920920" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"
  role       = module.stackgen_a78ad8a8-0049-567c-ad84-e3c83f4a8387.name
}

module "stackgen_be17efc3-0ff3-5b9c-b614-dc2b7f3f6bc1" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_d7bd5b7b-7e91-54b3-8b6d-747584caa04b.name
}

module "stackgen_be4b76ef-dd9d-54cc-aa9a-d268bcbface3" {
  source         = "./modules/aws_iam_openid_connect_provider"
  client_id_list = ["sts.amazonaws.com"]
  tags = {
    Name          = "sks-eks-eks-irsa"
    appcd_module  = "vpc"
    created_for   = "sks"
    maintained_by = "support@appcd.com"
  }
  thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280"]
  url             = "oidc.eks.ap-south-1.amazonaws.com/id/86DB6AC1226AF27A629837EE0A5BE166"
}

module "stackgen_be94d854-2e7a-57bc-9770-cd52897a3c14" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "mlf3ipxr66m75zztnnmvwfdk56t4bcws._domainkey.playground.dev.appcd.io"
  records                          = ["mlf3ipxr66m75zztnnmvwfdk56t4bcws.dkim.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 1800
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_beaa226b-d590-560c-adc6-d819de23abe0" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_821dccb7-3053-591f-97d1-f8ca7d79b0af.arn
  role       = module.stackgen_b85d53be-d3b0-59a3-be06-3738f279dfbc.name
}

module "stackgen_beb05c80-d90e-5dcd-9eb6-4fd2fe3fa32f" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "ip-monitoring-lambda-policy"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:CreateLogGroup\",\"logs:CreateLogStream\",\"logs:PutLogEvents\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:logs:*:*:*\"},{\"Action\":[\"ec2:DescribeRegions\",\"ec2:DescribeSubnets\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  }]
  max_session_duration = 3600
  name                 = "ip-monitoring-lambda-role"
  path                 = "/"
  permissions_boundary = ""
  tags                 = {}
}

module "stackgen_beb6ceb7-b524-5c90-81d8-dc35731a8a31" {
  source       = "./modules/aws_db_parameter_group"
  description  = "Default parameter group for aurora-postgresql15"
  family       = "aurora-postgresql15"
  name         = "default.aurora-postgresql15"
  name_prefix  = ""
  parameter    = []
  skip_destroy = false
  tags         = {}
}

module "stackgen_bed267d3-8146-592e-8fbf-af047f0b59c8" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = module.stackgen_3bf1912b-ab9f-51c1-9b73-6e6dc681cd83.name
}

module "stackgen_bedeb7c5-6f89-50bf-9053-03d7eb27aa69" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "rds_secrets_policy_developer"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"secretsmanager:GetResourcePolicy\",\"secretsmanager:GetSecretValue\",\"secretsmanager:DescribeSecret\",\"secretsmanager:ListSecretVersionIds\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:secretsmanager:us-west-2:339712749745:secret:/developer/temporal_rds_endpoint-vVg3wL\",\"arn:aws:secretsmanager:us-west-2:339712749745:secret:/developer/temporal_rds_port-cohA80\",\"arn:aws:secretsmanager:us-west-2:339712749745:secret:/developer/temporal_rds_read_endpoint-rTZciL\",\"arn:aws:secretsmanager:us-west-2:339712749745:secret:rds!cluster-f8660298-64eb-4795-88f7-c66337873389-7CJCqw\"],\"Sid\":\"rdssecretspolicy\"},{\"Action\":[\"secretsmanager:GetResourcePolicy\",\"secretsmanager:GetSecretValue\",\"secretsmanager:DescribeSecret\",\"secretsmanager:ListSecretVersionIds\"],\"Condition\":{\"StringEquals\":{\"aws:ResourceTag/namespace\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:secretsmanager:us-west-2:339712749745:secret:*\"],\"Sid\":\"secretForNamespaceRDS\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_bfc29284-a755-52d6-b668-18b372da1ab8" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_984453ee-883f-5434-bacf-95de97e68779.name
}

module "stackgen_c01bcbf2-8f24-5c48-b3c3-fc99491306e8" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-ingressn-ingressn-efb5f6ecf7-a04f395ff369e7c5.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "registry.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_c02144a3-6663-5440-85eb-fb26a6eea9ee" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "AWSLoadBalancerControllerIAMPolicy"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"iam:CreateServiceLinkedRole\"],\"Condition\":{\"StringEquals\":{\"iam:AWSServiceName\":\"elasticloadbalancing.amazonaws.com\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ec2:DescribeAccountAttributes\",\"ec2:DescribeAddresses\",\"ec2:DescribeAvailabilityZones\",\"ec2:DescribeInternetGateways\",\"ec2:DescribeVpcs\",\"ec2:DescribeVpcPeeringConnections\",\"ec2:DescribeSubnets\",\"ec2:DescribeSecurityGroups\",\"ec2:DescribeInstances\",\"ec2:DescribeNetworkInterfaces\",\"ec2:DescribeTags\",\"ec2:GetCoipPoolUsage\",\"ec2:DescribeCoipPools\",\"ec2:GetSecurityGroupsForVpc\",\"ec2:DescribeIpamPools\",\"elasticloadbalancing:DescribeLoadBalancers\",\"elasticloadbalancing:DescribeLoadBalancerAttributes\",\"elasticloadbalancing:DescribeListeners\",\"elasticloadbalancing:DescribeListenerCertificates\",\"elasticloadbalancing:DescribeSSLPolicies\",\"elasticloadbalancing:DescribeRules\",\"elasticloadbalancing:DescribeTargetGroups\",\"elasticloadbalancing:DescribeTargetGroupAttributes\",\"elasticloadbalancing:DescribeTargetHealth\",\"elasticloadbalancing:DescribeTags\",\"elasticloadbalancing:DescribeTrustStores\",\"elasticloadbalancing:DescribeListenerAttributes\",\"elasticloadbalancing:DescribeCapacityReservation\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"cognito-idp:DescribeUserPoolClient\",\"acm:ListCertificates\",\"acm:DescribeCertificate\",\"iam:ListServerCertificates\",\"iam:GetServerCertificate\",\"waf-regional:GetWebACL\",\"waf-regional:GetWebACLForResource\",\"waf-regional:AssociateWebACL\",\"waf-regional:DisassociateWebACL\",\"wafv2:GetWebACL\",\"wafv2:GetWebACLForResource\",\"wafv2:AssociateWebACL\",\"wafv2:DisassociateWebACL\",\"shield:GetSubscriptionState\",\"shield:DescribeProtection\",\"shield:CreateProtection\",\"shield:DeleteProtection\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ec2:AuthorizeSecurityGroupIngress\",\"ec2:RevokeSecurityGroupIngress\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ec2:CreateSecurityGroup\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ec2:CreateTags\"],\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"false\"},\"StringEquals\":{\"ec2:CreateAction\":\"CreateSecurityGroup\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ec2:*:*:security-group/*\"},{\"Action\":[\"ec2:CreateTags\",\"ec2:DeleteTags\"],\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"true\",\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ec2:*:*:security-group/*\"},{\"Action\":[\"ec2:AuthorizeSecurityGroupIngress\",\"ec2:RevokeSecurityGroupIngress\",\"ec2:DeleteSecurityGroup\"],\"Condition\":{\"Null\":{\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:CreateLoadBalancer\",\"elasticloadbalancing:CreateTargetGroup\"],\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:CreateListener\",\"elasticloadbalancing:DeleteListener\",\"elasticloadbalancing:CreateRule\",\"elasticloadbalancing:DeleteRule\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:AddTags\",\"elasticloadbalancing:RemoveTags\"],\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"true\",\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*\"]},{\"Action\":[\"elasticloadbalancing:AddTags\",\"elasticloadbalancing:RemoveTags\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:elasticloadbalancing:*:*:listener/net/*/*/*\",\"arn:aws:elasticloadbalancing:*:*:listener/app/*/*/*\",\"arn:aws:elasticloadbalancing:*:*:listener-rule/net/*/*/*\",\"arn:aws:elasticloadbalancing:*:*:listener-rule/app/*/*/*\"]},{\"Action\":[\"elasticloadbalancing:ModifyLoadBalancerAttributes\",\"elasticloadbalancing:SetIpAddressType\",\"elasticloadbalancing:SetSecurityGroups\",\"elasticloadbalancing:SetSubnets\",\"elasticloadbalancing:DeleteLoadBalancer\",\"elasticloadbalancing:ModifyTargetGroup\",\"elasticloadbalancing:ModifyTargetGroupAttributes\",\"elasticloadbalancing:DeleteTargetGroup\",\"elasticloadbalancing:ModifyListenerAttributes\",\"elasticloadbalancing:ModifyCapacityReservation\",\"elasticloadbalancing:ModifyIpPools\"],\"Condition\":{\"Null\":{\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:AddTags\"],\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"false\"},\"StringEquals\":{\"elasticloadbalancing:CreateAction\":[\"CreateTargetGroup\",\"CreateLoadBalancer\"]}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*\"]},{\"Action\":[\"elasticloadbalancing:RegisterTargets\",\"elasticloadbalancing:DeregisterTargets\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\"},{\"Action\":[\"elasticloadbalancing:SetWebAcl\",\"elasticloadbalancing:ModifyListener\",\"elasticloadbalancing:AddListenerCertificates\",\"elasticloadbalancing:RemoveListenerCertificates\",\"elasticloadbalancing:ModifyRule\",\"elasticloadbalancing:SetRulePriorities\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_c0467640-b7de-5652-8378-36214b38a629" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/CostOptimizationHubServiceRolePolicy"
  role       = module.stackgen_6c3e1a46-606f-53b0-a0f9-fa1d3380431a.name
}

module "stackgen_c0547458-b8c1-517f-b69f-419cc80a387d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_c252080d-87a2-54fe-8f43-5b725d327987.name
}

module "stackgen_c0e672dc-0b4d-59a8-92ad-fc5bd76edc60" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_5d8885bf-d6b9-5a83-9fd9-3bda96bc87a9.name
}

module "stackgen_c1028767-9b70-5f5b-a1ad-f42136d5f489" {
  source = "./modules/aws_glue_catalog_database"
  create_table_default_permission = [{
    permissions = ["ALL"]
    principal = [{
      data_lake_principal_identifier = "IAM_ALLOWED_PRINCIPALS"
    }]
  }]
  description        = ""
  federated_database = []
  name               = "testdbnr"
  parameters         = {}
  tags               = {}
  target_database    = []
}

module "stackgen_c12c01d9-437e-5f17-8c34-c2a056beb229" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064:sub\":\"system:serviceaccount:kube-system:aws-load-balancer-controller-sa\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064\"}}],\"Version\":\"2012-10-17\"}"
  description           = "IRSA for aws-load-balancer-controller project"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "alb-controller-20240212143633128100000006"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_c1fe0eb4-fe2d-56b2-a8af-1a983c553b50" {
  source      = "./modules/aws_iam_policy"
  description = "Cluster encryption policy to allow cluster role to utilize CMK provided"
  name        = "on-prem-eks-cluster-ClusterEncryption2024031301171022890000000e"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"kms:Encrypt\",\"kms:Decrypt\",\"kms:ListGrants\",\"kms:DescribeKey\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:kms:us-west-2:339712749745:key/4c206946-5c6b-4af2-a705-11044b7551ba\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    appcd_module  = "vpc"
    maintained_by = "support@appcd.com"
  }
}

module "stackgen_c2410637-32e0-563d-abc3-24e57bc66d86" {
  source          = "./modules/aws_iam_openid_connect_provider"
  client_id_list  = ["sts.amazonaws.com"]
  tags            = {}
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
  url             = "token.actions.githubusercontent.com"
}

module "stackgen_c250be75-307d-5b0d-867e-5cf12252599d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_852f1f74-b8ef-5a00-a947-ae5d4565233f.name
}

module "stackgen_c252080d-87a2-54fe-8f43-5b725d327987" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Sid\":\"EKSNodeAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = "EKS managed node group IAM role"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "managed-nodegroup-2-eks-node-group-20251006122607501400000015"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_c2b909a8-fb73-55f8-acec-99b7a8e4fdba" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "a050275aa5f504015b9fcdbead6e9012-eaac02d37f31d5a6.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "nielsen.dev.appcd.io"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_c2eff8b1-c67b-5421-b877-2726bbb5f57f" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064:sub\":\"system:serviceaccount:external-secrets:external-secrets-sa\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064\"}}],\"Version\":\"2012-10-17\"}"
  description           = "IRSA for external-secrets operator"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "external-secrets-20240212143633128000000005"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_c33aeea4-628c-59cc-b1f6-5e612be6586c" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064:sub\":\"system:serviceaccount:kube-system:ebs-csi-controller-sa\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064\"}}],\"Version\":\"2012-10-17\"}"
  description           = "role for postgres for ai-observability (aarav and armaan)"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AI-obs-postgres"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_c33f0deb-84a5-59d2-ad11-f54a80d445d0" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Allows EC2 instances to call AWS services on your behalf."
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "eks-node-role"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_c5091d98-6904-5cc3-a34e-dfab87423efb" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess"
  role       = module.stackgen_a01b96e0-5419-58db-ae25-4028eeb95829.name
}

module "stackgen_c52837fb-d403-5dbc-9e12-998b8291ba2d" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "a7adbf554635c42458f4d12ff6eeac06-36388daf0dcffc30.elb.ap-south-1.amazonaws.com"
    zone_id                = "ZVDDRBQ08TROA"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "onprem.dev.appcd.io"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_c62035a8-635c-50e5-8d43-dd5bb8bb2b28" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_984453ee-883f-5434-bacf-95de97e68779.name
}

module "stackgen_c670c9c7-8f66-5fd6-9609-d0815ee84698" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"elasticache.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "This policy allows ElastiCache to manage AWS resources on your behalf as necessary for managing your cache."
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForElastiCache"
  path                  = "/aws-service-role/elasticache.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_c7493f7e-1e3d-575c-bf4f-f9c7eb4257ed" {
  source                 = "./modules/aws_security_group"
  description            = "default VPC security group"
  egress                 = []
  ingress                = []
  name                   = "default"
  revoke_rules_on_delete = null
  tags = {
    Name             = "retail-store-default"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
  vpc_id   = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_c808e608-d7da-5aa0-9698-fe057f0f1159" {
  source = "./modules/aws_route_table"
  route  = []
  tags = {
    Name             = "retail-store-default"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  vpc_id = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_c878a175-e16e-5cd1-946f-5fca170f34fc" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"elasticfilesystem.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForAmazonElasticFileSystem"
  path                  = "/aws-service-role/elasticfilesystem.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_c891c6a2-ed2f-5354-87e3-77eb2b5c0adb" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSVPCTransitGatewayServiceRolePolicy"
  role       = module.stackgen_4d681287-9805-59ab-af1e-1eacd0bc6206.name
}

module "stackgen_c8d76f3a-a749-58d6-9797-856d426d96bd" {
  source              = "./modules/aws_s3_bucket"
  bucket              = "cross-account-athena-data-2"
  force_destroy       = null
  object_lock_enabled = false
  tags                = {}
}

module "stackgen_c8e63dfb-f895-5356-98a0-4b1e16862db1" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"rds.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Allows Amazon RDS to manage AWS resources on your behalf"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForRDS"
  path                  = "/aws-service-role/rds.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_c8e81dbc-1c91-5f6c-86e7-4c40bf324c96" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_0ba71079-1696-5955-ae33-2f462cbd91b1.arn
  role       = module.stackgen_0573fc18-dc0f-5e88-9d0d-dcdffc0d0b28.name
}

module "stackgen_c9af33d6-0f90-52f9-89ec-46b4ad4ee540" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_45fa43be-0891-5826-bb45-eb78c1ce2392.arn
  role       = module.stackgen_3ff676f1-566e-5d08-9f05-63c40b5b40de.name
}

module "stackgen_c9beea18-86cc-55f2-bd0f-f2e033255c6d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = module.stackgen_880be9b2-8513-53d7-94ad-0d769b00d2e4.name
}

module "stackgen_c9fe2345-6c65-5be9-85a4-37460edac48e" {
  source = "./modules/aws_iam_group_membership"
  group  = "terraform-cloud-demo-env"
  name   = "terraform-20251007091814156400000001"
  users = [
    module.stackgen_a5785c3e-33cb-5850-9b62-2c83fd4c4d5c.name,
  ]
}

module "stackgen_ca00cc59-68c1-591f-a5f1-d516b385309f" {
  source    = "./modules/aws_iam_role_policy"
  name      = "read-tfstate"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:PutObject\",\"s3:ListObjects*\",\"s3:ListBucket*\",\"s3:HeadObject\",\"s3:Get*\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::339712749745-states/*\",\"arn:aws:s3:::339712749745-states\"]}]}"
  role      = module.stackgen_271d9303-f8ac-5b8b-bb61-c639d7fa050a.name
  role_type = "custom"
}

module "stackgen_ca2a39f0-f21a-583d-b4c7-7a6baa9dc4c0" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_1e88b453-294b-5398-8df5-dc6c7c6cdae5.arn
  role       = module.stackgen_2d919c3d-0fec-55f6-8e0a-eb4a6a16cc6d.name
}

module "stackgen_ca52adee-c532-5bb9-adf0-586ee61385c8" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonECSServiceRolePolicy"
  role       = module.stackgen_0f568353-d06e-5022-8748-7ea557205d2c.name
}

module "stackgen_ca58f9fe-9bb4-53d5-949e-595d9dbe073a" {
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
  vpc_id = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_ca66e96b-85e5-50a4-b625-28ef8bcd0513" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "support.main.dev.stackgen.com"
  records                          = ["10 feedback-smtp.us-west-2.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 300
  type                             = "MX"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_cb82488e-2109-57d0-ba1a-bc88ea971116" {
  source = "./modules/aws_iam_group"
  name   = "AWSSESSendingGroupDoNotRename"
  path   = "/"
}

module "stackgen_cc39a7ef-efd2-5d36-8b41-2cd64d2992f6" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSOrganizationsServiceTrustPolicy"
  role       = module.stackgen_925e3503-8b4f-53c6-b129-93f36d8de4e9.name
}

module "stackgen_ccf17d4b-6b12-580d-b84a-9b051af9f31b" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "_37fc9d1df28674d86d50508474f98ba7.dev.stackgen.com"
  records                          = ["_5317fad855f90fe96f86e83e14fc910e.djqtsrsxkq.acm-validations.aws."]
  set_identifier                   = ""
  ttl                              = 300
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_cd0b4b47-5737-5f13-b9a5-1fc9ff69802f" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"
  role       = module.stackgen_477cd60c-ab3a-55c9-800d-2c42d96deeac.name
}

module "stackgen_cd5f5492-f3f6-5a08-9ef8-1b16ce290437" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = module.stackgen_c33aeea4-628c-59cc-b1f6-5e612be6586c.name
}

module "stackgen_cd786bc0-62b9-5a5a-b73a-e7479cd82195" {
  source          = "./modules/aws_key_pair"
  key_name        = "my-neo4j-key"
  key_name_prefix = ""
  public_key      = null
  tags            = {}
}

module "stackgen_cdc9c04d-f161-5b8e-8ba7-8b2c0a8b38dd" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "dualstack.k8s-kubeprom-grafanai-dd3d3eb65a-1572272577.us-west-2.elb.amazonaws.com"
    zone_id                = "Z1H1FL5HABSF5"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "pulse.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_cdd3fd14-b9ad-563d-b690-d513220c3f7f" {
  source    = "./modules/aws_iam_role_policy"
  name      = "DenyDataAccessPolicy"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"cloudformation:GetTemplate\",\"dynamodb:GetItem\",\"dynamodb:BatchGetItem\",\"dynamodb:Query\",\"dynamodb:Scan\",\"ec2:GetConsoleOutput\",\"ec2:GetConsoleScreenshot\",\"ecr:BatchGetImage\",\"ecr:GetAuthorizationToken\",\"ecr:GetDownloadUrlForLayer\",\"kinesis:Get*\",\"lambda:GetFunction\",\"logs:GetLogEvents\",\"s3:GetObject\",\"sdb:Select*\",\"sqs:ReceiveMessage\"],\"Effect\":\"Deny\",\"Resource\":[\"*\"]}]}"
  role      = module.stackgen_39bfebdd-63ef-59cd-b072-69cc51c559b5.name
  role_type = "custom"
}

module "stackgen_ce556776-5e2c-5e20-b98f-66fb7c85c535" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/ComputeOptimizerServiceRolePolicy"
  role       = module.stackgen_afb7bd77-3073-5286-84cb-e995c9d380dc.name
}

module "stackgen_ce73fd20-2a7c-5491-bc65-568f2226d9f4" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_0cba6313-3933-57a7-97ab-f4552457815c.arn
  role       = module.stackgen_f0e0bc09-8d3f-5f63-bfc1-aeb5a3e3ef3c.name
}

module "stackgen_ced43575-1240-5560-8ba8-cf842ef23da6" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = module.stackgen_19ba4c86-7702-54c7-8442-00aafed0df71.name
}

module "stackgen_cf1eb401-47ac-52ca-8d06-0762ea96441d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_eb72ead6-cac7-559a-8b9d-be1eed6fe356.name
}

module "stackgen_cf2fd37d-6d85-5268-841b-7d8e19c1c215" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"eks.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Allows Amazon EKS to call AWS services on your behalf."
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForAmazonEKS"
  path                  = "/aws-service-role/eks.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_cfa28fc1-540e-5afd-8edb-bf0fbe2b115a" {
  source      = "./modules/aws_api_gateway_resource"
  parent_id   = ""
  path_part   = ""
  rest_api_id = "mrafdp5i8e"
}

module "stackgen_cfb6020a-550c-51ef-b43c-f702d9ec033b" {
  source         = "./modules/aws_iam_openid_connect_provider"
  client_id_list = ["sts.amazonaws.com"]
  tags = {
    Name          = "tooling-dev-eks-eks-irsa"
    appcd_module  = "vpc"
    created_for   = "tooling-dev"
    maintained_by = "support@stackgen.com"
  }
  thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280"]
  url             = "oidc.eks.us-west-2.amazonaws.com/id/D027B653E35BDB1E89302EE39F5D9803"
}

module "stackgen_cffdb965-07b5-5e13-82b3-588b8bbc4aa9" {
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
  name                     = "node_group_2-2025100612363143650000002b"
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
  update_default_version = null
  user_data              = ""
  vpc_security_group_ids = [
    module.stackgen_fe56c635-6ab8-5e34-afad-bcaf895afc4b.id,
  ]
}

module "stackgen_d063f2be-4a3a-57ec-bf38-190f54a47dc4" {
  source  = "./modules/aws_iam_access_key"
  pgp_key = null
  status  = "Active"
  user    = module.stackgen_0cedae29-2b0d-5341-a4b1-11dd86f49d70.name
}

module "stackgen_d0b8a631-87da-5263-834a-5e5566b8524c" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/D027B653E35BDB1E89302EE39F5D9803:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/D027B653E35BDB1E89302EE39F5D9803:sub\":\"system:serviceaccount:signoz:signoz-clickhouse\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/D027B653E35BDB1E89302EE39F5D9803\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "ClickHouseS3Role"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_d0cacf81-26e2-57f9-88f1-3d4e2125fbed" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"monitoring.rds.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "terraform-20240212154111039000000005"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    namespace = "appcd-alpha"
    repo      = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_d1198f30-3320-52ed-9a6b-e55b95ac6324" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_984453ee-883f-5434-bacf-95de97e68779.name
}

module "stackgen_d11c5b7a-2a7e-5606-a4c3-44f2cdbb6324" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_0ba71079-1696-5955-ae33-2f462cbd91b1.arn
  role       = module.stackgen_0573fc18-dc0f-5e88-9d0d-dcdffc0d0b28.name
}

module "stackgen_d17a71f5-f368-594e-854f-6e03bececb2e" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_5aae0830-99db-5772-ba71-96e251989242.arn
  role       = module.stackgen_2ec6e0a9-ee21-57d8-933a-5e70733b6d44.name
}

module "stackgen_d1b23e50-248f-5fb3-a0cf-b0f9b63c6e8a" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_a35aa9b8-5884-5aaf-a493-7ebb093a9924.arn
  role       = module.stackgen_d0b8a631-87da-5263-834a-5e5566b8524c.name
}

module "stackgen_d1db53cc-1c45-5a24-8f14-a8a4d8f018fd" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"monitoring.rds.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "terraform-20240507234155152800000001"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    namespace = "appcd-stage"
    repo      = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_d20b7dd4-d97e-551b-a53c-73e5e54b9bcb" {
  source      = "./modules/aws_iam_policy"
  description = "IAM policy for S3 bucket access"
  name        = "appcd-blobs-engineering-s3-mount-policy"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"s3:ListBucket\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::appcd-blobs-engineering\"],\"Sid\":\"MountpointFullBucketAccess\"},{\"Action\":[\"s3:GetObject\",\"s3:PutObject\",\"s3:AbortMultipartUpload\",\"s3:DeleteObject\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::appcd-blobs-engineering/*\"],\"Sid\":\"MountpointFullObjectAccess\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_d25a6d89-d552-5559-bfac-46df4f389650" {
  source                               = "./modules/aws_vpc"
  cidr_block                           = "172.31.0.0/16"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  tags                                 = {}
}

module "stackgen_d27b3683-8d5b-53b3-bbe1-529786cfb0bb" {
  source     = "./modules/aws_iam_user_policy_attachment"
  policy_arn = module.stackgen_f09c6d11-f853-545f-9601-8285191aa60a.arn
  user       = module.stackgen_ba731813-b5f1-5b89-b963-be0c999e4636.name
}

module "stackgen_d2b54a32-21a6-5843-8a31-6bbf034dd917" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "rds_secrets_policy_dev-main"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"secretsmanager:GetResourcePolicy\",\"secretsmanager:GetSecretValue\",\"secretsmanager:DescribeSecret\",\"secretsmanager:ListSecretVersionIds\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:secretsmanager:us-west-2:339712749745:secret:/dev-main/rds_endpoint-UtDoNr\",\"arn:aws:secretsmanager:us-west-2:339712749745:secret:/dev-main/rds_port-sP1eSF\",\"arn:aws:secretsmanager:us-west-2:339712749745:secret:/dev-main/rds_read_endpoint-Wa7eHO\",\"arn:aws:secretsmanager:us-west-2:339712749745:secret:rds!cluster-0034b25b-4e99-4202-bb1f-ef4f18faa570-3N10Bp\"],\"Sid\":\"rdssecretspolicy\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_d2e2654e-1087-5523-8c50-043dd08b602f" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSReadOnlyAccess"
  role       = module.stackgen_37991be3-ebf8-576e-b55e-bb9614ed13f5.name
}

module "stackgen_d3977bf5-ecdd-5b17-9e10-96e8205334b9" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_1f7e3335-0725-52e8-b57a-6b84a291428b.arn
  role       = module.stackgen_3501c599-f36e-52d3-9034-4d49b358c453.name
}

module "stackgen_d3c3c948-43c0-59e9-b3b0-9a938eec6868" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  role       = module.stackgen_046f3ed5-e92e-58f0-96b9-5e9c28cbf536.name
}

module "stackgen_d3f12d1e-ef5e-5ebe-bc09-7f653a8e8598" {
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
    security_groups  = ["sg-0dcfa5969f791ae3e"]
    self             = false
    to_port          = 5671
  }]
  name                   = "retail-store-orders-broker"
  revoke_rules_on_delete = null
  tags = {
    Name             = "retail-store-orders-broker"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
  vpc_id   = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_d4755657-9f48-5565-b2e5-73d85c3a8162" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "engineering-eks_4067990795380418201"
  name_prefix = ""
  path        = "/"
  role        = null
  tags = {
    "karpenter.k8s.aws/ec2nodeclass"        = "default"
    "karpenter.sh/managed-by"               = "engineering-eks"
    "kubernetes.io/cluster/engineering-eks" = "owned"
    "topology.kubernetes.io/region"         = "us-west-2"
  }
}

module "stackgen_d4b1db2a-ce58-5af4-b4c0-8f7f393c02f9" {
  source = "./modules/aws_athena_workgroup"
  configuration = [{
    bytes_scanned_cutoff_per_query  = 10485760
    enforce_workgroup_configuration = true
    engine_version = [{
      effective_engine_version = "Athena engine version 3"
      selected_engine_version  = "AUTO"
    }]
    execution_role                     = ""
    publish_cloudwatch_metrics_enabled = true
    requester_pays_enabled             = false
    result_configuration = [{
      acl_configuration = []
      encryption_configuration = [{
        encryption_option = "SSE_KMS"
        kms_key_arn       = "arn:aws:kms:us-east-1:339712749745:key/afced4f6-51dc-49ef-9ce6-8e4ac9b971dd"
      }]
      expected_bucket_owner = ""
      output_location       = "s3://appcd-aws-athena-db/output/"
    }]
  }]
  description   = "appcd-athena-test-description"
  force_destroy = false
  name          = "appcd-athena-test"
  state         = "ENABLED"
  tags = {
    Environment = "dev"
    Region      = "us-east-1"
  }
}

module "stackgen_d4e58b6b-0983-5b5d-baab-7bd8ca1550ec" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = module.stackgen_3be52c00-188b-55fc-987f-484b62526b7e.name
}

module "stackgen_d5bffed4-6f84-5481-b823-1cccbcbfedc3" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_04183e2c-07be-5c10-a7d6-4eee7f2143e5.arn
  role       = module.stackgen_5d5e0065-2dc1-5150-b8f3-6fb468fcd651.name
}

module "stackgen_d636f605-2132-5da6-a09f-bc700ccaa5b7" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSLoadBalancingPolicy"
  role       = module.stackgen_e7da5ae7-3b7b-5af9-9bfc-dad2bc61c94c.name
}

module "stackgen_d64edb81-3af7-5d2d-8898-30080a23902c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = module.stackgen_d0cacf81-26e2-57f9-88f1-3d4e2125fbed.name
}

module "stackgen_d66ffb14-ace1-5dc9-aa9c-b8bead66346b" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_d7bd5b7b-7e91-54b3-8b6d-747584caa04b.name
}

module "stackgen_d6b4aa74-c95f-5de0-a1fc-b67ea30746d7" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_9aa05b2b-f650-542f-b376-2b7123b70856.name
}

module "stackgen_d73beb43-8289-5509-8813-7b0298d1151b" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSElasticLoadBalancingServiceRolePolicy"
  role       = module.stackgen_4cc0e8b1-5567-544f-a17e-04d76ef86e92.name
}

module "stackgen_d78eae75-16a9-533a-929f-da6b3b64b58e" {
  source    = "./modules/aws_iam_role_policy"
  name      = "lambda-logs-iaminferrence"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"logs:FilterLogEvents\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:logs:us-west-2:339712749745:log-group:logs_iaminferrence_test:*\",\"Sid\":\"VisualEditor0\"}]}"
  role      = module.stackgen_dd0b97cb-f569-5b99-904b-70d7e1b497d4.name
  role_type = "custom"
}

module "stackgen_d7bd5b7b-7e91-54b3-8b6d-747584caa04b" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Sid\":\"EKSNodeAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = "EKS managed node group IAM role"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "m7_node-eks-node-group-20240211202715389100000002"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_d857d057-ffeb-59c2-8c89-46f3e76fdb4c" {
  source    = "./modules/aws_iam_role_policy"
  name      = "s3-bucket-metadata-access"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:ListAllMyBuckets\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"ListBuckets\"},{\"Action\":[\"s3:GetBucketLocation\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"GetBucketLocations\"}]}"
  role      = module.stackgen_885d0e1a-e23a-5c1a-b36a-9f50ae1b1397.name
  role_type = "custom"
}

module "stackgen_d8779eca-2502-5cd2-aae3-fad44c1714a8" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "oztvdxtv6ph25r2lsm2iwpw2knk3th4d._domainkey.stage.dev.stackgen.com"
  records                          = ["oztvdxtv6ph25r2lsm2iwpw2knk3th4d.dkim.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 1800
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_d880408b-6c28-5795-aa59-6609d7268b56" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = module.stackgen_dd0b97cb-f569-5b99-904b-70d7e1b497d4.name
}

module "stackgen_d8b847e5-5090-5c1b-b1c4-6cdcb436ab75" {
  source    = "./modules/aws_iam_role_policy"
  name      = "retail-store-cluster"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:CreateLogGroup\"],\"Effect\":\"Deny\",\"Resource\":\"*\"}]}"
  role      = module.stackgen_b85d53be-d3b0-59a3-be06-3738f279dfbc.name
  role_type = "custom"
}

module "stackgen_d92b1e7e-a4e5-5350-b18a-5deaa2e9bcf3" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_0a47a628-1af8-599d-8d23-9a70f89f5a46.arn
  role       = module.stackgen_4f00631c-f2f0-5809-b5a1-6735fa7524ee.name
}

module "stackgen_d9a0cb4a-d814-5807-8ef2-25654fc5a596" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/CostOptimizationHubServiceRolePolicy"
  role       = module.stackgen_6c3e1a46-606f-53b0-a0f9-fa1d3380431a.name
}

module "stackgen_da201ebe-e9bb-5128-aec2-0f1585142641" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = module.stackgen_9db334f6-9d78-5cc1-b2c2-a026436062e5.name
}

module "stackgen_dbd596d2-80bb-5b3f-a4c0-d215a26f488e" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_5d8885bf-d6b9-5a83-9fd9-3bda96bc87a9.name
}

module "stackgen_dc789838-2a9b-5898-b93f-b4d66946afde" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  role       = module.stackgen_046f3ed5-e92e-58f0-96b9-5e9c28cbf536.name
}

module "stackgen_dc965dc1-6ec9-56fb-a92d-f9d497b7fa18" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_2556d107-d254-56be-b31d-5114418f4dc7.arn
  role       = module.stackgen_506b969f-1bf4-56e4-b9d9-a4a4bbba6795.name
}

module "stackgen_dcb10c96-bd8f-5a2d-9008-93634a24d80e" {
  source      = "./modules/aws_iam_policy"
  description = "IAM Policy for AWS Load Balancer Controller"
  name        = "alb-controller-20240130212104184500000009"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":\"iam:CreateServiceLinkedRole\",\"Condition\":{\"StringEquals\":{\"iam:AWSServiceName\":\"elasticloadbalancing.amazonaws.com\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:DescribeTargetHealth\",\"elasticloadbalancing:DescribeTargetGroups\",\"elasticloadbalancing:DescribeTargetGroupAttributes\",\"elasticloadbalancing:DescribeTags\",\"elasticloadbalancing:DescribeSSLPolicies\",\"elasticloadbalancing:DescribeRules\",\"elasticloadbalancing:DescribeLoadBalancers\",\"elasticloadbalancing:DescribeLoadBalancerAttributes\",\"elasticloadbalancing:DescribeListeners\",\"elasticloadbalancing:DescribeListenerCertificates\",\"ec2:GetCoipPoolUsage\",\"ec2:DescribeVpcs\",\"ec2:DescribeVpcPeeringConnections\",\"ec2:DescribeTags\",\"ec2:DescribeSubnets\",\"ec2:DescribeSecurityGroups\",\"ec2:DescribeNetworkInterfaces\",\"ec2:DescribeInternetGateways\",\"ec2:DescribeInstances\",\"ec2:DescribeCoipPools\",\"ec2:DescribeAvailabilityZones\",\"ec2:DescribeAddresses\",\"ec2:DescribeAccountAttributes\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"wafv2:GetWebACLForResource\",\"wafv2:GetWebACL\",\"wafv2:DisassociateWebACL\",\"wafv2:AssociateWebACL\",\"waf-regional:GetWebACLForResource\",\"waf-regional:GetWebACL\",\"waf-regional:DisassociateWebACL\",\"waf-regional:AssociateWebACL\",\"shield:GetSubscriptionState\",\"shield:DescribeProtection\",\"shield:DeleteProtection\",\"shield:CreateProtection\",\"iam:ListServerCertificates\",\"iam:GetServerCertificate\",\"cognito-idp:DescribeUserPoolClient\",\"acm:ListCertificates\",\"acm:DescribeCertificate\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ec2:RevokeSecurityGroupIngress\",\"ec2:AuthorizeSecurityGroupIngress\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ec2:CreateSecurityGroup\",\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ec2:CreateTags\",\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"false\"},\"StringEquals\":{\"ec2:CreateAction\":\"CreateSecurityGroup\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ec2:*:*:security-group/*\"},{\"Action\":[\"ec2:DeleteTags\",\"ec2:CreateTags\"],\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"true\",\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ec2:*:*:security-group/*\"},{\"Action\":[\"ec2:RevokeSecurityGroupIngress\",\"ec2:DeleteSecurityGroup\",\"ec2:AuthorizeSecurityGroupIngress\"],\"Condition\":{\"Null\":{\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:CreateTargetGroup\",\"elasticloadbalancing:CreateLoadBalancer\"],\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:DeleteRule\",\"elasticloadbalancing:DeleteListener\",\"elasticloadbalancing:CreateRule\",\"elasticloadbalancing:CreateListener\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:RemoveTags\",\"elasticloadbalancing:AddTags\"],\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"true\",\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*\"]},{\"Action\":[\"elasticloadbalancing:RemoveTags\",\"elasticloadbalancing:AddTags\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:elasticloadbalancing:*:*:listener/net/*/*/*\",\"arn:aws:elasticloadbalancing:*:*:listener/app/*/*/*\",\"arn:aws:elasticloadbalancing:*:*:listener-rule/net/*/*/*\",\"arn:aws:elasticloadbalancing:*:*:listener-rule/app/*/*/*\"]},{\"Action\":[\"elasticloadbalancing:SetSubnets\",\"elasticloadbalancing:SetSecurityGroups\",\"elasticloadbalancing:SetIpAddressType\",\"elasticloadbalancing:ModifyTargetGroupAttributes\",\"elasticloadbalancing:ModifyTargetGroup\",\"elasticloadbalancing:ModifyLoadBalancerAttributes\",\"elasticloadbalancing:DeleteTargetGroup\",\"elasticloadbalancing:DeleteLoadBalancer\"],\"Condition\":{\"Null\":{\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"elasticloadbalancing:AddTags\",\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"false\"},\"StringEquals\":{\"elasticloadbalancing:CreateAction\":[\"CreateTargetGroup\",\"CreateLoadBalancer\"]}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*\"]},{\"Action\":[\"elasticloadbalancing:RegisterTargets\",\"elasticloadbalancing:DeregisterTargets\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\"},{\"Action\":[\"elasticloadbalancing:SetWebAcl\",\"elasticloadbalancing:RemoveListenerCertificates\",\"elasticloadbalancing:ModifyRule\",\"elasticloadbalancing:ModifyListener\",\"elasticloadbalancing:AddListenerCertificates\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_dcc20ee0-5e1d-5db3-a327-0a068f920d2c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  role       = module.stackgen_39bfebdd-63ef-59cd-b072-69cc51c559b5.name
}

module "stackgen_dd0b97cb-f569-5b99-904b-70d7e1b497d4" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Allows Lambda functions to call AWS services on your behalf."
  force_detach_policies = false
  inline_policy = [{
    name   = "lambda-logs-iaminferrence"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"logs:FilterLogEvents\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:logs:us-west-2:339712749745:log-group:logs_iaminferrence_test:*\",\"Sid\":\"VisualEditor0\"}]}"
  }]
  max_session_duration = 3600
  name                 = "my_lambda_execution_role"
  path                 = "/"
  permissions_boundary = ""
  tags                 = {}
}

module "stackgen_ddb2abb3-31d3-589c-aa8a-778386f3f189" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = module.stackgen_9aa05b2b-f650-542f-b376-2b7123b70856.name
}

module "stackgen_de2382c3-cdf4-5312-9cde-a08fddbfa58b" {
  source               = "./modules/aws_iam_user"
  force_destroy        = null
  name                 = "loadbalancer"
  path                 = "/system/"
  permissions_boundary = ""
  tags = {
    tag-key = "tag-value"
  }
}

module "stackgen_dea94e73-6d20-5be0-ae63-f4e7bf5321ae" {
  source  = "./modules/aws_iam_access_key"
  pgp_key = null
  status  = "Active"
  user    = module.stackgen_2b2ae8eb-703f-56f8-b09e-b173fd0780f9.name
}

module "stackgen_dec46316-00c9-5857-9f81-a7397a0307d0" {
  source      = "./modules/aws_iam_policy"
  description = "This is an iam policy that allows for management of buckets that are prepended with gahaga"
  name        = "gahaga-s3"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":\"s3:ListAllMyBuckets\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::*\",\"Sid\":\"ListAllBuckets\"},{\"Action\":\"s3:*\",\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::gahaga*\",\"arn:aws:s3:::gahaga*/*\"],\"Sid\":\"FullAccessToGahagaBuckets\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    creator = "Sean Gahagan"
    usage   = "terraform cloud"
  }
}

module "stackgen_ded8ad1f-969a-5de4-9706-39d43510dcb8" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_852f1f74-b8ef-5a00-a947-ae5d4565233f.name
}

module "stackgen_df67c8c1-dfb1-598b-b18a-8c7932131eb0" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"
  role       = module.stackgen_a78ad8a8-0049-567c-ad84-e3c83f4a8387.name
}

module "stackgen_dfbfbdda-35e7-50f3-ad6f-30d4808ec839" {
  source      = "./modules/aws_iam_policy"
  description = "IAM Policy for external-secrets operator"
  name        = "external-secrets-20240212143602370200000001"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":\"ssm:DescribeParameters\",\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ssm:GetParameters\",\"ssm:GetParameter\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ssm:*:*:parameter/*\"},{\"Action\":\"secretsmanager:ListSecrets\",\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"secretsmanager:ListSecretVersionIds\",\"secretsmanager:GetSecretValue\",\"secretsmanager:GetResourcePolicy\",\"secretsmanager:DescribeSecret\",\"secretsmanager:BatchGetSecretValue\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:secretsmanager:*:*:secret:*\"},{\"Action\":\"kms:Decrypt\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:kms:*:*:key/*\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_dfc003bc-ca92-5425-9d7e-f1b5d84f62f4" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = module.stackgen_d1db53cc-1c45-5a24-8f14-a8a4d8f018fd.name
}

module "stackgen_e04e799f-f43b-5e20-a4e0-b2f278f3db9d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = module.stackgen_7c3b371c-f06f-5da9-ac30-d5d5c43a85a5.name
}

module "stackgen_e07aca97-a4c3-57ef-971d-0d5139a2290d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_b85d53be-d3b0-59a3-be06-3738f279dfbc.name
}

module "stackgen_e0a97320-e906-5d04-8b03-c9da598649bd" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_0a47a628-1af8-599d-8d23-9a70f89f5a46.arn
  role       = module.stackgen_4f00631c-f2f0-5809-b5a1-6735fa7524ee.name
}

module "stackgen_e1486cd6-227a-5b59-9d69-72c1d6d67903" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_0ccaae47-39ad-58d1-b9d9-c97e70657142.name
}

module "stackgen_e152d8a7-0fc3-57a6-bee8-6163ccae99d5" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "onprem-email-sender"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":\"ses:SendRawEmail\",\"Condition\":{\"StringLike\":{\"ses:FromAddress\":\"*@support.onprem.dev.stackgen.com\"}},\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"SendEmail\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    namespace = "appcd-onprem"
    repo      = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_e1663bb6-71af-552b-a2e5-12546d3dbe59" {
  source      = "./modules/aws_iam_policy"
  description = "IAM Policy for AWS Load Balancer Controller"
  name        = "alb-controller-20251006122339289600000007"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":\"iam:CreateServiceLinkedRole\",\"Condition\":{\"StringEquals\":{\"iam:AWSServiceName\":\"elasticloadbalancing.amazonaws.com\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:DescribeTrustStores\",\"elasticloadbalancing:DescribeTargetHealth\",\"elasticloadbalancing:DescribeTargetGroups\",\"elasticloadbalancing:DescribeTargetGroupAttributes\",\"elasticloadbalancing:DescribeTags\",\"elasticloadbalancing:DescribeSSLPolicies\",\"elasticloadbalancing:DescribeRules\",\"elasticloadbalancing:DescribeLoadBalancers\",\"elasticloadbalancing:DescribeLoadBalancerAttributes\",\"elasticloadbalancing:DescribeListeners\",\"elasticloadbalancing:DescribeListenerCertificates\",\"elasticloadbalancing:DescribeListenerAttributes\",\"elasticloadbalancing:DescribeCapacityReservation\",\"ec2:GetSecurityGroupsForVpc\",\"ec2:GetCoipPoolUsage\",\"ec2:DescribeVpcs\",\"ec2:DescribeVpcPeeringConnections\",\"ec2:DescribeTags\",\"ec2:DescribeSubnets\",\"ec2:DescribeSecurityGroups\",\"ec2:DescribeNetworkInterfaces\",\"ec2:DescribeIpamPools\",\"ec2:DescribeInternetGateways\",\"ec2:DescribeInstances\",\"ec2:DescribeCoipPools\",\"ec2:DescribeAvailabilityZones\",\"ec2:DescribeAddresses\",\"ec2:DescribeAccountAttributes\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"wafv2:GetWebACLForResource\",\"wafv2:GetWebACL\",\"wafv2:DisassociateWebACL\",\"wafv2:AssociateWebACL\",\"waf-regional:GetWebACLForResource\",\"waf-regional:GetWebACL\",\"waf-regional:DisassociateWebACL\",\"waf-regional:AssociateWebACL\",\"shield:GetSubscriptionState\",\"shield:DescribeProtection\",\"shield:DeleteProtection\",\"shield:CreateProtection\",\"iam:ListServerCertificates\",\"iam:GetServerCertificate\",\"cognito-idp:DescribeUserPoolClient\",\"acm:ListCertificates\",\"acm:DescribeCertificate\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ec2:RevokeSecurityGroupIngress\",\"ec2:AuthorizeSecurityGroupIngress\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ec2:CreateSecurityGroup\",\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ec2:CreateTags\",\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"false\"},\"StringEquals\":{\"ec2:CreateAction\":\"CreateSecurityGroup\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ec2:*:*:security-group/*\"},{\"Action\":[\"ec2:DeleteTags\",\"ec2:CreateTags\"],\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"true\",\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ec2:*:*:security-group/*\"},{\"Action\":[\"ec2:RevokeSecurityGroupIngress\",\"ec2:DeleteSecurityGroup\",\"ec2:AuthorizeSecurityGroupIngress\"],\"Condition\":{\"Null\":{\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:CreateTargetGroup\",\"elasticloadbalancing:CreateLoadBalancer\"],\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:DeleteRule\",\"elasticloadbalancing:DeleteListener\",\"elasticloadbalancing:CreateRule\",\"elasticloadbalancing:CreateListener\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"elasticloadbalancing:RemoveTags\",\"elasticloadbalancing:AddTags\"],\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"true\",\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*\"]},{\"Action\":[\"elasticloadbalancing:RemoveTags\",\"elasticloadbalancing:AddTags\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:elasticloadbalancing:*:*:listener/net/*/*/*\",\"arn:aws:elasticloadbalancing:*:*:listener/app/*/*/*\",\"arn:aws:elasticloadbalancing:*:*:listener-rule/net/*/*/*\",\"arn:aws:elasticloadbalancing:*:*:listener-rule/app/*/*/*\"]},{\"Action\":[\"elasticloadbalancing:SetSubnets\",\"elasticloadbalancing:SetSecurityGroups\",\"elasticloadbalancing:SetIpAddressType\",\"elasticloadbalancing:ModifyTargetGroupAttributes\",\"elasticloadbalancing:ModifyTargetGroup\",\"elasticloadbalancing:ModifyLoadBalancerAttributes\",\"elasticloadbalancing:ModifyListenerAttributes\",\"elasticloadbalancing:ModifyIpPools\",\"elasticloadbalancing:ModifyCapacityReservation\",\"elasticloadbalancing:DeleteTargetGroup\",\"elasticloadbalancing:DeleteLoadBalancer\"],\"Condition\":{\"Null\":{\"aws:ResourceTag/elbv2.k8s.aws/cluster\":\"false\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"elasticloadbalancing:AddTags\",\"Condition\":{\"Null\":{\"aws:RequestTag/elbv2.k8s.aws/cluster\":\"false\"},\"StringEquals\":{\"elasticloadbalancing:CreateAction\":[\"CreateTargetGroup\",\"CreateLoadBalancer\"]}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*\",\"arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*\"]},{\"Action\":[\"elasticloadbalancing:RegisterTargets\",\"elasticloadbalancing:DeregisterTargets\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:elasticloadbalancing:*:*:targetgroup/*/*\"},{\"Action\":[\"elasticloadbalancing:SetWebAcl\",\"elasticloadbalancing:SetRulePriorities\",\"elasticloadbalancing:RemoveListenerCertificates\",\"elasticloadbalancing:ModifyRule\",\"elasticloadbalancing:ModifyListener\",\"elasticloadbalancing:AddListenerCertificates\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_e21f61de-10e1-56ac-af3c-6269c2d482d2" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_82337260-27c3-51aa-87b3-108cffca9fa4.arn
  role       = module.stackgen_eebc175f-c339-5fbc-a7ef-83f96dbe693e.name
}

module "stackgen_e2586edb-0f9c-56df-8103-d321aa064c33" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/B2AF2CBCB3EF8145FAF788AA62E612A0:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/B2AF2CBCB3EF8145FAF788AA62E612A0:sub\":\"system:serviceaccount:kube-system:aws-load-balancer-controller-sa\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/B2AF2CBCB3EF8145FAF788AA62E612A0\"}}],\"Version\":\"2012-10-17\"}"
  description           = "IRSA for aws-load-balancer-controller project"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "alb-controller-20240130213123524500000032"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_e2bc9541-eda0-570e-acbb-e40eba3e17a7" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "queryresults"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"logs:StartQuery\",\"logs:GetQueryResults\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_e3cc2dcb-a999-5390-b22c-2974a94be564" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_8db1b774-3ed1-5592-89be-252ce3979e17.arn
  role       = module.stackgen_2a7764ff-e36e-5ce3-8c39-b313b75b17a4.name
}

module "stackgen_e4474042-a70c-5733-9b7f-e5afcf86005f" {
  source                             = "./modules/aws_nat_gateway"
  allocation_id                      = module.stackgen_3df7cbe1-4fdc-56e6-a822-a44b19261786.id
  connectivity_type                  = "public"
  private_ip                         = "10.0.0.86"
  secondary_allocation_ids           = []
  secondary_private_ip_address_count = 0
  secondary_private_ip_addresses     = []
  subnet_id                          = module.stackgen_ca58f9fe-9bb4-53d5-949e-595d9dbe073a.id
  tags = {
    Name             = "retail-store-us-east-1a"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
}

module "stackgen_e467affe-5067-5e3c-96e8-86676d974c11" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
  role       = module.stackgen_71761eff-46ba-5dfd-bf6e-44191a4ed3fd.name
}

module "stackgen_e4764e01-6376-5f25-8455-c924456e527c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = module.stackgen_bbad1ee5-40dc-538e-aeff-f117c26a2252.name
}

module "stackgen_e47f7120-86ff-5ee5-b985-f331dfbf2f04" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1f"
  cidr_block              = "172.31.64.0/20"
  map_public_ip_on_launch = true
  tags                    = {}
  vpc_id                  = module.stackgen_d25a6d89-d552-5559-bfac-46df4f389650.id
}

module "stackgen_e4b16a6a-d4d4-594f-88fd-54a1328f7034" {
  source     = "./modules/aws_iam_group_policy_attachment"
  group      = module.stackgen_f32d66e2-c131-51de-8904-511b356cdd1e.name
  policy_arn = module.stackgen_dec46316-00c9-5857-9f81-a7397a0307d0.arn
}

module "stackgen_e50bceeb-1c07-57de-b3c0-da7d5e76d54f" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"sts:ExternalId\":\"94583\"}},\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::339712749745:root\"}},{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "assume"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"sts:AssumeRole\",\"sts:AssumeRoleWithWebIdentity\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"VisualEditor0\"}]}"
  }]
  max_session_duration = 3600
  name                 = "stackgen-vault"
  path                 = "/"
  permissions_boundary = ""
  tags = {
    created_by    = "sabith"
    do-not-delete = "true"
  }
}

module "stackgen_e5123379-c668-550c-9044-7fa6bc112a54" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "s33lrqt3ynier2yqamyp6dioq4vn6x2l._domainkey.main.dev.appcd.io"
  records                          = ["s33lrqt3ynier2yqamyp6dioq4vn6x2l.dkim.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 1800
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_e5937335-9ae2-5c7e-9c7a-aeac3b1d3ce2" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_852f1f74-b8ef-5a00-a947-ae5d4565233f.name
}

module "stackgen_e59aca69-e934-5c0a-bf5b-9894443441df" {
  source                             = "./modules/aws_launch_template"
  block_device_mappings              = []
  capacity_reservation_specification = []
  cpu_options                        = []
  credit_specification               = []
  default_version                    = 1
  description                        = ""
  disable_api_termination            = false
  ebs_optimized                      = ""
  elastic_gpu_specifications         = []
  elastic_inference_accelerator      = []
  enclave_options                    = []
  hibernation_options                = []
  iam_instance_profile = [{
    arn  = ""
    name = "eks-aaccdcc3-1186-ec63-632e-e55f8bc1abde"
  }]
  image_id                             = "ami-0372948d8ff019232"
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
    instance_metadata_tags      = "disabled"
  }]
  monitoring = [{
    enabled = true
  }]
  name                     = "eks-aaccdcc3-1186-ec63-632e-e55f8bc1abde"
  network_interfaces       = []
  placement                = []
  private_dns_name_options = []
  ram_disk_id              = ""
  security_group_names     = []
  tag_specifications = [{
    resource_type = "volume"
    tags = {
      Name                 = "managed-nodegroup-2"
      created-by           = "retail-store-sample-app"
      "eks:cluster-name"   = "retail-store"
      "eks:nodegroup-name" = "managed-nodegroup-2-20251006123639664000000033"
      environment-name     = "retail-store"
    }
    }, {
    resource_type = "instance"
    tags = {
      Name                 = "managed-nodegroup-2"
      created-by           = "retail-store-sample-app"
      "eks:cluster-name"   = "retail-store"
      "eks:nodegroup-name" = "managed-nodegroup-2-20251006123639664000000033"
      environment-name     = "retail-store"
    }
    }, {
    resource_type = "network-interface"
    tags = {
      Name                 = "managed-nodegroup-2"
      created-by           = "retail-store-sample-app"
      "eks:cluster-name"   = "retail-store"
      "eks:nodegroup-name" = "managed-nodegroup-2-20251006123639664000000033"
      environment-name     = "retail-store"
    }
  }]
  tags = {
    "eks:cluster-name"   = "retail-store"
    "eks:nodegroup-name" = "managed-nodegroup-2-20251006123639664000000033"
  }
  update_default_version = null
  user_data              = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiBhcHBsaWNhdGlvbi9ub2RlLmVrcy5hd3MKCi0tLQphcGlWZXJzaW9uOiBub2RlLmVrcy5hd3MvdjFhbHBoYTEKa2luZDogTm9kZUNvbmZpZwpzcGVjOgogIGNsdXN0ZXI6CiAgICBhcGlTZXJ2ZXJFbmRwb2ludDogaHR0cHM6Ly9GM0Y0OTBCMEJGMTEyNUM0MjU1ODVFMjM3NkFBMDIyMC5ncjcudXMtZWFzdC0xLmVrcy5hbWF6b25hd3MuY29tCiAgICBjZXJ0aWZpY2F0ZUF1dGhvcml0eTogTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUkNWRU5EUVdVeVowRjNTVUpCWjBsSlNVWjJjREo0Y2xGdlpWbDNSRkZaU2t0dldrbG9kbU5PUVZGRlRFSlJRWGRHVkVWVVRVSkZSMEV4VlVVS1FYaE5TMkV6Vm1sYVdFcDFXbGhTYkdONlFXVkdkekI1VGxSRmQwMUVXWGhOYWtrelRWUlNZVVozTUhwT1ZFVjNUVVJSZUUxcVRYbE5WRkpoVFVKVmVBcEZla0ZTUW1kT1ZrSkJUVlJEYlhReFdXMVdlV0p0VmpCYVdFMTNaMmRGYVUxQk1FZERVM0ZIVTBsaU0wUlJSVUpCVVZWQlFUUkpRa1IzUVhkblowVkxDa0Z2U1VKQlVVUm9ka280UzNZeVVVbHZWMDVuV1cwelMwaFNNbkZqZFhwREszbHliVUV4VFZKNk9XWjROV1p0VG5GQlQzWnZjVFJ4UXpJMlIwZG1kMHdLZEVGVVZsZGhMelpuZDJOSmIyMW5iRlpPUkVoRGN6ZFNWemRtVmtzdmNGcGFNblJyVkZsdmVrRnJRV28zYUZZMVV6ZEtaRE5NUlhkTGNWbEVOMDlIY1FwSFRHTXJkVmh6WVRkUmExWjFjRzFJV1hkTFJ6TnVXazFEV0VKb2RpOXRjbFJpVW5CNlNHRlVVVEk1ZG1GVFpreHBiVGhVWkUxdVFsUmxLemRhT1c0NENsY3hSMFpaVlZCS1JIb3dWbmh4UWxCbU5ITXlTV2N4YTNoSVFuWmFhWHBJYVcxb016VlNPRlpaWmpGUWJFVkNVVzVOVkRWeFltVlhUa3RLTTB0V2JHTUtNQ3RuV1VwVVozQnNUekJGWVRKVWRsbEVRV2xQTVcxck4zTmlWazlRVjJOU1F5dEhUM0pVTUZvM2FWY3dTemwyYkZrM1VGZHlRa3AwZG1wd05VWlJiQXA0YlZNMlZ6VmFUMmtyWkVVNFZGcDBaVmR5TjFFMGRHMUVjRmQwUVdkTlFrRkJSMnBYVkVKWVRVRTBSMEV4VldSRWQwVkNMM2RSUlVGM1NVTndSRUZRQ2tKblRsWklVazFDUVdZNFJVSlVRVVJCVVVndlRVSXdSMEV4VldSRVoxRlhRa0pSWjNOdlQxSTFOVEJCUVV4UlkwWkJNalYzTUVWblJHZGlkV3hVUVZZS1FtZE9Wa2hTUlVWRWFrRk5aMmR3Y21SWFNteGpiVFZzWkVkV2VrMUJNRWREVTNGSFUwbGlNMFJSUlVKRGQxVkJRVFJKUWtGUlFsWXdZakJLVTBaeVR3cEtlSEYzTVc5RlQwRndkMFZ6UkdKSVlYb3hVMlYyTHpSRlpFRjFZbEZqTjBWWk4xbzVZVkpoTjBoU016TXdZWFUwTlc4eldFbHlkSE12WTJsQ0sybHJDbEJQYVVOTWFVSlZibFpYV1ROSWRXTTBMekVyZW5BNWJXZDBiSEZETVVRcmFtYzNVSE56ZUhoVlpXSlpRVEUxVVU5NkwyTlVNMVF5YkhwNmJGSTRUWE1LYkVSUmEweExVRlJ5TTAwd01VUXZSWFJaYzJaVVowYzRZalJqUkZabmNuTlFkamRIVDBWUmVHeENNa2RIYUU5ck1ESXlORlJIT0c0MVpYUTVOa1pEWVFwdU5FZ3ZLMGt5YlZCRmVuRXdkMkpRZGtOak9YTjBWekp5ZDJGMFF6WlpXRWhwYmtkNk5EUkdhams1ZUdoQ1VqSlZRbWhSZEdKU01YWktTMFZDYUdJdkNqaEdNV0kxVGxCb1ZVazFSeTlpZUUxdFJFWkdiR1JGUVZCb05XZEpaemh2YlU4d2VVdEhTUzlYVW5CaE0zSkJiU3RXYjNGdE15dDNkbmRRTlZoVVVEa0tkVGRCUlhWeGVVdzNla05wQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLCiAgICBjaWRyOiAxNzIuMjAuMC4wLzE2CiAgICBuYW1lOiByZXRhaWwtc3RvcmUKICBrdWJlbGV0OgogICAgY29uZmlnOgogICAgICBtYXhQb2RzOiAyOQogICAgICBjbHVzdGVyRE5TOgogICAgICAtIDE3Mi4yMC4wLjEwCiAgICBmbGFnczoKICAgIC0gIi0tbm9kZS1sYWJlbHM9ZWtzLmFtYXpvbmF3cy5jb20vc291cmNlTGF1bmNoVGVtcGxhdGVWZXJzaW9uPTEsZWtzLmFtYXpvbmF3cy5jb20vbm9kZWdyb3VwLWltYWdlPWFtaS0wMzcyOTQ4ZDhmZjAxOTIzMixla3MuYW1hem9uYXdzLmNvbS9jYXBhY2l0eVR5cGU9T05fREVNQU5ELGVrcy5hbWF6b25hd3MuY29tL25vZGVncm91cD1tYW5hZ2VkLW5vZGVncm91cC0yLTIwMjUxMDA2MTIzNjM5NjY0MDAwMDAwMDMzLGVrcy5hbWF6b25hd3MuY29tL3NvdXJjZUxhdW5jaFRlbXBsYXRlSWQ9bHQtMGI4MzRiMWMzMTg2MzRkNjAiCgotLS8vLS0="
  vpc_security_group_ids = [
    module.stackgen_fe56c635-6ab8-5e34-afad-bcaf895afc4b.id,
  ]
}

module "stackgen_e5f7b4ce-008c-55aa-a207-90fe1156d57c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = module.stackgen_552d7ce3-560a-56d3-80dd-e6e2f012a352.name
}

module "stackgen_e693e6a4-7825-4335-b7b9-a227347f6759" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = null
  map_public_ip_on_launch = false
  tags                    = {}
  vpc_id                  = module.stackgen_712f0693-28f2-4aa3-89b2-575b47fe1642.vpc_id
}

module "stackgen_e6dbdd66-9d6e-5804-831f-1be94d6061fa" {
  source    = "./modules/aws_iam_role_policy"
  name      = "engineering-eks-cluster"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:CreateLogGroup\"],\"Effect\":\"Deny\",\"Resource\":\"*\"}]}"
  role      = module.stackgen_2a7764ff-e36e-5ce3-8c39-b313b75b17a4.name
  role_type = "custom"
}

module "stackgen_e6f14303-79d0-5632-a8a9-71db0b10257f" {
  source    = "./modules/aws_iam_role_policy"
  name      = "eks-cluster-access"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"eks:DescribeCluster\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:eks:us-west-2:339712749745:cluster/developer-eks\"},{\"Action\":\"eks:List*\",\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  role      = module.stackgen_6940bf2e-3b95-50ce-b1bd-47aef747c918.name
  role_type = "custom"
}

module "stackgen_e71ceeff-055b-5af2-abe6-60a60178f09e" {
  source      = "./modules/aws_iam_policy"
  description = "Provides permissions to manage EBS volumes via the container storage interface driver"
  name        = "AmazonEKS_EBS_CSI_Policy-20240313011648169700000003"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"ec2:ModifyVolume\",\"ec2:DetachVolume\",\"ec2:DescribeVolumesModifications\",\"ec2:DescribeVolumes\",\"ec2:DescribeTags\",\"ec2:DescribeSnapshots\",\"ec2:DescribeInstances\",\"ec2:DescribeAvailabilityZones\",\"ec2:CreateSnapshot\",\"ec2:AttachVolume\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ec2:CreateTags\",\"Condition\":{\"StringEquals\":{\"ec2:CreateAction\":[\"CreateVolume\",\"CreateSnapshot\"]}},\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:ec2:*:*:volume/*\",\"arn:aws:ec2:*:*:snapshot/*\"]},{\"Action\":\"ec2:DeleteTags\",\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:ec2:*:*:volume/*\",\"arn:aws:ec2:*:*:snapshot/*\"]},{\"Action\":\"ec2:CreateVolume\",\"Condition\":{\"StringLike\":{\"aws:RequestTag/ebs.csi.aws.com/cluster\":\"true\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ec2:CreateVolume\",\"Condition\":{\"StringLike\":{\"aws:RequestTag/CSIVolumeName\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ec2:CreateVolume\",\"Condition\":{\"StringLike\":{\"aws:RequestTag/kubernetes.io/cluster/*\":\"owned\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ec2:DeleteVolume\",\"Condition\":{\"StringLike\":{\"ec2:ResourceTag/ebs.csi.aws.com/cluster\":\"true\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ec2:DeleteVolume\",\"Condition\":{\"StringLike\":{\"ec2:ResourceTag/CSIVolumeName\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ec2:DeleteVolume\",\"Condition\":{\"StringLike\":{\"ec2:ResourceTag/kubernetes.io/cluster/*\":\"owned\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ec2:DeleteVolume\",\"Condition\":{\"StringLike\":{\"ec2:ResourceTag/kubernetes.io/created-for/pvc/name\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ec2:DeleteSnapshot\",\"Condition\":{\"StringLike\":{\"ec2:ResourceTag/CSIVolumeSnapshotName\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ec2:DeleteSnapshot\",\"Condition\":{\"StringLike\":{\"ec2:ResourceTag/ebs.csi.aws.com/cluster\":\"true\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    appcd_module  = "vpc"
    maintained_by = "support@appcd.com"
  }
}

module "stackgen_e730147f-c77c-5251-9cc3-2bacd9df3caa" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess"
  role       = module.stackgen_a01b96e0-5419-58db-ae25-4028eeb95829.name
}

module "stackgen_e75c73a8-0830-5ebf-b3db-92386e7d1c53" {
  source      = "./modules/aws_iam_policy"
  description = "Allow AWS Step Functions to invoke Lambda functions on your behalf"
  name        = "LambdaInvokeScopedAccessPolicy-5e674425-481e-4754-93b6-448b886c2710"
  path        = "/service-role/"
  policy      = "{\"Statement\":[{\"Action\":[\"lambda:InvokeFunction\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:lambda:us-west-2:339712749745:function:stackgen_ad1a76-function:*\"]},{\"Action\":[\"lambda:InvokeFunction\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:lambda:us-west-2:339712749745:function:stackgen_ad1a76-function\"]}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_e7c96bfb-2406-59db-80d4-2a5801d1a145" {
  source      = "./modules/aws_iam_policy"
  description = "IAM Policy for external-secrets operator"
  name        = "external-secrets-20240120191851670200000005"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":\"ssm:DescribeParameters\",\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ssm:GetParameters\",\"ssm:GetParameter\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ssm:*:*:parameter/*\"},{\"Action\":\"secretsmanager:ListSecrets\",\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"secretsmanager:ListSecretVersionIds\",\"secretsmanager:GetSecretValue\",\"secretsmanager:GetResourcePolicy\",\"secretsmanager:DescribeSecret\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:secretsmanager:*:*:secret:*\"},{\"Action\":\"kms:Decrypt\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:kms:*:*:key/*\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_e7da5ae7-3b7b-5af9-9bfc-dad2bc61c94c" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":[\"sts:AssumeRole\",\"sts:TagSession\"],\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"eks.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Allows access to other AWS service resources that are required to operate Auto Mode clusters managed by EKS."
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AmazonEKSAutoClusterRole"
  path                  = "/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_e7fa9b79-d1af-5adc-ba06-2d0275bbed84" {
  source  = "./modules/aws_cloudfront_origin_access_identity"
  comment = "OAI for prashant-test-august"
}

module "stackgen_e89d9453-97a9-5e99-b043-2e4ad44687a8" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_04183e2c-07be-5c10-a7d6-4eee7f2143e5.arn
  role       = module.stackgen_5d5e0065-2dc1-5150-b8f3-6fb468fcd651.name
}

module "stackgen_e8a71ac7-bf19-5f45-8251-3b1076eac173" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"mq.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Allows Amazon MQ to call AWS services on your behalf"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForAmazonMQ"
  path                  = "/aws-service-role/mq.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_e9873c97-13cd-5a5a-9133-e4aa0ddfade4" {
  source    = "./modules/aws_iam_role_policy"
  name      = "S3AccessPolicy"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:GetObject\",\"s3:PutObject\",\"s3:ListBucket\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::newbucket-name\",\"arn:aws:s3:::newbucket-name/*\"]}]}"
  role      = module.stackgen_8b667ba9-affa-5d86-a018-c1fc6fd2a6d9.name
  role_type = "custom"
}

module "stackgen_ea1bf5b3-a357-56d0-bed5-f7cc44f515cd" {
  source = "./modules/aws_route_table"
  route = [{
    carrier_gateway_id         = ""
    cidr_block                 = "0.0.0.0/0"
    core_network_arn           = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    gateway_id                 = "igw-0aa78dc698a7b3828"
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
  vpc_id = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_eaea0fe9-2f8f-5797-8e89-2fef4a04d4c1" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_8befba9b-e145-5e71-94e9-f5845cc38d44.arn
  role       = module.stackgen_19ba4c86-7702-54c7-8442-00aafed0df71.name
}

module "stackgen_eaf60a62-b607-543d-9748-3b5e103d0d01" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_fdd7bdab-c110-508d-9e80-db8191e8feb6.arn
  role       = module.stackgen_7db562c2-d100-517e-9c7f-49e634bb2c49.name
}

module "stackgen_eb36b5a6-83ef-5be2-bba5-9e251d6ecbe0" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_582656da-e3ca-5e11-8e46-0b59dc55abc5.arn
  role       = module.stackgen_2d919c3d-0fec-55f6-8e0a-eb4a6a16cc6d.name
}

module "stackgen_eb72ead6-cac7-559a-8b9d-be1eed6fe356" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Sid\":\"EKSNodeAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = "EKS managed node group IAM role"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "default_node_group-eks-node-group-20240607172356880200000001"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_ebd07ac5-007e-575b-8fd4-58f315a13f6c" {
  source    = "./modules/aws_iam_role_policy"
  name      = "ip-monitoring-lambda-policy"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:CreateLogGroup\",\"logs:CreateLogStream\",\"logs:PutLogEvents\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:logs:*:*:*\"},{\"Action\":[\"ec2:DescribeRegions\",\"ec2:DescribeSubnets\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
  role      = module.stackgen_beb05c80-d90e-5dcd-9eb6-4fd2fe3fa32f.name
  role_type = "custom"
}

module "stackgen_ec81b5fe-4830-53c8-a7e2-8dd6f4c4cd06" {
  source                          = "./modules/aws_cloudfront_distribution"
  aliases                         = []
  comment                         = null
  continuous_deployment_policy_id = ""
  custom_error_response           = []
  default_cache_behavior = [{
    allowed_methods           = ["GET", "HEAD"]
    cache_policy_id           = ""
    cached_methods            = ["GET", "HEAD"]
    compress                  = true
    default_ttl               = 86400
    field_level_encryption_id = ""
    forwarded_values = [{
      cookies = [{
        forward           = "none"
        whitelisted_names = []
      }]
      headers                 = []
      query_string            = false
      query_string_cache_keys = []
    }]
    function_association = []
    grpc_config = [{
      enabled = false
    }]
    lambda_function_association = []
    max_ttl                     = 31536000
    min_ttl                     = 0
    origin_request_policy_id    = ""
    realtime_log_config_arn     = ""
    response_headers_policy_id  = ""
    smooth_streaming            = false
    target_origin_id            = "S3-prashant-test20-1993"
    trusted_key_groups          = []
    trusted_signers             = []
    viewer_protocol_policy      = "redirect-to-https"
  }]
  default_root_object    = "index.html"
  enabled                = false
  http_version           = "http2"
  is_ipv6_enabled        = false
  logging_config         = []
  ordered_cache_behavior = []
  origin = [{
    connection_attempts      = 3
    connection_timeout       = 10
    custom_header            = []
    custom_origin_config     = []
    domain_name              = "prashant-test20-1993.s3.us-east-1.amazonaws.com"
    origin_access_control_id = "E1JBJG6HLQ3JBV"
    origin_id                = "S3-prashant-test20-1993"
    origin_path              = ""
    origin_shield            = []
    s3_origin_config         = []
    vpc_origin_config        = []
  }]
  price_class = "PriceClass_All"
  restrictions = [{
    geo_restriction = [{
      locations        = []
      restriction_type = "none"
    }]
  }]
  staging = false
  tags    = {}
  viewer_certificate = [{
    acm_certificate_arn            = "arn:aws:acm:us-east-1:339712749745:certificate/d3389a2d-1171-43a7-843a-cded95a3bac7"
    cloudfront_default_certificate = false
    iam_certificate_id             = ""
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }]
  wait_for_deployment = true
  web_acl_id          = ""
}

module "stackgen_ecd9844b-ee7f-57d2-9474-ba6b4ca84a23" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Reader"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:Get*\",\"s3:List*\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::cross-region-default\",\"arn:aws:s3:::cross-region-default/*\"],\"Sid\":\"ab39fb0b00074ec18f450207cd17d81f\"}]}"
  role      = module.stackgen_b3d922bd-0101-5484-8fcd-91b9b93a6ea6.name
  role_type = "custom"
}

module "stackgen_ed092f1f-68e3-53e5-9a03-30dd2c3b9542" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_1e4710ad-6363-57e8-8eca-f137f5cb0fa1.arn
  role       = module.stackgen_880be9b2-8513-53d7-94ad-0d769b00d2e4.name
}

module "stackgen_ed5ee041-9c27-54f9-9621-70e27ae15d08" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "customer-sks-202502-eks_4067990795380418201"
  name_prefix = ""
  path        = "/"
  role        = null
  tags = {
    "karpenter.k8s.aws/ec2nodeclass"                = "default"
    "karpenter.sh/managed-by"                       = "customer-sks-202502-eks"
    "kubernetes.io/cluster/customer-sks-202502-eks" = "owned"
    "topology.kubernetes.io/region"                 = "us-west-2"
  }
}

module "stackgen_ed663e11-ae79-5900-b8a2-003f765caf34" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSServiceRoleForAmazonEKSNodegroup"
  role       = module.stackgen_9d972170-fbc1-5a4d-878a-bea3bdb8e0c3.name
}

module "stackgen_ed7a64aa-82ba-5738-8c09-98a743bf8fd6" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_d2b54a32-21a6-5843-8a31-6bbf034dd917.arn
  role       = module.stackgen_1e03b169-771b-5ab5-8d09-0cabb903a156.name
}

module "stackgen_edadc593-6390-5f1f-a41f-a8ccd8000a75" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:sts::339712749745:assumed-role/AWSReservedSSO_AdministratorAccess_90ce8fbcbe3cc328/yusuf@appcd.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Testing cross account access with this role. This role will assume into another role in another account."
  force_detach_policies = false
  inline_policy = [{
    name   = "AllowAssumeToDemo"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::180217099948:role/test-cross-account-role\",\"Sid\":\"AllowAssume\"}]}"
    }, {
    name   = "AllowCrossAccountS3Access"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:Get*\",\"s3:List*\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::cross-region-default\",\"arn:aws:s3:::cross-region-default/*\"]}]}"
  }]
  max_session_duration = 3600
  name                 = "cross-account-assumer"
  path                 = "/"
  permissions_boundary = ""
  tags = {
    created_by = "yusuf"
    delete_me  = "true"
  }
}

module "stackgen_edd19903-9222-5fc5-8d98-8fb1a904a03e" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"lambda.amazonaws.com\",\"edgelambda.amazonaws.com\"]}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "BasicAuthEdgeFunction-role-vdwodkf9"
  path                  = "/service-role/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_ee24170e-a4ef-5732-a097-0802174be992" {
  source              = "./modules/aws_s3_bucket"
  bucket              = "prashant-test20-1993"
  force_destroy       = null
  object_lock_enabled = false
  tags = {
    appstack = "cloudfront2"
  }
}

module "stackgen_eebc175f-c339-5fbc-a7ef-83f96dbe693e" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"states.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "StepFunctions-MyStateMachine-rk9v4paqe-role-8ferswjs1"
  path                  = "/service-role/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_eee173e9-844a-576b-a467-ffef35abdbe3" {
  source       = "./modules/aws_db_parameter_group"
  description  = "Managed by Terraform"
  family       = "aurora-mysql8.0"
  name         = "retail-store-catalog-20251006122337417700000004"
  name_prefix  = "retail-store-catalog-"
  parameter    = []
  skip_destroy = false
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_ef6e6fe3-cb3e-58d2-9a76-ff1c6daffecf" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:sts::339712749745:assumed-role/stackgen-system-access/stackgen-access-20250926162654\"},\"Sid\":\"AssumeRolePermission\"}],\"Version\":\"2012-10-17\"}"
  description           = "Role for appstack deployment: e2e test "
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "stackgen-managed-cc5503d2-7b84-4454-9b45-7694e442f353"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created-on           = "2025-09-26T16:26:54Z"
    stackgen-appstack-id = "cc5503d2-7b84-4454-9b45-7694e442f353"
    stackgen-deploy-id   = "343445b5-6289-40dd-852c-37ae6cfd4f0e"
    stackgen-managed     = "true"
    stackgen-reason      = "e2e test"
  }
}

module "stackgen_ef725fcd-4254-5f21-b46d-12184a3e4864" {
  source      = "./modules/aws_iam_policy"
  description = "IAM policy for S3 bucket access"
  name        = "appcd-blobs-sks-artifacts-s3-mount-policy"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"s3:ListBucket\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::appcd-blobs-sks-artifacts\"],\"Sid\":\"MountpointFullBucketAccess\"},{\"Action\":[\"s3:GetObject\",\"s3:PutObject\",\"s3:AbortMultipartUpload\",\"s3:DeleteObject\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::appcd-blobs-sks-artifacts/*\"],\"Sid\":\"MountpointFullObjectAccess\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    appcd_module  = "vpc"
    created_for   = "sks"
    maintained_by = "support@appcd.com"
  }
}

module "stackgen_ef8d42af-20aa-5e33-bbf5-5798ca6bf5d2" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_553bc7df-4f50-52c5-9f05-3f914d5a1b2f.arn
  role       = module.stackgen_2ec6e0a9-ee21-57d8-933a-5e70733b6d44.name
}

module "stackgen_efa17626-f47d-5472-b82c-6a4b0568c118" {
  source      = "./modules/aws_db_subnet_group"
  description = "For Aurora cluster retail-store-orders"
  name        = "retail-store-orders"
  name_prefix = ""
  subnet_ids = [
    module.stackgen_9d425fc1-ba64-5441-a24a-bceed3c5fff0.id,
    module.stackgen_a4632096-f217-5670-8040-5afc23611f74.id,
    module.stackgen_a3505971-d83d-5873-a44c-5b6f1898daa8.id,
  ]
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
}

module "stackgen_f03b85b0-7f69-5186-bc12-bf213f3e87d0" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = module.stackgen_b85d53be-d3b0-59a3-be06-3738f279dfbc.name
}

module "stackgen_f09c6d11-f853-545f-9601-8285191aa60a" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "stage-email-sender"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":\"ses:SendRawEmail\",\"Condition\":{\"StringLike\":{\"ses:FromAddress\":\"*@support.stage.dev.stackgen.com\"}},\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"SendEmail\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    namespace = "appcd-stage"
    repo      = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_f0ce5767-0f96-5d02-b24d-edea88e881c4" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"replicator.lambda.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForLambdaReplicator"
  path                  = "/aws-service-role/replicator.lambda.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_f0e0bc09-8d3f-5f63-bfc1-aeb5a3e3ef3c" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064:aud\":\"sts.amazonaws.com\",\"oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064:sub\":\"system:serviceaccount:karpenter:karpenter\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::339712749745:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/C2D453CC2FEF8CF48061EACC72F81064\"}}],\"Version\":\"2012-10-17\"}"
  description           = "IRSA for Karpenter"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "karpenter-20250404044140965400000005"
  path                  = "/"
  permissions_boundary  = ""
  tags = {
    created_for = "developer"
    repository  = "https://github.com/appcd-dev/appcd-dist"
  }
}

module "stackgen_f11f4c26-9f50-5aa1-aa78-62aec9c40e87" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = module.stackgen_d1db53cc-1c45-5a24-8f14-a8a4d8f018fd.name
}

module "stackgen_f14bfa4a-0e71-5ac3-8ccb-ed68632912b9" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "support.unstable.dev.stackgen.com"
  records                          = ["v=spf1 include:amazonses.com ~all"]
  set_identifier                   = ""
  ttl                              = 300
  type                             = "TXT"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_f196964c-90f5-5532-9204-20c221a9906c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_d20b7dd4-d97e-551b-a53c-73e5e54b9bcb.arn
  role       = module.stackgen_3a1ab668-99a7-57f2-bed3-9b3fc7dde311.name
}

module "stackgen_f2117ddc-0bb2-59ee-9eff-0702ad1248cb" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "support.playground.dev.appcd.io"
  records                          = ["v=spf1 include:amazonses.com ~all"]
  set_identifier                   = ""
  ttl                              = 300
  type                             = "TXT"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_f2130e8c-4dd6-52e9-9a5a-4e55516302f4" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_bbad1ee5-40dc-538e-aeff-f117c26a2252.name
}

module "stackgen_f23346a1-a044-59c0-8c6c-e134f1d9e3a9" {
  source    = "./modules/aws_iam_role_policy"
  name      = "developer-eks-cluster"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:CreateLogGroup\"],\"Effect\":\"Deny\",\"Resource\":\"*\"}]}"
  role      = module.stackgen_880be9b2-8513-53d7-94ad-0d769b00d2e4.name
  role_type = "custom"
}

module "stackgen_f2e69190-5def-5fdf-bb9c-ce263365a0c1" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = module.stackgen_852f1f74-b8ef-5a00-a947-ae5d4565233f.name
}

module "stackgen_f2ec2057-db7a-5adf-9c02-f46ce98c324e" {
  source     = "./modules/aws_iam_user_policy_attachment"
  policy_arn = module.stackgen_e152d8a7-0fc3-57a6-bee8-6163ccae99d5.arn
  user       = module.stackgen_746f36ad-514b-5599-9954-c80a64d2ff7d.name
}

module "stackgen_f328a378-9290-5868-8934-c40798f52719" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_8db1b774-3ed1-5592-89be-252ce3979e17.arn
  role       = module.stackgen_2a7764ff-e36e-5ce3-8c39-b313b75b17a4.name
}

module "stackgen_f32d66e2-c131-51de-8904-511b356cdd1e" {
  source = "./modules/aws_iam_group"
  name   = "terraform-cloud-demo-env"
  path   = "/"
}

module "stackgen_f336736d-79e5-5051-b35f-f8590e490d0f" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.stackgen_c33f0deb-84a5-59d2-ad11-f54a80d445d0.name
}

module "stackgen_f34dac36-0b09-570a-aca8-79dfd1772d18" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "azure.dev.appcd.io"
  records                          = ["ns1-36.azure-dns.com.", "ns2-36.azure-dns.net.", "ns3-36.azure-dns.org.", "ns4-36.azure-dns.info."]
  set_identifier                   = ""
  ttl                              = 300
  type                             = "NS"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_f3800c1a-67bf-57af-bfb4-bd636a89f2eb" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-ingressn-ingressn-d40c055cd3-ed9f7678f3083a51.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "redirect-test.dev.appcd.io"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_f4ce104c-19fd-5711-89ad-dc477a994d01" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = module.stackgen_984453ee-883f-5434-bacf-95de97e68779.name
}

module "stackgen_f4ffba68-b47a-5d39-9401-21c2386bab06" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "support.stage.dev.stackgen.com"
  records                          = ["v=spf1 include:amazonses.com ~all"]
  set_identifier                   = ""
  ttl                              = 300
  type                             = "TXT"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_f61f8b97-5a35-5c05-9b5d-32bbc6a5a1ae" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonECSServiceRolePolicy"
  role       = module.stackgen_0f568353-d06e-5022-8748-7ea557205d2c.name
}

module "stackgen_f63463b1-30b7-58b9-95a7-a669ed91bb38" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"globalaccelerator.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
  description           = "Allows Global Accelerator to call AWS services on customer's behalf"
  force_detach_policies = false
  inline_policy         = []
  max_session_duration  = 3600
  name                  = "AWSServiceRoleForGlobalAccelerator"
  path                  = "/aws-service-role/globalaccelerator.amazonaws.com/"
  permissions_boundary  = ""
  tags                  = {}
}

module "stackgen_f6f27325-530f-5f11-9772-a8b573eafb87" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2SpotFleetTaggingRole"
  role       = module.stackgen_758705b8-cc62-5629-bedc-ef952fe15a21.name
}

module "stackgen_f6fd2586-8822-5ae1-9273-45642b9b27a3" {
  source      = "./modules/aws_iam_instance_profile"
  name        = "eks-node-role"
  name_prefix = ""
  path        = "/"
  role        = module.stackgen_c33f0deb-84a5-59d2-ad11-f54a80d445d0.name
  tags        = {}
}

module "stackgen_f7bc51fe-aa34-5543-81d6-7203f1757ee6" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_dfbfbdda-35e7-50f3-ad6f-30d4808ec839.arn
  role       = module.stackgen_c2eff8b1-c67b-5421-b877-2726bbb5f57f.name
}

module "stackgen_f7e97fc2-46a2-5fa7-8ed7-e3ec5294ac1d" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.stackgen_3be52c00-188b-55fc-987f-484b62526b7e.name
}

module "stackgen_f81fb3da-1d5a-5ec2-8368-1fa4c1e291f0" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "znofkewad6o366xebettsdkk3tmw44bt._domainkey.playground.dev.appcd.io"
  records                          = ["znofkewad6o366xebettsdkk3tmw44bt.dkim.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 1800
  type                             = "CNAME"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_f82398e6-17d6-474b-84ea-491a6b79bae8" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = null
  map_public_ip_on_launch = false
  tags                    = {}
  vpc_id                  = null
}

module "stackgen_f8e4110a-89f6-5a64-bc92-0cce11523b05" {
  source                             = "./modules/aws_rds_cluster"
  availability_zones                 = ["us-east-1a", "us-east-1b", "us-east-1c"]
  backup_retention_period            = 7
  cluster_identifier                 = "retail-store-orders"
  copy_tags_to_snapshot              = false
  database_name                      = "orders"
  db_subnet_group_name               = "retail-store-orders"
  enable_global_write_forwarding     = null
  enable_local_write_forwarding      = null
  enabled_cloudwatch_logs_exports    = []
  engine                             = "aurora-postgresql"
  engine_mode                        = "provisioned"
  engine_version                     = "15.10"
  global_cluster_identifier          = ""
  kms_key_id                         = "arn:aws:kms:us-east-1:339712749745:key/102d37c1-0438-43b9-a8cc-8302cfa365cb"
  master_password                    = var.master_password_f8e4110a-89f6-5a64-bc92-0cce11523b05
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
    module.stackgen_19ba0129-0dad-513b-ab75-bbc991664bf0.id,
  ]
}

module "stackgen_f952c79e-3192-54e0-89a2-0382e7c810e5" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSComputePolicy"
  role       = module.stackgen_e7da5ae7-3b7b-5af9-9bfc-dad2bc61c94c.name
}

module "stackgen_f9b8f80b-f954-58e6-acbf-007259761592" {
  source = "./modules/aws_internet_gateway"
  tags = {
    Name             = "retail-store"
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  vpc_id = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_f9d0d6bf-b8a7-53b6-bb85-8070643ef314" {
  source      = "./modules/aws_iam_policy"
  description = "Policy for EKS cluster access"
  name        = "evaluation-eks-access"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"eks:DescribeCluster\",\"eks:ListClusters\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"eks:AccessKubernetesApi\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:eks:us-west-2:339712749745:cluster/appcd-unstable\"}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_fa0b0a4e-a2d9-5530-a8af-8a64b6ee970d" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-nginxing-nginxing-5bcc97d528-8c5ddc36e39e5068.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "traces-collector-stackgen-observe.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_fa16772f-5e83-5f83-9b41-d443b19840d1" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"eks.amazonaws.com\"},\"Sid\":\"EKSClusterAssumeRole\"}],\"Version\":\"2012-10-17\"}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "on-prem-eks-cluster"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:CreateLogGroup\"],\"Effect\":\"Deny\",\"Resource\":\"*\"}]}"
  }]
  max_session_duration = 3600
  name                 = "on-prem-eks-cluster-20240313011648169000000002"
  path                 = "/"
  permissions_boundary = ""
  tags = {
    appcd_module  = "vpc"
    maintained_by = "support@appcd.com"
  }
}

module "stackgen_fa4abc3f-354b-5e16-96d2-523f448fd178" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonElasticFileSystemServiceRolePolicy"
  role       = module.stackgen_c878a175-e16e-5cd1-946f-5fca170f34fc.name
}

module "stackgen_fad5e5d4-937e-536a-9c21-694cad76c66e" {
  source      = "./modules/aws_security_group"
  description = "EKS created security group applied to ENI that is attached to EKS Control Plane master nodes, as well as any managed workloads."
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = []
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = true
    to_port          = 0
  }]
  name                   = "eks-cluster-sg-retail-store-1247604631"
  revoke_rules_on_delete = null
  tags = {
    Name                                 = "eks-cluster-sg-retail-store-1247604631"
    created-by                           = "retail-store-sample-app"
    environment-name                     = "retail-store"
    "kubernetes.io/cluster/retail-store" = "owned"
  }
  timeouts = null
  vpc_id   = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_fc1a352d-cbb5-54b7-a1de-2fdf6a81b249" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AutoScalingServiceRolePolicy"
  role       = module.stackgen_a7224fb9-2376-5c48-81b3-14324b0ca906.name
}

module "stackgen_fc3a399e-1bc4-5566-82d4-07048c565ef3" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-east-1c"
  cidr_block              = "172.31.16.0/20"
  map_public_ip_on_launch = true
  tags                    = {}
  vpc_id                  = module.stackgen_d25a6d89-d552-5559-bfac-46df4f389650.id
}

module "stackgen_fc3ab742-d440-584b-95be-53ecea215ce7" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = module.stackgen_6fac6601-e034-5bd3-a7db-6d84742d872a.name
}

module "stackgen_fd06ceba-1079-5877-8be4-e097549ba744" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = module.stackgen_0ccaae47-39ad-58d1-b9d9-c97e70657142.name
}

module "stackgen_fd345d6b-f16a-553c-b5a0-ecdb7d41d9ea" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "appcd.dev.appcd.io"
  records                          = ["10 feedback-smtp.us-west-2.amazonses.com"]
  set_identifier                   = ""
  ttl                              = 300
  type                             = "MX"
  zone_id                          = "/hostedzone/Z09643463NTTOAHGOLJ4I"
}

module "stackgen_fd47add1-ae77-5dfa-8983-0cc077581522" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-ingressn-ingressn-efb5f6ecf7-a04f395ff369e7c5.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "ops.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_fd6e1cff-5082-48ba-8249-dee08ec26ba1" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = null
  map_public_ip_on_launch = false
  tags                    = {}
  vpc_id                  = module.stackgen_151b221b-a95a-4244-94d5-a8d51e5f5a45.vpc_id
}

module "stackgen_fd8adac2-624b-458e-b5e9-e862d4038714" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = null
  map_public_ip_on_launch = false
  tags                    = {}
  vpc_id                  = null
}

module "stackgen_fd9aca22-b6c7-5771-b6b8-c8f569141558" {
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
  revoke_rules_on_delete = null
  tags = {
    created-by       = "retail-store-sample-app"
    environment-name = "retail-store"
  }
  timeouts = null
  vpc_id   = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_fdc23867-b8be-5ee6-bb7d-df1a01d6a863" {
  source    = "./modules/aws_iam_role_policy"
  name      = "sks-log-muncher-s3-policy"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:ListBucket\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::stackgen-main-sks-exporter-test\",\"Sid\":\"ListObjectsInBucket\"},{\"Action\":[\"s3:PutObject\",\"s3:GetObject\",\"s3:DeleteObject\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::stackgen-main-sks-exporter-test/*\",\"arn:aws:s3:::stackgen-main-sks-exporter-test/**/*\"],\"Sid\":\"ManageBucketObjects\"},{\"Action\":[\"kms:GenerateDataKey\",\"kms:Decrypt\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"KMSPermissions\"}]}"
  role      = module.stackgen_620a4299-b645-5deb-b155-428d1e9660e3.name
  role_type = "custom"
}

module "stackgen_fdd7bdab-c110-508d-9e80-db8191e8feb6" {
  source      = "./modules/aws_iam_policy"
  description = "IAM Policy for AWS Fluentbit"
  name        = "aws-for-fluent-bit-20240801181410915000000001"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":\"logs:PutLogEvents\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:logs:us-west-2:339712749745:log-group:*:log-stream:*\",\"Sid\":\"PutLogEvents\"},{\"Action\":[\"logs:PutRetentionPolicy\",\"logs:DescribeLogStreams\",\"logs:DescribeLogGroups\",\"logs:CreateLogStream\",\"logs:CreateLogGroup\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:logs:us-west-2:339712749745:log-group:*:*\",\"Sid\":\"CreateCWLogs\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    appcd_module  = "vpc"
    created_for   = "on-prem"
    maintained_by = "support@appcd.com"
  }
}

module "stackgen_fe27bcc6-9400-5bad-b596-dae8f294f807" {
  source = "./modules/aws_glue_catalog_database"
  create_table_default_permission = [{
    permissions = ["ALL"]
    principal = [{
      data_lake_principal_identifier = "IAM_ALLOWED_PRINCIPALS"
    }]
  }]
  description        = ""
  federated_database = []
  name               = "default"
  parameters         = {}
  tags               = {}
  target_database    = []
}

module "stackgen_fe56c635-6ab8-5e34-afad-bcaf895afc4b" {
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
    security_groups  = ["sg-08fcf71e7ff9e5810"]
    self             = false
    to_port          = 0
    }, {
    cidr_blocks      = []
    description      = "Cluster API to node 4443/tcp webhook"
    from_port        = 4443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-08fcf71e7ff9e5810"]
    self             = false
    to_port          = 4443
    }, {
    cidr_blocks      = []
    description      = "Cluster API to node 6443/tcp webhook"
    from_port        = 6443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-08fcf71e7ff9e5810"]
    self             = false
    to_port          = 6443
    }, {
    cidr_blocks      = []
    description      = "Cluster API to node 8443/tcp webhook"
    from_port        = 8443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-08fcf71e7ff9e5810"]
    self             = false
    to_port          = 8443
    }, {
    cidr_blocks      = []
    description      = "Cluster API to node 9443/tcp webhook"
    from_port        = 9443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-08fcf71e7ff9e5810"]
    self             = false
    to_port          = 9443
    }, {
    cidr_blocks      = []
    description      = "Cluster API to node groups"
    from_port        = 443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-08fcf71e7ff9e5810"]
    self             = false
    to_port          = 443
    }, {
    cidr_blocks      = []
    description      = "Cluster API to node kubelets"
    from_port        = 10250
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-08fcf71e7ff9e5810"]
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
    security_groups  = ["sg-066419183e0df70dd"]
    self             = false
    to_port          = 8080
  }]
  name                   = "retail-store-node-20251006122600094700000010"
  revoke_rules_on_delete = null
  tags = {
    Name                                 = "retail-store-node"
    created-by                           = "retail-store-sample-app"
    environment-name                     = "retail-store"
    "kubernetes.io/cluster/retail-store" = "owned"
  }
  timeouts = null
  vpc_id   = module.stackgen_2f0726a4-0c85-5318-8a21-153dde4c8bcf.id
}

module "stackgen_fe90da22-94b5-5790-bdf0-87c6fdaba3bf" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = true
    name                   = "k8s-ingressn-ingressn-efb5f6ecf7-a04f395ff369e7c5.elb.us-west-2.amazonaws.com"
    zone_id                = "Z18D5FSROUN65G"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = false
  name                             = "marketing.dev.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09918442S7BBFQ09RDHY"
}

module "stackgen_fee9472a-0e7d-5690-82c0-e1303ed81fa9" {
  source    = "./modules/aws_iam_role_policy"
  name      = "on-prem-eks-cluster"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"logs:CreateLogGroup\"],\"Effect\":\"Deny\",\"Resource\":\"*\"}]}"
  role      = module.stackgen_fa16772f-5e83-5f83-9b41-d443b19840d1.name
  role_type = "custom"
}

module "stackgen_ffb12442-31ff-5986-9c3a-a0bdd9921953" {
  source      = "./modules/aws_iam_policy"
  description = "IAM Policy for karpenter"
  name        = "karpenter-2024021200252810100000000b"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"ec2:DescribeSubnets\",\"ec2:DescribeSpotPriceHistory\",\"ec2:DescribeSecurityGroups\",\"ec2:DescribeLaunchTemplates\",\"ec2:DescribeInstances\",\"ec2:DescribeInstanceTypes\",\"ec2:DescribeInstanceTypeOfferings\",\"ec2:DescribeImages\",\"ec2:DescribeAvailabilityZones\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ec2:RunInstances\",\"ec2:DeleteLaunchTemplate\",\"ec2:CreateTags\",\"ec2:CreateLaunchTemplate\",\"ec2:CreateFleet\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:ec2:us-west-2::image/*\",\"arn:aws:ec2:us-west-2:339712749745:*\"]},{\"Action\":\"iam:PassRole\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::339712749745:role/karpenter-engineering-eks-20240212002501426200000005\"},{\"Action\":\"pricing:GetProducts\",\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"ssm:GetParameter\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ssm:us-west-2::parameter/aws/service/*\"},{\"Action\":\"eks:DescribeCluster\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:eks:*:339712749745:cluster/engineering-eks\"},{\"Action\":\"ec2:TerminateInstances\",\"Condition\":{\"StringLike\":{\"ec2:ResourceTag/kubernetes.io/cluster/engineering-eks\":\"*\"}},\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ec2:us-west-2:339712749745:instance/*\"},{\"Action\":[\"sqs:ReceiveMessage\",\"sqs:GetQueueUrl\",\"sqs:GetQueueAttributes\",\"sqs:DeleteMessage\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:sqs:us-west-2:339712749745:karpenter-engineering-eks\"},{\"Action\":[\"iam:TagInstanceProfile\",\"iam:RemoveRoleFromInstanceProfile\",\"iam:GetInstanceProfile\",\"iam:DeleteInstanceProfile\",\"iam:CreateInstanceProfile\",\"iam:AddRoleToInstanceProfile\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
  tags = {
    repository = "https://github.com/appcd-dev/appcd-dist"
  }
}

