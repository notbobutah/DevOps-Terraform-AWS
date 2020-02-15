# Steps to setup a cluster with terraform

Linux Bash setup, tool installation and configuration
installing and configuring Amazon Web Services tools


### AWS CLI installation
```curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```
#### optional eks cli installaition
```curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/laqa_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
```
### Kubectl Installation
using package manager
```
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
kubectl version --client
```
Using curl method
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
```

### TerraForm Installation
```wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
sudo unzip ./terraform_0.11.13_linux_amd64.zip -d /usr/local/bin/
terraform -v
```

### AWS credential setup
Login to your AWS account
go to the my security credentials page under my account menu(Your name)
Click Access Keys panel
Create new Access key
download access key file
```
vi ~/bashrc 
```
add the following lines 
```
export AWS_ACCESS_KEY_ID=AKXXXXXXXXXXXX
export AWS_SECRET_ACCESS_KEY=Xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
export AWS_DEFAULT_REGION=us-west-2

``` 
Replacing the X,x with the ACCESS and SECRET from the downloaded file

#### AWS Config file method qanstrating named configuartions
vi ~/.aws/config
```
[default]
aws_access_key_id=AKXXXXXXXXXXXX
aws_secret_access_key=Xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
region=us-west-2
output=json

[profile eksuser]
aws_access_key_id=AKXXXXXXXXXXXX
aws_secret_access_key=Xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
region=us-east-1
output=text
```

### AWS Document reference
https://docs.aws.amazon.com/cli/laqa/userguide/aws-cli.pdf


### qa AWS CLI Setup
```
aws iam get-user
{
    "User": {
        "UserId": "561246147461",
        "Arn": "arn:aws:iam::561246147461:root",
        "CreateDate": "2016-01-19T17:46:47+00:00",
        "PasswordLastUsed": "2020-02-15T17:34:00+00:00"
    }
}
```

```
aws sts get-caller-identity
{
    "UserId": "561246147461",
    "Account": "561246147461",
    "Arn": "arn:aws:iam::561246147461:root"
}
```

```
aws eks update-kubeconfig --name qa
Added new context arn:aws:eks:us-west-2:561246147461:cluster/qa to ~/.kube/config
```
