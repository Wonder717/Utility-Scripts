import json
import boto3

# read from dyamodb

dynamodb = boto3.resource("dynamodb")

table = dynamodb.Table("<tablename>")  # insert a table name


def lambda_handler(event, context):
    response = table.get_item(key={"id": "earth"})

    print(response)

    return {"statusCode": 200, "body": response}
