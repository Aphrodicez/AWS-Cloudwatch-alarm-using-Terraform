module "sns" {
  source = "../aws_sns"
}

/*
  ${metric_name} >= ${treshold} for ${evaluation_periods} datapionts within (${evaluation_periods} * ${period}) 
*/
resource "aws_cloudwatch_metric_alarm" "your_alarm_reference_name" {
  alarm_name                = "Your visible alarm name" # Replace with your Alarm name
  alarm_description         = "Your alarm description here." # Replace with your Alarm description
  
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 1
  period                    = 60 # seconds
  statistic                 = "Sum"
  threshold                 = 1
  #-------------------------------------------------------------------#
  metric_name               = "Invocations"
  namespace                 = "AWS/Lambda"
  
  dimensions = {
    FunctionName = "helloChatbot"
  }

  alarm_actions = [
    module.sns.arn
  ]
}