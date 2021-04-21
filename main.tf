data "cloudfoundry_org" "org" {
  name = var.cf_org
}

data "cloudfoundry_space" "space" {
  org  = data.cloudfoundry_org.org.id
  name = var.cf_space
}

data "cloudfoundry_domain" "domain" {
  name = var.cf_domain
}


resource "cloudfoundry_app" "bgtest" {
  name         = "bgtest"
  space        = data.cloudfoundry_space.space.id
  memory       = var.memory
  disk_quota   = var.disk
  docker_image = var.bgtest_image
  strategy     = var.strategy

  routes {
    route = cloudfoundry_route.bgtest.id
  }
}

resource "cloudfoundry_route" "bgtest" {
  domain   = data.cloudfoundry_domain.domain.id
  space    = data.cloudfoundry_space.space.id
  hostname = "bgtest"
}
