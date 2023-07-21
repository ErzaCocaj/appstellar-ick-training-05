resource "aws_ecr_repository" "foo" {
  name                 = "assignment-4-workspace-erza"
  image_tag_mutability = "MUTABLE"
}
