if [ "$#" -lt 1 ];
then
   echo "Usage error: Parameters are required for this are the subnet ids"
   exit
fi
aws rds create-db-subnet-group --db-subnet-group-name  "DemoDBSubnetGroup" --db-subnet-group-description "Demo DB Subnet Group" --subnet-ids "$1" "$2" | jq '{DBSubnetGroupName:.DBSubnetGroup.DBSubnetGroupName,VpcId:.DBSubnetGroup.VpcId,Subnets:.DBSubnetGroup.Subnets[].SubnetIdentifier}'

