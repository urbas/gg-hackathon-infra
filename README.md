# Quick start

1. Create a provisioning ssh key and name it `ssh_key`:
    ```bash
    ssh-keygen
    ```
2. Install `nix` and activate the development environment with this command:
    ```bash
    nix-shell
    ```
3. Run `terraform init` and then `terraform plan` to see what changes will be made.
4. If you're happy with the changes, run `terraform apply -auto-appprove`.