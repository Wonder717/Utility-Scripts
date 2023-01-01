import boto3

ec2 = boto3.client("ec2")

response = ec2.start_instances(
    InstanceIds=[
        "i-035e9ad0d4b3825e5",
    ],
)
