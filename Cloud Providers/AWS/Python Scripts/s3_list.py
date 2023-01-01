import boto3


def list_bucket_():
    # Step1: Tell Boto3 that the service used is s3
    # Step2: Get list of buckets
    # Step3: Iterate over the list of buckets
    s3_client = boto3.client("s3")
    response = s3_client.list_buckets()
    print("These are buckets accessible by your credentials:")
    for bucket in response["Buckets"]:
        print(f' {bucket ["Name"]}')
