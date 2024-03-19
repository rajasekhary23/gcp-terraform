variable "project_name" {
    type = string
    description = "project_name"
    default = "Speedcloud"
}

variable "worker_names" {
    type = list(number)
    default = [1,2,3]
}

variable "vmproperties" {
    type = map(string)
    description = "worker VM properties"
    default = {
        vmtype = "e2-micro"
        image = "debian-cloud/debian-12"
    }
}