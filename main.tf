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
    ami = "ami-830c94e3" #tem que pegar do console da AWS ou do provedor
    instance_type = "t2.micro"

    key_name = "iac-alura" #nome da chave

    #user_data = <<-EOF
    #    #!/bin/bash 
    #    cd /home/ubuntu 
    #    echo "<h1>Feito com o terraform</h1>" > index.html 
    #    nohup busybox hhtpd -f -p 8080 &
    #               EOF
    #               código bash para configurar o servidor automaticamente

    tags = {
        Name = "Teste da AWS"
    }
}

#Passo 1: cria terraform 
#Passo 2: Cria a máquina virtual 
#Passo 3: configura as chaves 
#Passo 4: Tem que habilitar o trafego de entrada e saída da máquina

#Rodar servidor http do ubunto -> nohup: busybox hhtpd -f -p 8080 &
#O comando levanta um servidor HHTP na porta 8080, que não será fechado quando desconectar o SSH para

#Tem que por gitignore no ftstate e chave ssh
