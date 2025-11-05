moved {
  from = module.retail_app_eks.aws_s3_bucket.retail_store
  to   = module.stackgen_404481e2-42c2-55fe-a560-5799749062b9.aws_s3_bucket.this
}

moved {
  from = module.vpc.module.vpc.aws_subnet.public[0]
  to   = module.stackgen_6d3e2e85-c3bd-5a31-befc-5ca1b1595119.aws_subnet.this
}

moved {
  from = module.dependencies.module.catalog_rds.aws_rds_cluster.this[0]
  to   = module.stackgen_8998c9cd-72ad-5c1d-8a92-e35282cb5d9c.aws_rds_cluster.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.kms.aws_kms_key.this[0]
  to   = module.stackgen_085052dc-7ced-556e-9d17-b5f74fa17dd0.aws_kms_key.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_3"].aws_partition.current
  to   = module.stackgen_64ad3123-9b53-58ba-b3e6-3b72c0cda733.aws_partition.this
}

moved {
  from = module.vpc.module.vpc.aws_route_table_association.private[0]
  to   = module.stackgen_07ebdcfe-413d-5d0c-ad58-214d7f1d0cef.aws_route_table_association.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_2"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"]
  to   = module.stackgen_d71132d1-13a5-5f17-869e-fa7ca111e7ba.aws_iam_role_policy_attachment.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.module.cert_manager.aws_iam_policy_document.this[0]
  to   = module.stackgen_0aa1330c-fd2c-5ac0-b84f-af0f0e72c4e4.aws_iam_policy_document.this
}

moved {
  from = module.iam_assumable_role_carts.aws_caller_identity.current
  to   = module.stackgen_2d3883cc-0285-5842-ba3e-ae5007a68352.aws_caller_identity.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_security_group_rule.node["ingress_cluster_9443_webhook"]
  to   = module.stackgen_8c76187a-335c-5170-a794-f32d262ef47d.aws_security_group_rule.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.module.cert_manager.aws_caller_identity.current[0]
  to   = module.stackgen_66458e5f-8d06-50aa-bb2c-0f1247abf8c9.aws_caller_identity.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.module.cert_manager.aws_iam_role_policy_attachment.this[0]
  to   = module.stackgen_fc1e9f9f-2c77-5f57-9e3a-30650240d1b7.aws_iam_role_policy_attachment.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_ec2_tag.cluster_primary_security_group["created-by"]
  to   = module.stackgen_98a8d20f-66f7-5ac8-b8e8-6246805464db.aws_ec2_tag.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_iam_role_policy_attachment.cluster_encryption[0]
  to   = module.stackgen_333af998-c115-5049-a4e9-ce41d79bdbfd.aws_iam_role_policy_attachment.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_security_group.cluster[0]
  to   = module.stackgen_5419323d-e3b5-54db-991f-7522879fa01e.aws_security_group.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_2"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"]
  to   = module.stackgen_78ef85a1-cf50-5e55-b832-100c3003175f.aws_iam_role_policy_attachment.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_3"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"]
  to   = module.stackgen_31d7ccf9-97bb-550e-881c-ea03d84d0da6.aws_iam_role_policy_attachment.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_security_group_rule.node["ingress_self_coredns_udp"]
  to   = module.stackgen_7cb9d721-8b9a-5123-9074-2dd008c25702.aws_security_group_rule.this
}

moved {
  from = module.dependencies.module.orders_rds.aws_db_subnet_group.this[0]
  to   = module.stackgen_2b421124-e76e-5051-910c-7de9da9127cc.aws_db_subnet_group.this
}

moved {
  from = module.vpc.module.vpc.aws_route_table.private[0]
  to   = module.stackgen_21b17b50-c073-54ab-aaf3-662db6da5665.aws_route_table.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_iam_policy_document.assume_role_policy[0]
  to   = module.stackgen_0325c2df-b5d5-54cd-ad35-e8c5e72a3631.aws_iam_policy_document.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.module.aws_load_balancer_controller.aws_partition.current[0]
  to   = module.stackgen_96d6c021-7841-5c89-b5f4-55c68c6dc143.aws_partition.this
}

moved {
  from = module.dependencies.module.orders_rds.aws_security_group_rule.default_ingress[0]
  to   = module.stackgen_dc634a31-d88c-584a-8300-11a0e0535874.aws_security_group_rule.this
}

moved {
  from = aws_eks_cluster_auth.this
  to   = module.stackgen_b810b1c2-64fc-5169-865e-f04ae88be047.aws_eks_cluster_auth.this
}

moved {
  from = module.dependencies.aws_iam_policy.carts_dynamo
  to   = module.stackgen_cfe3cf5d-b40f-522f-92e8-89163efbf3b0.aws_iam_policy.this
}

moved {
  from = module.dependencies.module.orders_rds.aws_iam_policy_document.monitoring_rds_assume_role
  to   = module.stackgen_ab2b7356-a275-57b9-be01-e3ba69716138.aws_iam_policy_document.this
}

moved {
  from = module.dependencies.random_string.catalog_db_master
  to   = module.stackgen_9a91c349-a860-55b8-ba35-f4eb9b699f6a.random_string.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_3"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"]
  to   = module.stackgen_410c5df7-858c-5902-b0bb-4bb44ade3ae9.aws_iam_role_policy_attachment.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_eks_addon.before_compute["vpc-cni"]
  to   = module.stackgen_d90d1b23-e7ce-5ff7-bda1-1128938c3840.aws_eks_addon.this
}

moved {
  from = module.dependencies.module.orders_rds.aws_security_group.this[0]
  to   = module.stackgen_297b1d6b-84eb-5f56-ab89-782203435d8f.aws_security_group.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_2"].aws_iam_policy_document.assume_role_policy[0]
  to   = module.stackgen_07808840-5b99-5109-91b3-cd6d86dc6e46.aws_iam_policy_document.this
}

moved {
  from = module.dependencies.module.orders_rds.aws_rds_cluster_parameter_group.this[0]
  to   = module.stackgen_82256cc6-29bf-5c68-badb-4ab3b98f6b51.aws_rds_cluster_parameter_group.this
}

moved {
  from = module.vpc.module.vpc.aws_route_table_association.public[0]
  to   = module.stackgen_e2b6b6d6-fd40-572f-b506-e73cd03ecd19.aws_route_table_association.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.module.aws_load_balancer_controller.aws_iam_role_policy_attachment.this[0]
  to   = module.stackgen_8e10ffab-d76c-5619-bd6d-1e98ba620c46.aws_iam_role_policy_attachment.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_1"].aws_eks_node_group.this[0]
  to   = module.stackgen_1207fdd8-a4ac-57b1-bc71-5ca7e09908db.aws_eks_node_group.this
}

moved {
  from = module.dependencies.module.checkout_elasticache_redis.module.aws_security_group.aws_security_group_rule.keyed["in#in#sg#0"]
  to   = module.stackgen_917c8be5-d7a9-5b6b-91a2-0d159c15f427.aws_security_group_rule.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_3"].aws_caller_identity.current
  to   = module.stackgen_afbca3c7-f9e3-56ec-8838-d92850196ae7.aws_caller_identity.this
}

moved {
  from = module.dependencies.module.orders_rds.aws_partition.current
  to   = module.stackgen_bf8d7c5b-6c00-5dd2-861f-c2b6bfe2e0a6.aws_partition.this
}

moved {
  from = module.vpc.module.vpc.aws_route_table_association.private[1]
  to   = module.stackgen_3c25f244-7c82-585b-b511-390b9fa1da4e.aws_route_table_association.this
}

moved {
  from = module.vpc.module.vpc.aws_route.public_internet_gateway[0]
  to   = module.stackgen_b2548492-8db5-56fb-8fa3-d067ab37f77a.aws_route.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.module.aws_load_balancer_controller.aws_iam_policy_document.this[0]
  to   = module.stackgen_935edbe5-4307-50f3-9d8e-aa550a229238.aws_iam_policy_document.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_cloudwatch_log_group.this[0]
  to   = module.stackgen_50c10d0b-0585-5fe7-b71c-7c1e4721a927.aws_cloudwatch_log_group.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_iam_role.this[0]
  to   = module.stackgen_f9fee92e-0d9b-531d-b33c-9d42bad8acb2.aws_iam_role.this
}

moved {
  from = module.retail_app_eks.module.iam_assumable_role_adot_logs.aws_iam_policy_document.assume_role_with_oidc[0]
  to   = module.stackgen_5386ef77-2ecb-5529-a6e6-2c7bb45f7c30.aws_iam_policy_document.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_security_group_rule.node["ingress_cluster_kubelet"]
  to   = module.stackgen_8701ff9d-ddbf-54e5-81aa-3b7607c1e55d.aws_security_group_rule.this
}

moved {
  from = aws_eks_cluster_auth.cluster
  to   = module.stackgen_84391fcc-8e8c-52a3-b09c-b08412663799.aws_eks_cluster_auth.this
}

moved {
  from = module.iam_assumable_role_carts.aws_iam_policy_document.assume_role_with_oidc[0]
  to   = module.stackgen_788b00e0-272b-5bae-9af9-46937c8c450f.aws_iam_policy_document.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_security_group_rule.node["ingress_cluster_4443_webhook"]
  to   = module.stackgen_6a9ef1b6-d9ae-57c8-822e-4ad02775303b.aws_security_group_rule.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_2"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"]
  to   = module.stackgen_6dee6a07-5cce-517e-84c5-03185cbfd854.aws_iam_role_policy_attachment.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_3"].aws_eks_node_group.this[0]
  to   = module.stackgen_16643503-d9d9-52f9-a530-4c1458eb9f7c.aws_eks_node_group.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.module.cert_manager.aws_iam_policy.this[0]
  to   = module.stackgen_9e1c24b5-fa26-5daf-8a46-0477ae77cbce.aws_iam_policy.this
}

moved {
  from = module.dependencies.module.checkout_elasticache_redis.aws_elasticache_parameter_group.default[0]
  to   = module.stackgen_fbdc3c43-709a-5adf-b8b4-dff7b94fbc6b.aws_elasticache_parameter_group.this
}

moved {
  from = module.dependencies.module.dynamodb_carts.aws_dynamodb_table.this[0]
  to   = module.stackgen_5db11829-c346-5c74-a079-c91ac3d0a5d4.aws_dynamodb_table.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_security_group_rule.node["ingress_cluster_443"]
  to   = module.stackgen_d1b60c69-5ff7-5324-b97b-92cfe3a0643a.aws_security_group_rule.this
}

moved {
  from = module.dependencies.aws_region.current
  to   = module.stackgen_28d19d44-138c-5fd8-8aa2-c1988bdd1caa.aws_region.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.aws_partition.current
  to   = module.stackgen_96f162b0-0dcc-57e1-abb3-c291f6e631fd.aws_partition.this
}

moved {
  from = module.iam_assumable_role_carts.aws_partition.current
  to   = module.stackgen_21b3f04c-abd0-5976-b9d8-37422814678d.aws_partition.this
}

moved {
  from = module.dependencies.aws_mq_broker.mq
  to   = module.stackgen_8076336a-31d7-5546-a4dc-166eada064a6.aws_mq_broker.this
}

moved {
  from = module.retail_app_eks.aws_eks_addon.adot
  to   = module.stackgen_b7a21433-ae00-5481-9306-1c659b74e1e6.aws_eks_addon.this
}

moved {
  from = module.dependencies.module.checkout_elasticache_redis.module.aws_security_group.aws_security_group_rule.keyed["_allow_all_egress_"]
  to   = module.stackgen_95654f4e-c22e-51e6-a9bf-baf6956e16f4.aws_security_group_rule.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.module.cert_manager.aws_iam_role.this[0]
  to   = module.stackgen_61efdefc-0377-5096-88ed-9279e18a475d.aws_iam_role.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.kms.aws_iam_policy_document.this[0]
  to   = module.stackgen_460edd81-a9e2-5cff-990c-e5b14ac50ac1.aws_iam_policy_document.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_3"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"]
  to   = module.stackgen_1e2b65bc-b7c1-5522-b349-608d50ce9d6a.aws_iam_role_policy_attachment.this
}

moved {
  from = module.dependencies.module.catalog_rds.aws_db_subnet_group.this[0]
  to   = module.stackgen_92804688-3259-5633-8e0f-5290355c67fb.aws_db_subnet_group.this
}

moved {
  from = module.vpc.module.vpc.aws_vpc.this[0]
  to   = module.stackgen_61781de0-c328-5e4a-ad6c-66b34fee674a.aws_vpc.this
}

moved {
  from = module.dependencies.random_password.mq_password
  to   = module.stackgen_c46bf41d-c12e-5775-b294-cd17548f1a83.random_password.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_2"].aws_eks_node_group.this[0]
  to   = module.stackgen_bcdbeaab-ee30-552b-8fab-6a8c03fd95b4.aws_eks_node_group.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.module.aws_load_balancer_controller.aws_iam_role.this[0]
  to   = module.stackgen_485611a9-ca8a-577c-b2aa-c9bc8d12fa4d.aws_iam_role.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.kms.aws_caller_identity.current[0]
  to   = module.stackgen_198e4fa4-3952-56d4-b469-c9b9db4b0c31.aws_caller_identity.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.kms.aws_kms_alias.this["cluster"]
  to   = module.stackgen_503b3840-d7d1-52b3-96ad-f9dd997db457.aws_kms_alias.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_eks_cluster.this[0]
  to   = module.stackgen_d613e397-f4e3-54a2-af56-6c8aa0000bef.aws_eks_cluster.this
}

moved {
  from = module.vpc.module.vpc.aws_default_network_acl.this[0]
  to   = module.stackgen_d1a9fd2d-dc8e-500d-a551-903c3b2afde3.aws_default_network_acl.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.kms.aws_partition.current[0]
  to   = module.stackgen_04372edb-8df3-56bf-aaa4-91b9c171ba8b.aws_partition.this
}

moved {
  from = module.vpc.module.vpc.aws_subnet.private[1]
  to   = module.stackgen_1035c3f1-b526-555f-af0f-1f468c5d9d61.aws_subnet.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_security_group_rule.node["ingress_self_coredns_tcp"]
  to   = module.stackgen_10b46f79-c54b-5a80-a4e1-1d437facecd0.aws_security_group_rule.this
}

moved {
  from = module.iam_assumable_role_carts.aws_iam_role_policy_attachment.custom[0]
  to   = module.stackgen_080ebcf6-682b-5457-a6d8-6cbdb402af3e.aws_iam_role_policy_attachment.this
}

moved {
  from = module.vpc.module.vpc.aws_route_table_association.public[1]
  to   = module.stackgen_543bbc87-4502-5a7d-8fba-bed2491e343f.aws_route_table_association.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_ec2_tag.cluster_primary_security_group["environment-name"]
  to   = module.stackgen_488e85b1-9435-5dc6-ac58-3d70f55ffde6.aws_ec2_tag.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_iam_policy.cluster_encryption[0]
  to   = module.stackgen_b5dcabf6-ad83-53ad-8b32-0f250aac030d.aws_iam_policy.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_security_group_rule.node["ingress_nodes_ephemeral"]
  to   = module.stackgen_60a63b69-1cb2-5161-911c-31012f8d14f5.aws_security_group_rule.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_eks_addon_version.this["vpc-cni"]
  to   = module.stackgen_2a3747eb-2205-5e47-853d-2cb660740929.aws_eks_addon_version.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.module.cert_manager.aws_partition.current[0]
  to   = module.stackgen_47c687cb-c230-5f90-92e2-66e7dc99054e.aws_partition.this
}

moved {
  from = module.vpc.module.vpc.aws_route_table_association.private[2]
  to   = module.stackgen_c0b51f5d-a234-5eab-8811-5241836aec46.aws_route_table_association.this
}

moved {
  from = module.retail_app_eks.null_resource.cluster_blocker
  to   = module.stackgen_766510af-3a1c-5553-b3b2-76b3a5e5d511.null_resource.this
}

moved {
  from = module.dependencies.module.catalog_rds.aws_security_group_rule.default_ingress[0]
  to   = module.stackgen_f7443e81-ed4b-5c30-8fb6-e70da6eb1a13.aws_security_group_rule.this
}

moved {
  from = module.retail_app_eks.aws_partition.current
  to   = module.stackgen_73753da0-5aa4-5dc9-a0d2-56efa8a29801.aws_partition.this
}

moved {
  from = module.dependencies.aws_caller_identity.current
  to   = module.stackgen_9191a905-1026-5837-b177-5bf3216563a7.aws_caller_identity.this
}

moved {
  from = module.retail_app_eks.module.iam_assumable_role_adot_logs.aws_iam_role_policy_attachment.custom[0]
  to   = module.stackgen_6bcf3acd-3b68-5184-a987-bef4ee02cc84.aws_iam_role_policy_attachment.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_security_group_rule.node["ingress_cluster_8443_webhook"]
  to   = module.stackgen_72bdbdcd-5158-5871-8431-9851875edba4.aws_security_group_rule.this
}

moved {
  from = null_resource.addons_blocker
  to   = module.stackgen_ec05439b-d31d-5412-b207-792f0e75de0e.null_resource.this
}

moved {
  from = module.vpc.module.vpc.aws_route.private_nat_gateway[0]
  to   = module.stackgen_3f237aaa-ae99-5272-b6e0-2d71d2445d38.aws_route.this
}

moved {
  from = module.dependencies.aws_security_group.mq
  to   = module.stackgen_177f2dbf-0d1f-5f0e-a688-295555ad5a26.aws_security_group.this
}

moved {
  from = aws_security_group.catalog
  to   = module.stackgen_9d8c0267-4943-5613-97a6-5b0d439b9aa7.aws_security_group.this
}

moved {
  from = aws_security_group.checkout
  to   = module.stackgen_9608704d-d778-5db8-b689-eede92d6da45.aws_security_group.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.aws_iam_policy_document.cert_manager[0]
  to   = module.stackgen_acc36a76-e5c5-5975-adc1-beb250c152b1.aws_iam_policy_document.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.module.cert_manager.aws_iam_policy_document.assume[0]
  to   = module.stackgen_2604f6a8-dfe7-57ad-8224-2b9b16d07914.aws_iam_policy_document.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.time_sleep.this[0]
  to   = module.stackgen_68edfdb9-fb62-5a00-bfcd-095ae9464407.time_sleep.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_1"].aws_caller_identity.current
  to   = module.stackgen_7d57e7a3-cbd7-5739-ab75-53f3e798b549.aws_caller_identity.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_1"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"]
  to   = module.stackgen_225451b0-6ece-5b7b-9783-34eb5f9c172b.aws_iam_role_policy_attachment.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_3"].aws_iam_policy_document.assume_role_policy[0]
  to   = module.stackgen_e4b03209-a71f-537b-a50e-23c84768b5cc.aws_iam_policy_document.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_1"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"]
  to   = module.stackgen_10af7ac7-56a6-526c-b3fa-1bf022e5e06b.aws_iam_role_policy_attachment.this
}

moved {
  from = module.retail_app_eks.aws_region.current
  to   = module.stackgen_ea3bfe32-57ae-596a-aca7-693eb8e8c329.aws_region.this
}

moved {
  from = module.retail_app_eks.module.iam_assumable_role_adot_amp.aws_iam_policy_document.assume_role_with_oidc[0]
  to   = module.stackgen_7f744985-0b4a-5363-9ed9-88e6aa6b2a0d.aws_iam_policy_document.this
}

moved {
  from = aws_security_group.orders
  to   = module.stackgen_9c39b20d-d008-5000-ac92-996e35933f67.aws_security_group.this
}

moved {
  from = module.retail_app_eks.null_resource.addons_blocker
  to   = module.stackgen_795eb769-4621-58a9-8b61-524a9018d83d.null_resource.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.module.aws_load_balancer_controller.aws_iam_policy.this[0]
  to   = module.stackgen_d630bcf0-017a-50ac-8677-8e5d2aa10825.aws_iam_policy.this
}

moved {
  from = module.dependencies.module.checkout_elasticache_redis.aws_elasticache_replication_group.default[0]
  to   = module.stackgen_4194fea2-8efb-5ccb-90d4-84e4505e1ec4.aws_elasticache_replication_group.this
}

moved {
  from = module.retail_app_eks.time_sleep.addons
  to   = module.stackgen_f80d5c8a-e4bc-5e93-9acf-1fb2a7f4fdba.time_sleep.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_iam_openid_connect_provider.oidc_provider[0]
  to   = module.stackgen_f24bbd31-cb02-5c70-af30-58f6000fab6e.aws_iam_openid_connect_provider.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_iam_session_context.current
  to   = module.stackgen_15599ca1-2ef6-5eb8-9437-2290f2cefc3c.aws_iam_session_context.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_security_group_rule.node["ingress_cluster_6443_webhook"]
  to   = module.stackgen_02ac58b4-27d4-58e9-b21d-41690b6f2e37.aws_security_group_rule.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_partition.current
  to   = module.stackgen_64b18fc2-6bfe-5191-8d34-477f72558cd2.aws_partition.this
}

moved {
  from = module.dependencies.module.orders_rds.aws_rds_cluster.this[0]
  to   = module.stackgen_beaa250e-3069-52b4-ad93-89587b6331d1.aws_rds_cluster.this
}

moved {
  from = module.vpc.module.vpc.aws_route_table.public[0]
  to   = module.stackgen_513fdee8-3275-583a-a5c2-977c859818a2.aws_route_table.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_eks_addon_version.this["aws-ebs-csi-driver"]
  to   = module.stackgen_ede48d99-cef7-5f36-9e2f-9d184d1c1d32.aws_eks_addon_version.this
}

moved {
  from = module.retail_app_eks.module.iam_assumable_role_adot_amp.aws_caller_identity.current
  to   = module.stackgen_61fdcc58-fab7-5c58-a402-4c8be520c38d.aws_caller_identity.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_3"].aws_iam_role.this[0]
  to   = module.stackgen_6cb03677-4a41-5ff3-8394-544eaffe9a23.aws_iam_role.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_1"].aws_iam_role_policy_attachment.additional["ebs_csi_driver_policy"]
  to   = module.stackgen_757a8e99-2537-5ec0-aa47-1cf8953af370.aws_iam_role_policy_attachment.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_security_group_rule.node["ingress_self_all"]
  to   = module.stackgen_46d6e57d-08d9-5ac4-8bcf-66e52ee12c25.aws_security_group_rule.this
}

moved {
  from = module.vpc.module.vpc.aws_default_route_table.default[0]
  to   = module.stackgen_3df67ea7-856b-5767-9ae8-a3d61048515c.aws_default_route_table.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_2"].aws_launch_template.this[0]
  to   = module.stackgen_0d1ebe22-92d5-5166-9d39-32ec59adbb6c.aws_launch_template.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_security_group_rule.node["ingress_cluster_to_node_all_traffic"]
  to   = module.stackgen_727c86d5-8bfb-508a-be79-5e49aba69e5e.aws_security_group_rule.this
}

moved {
  from = module.dependencies.module.catalog_rds.aws_security_group.this[0]
  to   = module.stackgen_d2d013e8-ef34-5243-875d-6f2ee50f0e87.aws_security_group.this
}

moved {
  from = time_sleep.restart_pods
  to   = module.stackgen_992520a7-75c5-5cf0-890b-5bf03003a9c7.time_sleep.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.time_sleep.this
  to   = module.stackgen_0a5e5e51-cb3e-5da0-8418-04f8f1d017e3.time_sleep.this
}

moved {
  from = module.dependencies.module.catalog_rds.aws_partition.current
  to   = module.stackgen_72464a4d-dd86-5bd4-b6e7-2b8dd6192e6c.aws_partition.this
}

moved {
  from = module.vpc.module.vpc.aws_eip.nat[0]
  to   = module.stackgen_22542c20-ea3b-5d87-8bd2-6f8ebe9d0295.aws_eip.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_security_group_rule.cluster["ingress_nodes_443"]
  to   = module.stackgen_66ce41f3-6a50-5060-b281-0af00238fbd2.aws_security_group_rule.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_1"].aws_iam_role.this[0]
  to   = module.stackgen_a51d54c8-fc59-5d1f-bcb5-f4c4feb742b9.aws_iam_role.this
}

moved {
  from = module.retail_app_eks.module.iam_assumable_role_adot_logs.aws_caller_identity.current
  to   = module.stackgen_4b8618c5-5414-513d-8458-096ad808c215.aws_caller_identity.this
}

moved {
  from = module.dependencies.module.checkout_elasticache_redis.module.aws_security_group.aws_security_group.cbd[0]
  to   = module.stackgen_791cf9ff-f969-543c-a89b-4cee88431223.aws_security_group.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_1"].aws_launch_template.this[0]
  to   = module.stackgen_69d6ce62-0148-5243-8d8d-47201d69c9a1.aws_launch_template.this
}

moved {
  from = module.dependencies.module.catalog_rds.aws_db_parameter_group.this[0]
  to   = module.stackgen_d025fda5-db6c-54e6-bacd-c851dc7abf3f.aws_db_parameter_group.this
}

moved {
  from = module.retail_app_eks.module.iam_assumable_role_adot_amp.aws_partition.current
  to   = module.stackgen_70b0aaa0-d37a-59ac-8ef1-80e70a658a5c.aws_partition.this
}

moved {
  from = null_resource.cluster_blocker
  to   = module.stackgen_2c4b2f18-b37a-53fe-ba81-0202e2b3b76a.null_resource.this
}

moved {
  from = module.dependencies.module.catalog_rds.aws_iam_policy_document.monitoring_rds_assume_role
  to   = module.stackgen_59e5d90c-f2b9-529f-9a3b-e23013057cfb.aws_iam_policy_document.this
}

moved {
  from = module.vpc.module.vpc.aws_route_table_association.public[2]
  to   = module.stackgen_7d00b26e-7a4f-5bbd-be2c-5fa474ca4fe7.aws_route_table_association.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_2"].aws_caller_identity.current
  to   = module.stackgen_e3b9aa8b-31a7-586b-856a-c5c503b31002.aws_caller_identity.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.module.aws_load_balancer_controller.aws_iam_policy_document.assume[0]
  to   = module.stackgen_427df23c-c79a-5c0e-8df7-3840c1d853cc.aws_iam_policy_document.this
}

moved {
  from = null_resource.restart_pods
  to   = module.stackgen_d746eea8-1980-5861-a77f-fe6fe8c6705a.null_resource.this
}

moved {
  from = module.dependencies.aws_security_group_rule.mq[0]
  to   = module.stackgen_013b1937-7647-5932-b6c0-c14df1bc3987.aws_security_group_rule.this
}

moved {
  from = module.vpc.module.vpc.aws_internet_gateway.this[0]
  to   = module.stackgen_36c6525d-bb72-580e-a850-1a44af7d5a09.aws_internet_gateway.this
}

moved {
  from = module.retail_app_eks.module.iam_assumable_role_adot_logs.aws_partition.current
  to   = module.stackgen_4ea98a6f-7611-5734-a6cf-67ce47e792c4.aws_partition.this
}

moved {
  from = module.dependencies.module.catalog_rds.aws_rds_cluster_parameter_group.this[0]
  to   = module.stackgen_a5450dce-3217-59eb-bbd0-2be59482627d.aws_rds_cluster_parameter_group.this
}

moved {
  from = module.vpc.module.vpc.aws_subnet.private[2]
  to   = module.stackgen_889eaaf4-581f-5fbe-a398-bb14b7a92ae5.aws_subnet.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_2"].aws_iam_role.this[0]
  to   = module.stackgen_35f62127-f837-5e73-b62b-96327e0de448.aws_iam_role.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_iam_role_policy_attachment.this["AmazonEKSVPCResourceController"]
  to   = module.stackgen_b04eaef4-af5c-5927-ad4f-2f3141fddd6d.aws_iam_role_policy_attachment.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_1"].aws_iam_policy_document.assume_role_policy[0]
  to   = module.stackgen_b217e8ba-c097-573c-8a87-423fb3d37f11.aws_iam_policy_document.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_3"].aws_iam_role_policy_attachment.additional["ebs_csi_driver_policy"]
  to   = module.stackgen_d54a8bdf-a6eb-5b99-99bd-b6fe455460d8.aws_iam_role_policy_attachment.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_1"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"]
  to   = module.stackgen_31ff0b8a-f1af-51e9-8873-b47d808f78ba.aws_iam_role_policy_attachment.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.aws_iam_policy_document.aws_load_balancer_controller[0]
  to   = module.stackgen_2b461a13-9153-5d8b-a4ff-b904291476be.aws_iam_policy_document.this
}

moved {
  from = module.vpc.module.vpc.aws_subnet.private[0]
  to   = module.stackgen_88bb083b-9e45-5b64-a250-ffc4d2acbe5f.aws_subnet.this
}

moved {
  from = module.vpc.module.vpc.aws_nat_gateway.this[0]
  to   = module.stackgen_dea51a16-b560-5216-89d7-d3c721911e9d.aws_nat_gateway.this
}

moved {
  from = time_sleep.workloads
  to   = module.stackgen_b445b256-0544-50b6-bf65-4cc1b5c9d255.time_sleep.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_2"].aws_iam_role_policy_attachment.additional["ebs_csi_driver_policy"]
  to   = module.stackgen_3e78a077-0ca9-5355-b9a7-6abfa7f3100f.aws_iam_role_policy_attachment.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.module.aws_load_balancer_controller.aws_caller_identity.current[0]
  to   = module.stackgen_8ffa6481-28a5-5d26-bb02-927f211dc5e5.aws_caller_identity.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.aws_region.current
  to   = module.stackgen_aa5505ac-352b-507c-add0-242185c9648a.aws_region.this
}

moved {
  from = module.retail_app_eks.aws_security_group_rule.dns_tcp
  to   = module.stackgen_cdc17417-48e9-59f6-b251-1e78bad93e54.aws_security_group_rule.this
}

moved {
  from = module.vpc.aws_availability_zones.available
  to   = module.stackgen_461fb8ac-e5c7-5efe-a73a-575940829551.aws_availability_zones.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_3"].aws_launch_template.this[0]
  to   = module.stackgen_b3d6079a-2599-53ce-86c5-c3cd77621f4b.aws_launch_template.this
}

moved {
  from = module.dependencies.module.checkout_elasticache_redis.aws_elasticache_subnet_group.default[0]
  to   = module.stackgen_3d8e470a-ca07-5963-9dfa-764e42587e71.aws_elasticache_subnet_group.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_security_group_rule.node["egress_all"]
  to   = module.stackgen_09607291-071b-5408-8f11-ffb1ca99e744.aws_security_group_rule.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_1"].aws_partition.current
  to   = module.stackgen_22d3d146-85e9-5050-bbd9-fa3fa66d5906.aws_partition.this
}

moved {
  from = module.retail_app_eks.module.eks_blueprints_addons.aws_caller_identity.current
  to   = module.stackgen_a798a11a-cdd7-57e4-92cf-59583751959e.aws_caller_identity.this
}

moved {
  from = module.dependencies.aws_partition.current
  to   = module.stackgen_5b5c3aa3-c776-5fa6-a444-392603620860.aws_partition.this
}

moved {
  from = module.dependencies.module.orders_rds.aws_db_parameter_group.this[0]
  to   = module.stackgen_7ed17ace-f1c7-5f17-a85e-3695cff5dd87.aws_db_parameter_group.this
}

moved {
  from = module.iam_assumable_role_carts.aws_iam_role.this[0]
  to   = module.stackgen_1552e8e2-9c10-51ed-bbee-dccf751e63e7.aws_iam_role.this
}

moved {
  from = module.retail_app_eks.aws_security_group_rule.dns_udp
  to   = module.stackgen_49a9acb0-3e4e-5aae-a5d7-fbfec02ac2d4.aws_security_group_rule.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.module.eks_managed_node_group["node_group_2"].aws_partition.current
  to   = module.stackgen_fd5873c1-c2c5-54c3-8b8e-7a5b8d2e0d38.aws_partition.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_iam_role_policy_attachment.this["AmazonEKSClusterPolicy"]
  to   = module.stackgen_1624c7a0-f6bd-55b1-80c2-4cf6b19d519f.aws_iam_role_policy_attachment.this
}

moved {
  from = module.dependencies.random_string.orders_db_master
  to   = module.stackgen_21002d96-fcf7-5dd4-8843-848ba1e2ecb2.random_string.this
}

moved {
  from = module.vpc.module.vpc.aws_subnet.public[1]
  to   = module.stackgen_92aef2fe-54a5-5c32-b10a-6195025d7af2.aws_subnet.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_eks_addon.this["aws-ebs-csi-driver"]
  to   = module.stackgen_e881e6ee-dad3-5c67-a27b-ab93ad02a366.aws_eks_addon.this
}

moved {
  from = module.retail_app_eks.module.iam_assumable_role_adot_amp.aws_iam_role.this[0]
  to   = module.stackgen_6501d29c-cbf2-5728-bbde-c0646ee9fbe9.aws_iam_role.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_caller_identity.current
  to   = module.stackgen_1b10b983-7b5e-53fc-8f77-bfd9201a4dae.aws_caller_identity.this
}

moved {
  from = module.retail_app_eks.module.iam_assumable_role_adot_amp.aws_iam_role_policy_attachment.custom[0]
  to   = module.stackgen_840699ac-9b97-5ad5-a6a0-ff51315b0fe7.aws_iam_role_policy_attachment.this
}

moved {
  from = module.retail_app_eks.module.eks_cluster.aws_security_group.node[0]
  to   = module.stackgen_6d1a83dc-ab58-5131-86cf-58201605c4cf.aws_security_group.this
}

moved {
  from = module.vpc.module.vpc.aws_subnet.public[2]
  to   = module.stackgen_bbc52756-76a5-5d72-8f31-15c63a023515.aws_subnet.this
}

moved {
  from = module.retail_app_eks.module.iam_assumable_role_adot_logs.aws_iam_role.this[0]
  to   = module.stackgen_a16e4a98-b90b-5e84-a99e-5d91911017bd.aws_iam_role.this
}

