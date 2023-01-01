import boto3

ec2 = boto3.client("ec2")

response = ec2.stop_instances(
    InstanceIds=[
        "i-035e9ad0d4b3825e5",
    ],
)
