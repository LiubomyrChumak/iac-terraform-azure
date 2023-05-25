variable "resource_group_name" {
  description = "Nazwa grupy zasobów"
  type        = string
}

variable "location" {
  description = "Lokalizacja zasobów"
  type        = string
}

variable "storage_account_name" {
  description = "Nazwa konta magazynowego"
  type        = string
}

variable "app_service_plan_name" {
  description = "Nazwa planu usługi aplikacyjnej"
  type        = string
}

variable "function_app_name" {
  description = "Nazwa aplikacji funkcji"
  type        = string
}

variable "function_name" {
  description = "Nazwa funkcji"
  type        = string
}
