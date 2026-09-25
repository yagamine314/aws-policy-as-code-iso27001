# GuardDuty intentionally NOT enabled in this insecure/ state.
# This represents risk R07 — détection tardive d'une activité malveillante.
# The compliant/ version will enable aws_guardduty_detector explicitly.

resource "aws_guardduty_detector" "main" {
  enable = true

  finding_publishing_frequency = "FIFTEEN_MINUTES"

  tags = {
    Name = "${var.project}-guardduty"
  }
}
