import boto3


def create_queue(queue_name):
    sqs = boto3.resource("sqs")
    queue = sqs.create_queue(QueueName=queue_name)
    # The new queue's url identifier
    print(queue.url)
