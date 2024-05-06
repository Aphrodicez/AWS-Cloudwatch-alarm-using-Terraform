resource "aws_sns_topic" "your_topic_reference_name" {
  name              = var.your_alarm_sns_topic_name
}

output "arn" {
  value = aws_sns_topic.your_topic_reference_name.arn
}

resource "aws_sns_topic_subscription" "subscription" {
  topic_arn = aws_sns_topic.your_topic_reference_name.arn
  protocol  = "https"
  endpoint  = "https://global.sns-api.chatbot.amazonaws.com"
}