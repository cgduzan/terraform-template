# Terraform loads all files in the current directory ending in .tf, so you can name your configuration files however you choose.

# The variable block defines a variable that can be set by the user (command line) or by a file in the same directory.
# variable names can be accessed using `var.{variable_name}` (ie. in this case, var.instance_name)
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}
