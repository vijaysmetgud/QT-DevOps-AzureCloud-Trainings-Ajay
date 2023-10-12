variable "buckets" {
  type = list(object({
    name   = string
    region = string
  }))

  default = [{
    name   = "sasaj1"
    region = "us-west-1"
    },

    {
      name   = "sasaj2"
      region = "us-west-2"
    },

    {
      name   = "sasaj3"
      region = "us-east-1"
    }

  ]
}