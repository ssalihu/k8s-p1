aws rds   describe-db-subnet-groups |jq '.DBSubnetGroups[] | {DBSubnetGroupName: .DBSubnetGroupName}' -r |jq -r .DBSubnetGroupName
