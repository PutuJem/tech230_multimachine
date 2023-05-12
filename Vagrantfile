# configure 2 so that 2 virtual machines are created. And note, we need a new do block.
Vagrant.configure("2") do |config|


  config.vm.define "app" do |app|

    # configures the VM settings
    app.vm.box = "ubuntu/bionic64"
    app.vm.network "private_network", ip:"192.168.10.100"

    # put the app folder from our local machine to the vm
    app.vm.synced_folder "app", "/home/vagrant/app"

    # provision the VM to have nginx
    app.vm.provision "shell", path: "provision_app.sh", privileged:false
  
  end

  config.vm.define "database" do |db|

    # configures the VM settings
    db.vm.box = "ubuntu/bionic64"
    db.vm.network "private_network", ip:"192.168.10.150" # any number between 1-255

    db.vm.synced_folder "environment", "/home/vagrant/environment"

    # provision the VM to setup mongodb
    db.vm.provision "shell", path: "provision_db.sh", privileged:false
      
  end
end