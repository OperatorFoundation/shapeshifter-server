# shapeshifter-server

**These setup instructions assume that you have downloaded and installed terraform from https://www.terraform.io/**

# Setup
1. Clone the repo
2. Download your vars file into the shapeshifter-server directory.
3. in command line: navigate to your shapeshifter-server directory.
4. in command line: "ssh-keygen -t ecdsa" to generate your ssh keys (use default filename (hit enter), no pass phrase (hit enter twice))

# Start your OpenVPN server on Digital Ocean (Make sure you are in your shapeshifter-server directory)
1. in command line: "source ./vars"
2. in command line: "terraform apply"

# Stop your server
1. in command line: "terraform destroy"
