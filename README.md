# shapeshifter-server

Setup
1. Clone the repo
2. Download your vars file into the shapeshifter-server directory.
3. in command line: "ssh-keygen -t ecdsa" to generate your ssh keys (use default filename (hit enter), no pass phrase (hit enter twice))

Start your OpenVPN server on Digital Ocean
1. in command line: "source ./vars"
2. in command line: "terraform apply"

Stop your server
1. in command line: "terraform destroy"
