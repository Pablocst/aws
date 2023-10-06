import json
import boto3

region = 'us-east-1'
ec2 = boto3.resource('ec2', region_name=region)