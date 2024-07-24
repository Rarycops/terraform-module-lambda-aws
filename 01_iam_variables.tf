variable "iam_role_tags" {
  description = "Key-value map of tags for the IAM role."
  type        = map(string)
  default     = {}
}

variable "iam_role_assume_role_policy" {
  description = "The policy that grants an entity permission to assume the role. Must be a valid JSON."
  type        = string
  default     = null
}

variable "iam_role_name" {
  description = "The name of the role. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}

variable "iam_role_description" {
  description = "he description of the role."
  type        = string
  default     = null
}

variable "iam_role_force_detach_policies" {
  description = "Specifies to force detaching any policies the role has before destroying it. Defaults to false."
  type        = bool
  default     = false
}

variable "iam_role_path" {
  description = "The path to the role. See IAM Identifiers for more information."
  type        = string
  default     = null
}

variable "iam_role_max_session_duration" {
  description = "The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
  type        = number
  default     = null
}

variable "iam_role_permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the role."
  type        = string
  default     = null
}

variable "iam_role_policy_attachment_arn" {
  description = "The ARN of the policy you want to apply."
  type        = map(string)
  default     = {}
}

variable "iam_policies" {
  description = "Map for generating policies that are going to be attached to the lambda"
  type = map(object({
    name        = string
    description = string
    path        = string
    policy      = string
    tags        = map(string)
  }))
  default = {}
}
