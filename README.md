# LocalStack

### Start localstack
```
localstack start
```
### Add Environment Variable
```
export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_REGION=eu-central-1
```
### terraform Apply Command
```
terrafrom init
terraform plan --auto-approve
terrafrom apply --auto-approve
terrafrom destroy --auto-approve
```

### Copy file to localstack s3 bucket
```    
aws --region eu-central-1 --endpoint-url http://localhost:4566 s3 cp README.md s3://<s3-bucket>/
```

### List file to localstack s3 bucket
```
aws --region eu-central-1 --endpoint-url http://localhost:4566 s3 ls s3://<s3-bucket>/
```

### Delete file to localstack s3 bucket
```
aws --region eu-central-1 --endpoint-url http://localhost:4566 s3 rm s3://<s3-bucket>/README.md --recursive
```

### CloudWatching
```
aws --region eu-central-1 --endpoint-url http://localhost:4566 logs describe-log-groups
aws --region eu-central-1 --endpoint-url http://localhost:4566 logs describe-log-streams --log-group-name '/aws/lambda/s3_lambda_function'
aws --region eu-central-1 --endpoint-url http://localhost:4566 logs describe-log-streams --log-group-name '/aws/lambda/s3_lambda_function' --log-stream-name '2023/04/26/{$LATEST}34ret5346y67utr"%
```
