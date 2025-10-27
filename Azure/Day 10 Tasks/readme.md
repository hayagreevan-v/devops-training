# Day 10 Tasks
## Tasks
Create 3 VNETs and deploy 3 VMs in each VNET. 1st and 2nd VNET should be private and 3rd VNET should be public . If VM from 1st VNET needs to connect to vm in 2nd VNET it should pass through vm in 3rd VNET
Extra - Make this flow entirely with private dns zones so , that you can reach the VM’s via private domain names instead of IP’s.
using AZ Bicep


### Steps
1. Created 3 Vnets with peering
2. Created 3 VMs in each vnet with custom data and ip-forwarding in nic
3. Add route table and associate vnets



``` sh
az group create --name hayagreevan-rg --location westus2

az deployment group create --resource-group hayagreevan-rg --template-file 'main. bicep'
```


``` json
{
  "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Resources/deployments/main",
  "location": null,
  "name": "main",
  "properties": {
    "correlationId": "b72cdac0-b9b4-4ddc-b31d-58d9e03e64b7",
    "debugSetting": null,
    "dependencies": [
      {
        "dependsOn": [
          {
            "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Resources/deployments/hayagreevan-vnets",
            "resourceGroup": "hayagreevan-rg",
            "resourceName": "hayagreevan-vnets",
            "resourceType": "Microsoft.Resources/deployments"
          }
        ],
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Resources/deployments/vm_1-ym5redvl74lro",
        "resourceGroup": "hayagreevan-rg",
        "resourceName": "vm_1-ym5redvl74lro",
        "resourceType": "Microsoft.Resources/deployments"
      },
      {
        "dependsOn": [
          {
            "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Resources/deployments/hayagreevan-vnets",
            "resourceGroup": "hayagreevan-rg",
            "resourceName": "hayagreevan-vnets",
            "resourceType": "Microsoft.Resources/deployments"
          }
        ],
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Resources/deployments/vm_2-qg6zqwqluspbs",
        "resourceGroup": "hayagreevan-rg",
        "resourceName": "vm_2-qg6zqwqluspbs",
        "resourceType": "Microsoft.Resources/deployments"
      },
      {
        "dependsOn": [
          {
            "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Resources/deployments/hayagreevan-vnets",
            "resourceGroup": "hayagreevan-rg",
            "resourceName": "hayagreevan-vnets",
            "resourceType": "Microsoft.Resources/deployments"
          }
        ],
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Resources/deployments/vm_hub-oaqhxgsdawqki",
        "resourceGroup": "hayagreevan-rg",
        "resourceName": "vm_hub-oaqhxgsdawqki",
        "resourceType": "Microsoft.Resources/deployments"
      },
      {
        "dependsOn": [
          {
            "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Resources/deployments/vm_1-ym5redvl74lro",
            "resourceGroup": "hayagreevan-rg",
            "resourceName": "vm_1-ym5redvl74lro",
            "resourceType": "Microsoft.Resources/deployments"
          },
          {
            "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Resources/deployments/vm_2-qg6zqwqluspbs",
            "resourceGroup": "hayagreevan-rg",
            "resourceName": "vm_2-qg6zqwqluspbs",
            "resourceType": "Microsoft.Resources/deployments"
          },
          {
            "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Resources/deployments/vm_hub-oaqhxgsdawqki",
            "resourceGroup": "hayagreevan-rg",
            "resourceName": "vm_hub-oaqhxgsdawqki",
            "resourceType": "Microsoft.Resources/deployments"
          },
          {
            "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Resources/deployments/hayagreevan-vnets",
            "resourceGroup": "hayagreevan-rg",
            "resourceName": "hayagreevan-vnets",
            "resourceType": "Microsoft.Resources/deployments"
          }
        ],
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Resources/deployments/rt_integration-adzzswufpmc4u",
        "resourceGroup": "hayagreevan-rg",
        "resourceName": "rt_integration-adzzswufpmc4u",
        "resourceType": "Microsoft.Resources/deployments"
      }
    ],
    "diagnostics": null,
    "duration": "PT7M42.8716991S",
    "error": null,
    "extensions": null,
    "mode": "Complete",
    "onErrorDeployment": null,
    "outputResources": [
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Compute/virtualMachines/hayagreevan-vm-1",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Compute/virtualMachines/hayagreevan-vm-1/extensions/GuestAttestation",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Compute/virtualMachines/hayagreevan-vm-2",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Compute/virtualMachines/hayagreevan-vm-2/extensions/GuestAttestation",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Compute/virtualMachines/hayagreevan-vm-hub",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Compute/virtualMachines/hayagreevan-vm-hub/extensions/GuestAttestation",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/networkInterfaces/hayagreevan-vm-1-NetInt",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/networkInterfaces/hayagreevan-vm-2-NetInt",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/networkInterfaces/hayagreevan-vm-hub-NetInt",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/networkSecurityGroups/SecGroupNet",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/publicIPAddresses/hayagreevan-vm-1-PublicIP",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/publicIPAddresses/hayagreevan-vm-2-PublicIP",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/publicIPAddresses/hayagreevan-vm-hub-PublicIP",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/routeTables/rt",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/virtualNetworks/hayagreevan-west-vnet-1",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/virtualNetworks/hayagreevan-west-vnet-1/subnets/default",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/virtualNetworks/hayagreevan-west-vnet-1/virtualNetworkPeerings/hayagreevan-west-vnet-1-hayagreevan-west-vnet-hub",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/virtualNetworks/hayagreevan-west-vnet-2",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/virtualNetworks/hayagreevan-west-vnet-2/subnets/default",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/virtualNetworks/hayagreevan-west-vnet-2/virtualNetworkPeerings/hayagreevan-west-vnet-2-hayagreevan-west-vnet-hub",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/virtualNetworks/hayagreevan-west-vnet-hub",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/virtualNetworks/hayagreevan-west-vnet-hub/subnets/default",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/virtualNetworks/hayagreevan-west-vnet-hub/virtualNetworkPeerings/hayagreevan-west-vnet-hub-hayagreevan-west-vnet-1",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      },
      {
        "apiVersion": null,
        "extension": null,
        "id": "/subscriptions/145ccdc1-6c51-4e45-a04e-21bdea03d170/resourceGroups/hayagreevan-rg/providers/Microsoft.Network/virtualNetworks/hayagreevan-west-vnet-hub/virtualNetworkPeerings/hayagreevan-west-vnet-hub-hayagreevan-west-vnet-2",
        "identifiers": null,
        "resourceGroup": "hayagreevan-rg",
        "resourceType": null
      }
    ],
    "outputs": {
      "vm_1_ip": {
        "type": "String",
        "value": "10.102.0.4"
      },
      "vm_1_ssh": {
        "type": "String",
        "value": "ssh azureuser@hayagreevan-vm-1-oawwofdtnnrjo.westus2.cloudapp.azure.com"
      },
      "vm_2_ip": {
        "type": "String",
        "value": "10.103.0.4"
      },
      "vm_2_ssh": {
        "type": "String",
        "value": "ssh azureuser@hayagreevan-vm-2-oawwofdtnnrjo.westus2.cloudapp.azure.com"
      },
      "vm_hub_ip": {
        "type": "String",
        "value": "10.101.0.4"
      },
      "vm_hub_shh": {
        "type": "String",
        "value": "ssh azureuser@hayagreevan-vm-hub-oawwofdtnnrjo.westus2.cloudapp.azure.com"
      }
    },
    "parameters": null,
    "parametersLink": null,
    "providers": [
      {
        "id": null,
        "namespace": "Microsoft.Resources",
        "providerAuthorizationConsentState": null,
        "registrationPolicy": null,
        "registrationState": null,
        "resourceTypes": [
          {
            "aliases": null,
            "apiProfiles": null,
            "apiVersions": null,
            "capabilities": null,
            "defaultApiVersion": null,
            "locationMappings": null,
            "locations": [
              null
            ],
            "properties": null,
            "resourceType": "deployments",
            "zoneMappings": null
          }
        ]
      }
    ],
    "provisioningState": "Succeeded",
    "templateHash": "3537585499457142868",
    "templateLink": null,
    "timestamp": "2025-10-27T10:29:27.644357+00:00",
    "validatedResources": null,
    "validationLevel": null
  },
  "resourceGroup": "hayagreevan-rg",
  "tags": null,
  "type": "Microsoft.Resources/deployments"
}
```