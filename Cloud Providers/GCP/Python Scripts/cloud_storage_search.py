from google.cloud import storage


def search_bucket(bucket_name):
    client = storage.Client()
    buckets = client.list_buckets()
    list_of_buckets = [b.name for b in buckets]
    return (bucket_name in list_of_buckets, list_of_buckets)
