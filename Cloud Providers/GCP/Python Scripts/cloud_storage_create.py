from google.cloud import storage


def create_bucket(name):

    storage_client = storage.Client()
    bucket = storage_client.bucket(name)
    bucket.storage_class = "NEARLINE"
    new_bucket = storage_client.create_bucket(bucket, location="us")

    return new_bucket
