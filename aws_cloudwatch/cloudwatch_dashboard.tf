resource "aws_cloudwatch_dashboard" "your_dashboard_reference_name" {
  dashboard_name = var.your_visible_dashboard_name

  dashboard_body = file(var.your_dashboard_raw_reference_name)
}