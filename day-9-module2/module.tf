module "projectk" {
    source = "../day-1"
    ami_id = var.ami
instance_type = var.type
key = var.key_name
#source variable = variable for module

  
  
}