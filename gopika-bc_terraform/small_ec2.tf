provider "aws" {
    region = "eu-central-1"
    access_key = "your_IAM_access_key"
    secret_key = "your_IAM_secret_key"
}

variable "ssh_public_key" {
    type = string
    default = "<your_public_key>"
}

resource "aws_key_pair" "Gopika_Krishnakumar-tf-sec-01" {
    key_name   = "Gopika_Krishnakumar-tf-sec-01"
    public_key = trimspace(var.ssh_public_key)
}

resource "aws_instance" "Gopika_Krishnakumar-tf-sec-01" {
    ami           = "ami-09042b2f6d07d164a"
    instance_type = "t2.micro"
    key_name      = aws_key_pair.Gopika_Krishnakumar-tf-sec-01.key_name

    tags = {
        Name  = "Gopika_Krishnakumar-BootcampMicroEC2"
        Owner = "Gopika_Krishnakumar"
  }
}

output "connection_cmd" {
    value = "ssh -l ec2-user -o StrictHostKeyChecking=no ${aws_instance.Gopika_Krishnakumar-tf-sec-01.public_ip}"
}
