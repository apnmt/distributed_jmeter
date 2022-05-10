terraform {
  cloud {
    organization = "apnmt"

    workspaces {
      name = "distributed_jmeter"
    }
  }
}

module "jmeter-distributed-load-test-infra" {
  source  = "./aws-jmeter-distributed-load-test-infra"

  # insert the required variables here
  aws_ami                      = "ami-0dcc0ebde7b2e00db"
  aws_key_name                 = "jmeter"
  jmeter_version               = "5.4.3"
  jmeter_workers_count         = 2
  aws_controller_instance_type = "t2.small"
  aws_worker_instance_type     = "t2.small"
  jmeter_plugins               = ["jpgc-casutg"]
  aws_region = "eu-central-1"

}

output "worker_private_ip" {
  value = module.jmeter-distributed-load-test-infra.worker_private_ip
}

output "controller_public_ip" {
  value = module.jmeter-distributed-load-test-infra.controller_public_ip
}