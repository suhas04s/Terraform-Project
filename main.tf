# calling child modules 
module "vpc" {
    source = "./vpc"
  
}

module "ec2" {
    source = "./web"
    sn = module.vpc.sub1
    sg = module.vpc.sg
  
}