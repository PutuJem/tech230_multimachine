# **Deploying an application within a Virtual Machine**

### **Installing the application and environment**

Download the following files and place them within the new repository in the next step:

- Download file: [Application](app)

- Download file: [Environment](environment)

### **Setting up a new repository with Vagrant**

For this example, create a directory called `app_development`:

    mkdir app_development

_Note: reminder to place the `Application` and `Environment` file into this directory._

Within the gitbash terminal, whilst being in the repo., initialise Vagrant:

    vagrant init

Create a new provisioning shell script called `provision.sh` to automate the initial gitbash setup commands:

```gitbash
#!/bin/bash

sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt-get install nginx -y

sudo systemctl start nginx
```

Amend and add the following to the configuration of the operating system, provisioning and synced files commands:

```ruby
Vagrant.configure("2") do |config|

  # configures the VM settings
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "private_network", ip:"192.168.10.100"

  # provision the VM to have nginx
  config.vm.provision "shell", path: "provision.sh"

  # put the app folder from our local machine to the vm
  config.vm.synced_folder "app", "/home/vagrant/app"

end
```

Check the repo. contains all of the relevant files:

![Repository](repo.PNG)

### **Deploy the Virtual Machine and install the relevant JavaScript packages**

Deploy the Virtual Machine through vagrant with:

    vagrant up

Connect to the Virtual Machine through:

    vagrant ssh

Once in the Virtual Machine, install the specific `NodeJS` version through the python package manager `python-software-properties` as shown:

    sudo apt-get install python-software-properties -y

Retrieve the appropriate package (`curl -sL`) for the debian distribution within a bash shell (`-E bash`):

    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

Confirm the package has been found and is being installed.

![Retrieve NodeJS 6.x](curl.PNG)

The appropriate `NodeJS` version (6.x) can now be installed with:

    sudo apt-get install nodejs -y

Follow up with installing `NodeJS`' production process manager `pm2`:

    sudo npm install pm2 -g

Navigate to the `/app` folder in the Virtual Machine and install `npm`:

    npm install

Run the main application file:

    node app.js

The following message should be shown within the terminal; this final line informs the user the application has been deployed to port 3000:

![Port 3000 ready](port_ready.PNG)

Access the application through entering the local IP address and port number in a browser:

    192.168.10.100

The application can now be shown running:

![sparta_app](sparta_test.PNG)


