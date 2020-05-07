echo "aws ec2 create-internet-gateway"
igw-id=`aws ec2 create-internet-gateway | jq -r '.InternetGatewayId'`
echo "Internet Gateway ID: $igw-id"
