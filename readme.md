# AWS Cloudwatch Alarm Slack bot using Terraform
Set up **AWS Chatbot** with **Terraform** to send notifications from **AWS CloudWatch Alarms** to your **Slack** channel.

## 1. Create SNS topic
- Create [SNS topic](https://ap-southeast-1.console.aws.amazon.com/sns/v3/home?region=ap-southeast-1#/topics) with **Standard** type.

## 2. Create AWS Chatbot
1. Go to [AWS Chatbot](https://us-east-console.aws.amazon.com/chatbot/home?region=ap-southeast-1#/chat-clients).
2. Configure new client.
3. Choose client type > **Slack**.
4. Enter your **Slack Workspace URL**. ( Example: **your_workspace.slack.com** )
5. Allow
6. Configure new channel
7. Choose **configuration name** for your slack channel.
8. You can get Channel ID from by **Right click at your slack channel**.
## IAM Role
- Case 1: You don't have an **existing IAM role** for your bot.
	- Channel Role > **Create an IAM role using a template**.
	- Role name > **your_bot_role_name**
- Case 2:
	- Channel Role > **Use an existing IAM role**.
	- Existing role > **your_bot_role**
##
## SNS Topic
- Select your **region** and **SNS topic**.
## 
9. Click **Configure**. 

## 3. Invite AWS 
1. Go to your slack channel and type **invite @aws**
2. Click invite them. 

# Set up Terraform

## Cloudwatch Dashboard
- Configure your dashboard name in **/aws_cloudwatch/variables.tf**
```tf
variable  "your_visible_dashboard_name" {
	type  =  string
	default  =  "your_dashboard_name_here" # Change here
}
```
- Get your raw dashboard
	1. Go to your Cloudwatch dashboard.
	2. **Actions > View/edit source > Copy source**
	3. Paste the json file in **/aws_cloudwatch/cloudwatch_dashboard_raw.json**

## Cloudwatch Alarm
- Configure **cloudwatch_alarm.tf** with your alarm configuration using **Terraform** format.

## SNS
- Configure your sns name in **aws_sns/variables.tf**
```tf
variable  "your_alarm_sns_topic_name" {
	type  =  string
	default  =  "your_sns_name_here" # Change here
}
```

## Setup your AWS profile
1. Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
2. Type the following command on your terminal. 
	```bash
	aws configure --profile your_profile_name
	```
3. Enter your 
	- **ACCESS_KEY_ID**
	- **SECRET_ACCESS_KEY**
	- **Region** 
	- For **Output**, enter **json**

 ## Terraform Apply
 ### Type the following commands in your terminal.
 1. Select your AWS profile
	 ```bash
	 export AWS_PROFILE=your_profile_name
	 ```
4. Terraform Init **( One Time )**
	```bash
	terraform init
	```
5. Terraform Apply **( After Changes )**
	```
	terraform apply
	```

# Done!