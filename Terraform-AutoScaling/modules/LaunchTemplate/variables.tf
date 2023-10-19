variable "snapshot_id" {
  type    = string
  default = "snap-04df0d2473a226073"  # Replace with your snapshot ID
}

variable "name_prefix" {
  type    = string
  default = "terraform"  # Replace with your name prefix
}

variable "key_name" {
  type    = string
  default = "LoadTest"  # Replace with your key pair name
}