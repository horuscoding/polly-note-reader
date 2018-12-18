provider "aws" {
  region     = "${var.region}"
  profile = "${var.profile}"
}

resource "aws_dynamodb_table" "posts" {
    name = "posts"
    hash_key = "id"
}

resource "aws_s3_bucket" "static_website" {
  bucket = "my-tf-test-bucket"
  acl    = "public-read"
  
  website {
      index_document = "index.html"
      error_document = "error.html"
  }
}

resource "aws_s3_bucket" "audio_storage" {
    bucket = "my-audio-storage-bucket"
    acl = "public-read"
}
resource "aws_api_gateway_rest_api" "MyDemoAPI" {
  name        = "MyDemoAPI"
  description = "This is my API for demonstration purposes"
}

resource "aws_api_gateway_resource" "MyDemoResource" {
  rest_api_id = "${aws_api_gateway_rest_api.MyDemoAPI.id}"
  parent_id   = "${aws_api_gateway_rest_api.MyDemoAPI.root_resource_id}"
  path_part   = "mydemoresource"
}