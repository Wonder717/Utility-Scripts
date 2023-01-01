import sys
import boto3


def main():
    if len(sys.argv) < 2:
        print("Please supply a VPC id as an argument!")
    else:
        vpc_id = sys.argv[1]
        print("VPC ID:", vpc_id)

        # Display RDS instances in VPC
        client = boto3.client("rds")
        response = client.describe_db_instances()

        # Use Python lambda to filter DB instances that are in our VPC
        rds_instances = list(
            filter(
                lambda x: x["DBSubnetGroup"]["VpcId"] == vpc_id, response["DBInstances"]
            )
        )
        if len(rds_instances) > 0:
            print("\nRDS Instances:")
            for rds in rds_instances:
                print(rds["DBInstanceIdentifier"])
        else:
            print("There is no RDS instance in this VPC!")


if __name__ == "__main__":
    main()
