terraform{
    required_providers: {
        aws = {
            source = "hashicorp/aws",
            version = "~> 3.27"
        }
    }

    required_version: ">= 0.14.9"
} //aqui especificou o provedor 

provider "aws" {
    profile = "default",
    region = "us-west-2"
} // provedor utilizado 

resource "aws_instance" "app_server" {
    ami = "ami-830c94e3" //tem que pegar do console da AWS ou do provedor
    instance_type = "t2.micro"

    tags = {
        Name = "Primeira instância"
    }
}