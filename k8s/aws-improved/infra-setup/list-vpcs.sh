aws ec2 describe-vpcs |jq '.Vpcs[] | {VpcId: .VpcId}' -r |jq -r .VpcId
