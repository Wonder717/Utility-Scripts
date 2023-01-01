import boto3

ec2 = boto3.resource("ec2")

instances = ec2.create_instances(
    ImageId="ami-0c6615dle95c98aca",
    MinCount=1,
    MaxCount=3,
    InstanceType="t2.medium",
    KeyName="KeyPair1",
)
