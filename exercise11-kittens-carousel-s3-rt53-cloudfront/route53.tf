data "aws_route53_zone" "selected" {
  name = var.hosted-zone
}



resource "aws_route53_record" "kittens" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name = "kittens.${var.hosted-zone}"
  type = "A"
  alias {
    name                   = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = true
  }
  depends_on = [aws_cloudfront_distribution.s3_distribution]

}