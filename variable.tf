variable "project_info" {
  type = object({
    id              = string
    name            = string
    org_id          = string
    billing_account = string
    random_suffix   = bool
  })
  description = "New GCP project info"
  nullable    = false
}

variable "activate_apis" {
  description = "Service APIs to enable."
  type        = list(string)
  default     = []
}

variable "owners" {
  description = "Optional list of IAM-format members to set as project owners."
  type        = list(string)
  default     = []
}

variable "editors" {
  description = "Optional list of IAM-format members to set as project editor."
  type        = list(string)
  default     = []
}
