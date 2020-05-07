if [ "$#" -lt 1 ];
then
   echo "Usage error: Parameters are required for this are the subnet ids"
   exit
fi
VPC_SECURITY_GROUP_ID=`aws ec2 create-security-group --group-name DemoRDSSecurityGroup --description "Demo RDS security group" --vpc-id $1 | jq -r .GroupId`
echo "create security group id $VPC_SECURITY_GROUP_ID"
