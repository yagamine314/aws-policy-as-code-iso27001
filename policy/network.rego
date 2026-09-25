package main

deny contains msg if {
	rc := input.resource_changes[_]
	rc.type == "aws_security_group"
	ingress := rc.change.after.ingress[_]
	ingress.from_port <= 22
	ingress.to_port >= 22
	ingress.cidr_blocks[_] == "0.0.0.0/0"
	msg := sprintf("A.8.20 violated: %s allows SSH (port 22) from 0.0.0.0/0", [rc.address])
}

deny contains msg if {
	rc := input.resource_changes[_]
	rc.type == "aws_route_table"
	rc.change.after.tags.Name != "AIS-PFA-public-rt"
	route := rc.change.after.route[_]
	route.cidr_block == "0.0.0.0/0"
	msg := sprintf("A.8.22 violated: %s (private route table) has a route to the internet", [rc.address])
}
