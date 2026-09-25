package main

deny contains msg if {
	rc := input.resource_changes[_]
	rc.type == "aws_s3_bucket_public_access_block"
	rc.change.after.block_public_acls == false
	msg := sprintf("A.8.3 violated: %s does not block public ACLs", [rc.address])
}

deny contains msg if {
	rc := input.resource_changes[_]
	rc.type == "aws_s3_bucket_public_access_block"
	rc.change.after.restrict_public_buckets == false
	msg := sprintf("A.8.3 violated: %s does not restrict public bucket policies", [rc.address])
}

deny contains msg if {
	rc := input.resource_changes[_]
	rc.type == "aws_s3_bucket"
	rc.change.after.tags.DataClassification == "Confidential"

	kms_configs := [x |
		x := input.resource_changes[_]
		x.type == "aws_s3_bucket_server_side_encryption_configuration"
		x.change.after.rule[_].apply_server_side_encryption_by_default[_].sse_algorithm == "aws:kms"
	]

	count(kms_configs) == 0
	msg := sprintf("A.8.24 violated: %s is classified Confidential but no SSE-KMS encryption configuration was found in the plan", [rc.address])
}
