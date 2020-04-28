mkdir -p ~/.aws
curl https://sdk.cloud.google.com | bash > /dev/null
source $HOME/google-cloud-sdk/path.bash.inc
gcloud components install kubectl
pip install --user awscli
export PATH=$PATH:$HOME/.local/bin    
openssl aes-256-cbc -K $encrypted_dfba7aade086_key -iv $encrypted_dfba7aade086_iv -in config.enc -out ~/.aws/config -d
openssl aes-256-cbc -K $encrypted_d506bd5213c4_key -iv $encrypted_d506bd5213c4_iv -in credentials.enc -out ~/.aws/credentials -d
export AWS_PROFILE=aws-eks
aws eks --region us-east-1 update-kubeconfig --name EmployeeTestCl
# - aws configure set default.aws_access_key_id $DEFAULT_AWS_ACCESS_KEY_ID
# - aws configure set default.aws_secret_access_key $DEFAULT_AWS_SECRET_ACCESS_KEY
# Setup alternative AWS credentials using an AWS Named Profile for testing.
# - aws configure set aws_access_key_id $ALT_AWS_ACCESS_KEY_ID --profile $ALT_AWS_PROFILE
# - aws configure set aws_secret_access_key $ALT_AWS_SECRET_ACCESS_KEY --profile $ALT_AWS_PROFILE
kubectl apply -f k8s/aws