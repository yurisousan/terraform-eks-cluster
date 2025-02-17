locals {
  oidc = replace(var.oidc, "https://", "")
}
