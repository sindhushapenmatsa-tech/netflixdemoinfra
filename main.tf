provider "aws" {
  region = "us-north-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-0aba19e56f3eaec05"
  instance_type          = "c7i-flex.large"
  key_name               = "sindhu-key-new"
  vpc_security_group_ids = ["sg-0ea59f073476fbb92"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "Monitoring server"]
}

resource "aws_s3_bucket" "one" {
  bucket = "my-project-bucket-jenkins-netflix-1234"
  versioning {
    enabled = true
  }
}
