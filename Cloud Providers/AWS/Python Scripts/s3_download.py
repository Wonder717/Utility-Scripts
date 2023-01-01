import boto3


def download_files(bucket_name, path_to_download, save_as=None):
    # Step1 : Tell boto3 that service used is 'S3'
    # Step2: To download, Specify the filename with path of the bucket
    # Step3 : optionally specify te alternative name as which file has to be stored in pc
    s3_client = boto3.client("s3")
    object_to_download = path_to_download
    s3_client.download_file(bucket_name, object_to_download, save_as)
