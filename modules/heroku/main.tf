resource "heroku_app" "this" {
  name   = var.app_name
  region = var.app_region
  stack  = var.app_stack
}

resource "heroku_domain" "this" {
  app_id   = heroku_app.this.id
  hostname = var.domain_name
}

resource "heroku_pipeline" "this" {
  name = "${var.app_name}-pipeline"
}

resource "heroku_pipeline_coupling" "this" {
  app_id   = heroku_app.this.id
  pipeline = heroku_pipeline.this.id
  stage    = "production"
}

resource "herokux_pipeline_github_integration" "this" {
  pipeline_id = heroku_pipeline.this.id
  org_repo    = var.github_org_repo
}

resource "herokux_app_github_integration" "this" {
  app_id      = heroku_app.this.uuid
  branch      = var.github_branch
  auto_deploy = true
  wait_for_ci = false

  depends_on = [
    heroku_pipeline_coupling.this,
    herokux_pipeline_github_integration.this
  ]
}

# Bật lại formation để dyno có thể start (đặc biệt quan trọng với stack = "container")
resource "heroku_formation" "this" {
  app_id     = heroku_app.this.id
  type       = "web"
  quantity   = 1
  size       = "basic"
  depends_on = [heroku_app.this]
}
