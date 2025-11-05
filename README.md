# AWS Retail Store Sample Application

A comprehensive Terraform-based infrastructure project for deploying a retail store sample application on AWS. This project provides multiple deployment options using different AWS container services, allowing you to choose the best fit for your use case.

## 📋 Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Application Components](#application-components)
- [Infrastructure Components](#infrastructure-components)
- [Deployment Options](#deployment-options)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Configuration](#configuration)
- [Observability](#observability)
- [Cost Considerations](#cost-considerations)
- [Troubleshooting](#troubleshooting)

## Overview

This project provides Infrastructure as Code (IaC) using Terraform to deploy a retail store sample application on AWS. The application is a microservices-based e-commerce platform that demonstrates best practices for containerized applications on AWS.

The project supports three deployment options:

1. **AWS App Runner** - Fully managed container service with automatic scaling
2. **Amazon ECS** - Container orchestration service with Fargate for serverless compute
3. **Amazon EKS** - Fully managed Kubernetes service for container orchestration

Each deployment option includes all necessary infrastructure components, networking, security groups, IAM roles, and application dependencies.

## Architecture

The retail store application follows a microservices architecture pattern with the following characteristics:

- **Frontend**: Web UI for customer interaction
- **Backend Services**: Multiple microservices handling different business functions
- **Data Layer**: Multiple database types optimized for specific use cases
- **Message Queue**: Asynchronous message processing
- **Caching**: Redis for session and data caching

### Network Architecture

All deployments include:
- **VPC** with public and private subnets across multiple availability zones
- **Internet Gateway** for public internet access
- **NAT Gateways** for private subnet outbound connectivity
- **Security Groups** with least-privilege access
- **Route Tables** for proper traffic routing

## Application Components

The retail store consists of the following microservices:

### 1. **UI Service**
- Frontend web application
- Serves the customer-facing interface
- Exposed via public endpoint (ALB for ECS/EKS, App Runner service URL for App Runner)

### 2. **Catalog Service**
- Product catalog management
- Stores product data in PostgreSQL (RDS)
- Handles product search and retrieval

### 3. **Carts Service**
- Shopping cart management
- Stores cart data in Amazon DynamoDB
- Handles cart operations (add, update, delete items)

### 4. **Checkout Service**
- Order checkout processing
- Uses Redis (ElastiCache) for session management
- Coordinates with Orders service

### 5. **Orders Service**
- Order processing and management
- Stores order data in PostgreSQL (RDS)
- Integrates with Amazon MQ (RabbitMQ) for asynchronous processing

### 6. **Assets Service** (EKS only)
- Static asset management
- Handles image and file serving

## Infrastructure Components

### Data Stores

1. **Amazon RDS (PostgreSQL)**
   - **Catalog Database**: Stores product catalog data
   - **Orders Database**: Stores order and transaction data
   - Multi-AZ deployment for high availability
   - Automated backups enabled

2. **Amazon DynamoDB**
   - **Carts Table**: Stores shopping cart data
   - NoSQL database for fast, scalable cart operations

3. **Amazon ElastiCache (Redis)**
   - **Checkout Cache**: Session storage and caching
   - Improves checkout performance and handles concurrent sessions

4. **Amazon MQ (RabbitMQ)**
   - Message queue for asynchronous order processing
   - Enables decoupled communication between services

### Compute & Orchestration

- **ECS**: Fargate tasks for serverless container execution
- **EKS**: Kubernetes cluster with managed node groups
- **App Runner**: Fully managed container service with automatic scaling

### Networking

- **VPC**: Isolated network environment
- **Subnets**: Public and private subnets across availability zones
- **Load Balancers**: Application Load Balancer (ECS/EKS) or App Runner managed endpoints
- **Security Groups**: Network-level security controls

## Deployment Options

### Option 1: AWS App Runner

**Location**: `apprunner/default/`

**Best For**:
- Rapid deployment without infrastructure management
- Automatic scaling and load balancing
- Simple CI/CD integration

**Features**:
- Fully managed service (no cluster management)
- Automatic scaling based on traffic
- VPC egress for secure database access
- Public endpoint for UI, private endpoints for backend services

**Usage**:
```bash
cd apprunner/default
terraform init
terraform plan
terraform apply
```

### Option 2: Amazon ECS (Fargate)

**Location**: `ecs/default/`

**Best For**:
- Serverless container orchestration
- AWS-native service integration
- Container Insights for monitoring

**Features**:
- ECS Service Connect for service discovery
- Fargate for serverless compute
- Application Load Balancer for traffic distribution
- Optional OpenTelemetry integration
- Configurable Container Insights

**Usage**:
```bash
cd ecs/default
terraform init
terraform plan
terraform apply
```

### Option 3: Amazon EKS

**Location**: `eks/default/`

**Best For**:
- Kubernetes-native deployments
- Advanced orchestration features
- Multi-cloud portability

**Features**:
- Managed Kubernetes cluster
- Helm chart deployments
- Optional OpenTelemetry (AWS Distro for OpenTelemetry)
- Optional Istio service mesh
- Kubernetes-native networking and service discovery

**Usage**:
```bash
cd eks/default
terraform init
terraform plan
terraform apply

# Configure kubectl
terraform output -raw configure_kubectl | bash

# Access the application
kubectl get svc -n ui ui-lb
```

**Minimal Configuration**: `eks/minimal/` provides a simplified EKS setup with fewer features.

## Prerequisites

Before deploying any configuration, ensure you have:

### Required Tools

- **Terraform** >= 1.0.0
- **AWS CLI** configured with appropriate credentials
- **kubectl** (for EKS deployments)
- **helm** (for EKS deployments)

### AWS Account Requirements

- AWS account with appropriate permissions
- IAM permissions to create:
  - VPCs, subnets, security groups
  - ECS/EKS/App Runner services
  - RDS, DynamoDB, ElastiCache, MQ instances
  - IAM roles and policies
  - Load balancers
  - CloudWatch Log Groups

### AWS Credentials

Configure AWS credentials using one of these methods:
- AWS CLI: `aws configure`
- Environment variables: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`
- IAM roles (if running on EC2)

**Note**: Never commit AWS credentials to the repository. The provider configuration should rely on environment variables or AWS credential files.

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/craigleander/retail-store.git
cd retail-store
```

### 2. Choose Your Deployment Option

Select one of the three deployment options based on your needs:
- `apprunner/default/` - App Runner deployment
- `ecs/default/` - ECS Fargate deployment
- `eks/default/` - EKS Kubernetes deployment

### 3. Initialize Terraform

```bash
cd <chosen-deployment-option>
terraform init
```

### 4. Review the Configuration

```bash
terraform plan
```

This will show you what resources will be created. Review carefully as this will incur AWS costs.

### 5. Deploy

```bash
terraform apply
```

Confirm when prompted. The deployment typically takes 15-20 minutes.

### 6. Access the Application

**For ECS/App Runner**:
```bash
terraform output -raw application_url
```

**For EKS**:
```bash
# Get the load balancer URL
kubectl get svc -n ui ui-lb
```

## Project Structure

```
retail-store/
├── apprunner/              # App Runner deployment configurations
│   └── default/            # Default App Runner configuration
├── ecs/                    # ECS deployment configurations
│   └── default/            # Default ECS configuration
├── eks/                    # EKS deployment configurations
│   ├── default/            # Full-featured EKS configuration
│   └── minimal/            # Minimal EKS configuration
├── lib/                    # Reusable Terraform modules
│   ├── apprunner/          # App Runner service modules
│   ├── dependencies/       # Shared infrastructure (RDS, DynamoDB, etc.)
│   ├── ecs/                # ECS service modules
│   ├── eks/                # EKS cluster and addon modules
│   ├── images/             # Container image references
│   ├── tags/               # Tagging module
│   └── vpc/                # VPC networking module
└── cloud2code/             # Generated Terraform configurations (ignored in git)
```

## Configuration

### Environment Variables

Each deployment option has configurable variables. Common variables include:

- `environment_name`: Name prefix for all resources (default varies by deployment)
- `opentelemetry_enabled`: Enable OpenTelemetry observability (ECS/EKS)
- `container_insights_setting`: Container Insights configuration (ECS)
- `istio_enabled`: Enable Istio service mesh (EKS)

### Customization

You can customize deployments by:

1. **Modifying Variables**: Edit `variables.tf` in your chosen deployment directory
2. **Container Images**: Override default container images via `container_image_overrides`
3. **Resource Sizing**: Adjust instance types, database sizes in the `lib/` modules

### Terraform Backend

The EKS default configuration uses S3 backend for state management:
- Bucket: `aws-retail-store-state`
- Region: `us-east-1`
- Encryption: Enabled

You may need to create this bucket or modify the backend configuration.

## Observability

### OpenTelemetry (ECS/EKS)

Enable distributed tracing and metrics collection:

```hcl
opentelemetry_enabled = true
```

This installs:
- AWS Distro for OpenTelemetry (ADOT)
- OpenTelemetry collectors
- Trace and metric collection
- Integration with AWS X-Ray and CloudWatch

### Container Insights (ECS)

Enable enhanced monitoring:

```hcl
container_insights_setting = "enhanced"
lifecycle_events_enabled   = true
```

### CloudWatch Logs

All services log to CloudWatch Log Groups:
- Log retention: Configurable (default 30 days)
- Service-specific log groups
- Integration with Container Insights

### Istio Service Mesh (EKS)

Enable advanced traffic management:

```hcl
istio_enabled = true
```

Features:
- Traffic routing and load balancing
- Security policies
- Observability enhancements
- Canary deployments

## Cost Considerations

⚠️ **Important**: This infrastructure will incur AWS costs. Estimate costs before deployment.

### Estimated Monthly Costs (varies by region and usage)

- **ECS/EKS**: ~$150-300/month (base infrastructure)
- **App Runner**: ~$100-200/month (pay-per-use pricing)
- **RDS**: ~$100-200/month (depending on instance size)
- **ElastiCache**: ~$50-100/month
- **DynamoDB**: Pay-per-request (minimal for demo)
- **MQ**: ~$50-100/month
- **Data Transfer**: Variable based on usage

### Cost Optimization Tips

1. **Use smaller instance sizes** for development/testing
2. **Enable auto-scaling** to scale down during low usage
3. **Use single-AZ** for non-production (modify VPC configuration)
4. **Schedule stop/start** for development environments
5. **Clean up resources** when not in use: `terraform destroy`

### Cleanup

To remove all resources and stop incurring costs:

```bash
terraform destroy
```

**Warning**: This will delete all resources. Ensure you have backups if needed.

## Troubleshooting

### Common Issues

#### 1. Terraform State Lock Errors

If you see state lock errors:
```bash
# Check for locks
terraform force-unlock <LOCK_ID>
```

#### 2. Timeout Errors During Deployment

Some resources take time to provision. If you see timeouts:
- Wait a few minutes and retry `terraform apply`
- Check AWS service quotas and limits

#### 3. EKS Cluster Not Accessible

```bash
# Verify kubectl configuration
aws eks update-kubeconfig --region <region> --name <cluster-name>

# Check cluster status
kubectl cluster-info
```

#### 4. Application Not Responding

- **ECS/App Runner**: Check CloudWatch Logs for service errors
- **EKS**: Check pod status: `kubectl get pods -A`
- **Load Balancer**: Verify security group rules allow traffic
- **Database**: Check RDS instance status and connectivity

#### 5. Database Connection Errors

- Verify security group rules allow traffic from application subnets
- Check database endpoint and credentials
- Ensure NAT Gateway is configured for private subnet access

### Getting Help

1. Check CloudWatch Logs for detailed error messages
2. Review Terraform output for resource IDs
3. Verify AWS service limits and quotas
4. Check security group configurations
5. Review IAM role permissions

## Security Best Practices

This project implements several security best practices:

- ✅ Secrets stored in AWS Secrets Manager (not in code)
- ✅ Security groups with least-privilege access
- ✅ Private subnets for application and database tiers
- ✅ IAM roles with minimal required permissions
- ✅ Encryption at rest for databases
- ✅ VPC isolation for network security

**Note**: Review and customize security settings based on your requirements.

## Contributing

This is a sample application for demonstration purposes. Contributions and improvements are welcome!

## License

This project is provided as-is for educational and demonstration purposes.

## Additional Resources

- [AWS App Runner Documentation](https://docs.aws.amazon.com/apprunner/)
- [Amazon ECS Documentation](https://docs.aws.amazon.com/ecs/)
- [Amazon EKS Documentation](https://docs.aws.amazon.com/eks/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

---

**Disclaimer**: This project creates real AWS resources that will incur costs. Always review the Terraform plan before applying and ensure you understand the resources being created. Clean up resources when not in use to avoid unexpected charges.

