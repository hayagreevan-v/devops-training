resource hayagreevan_mi 'Microsoft.ManagedIdentity/userAssignedIdentities@2024-11-30' = {
    name : 'hayagreevan-mi-bicep'
    location: 'eastus'
    properties: {
        isolationScope:'None'
    }
} 
output clienId string = hayagreevan_mi.properties.clientId
