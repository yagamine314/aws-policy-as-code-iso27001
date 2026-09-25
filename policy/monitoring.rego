package main

deny contains msg if {
	guardduty_detectors := [rc |
		rc := input.resource_changes[_]
		rc.type == "aws_guardduty_detector"
	]
	count(guardduty_detectors) == 0
	msg := "A.8.16 violated: no aws_guardduty_detector resource found in the plan"
}
