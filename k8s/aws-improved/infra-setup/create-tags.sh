if [ "$#" -ne 2 ];
then
   echo "Resource id and Value required. eg:- VPC-ID and the name you want to give"
   exit
fi
aws ec2 create-tags --resources $1 --tags Key=Name,Value=$2
