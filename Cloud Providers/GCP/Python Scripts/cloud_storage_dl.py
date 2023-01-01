from google.cloud import storage


storage_client = storage.Client()
source_blob_name = "inventory.txt" # blob to download 
destination_file_name = "downloaded_inventories.txt"
bucket_name = "collections-007"

try:
    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(source_blob_name)
    blob.download_to_filename(destination_file_name)
    print(
        "file: ",
        destination_file_name,
        " downloaded from bucket: ",
        bucket_name,
        " successfully",
    )
except Exception as e:
    print(e)
