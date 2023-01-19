import boto3


def search():
    s3_client = boto3.client("s3")
    bucket_name = "Models_Bucket"
    result = s3_client.list_objects(Bucket=bucket_name, Delimiter="/")
    for prefix in result["CommonPrefixes"]:
        objects_ = prefix.get("Prefix")
        if objects_ == "22/07/2021/":
            files_in_each_buck = s3_client.list_objects(
                Bucket=bucket_name, Prefix=objects_
            )
            for content in files_in_each_buck.get("Contents", []):
                if "mobilenet.h5" in content["Key"]:
                    print(content["Key"])
