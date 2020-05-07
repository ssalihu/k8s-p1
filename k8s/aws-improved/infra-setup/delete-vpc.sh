if [ "$#" -ne 1 ];
then
  echo "Usage error. Missing vpc-id"
  exit
fi
echo "Deleteing $1"
read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # do dangerous stuff
    aws ec2 delete-vpc --vpc-id=$1
fi
