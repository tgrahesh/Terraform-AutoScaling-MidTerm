output "AMI_snapshotID" {
  value = aws_ami_from_instance.LAMPStackAMI.root_snapshot_id
}

/*output "latest_snapshot_id" {
  value = data.aws_ebs_snapshot.latest_snapshot.id
}
*/