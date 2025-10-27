@description('Location for all resources.')
param location string = 'westus2'

var availabilitySetName = 'AvSet'
var virtualNetworkNameHub = 'hayagreevan-west-vnet-hub'
var virtualNetworkName1 = 'hayagreevan-west-vnet-1'
var virtualNetworkName2 = 'hayagreevan-west-vnet-2'
var subnetName = 'default'

// var subnetRef = resourceId('Microsoft.Network/virtualNetworks/subnets', virtualNetworkName, subnetName)


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


resource VnetPeering_hub_1 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-05-01' = {
  parent: virtualNetwork_hub
  name: '${virtualNetworkNameHub}-${virtualNetworkName1}'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: virtualNetwork_1.id
    }
  }
  dependsOn: [ virtualNetwork_1, virtualNetwork_hub]
}
resource VnetPeering_1_hub 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-05-01' = {
  parent: virtualNetwork_1
  name: '${virtualNetworkName1}-${virtualNetworkNameHub}'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: virtualNetwork_hub.id
    }
  }
  dependsOn: [ virtualNetwork_1, virtualNetwork_hub]
}
resource VnetPeering_hub_2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-05-01' = {
  parent: virtualNetwork_hub
  name: '${virtualNetworkNameHub}-${virtualNetworkName2}'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: virtualNetwork_2.id
    }
  }
  dependsOn: [ virtualNetwork_2, virtualNetwork_hub]
}
resource VnetPeering_2_hub 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-05-01' = {
  parent: virtualNetwork_2
  name: '${virtualNetworkName2}-${virtualNetworkNameHub}'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: virtualNetwork_hub.id
    }
  }
  dependsOn: [ virtualNetwork_2, virtualNetwork_hub]
}

@description('Name of the Network Security Group')
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

output location string = location
output resourceGroupName string = resourceGroup().name

// Hub VNet Outputs
output name_hub string = virtualNetwork_hub.name
output resourceId_hub string = virtualNetwork_hub.id
output addressPrefix_hub string = virtualNetwork_hub.properties.addressSpace.addressPrefixes[0]
output subnetAddressPrefix_hub string = virtualNetwork_hub.properties.subnets[0].properties.addressPrefix

// VNet 1 Outputs
output name_1 string = virtualNetwork_1.name
output resourceId_1 string = virtualNetwork_1.id
output addressPrefix_1 string = virtualNetwork_1.properties.addressSpace.addressPrefixes[0]
output subnetAddressPrefix_1 string = virtualNetwork_1.properties.subnets[0].properties.addressPrefix

// VNet 2 Outputs
output name_2 string = virtualNetwork_2.name
output resourceId_2 string = virtualNetwork_2.id
output addressPrefix_2 string = virtualNetwork_2.properties.addressSpace.addressPrefixes[0]
output subnetAddressPrefix_2 string = virtualNetwork_2.properties.subnets[0].properties.addressPrefix


output nsg_id string = networkSecurityGroup.id
