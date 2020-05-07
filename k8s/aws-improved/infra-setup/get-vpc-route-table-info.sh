if [ "$#" -ne 1 ];
then
   echo "Usage error: VPC Parameter missing"
   exit
fi
route_table_id=`aws ec2 describe-route-tables --filters Name=vpc-id,Values=$1 | jq -r '.RouteTables[0].RouteTableId'`
echo "Route table id for $1 is $route_table_id"
