var virtualNetworkNameHub = 'hayagreevan-west-vnet-hub'
var virtualNetworkName1 = 'hayagreevan-west-vnet-1'
var virtualNetworkName2 = 'hayagreevan-west-vnet-2'
var subnetName = 'default'

resource virtualNetwork_hub 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: virtualNetworkNameHub
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.101.0.0/16'
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: '10.101.0.0/24'
        }
      }
    ]
  }
}

resource virtualNetwork_1 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: virtualNetworkName1
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.102.0.0/16'
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: '10.102.0.0/24'
        }
      }
    ]
  }
}
resource virtualNetwork_2 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: virtualNetworkName2
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.103.0.0/16'
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: '10.103.0.0/24'
        }
      }
    ]
  }
}

param networkSecurityGroupName string = 'SecGroupNet'
resource networkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2023-09-01' = {
  name: networkSecurityGroupName
  location: location
  properties: {
    securityRules: [
      {
        name: 'SSH'
        properties: {
          priority: 1000
          protocol: 'Tcp'
          access: 'Allow'
          direction: 'Inbound'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '22'
        }
      }
    ]
  }
}


param address_prefix_1 string
param address_prefix_2 string
param next_hop_address string
param location string = 'westus2'

resource routeTable 'Microsoft.Network/routeTables@2020-11-01' = {
  name: 'rt'
  location: location
  properties: {
    routes: [
      {
        name: 'hub-1'
        properties: {
          addressPrefix: address_prefix_1
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: next_hop_address // Hub VM private IP
        }
      }
      {
        name: 'hub-2'
        properties: {
          addressPrefix: address_prefix_2
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: next_hop_address // Hub VM private IP
        }
      }
    ]
  }
}

// --- Associate NSGs and Route table with subnets ---
resource assocSubnet1 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetwork_1
  name: subnetName
  properties: {
    addressPrefix: virtualNetwork_1.properties.subnets[0].properties.addressPrefix
    networkSecurityGroup: { id: networkSecurityGroup.id }
    routeTable: { id: routeTable.id }
  }
}

resource assocSubnet2 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetwork_2
  name: subnetName
  properties: {
    addressPrefix: virtualNetwork_2.properties.subnets[0].properties.addressPrefix
    networkSecurityGroup: { id: networkSecurityGroup.id }
    routeTable: { id: routeTable.id }
  }
}

resource assocSubnethub 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetwork_hub
  name: subnetName
  properties: {
    addressPrefix: virtualNetwork_hub.properties.subnets[0].properties.addressPrefix
    networkSecurityGroup: { id: networkSecurityGroup.id }
  }
}

