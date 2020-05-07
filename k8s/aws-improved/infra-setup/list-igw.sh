echo "aws ec2 describe-internet-gateways |jq '.InternetGateways[] |{InternetGatewayId: .InternetGatewayId}'|jq -r .InternetGatewayId"
aws ec2 describe-internet-gateways |jq '.InternetGateways[] |{InternetGatewayId: .InternetGatewayId}'|jq -r .InternetGatewayId
