variable region {
    type = "string"
    description = "AWS region to use when provisioning resources"
    default = "us-east-1"
}

variable profile {
    type = "string"
    description = "Profile from your local ~/.aws/credentials file to use for access to AWS"
    default = "default"
}