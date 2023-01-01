import boto3


def create_buckets(bucket_name):
    s3_client = boto3.client("s3")
    s3_client.create_bucket(BUcket=bucket_name)
    print("New Bucket Created")
