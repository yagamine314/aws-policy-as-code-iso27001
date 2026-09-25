package main

deny contains msg if {
	rc := input.resource_changes[_]
	rc.type == "aws_iam_role_policy"
	policy := json.unmarshal(rc.change.after.policy)
	statement := policy.Statement[_]
	statement.Effect == "Allow"
	statement.Action == "*"
	statement.Resource == "*"
	msg := sprintf("A.8.2 violated: %s grants unrestricted Action:* and Resource:*", [rc.address])
}


