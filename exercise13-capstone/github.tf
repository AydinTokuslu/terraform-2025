
resource "github_repository" "terraform-capstone-project" {
  name        = "terraform-capstone-project"
  description = "My terraform capstone project"
  visibility  = "public"
  auto_init   = true
}