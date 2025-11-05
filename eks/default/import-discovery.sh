#!/bin/bash

# AWS Resource Discovery Script for Import
# Account: 339712749745, Region: us-east-1
# Excludes: ALBs (Application Load Balancers)

set -e

AWS_ACCOUNT_ID="339712749745"
AWS_REGION="us-east-1"

echo "🔍 Discovering AWS resources in account $AWS_ACCOUNT_ID, region $AWS_REGION"
echo "Excluding ALBs from discovery..."
echo "=================================================="

# Set AWS region
export AWS_DEFAULT_REGION=$AWS_REGION

# Create output directory
mkdir -p discovered-resources
cd discovered-resources

echo "📋 Discovering VPCs..."
aws ec2 describe-vpcs --query 'Vpcs[*].[VpcId,Tags[?Key==`Name`].Value|[0],CidrBlock,State]' --output table > vpcs.txt
echo "VPCs saved to vpcs.txt"

echo "📋 Discovering Subnets..."
aws ec2 describe-subnets --query 'Subnets[*].[SubnetId,VpcId,CidrBlock,AvailabilityZone,Tags[?Key==`Name`].Value|[0]]' --output table > subnets.txt
echo "Subnets saved to subnets.txt"

echo "📋 Discovering Security Groups..."
aws ec2 describe-security-groups --query 'SecurityGroups[*].[GroupId,GroupName,VpcId,Description]' --output table > security-groups.txt
echo "Security Groups saved to security-groups.txt"

echo "📋 Discovering Internet Gateways..."
aws ec2 describe-internet-gateways --query 'InternetGateways[*].[InternetGatewayId,Tags[?Key==`Name`].Value|[0],Attachments[0].VpcId]' --output table > internet-gateways.txt
echo "Internet Gateways saved to internet-gateways.txt"

echo "📋 Discovering NAT Gateways..."
aws ec2 describe-nat-gateways --query 'NatGateways[*].[NatGatewayId,VpcId,SubnetId,State,Tags[?Key==`Name`].Value|[0]]' --output table > nat-gateways.txt
echo "NAT Gateways saved to nat-gateways.txt"

echo "📋 Discovering Route Tables..."
aws ec2 describe-route-tables --query 'RouteTables[*].[RouteTableId,VpcId,Tags[?Key==`Name`].Value|[0]]' --output table > route-tables.txt
echo "Route Tables saved to route-tables.txt"

echo "📋 Discovering EKS Clusters..."
aws eks list-clusters --query 'clusters' --output table > eks-clusters.txt
if [ -s eks-clusters.txt ]; then
    echo "EKS Clusters found, getting details..."
    for cluster in $(aws eks list-clusters --query 'clusters' --output text); do
        echo "Getting details for cluster: $cluster"
        aws eks describe-cluster --name $cluster --query 'cluster.[name,status,version,endpoint,roleArn]' --output table > "eks-cluster-$cluster.txt"
    done
fi
echo "EKS Clusters saved to eks-clusters.txt"

echo "📋 Discovering EC2 Instances..."
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,InstanceType,State.Name,Tags[?Key==`Name`].Value|[0],VpcId,SubnetId]' --output table > ec2-instances.txt
echo "EC2 Instances saved to ec2-instances.txt"

echo "📋 Discovering RDS Instances..."
aws rds describe-db-instances --query 'DBInstances[*].[DBInstanceIdentifier,DBInstanceClass,Engine,DBInstanceStatus,VpcId]' --output table > rds-instances.txt
echo "RDS Instances saved to rds-instances.txt"

echo "📋 Discovering RDS Clusters..."
aws rds describe-db-clusters --query 'DBClusters[*].[DBClusterIdentifier,Engine,Status,DatabaseName]' --output table > rds-clusters.txt
echo "RDS Clusters saved to rds-clusters.txt"

echo "📋 Discovering S3 Buckets..."
aws s3api list-buckets --query 'Buckets[*].[Name,CreationDate]' --output table > s3-buckets.txt
echo "S3 Buckets saved to s3-buckets.txt"

echo "📋 Discovering DynamoDB Tables..."
aws dynamodb list-tables --query 'TableNames' --output table > dynamodb-tables.txt
echo "DynamoDB Tables saved to dynamodb-tables.txt"

echo "📋 Discovering ElastiCache Clusters..."
aws elasticache describe-cache-clusters --query 'CacheClusters[*].[CacheClusterId,CacheNodeType,Engine,CacheClusterStatus]' --output table > elasticache-clusters.txt
echo "ElastiCache Clusters saved to elasticache-clusters.txt"

echo "📋 Discovering ElastiCache Replication Groups..."
aws elasticache describe-replication-groups --query 'ReplicationGroups[*].[ReplicationGroupId,Status,NodeType]' --output table > elasticache-replication-groups.txt
echo "ElastiCache Replication Groups saved to elasticache-replication-groups.txt"

echo "📋 Discovering Lambda Functions..."
aws lambda list-functions --query 'Functions[*].[FunctionName,Runtime,Handler,Description]' --output table > lambda-functions.txt
echo "Lambda Functions saved to lambda-functions.txt"

echo "📋 Discovering IAM Roles..."
aws iam list-roles --query 'Roles[*].[RoleName,CreateDate,Description]' --output table > iam-roles.txt
echo "IAM Roles saved to iam-roles.txt"

echo "📋 Discovering KMS Keys..."
aws kms list-keys --query 'Keys[*].KeyId' --output table > kms-keys.txt
echo "KMS Keys saved to kms-keys.txt"

echo "📋 Discovering SQS Queues..."
aws sqs list-queues --query 'QueueUrls' --output table > sqs-queues.txt
echo "SQS Queues saved to sqs-queues.txt"

echo "📋 Discovering SNS Topics..."
aws sns list-topics --query 'Topics[*].TopicArn' --output table > sns-topics.txt
echo "SNS Topics saved to sns-topics.txt"

# Skip ALBs as requested
echo "🚫 Skipping Application Load Balancers (ALBs) as requested"

echo "📋 Discovering Network Load Balancers (NLBs)..."
aws elbv2 describe-load-balancers --query 'LoadBalancers[?Type==`network`].[LoadBalancerName,LoadBalancerArn,Type,State.Code]' --output table > nlbs.txt
echo "Network Load Balancers saved to nlbs.txt"

echo "=================================================="
echo "✅ Resource discovery complete!"
echo "📁 All discovery results saved in: discovered-resources/"
echo ""
echo "Next steps:"
echo "1. Review the discovered resources in the text files"
echo "2. Run the import generator script to create Terraform import commands"
echo "3. Add resource blocks to your Terraform configuration"
echo "4. Execute the import commands"

