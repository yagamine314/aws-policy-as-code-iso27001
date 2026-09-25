package main

deny contains msg if {
	rc := input.resource_changes[_]
	rc.type == "aws_cloudtrail"
	rc.change.after.is_multi_region_trail == false
	msg := sprintf("A.8.15 violated: %s is not multi-region", [rc.address])
}

deny contains msg if {
	rc := input.resource_changes[_]
	rc.type == "aws_cloudtrail"
	rc.change.after.enable_log_file_validation == false
	msg := sprintf("A.8.15 violated: %s does not have log file validation enabled", [rc.address])
}
