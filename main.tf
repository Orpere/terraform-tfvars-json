variable "test" {
  type        = string
  description = "some string"
  default     = "test var"
}

output test_result {
  description = "test result"
  value       = "${var.test}"
}