terraform {
  cloud {
    organization = "Enterpriseair-Cloud"

    workspaces {
      name = "awsInfraGovernance"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::084047255080:role/TerraformExecutionRole"
  }
}

module "app" {
  source       = "../../modules/app"
  project_name = "ec2-role-demo-prod"
  region       = "us-east-1"
}
