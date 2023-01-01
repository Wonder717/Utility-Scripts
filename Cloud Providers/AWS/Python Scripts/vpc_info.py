import sys
import boto3


def main():
    if len(sys.argv) < 2:
        print("Please supply a VPC id as an argument!")
    else:
        vpc_id = sys.argv[1]
        print("VPC ID:", vpc_id)

        # Get EC2 resource
        ec2 = boto3.resource("ec2")

        # Get VPC resource using Ec2 resource by supplying VPC ID
        vpc = ec2.Vpc(vpc_id)
        print("VPC CIDR:", vpc.cidr_block)


if __name__ == "__main__":
    main()
