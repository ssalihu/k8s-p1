vpc=`aws ec2 create-vpc --cidr-block 10.0.0.0/24 | jq '{VpcId:.Vpc.VpcId,CidrBlock:.Vpc.CidrBlock}' |jq -r .VpcId`
echo "VPC created is $vpc"
