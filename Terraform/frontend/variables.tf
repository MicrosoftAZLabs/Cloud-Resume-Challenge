variable "location" {
  description = "The Azure Region in which all resources groups should be created."
}

variable "rg-name" {
    description = "The name of the resource group"
}

variable "storage-account-name" {
  description = "The name of the storage account"
}

variable "index_document" {
  description = "The index document of the static website"
}

variable "error_document" {
  description = "The error document of the static website"
}

variable "source_content" {
  description = "This is the source content for the static website"
}

variable "account_tier" {
  description = "This is account tier for the storage account"
  default = "Standard"
}

variable "account_replication_type" {
  description = "This is account replication type for the storage account"
  default = "LRS"
}

variable "account_kind" {
  description = "This is account kind for the storage account"
  default = "StorageV2"
}

variable "cdnprofile-name" {
  description = "This is CDN Profile name"
}

variable "cdnprofile-sku" {
  description = "This is SKU of the CDN Profile"
}

variable "cdn-endpoint-name" {
  description = "Name of the CDN Endpoint Profile"
}