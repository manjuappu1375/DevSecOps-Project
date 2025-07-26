resource "aws_ecr_repository" "netflix" {
  name = "netflix"

  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name    = "netflix-ecr"
    Project = "netflix-clone"
    Owner   = "Appu"
  }
}

# (Optional) Auto-delete old images after 10 untagged versions
resource "aws_ecr_lifecycle_policy" "netflix_cleanup" {
  repository = aws_ecr_repository.netflix.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Expire untagged images after 10",
        selection = {
          tagStatus     = "untagged",
          countType     = "imageCountMoreThan",
          countNumber   = 10
        },
        action = {
          type = "expire"
        }
      }
    ]
  })
}