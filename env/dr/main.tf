terraform {
  cloud {
    organization = "Enterpriseair-Cloud"

    workspaces {
      name = "awsInfraGovernance-dr"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::921883587338:role/TerraformExecutionRole"
  }
}

module "app" {
  source       = "../../modules/app"
  project_name = "ec2-role-demo-dr"
  region       = "us-east-1"
}
