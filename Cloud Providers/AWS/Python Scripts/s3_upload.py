import boto3


def upload_file(file_name, bucket, store_as=None):
    # step1: Tell boto3 that the service used is 'S3'
    # Step2: specify the filename in your pc with absolute path
    # Step3: specify the name of the bucket within which file has to be uploaded
    # Step4 : optionally specify the alternative name by which file will be uploaded to s3
    if store_as is None:
        store_as = file_name
        s3_client = boto3.client("s3")
        s3_client.upload_file(file_name, bucket, store_as)
