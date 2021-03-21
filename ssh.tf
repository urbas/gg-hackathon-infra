resource "aws_key_pair" "deploy" {
  key_name   = "gg-deploy"
  public_key = file("ssh_key.pub")
}