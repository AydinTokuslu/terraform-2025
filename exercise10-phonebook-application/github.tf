resource "github_repository_file" "dbendpoint" {
  content = aws_db_instance.my-database-server.address
  file = "dbserver.endpoint"
  repository = "contact-list-project"
  overwrite_on_create = true
  branch = "main"
}
