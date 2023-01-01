from google.cloud import storage


def gcp_storage_upload_file(input_file, bucket_name, blob_name):

    try:
        storage_client = storage.Client()
        bucket = storage_client.get_bucket(bucket_name)
        blob = bucket.blob(blob_name)

        blob.upload_from_filename(input_file)

        print("File {} uploaded to {}.".format(input_file, blob_name))

    except Exception as e:
        print("[ ERROR ] {}".format(e))
