module vnet 'vnet.bicep' = {
  name: 'hayagreevan-vnets'
  params: {
    location: 'westus2'
  }
}

module vm_1 'vm.bicep' = {
  dependsOn: [vnet]
  params: {
    vmName: 'hayagreevan-vm-1'
    virtualNetworkName: 'hayagreevan-west-vnet-1'
    subnetName: 'default'
    addressPrefix: vnet.outputs.addressPrefix_1
    subnetAddressPrefix: vnet.outputs.subnetAddressPrefix_1
    adminPasswordOrKey: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDpqSjySip3HRQybdHJkjY9RSxuAxn9awCiEZLqFBMCcVHANhA5Gzc5g8351EwocnMbQQJTAGlRFX2tVsetEQk145/nF+MkbYJIgqUTLFGOWFsdw2thYMzQbf2aPI9KX0a6Ok/3six3+nHeN5SRn2jSG5JG+nNCcm+mO+1wR3eZ5T0/At4lFy4eJNZi8X7BRNQXrjlGqFIrFcQ26tjsumv2Alba/0c6AHKOyK11xKwLiGz8aqkGn+BxrVZHIDpTDn5veX57QLndQxuqYkONFkDOUNRNTyELc1bmPqgUiR9dQhQagtur6b1lQ6AWGxB7N+1rI3MzZ/+wgn7pYL8hh2BJ6y9aLxAYHm7mvgS6z+Sewuv2+k39ToHQf/M2f0GjtIba121TckCgHWTCnzAcOEJvW8knpZmlALD4qZyOKp5IY8A6/glrdV1midog2/TFPjbvOq/0vky0gSmkXLgT8VbWocRSiJgy3qSKY/62g/1gITj5bQUvagtsDc/Cfmjsa60= generated-by-azure'
    nsg_id: vnet.outputs.nsg_id
  }
}
module vm_2 'vm.bicep' = {
  dependsOn: [vnet]
  params: {
    vmName: 'hayagreevan-vm-2'
    virtualNetworkName: 'hayagreevan-west-vnet-2'
    subnetName: 'default'
    addressPrefix: vnet.outputs.addressPrefix_2
    subnetAddressPrefix: vnet.outputs.subnetAddressPrefix_2
    adminPasswordOrKey: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDpqSjySip3HRQybdHJkjY9RSxuAxn9awCiEZLqFBMCcVHANhA5Gzc5g8351EwocnMbQQJTAGlRFX2tVsetEQk145/nF+MkbYJIgqUTLFGOWFsdw2thYMzQbf2aPI9KX0a6Ok/3six3+nHeN5SRn2jSG5JG+nNCcm+mO+1wR3eZ5T0/At4lFy4eJNZi8X7BRNQXrjlGqFIrFcQ26tjsumv2Alba/0c6AHKOyK11xKwLiGz8aqkGn+BxrVZHIDpTDn5veX57QLndQxuqYkONFkDOUNRNTyELc1bmPqgUiR9dQhQagtur6b1lQ6AWGxB7N+1rI3MzZ/+wgn7pYL8hh2BJ6y9aLxAYHm7mvgS6z+Sewuv2+k39ToHQf/M2f0GjtIba121TckCgHWTCnzAcOEJvW8knpZmlALD4qZyOKp5IY8A6/glrdV1midog2/TFPjbvOq/0vky0gSmkXLgT8VbWocRSiJgy3qSKY/62g/1gITj5bQUvagtsDc/Cfmjsa60= generated-by-azure'
    nsg_id: vnet.outputs.nsg_id
  }
}
module vm_hub 'vm.bicep' = {
  dependsOn: [vnet]
  params: {
    vmName: 'hayagreevan-vm-hub'
    virtualNetworkName: 'hayagreevan-west-vnet-hub'
    subnetName: 'default'
    addressPrefix: vnet.outputs.addressPrefix_hub
    subnetAddressPrefix: vnet.outputs.subnetAddressPrefix_hub
    adminPasswordOrKey: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDpqSjySip3HRQybdHJkjY9RSxuAxn9awCiEZLqFBMCcVHANhA5Gzc5g8351EwocnMbQQJTAGlRFX2tVsetEQk145/nF+MkbYJIgqUTLFGOWFsdw2thYMzQbf2aPI9KX0a6Ok/3six3+nHeN5SRn2jSG5JG+nNCcm+mO+1wR3eZ5T0/At4lFy4eJNZi8X7BRNQXrjlGqFIrFcQ26tjsumv2Alba/0c6AHKOyK11xKwLiGz8aqkGn+BxrVZHIDpTDn5veX57QLndQxuqYkONFkDOUNRNTyELc1bmPqgUiR9dQhQagtur6b1lQ6AWGxB7N+1rI3MzZ/+wgn7pYL8hh2BJ6y9aLxAYHm7mvgS6z+Sewuv2+k39ToHQf/M2f0GjtIba121TckCgHWTCnzAcOEJvW8knpZmlALD4qZyOKp5IY8A6/glrdV1midog2/TFPjbvOq/0vky0gSmkXLgT8VbWocRSiJgy3qSKY/62g/1gITj5bQUvagtsDc/Cfmjsa60= generated-by-azure'
    nsg_id: vnet.outputs.nsg_id
  }
}

module rt_integration 'routetable.bicep' = {
  params: {
    address_prefix_1: vnet.outputs.addressPrefix_1
    address_prefix_2: vnet.outputs.addressPrefix_2
    next_hop_address: vm_hub.outputs.privateIpAddress
    location: 'westus2'
  }
  dependsOn: [vnet, vm_1, vm_2, vm_hub]
}
output vm_1_ssh string = vm_1.outputs.sshCommand
output vm_1_ip string = vm_1.outputs.privateIpAddress
output vm_2_ssh string = vm_2.outputs.sshCommand
output vm_2_ip string = vm_2.outputs.privateIpAddress
output vm_hub_shh string = vm_hub.outputs.sshCommand
output vm_hub_ip string = vm_hub.outputs.privateIpAddress

