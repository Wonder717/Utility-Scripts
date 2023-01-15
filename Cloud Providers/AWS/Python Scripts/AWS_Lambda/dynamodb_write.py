import json
import boto3

# write to a table in dyamodb

dynamodb = boto3.resource("dynamodb")

table = dynamodb.Table("<tablename>")  # insert a table name


def lambda_handler(event, context):
    table.put_item(Item={"id": "value", "property": "value"})
    response = {"message": "Item added"}
    return {"statusCode": 200, "body": response}
