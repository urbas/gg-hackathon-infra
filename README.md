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
4. If you're happy with the changes, run `terraform apply -auto-approve`.
5. Terraform will print the IPs of all clients and the server. Take a note of them.

Once the clients are created, start Jupyter Notebook on all of them:
```
SSH_KEY=./ssh_key
CLIENT_IP=1.2.3.4
ssh -i $SSH_KEY ec2-user@$CLIENT_IP

# On the client:
tmux new -s gg-hackathon
jupyter notebook --port=8280 --ip=0.0.0.0
# Take a note of the link printed by jupyter and detach from the tmux session with `Ctrl+B,D`
```