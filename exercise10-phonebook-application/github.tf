resource "github_repository_file" "dbendpoint" {
  content = aws_db_instance.my-database-server.address
  file = "dbserver.endpoint"
  repository = "contact-list-project"
  overwrite_on_create = true
  branch = "main"
}




# resource "github_repository" "foo" {
#   name      = "contact-list-project"
#   auto_init = true
# }

# resource "github_repository_file" "foo" {
#   repository          = github_repository.foo.name
#   branch              = "main"
#   file                = "dbserver.endpoint"
#   #file                = ".gitignore"
#   content             = aws_db_instance.my-database-server.address
#   commit_message      = "Managed by Terraform"
#   commit_author       = "AydinTokuslu"
#   commit_email        = "aydintokuslu78@gmail.com"
#   overwrite_on_create = true
# }
