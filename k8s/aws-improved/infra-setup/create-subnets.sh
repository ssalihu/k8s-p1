if [ "$#" -ne 3 ];
then 
  echo "Usage error. Must provide <vpc-id>  <region> <cidr-range>"
  exit
fi
aws ec2 create-subnet \
       --availability-zone $2 \
       --vpc-id $1 \
       --cidr-block $3 | jq '{SubnetId:.Subnet.SubnetId,AvailabilityZone:.Subnet.AvailabilityZone,CidrBlock:.Subnet.CidrBlock,VpcId:.Subnet.VpcId}' 
