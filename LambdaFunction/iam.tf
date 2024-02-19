resource "aws_iam_role" "lambda_role_ebs" {
  name = "AutoDeleteUnusedEBSvolumes_Role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        },
        "Effect" : "Allow",
        "Sid" : ""
      }
    ]
  })
}


resource "aws_iam_policy" "iam_policy_for_lambda_ebs" {
  name        = "AutoDeleteUnusedEBSvolumes_Policy"
  path        = "/"
  description = "AWS IAM Policy for managing AWS Lambda role"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "arn:aws:logs:*:*:*",
        "Effect" : "Allow"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "ec2:DeleteVolume",
          "ec2:DescribeVolumes"
        ],
        "Resource" : "*",
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "sns:Publish"
        ],
        "Resource" : "${var.sns_topic_arn}"
      }
    ]
    }
  )
}




resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role       = aws_iam_role.lambda_role_ebs.name
  policy_arn = aws_iam_policy.iam_policy_for_lambda_ebs.arn
}