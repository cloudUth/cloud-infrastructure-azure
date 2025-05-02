param storageAccounts_multienterprisestorage01_name string = 'multienterprisestorage01'

resource storageAccounts_multienterprisestorage01_name_resource 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: storageAccounts_multienterprisestorage01_name
  location: 'italynorth'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: true
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    allowSharedKeyAccess: true
    largeFileSharesState: 'Enabled'
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      requireInfrastructureEncryption: false
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource storageAccounts_multienterprisestorage01_name_default 'Microsoft.Storage/storageAccounts/blobServices@2024-01-01' = {
  parent: storageAccounts_multienterprisestorage01_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_multienterprisestorage01_name_default 'Microsoft.Storage/storageAccounts/fileServices@2024-01-01' = {
  parent: storageAccounts_multienterprisestorage01_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_multienterprisestorage01_name_default 'Microsoft.Storage/storageAccounts/queueServices@2024-01-01' = {
  parent: storageAccounts_multienterprisestorage01_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_multienterprisestorage01_name_default 'Microsoft.Storage/storageAccounts/tableServices@2024-01-01' = {
  parent: storageAccounts_multienterprisestorage01_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource storageAccounts_multienterprisestorage01_name_default_archivelogs 'Microsoft.Storage/storageAccounts/blobServices/containers@2024-01-01' = {
  parent: storageAccounts_multienterprisestorage01_name_default
  name: 'archivelogs'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_multienterprisestorage01_name_resource
  ]
}

resource storageAccounts_multienterprisestorage01_name_default_azure_webjobs_hosts 'Microsoft.Storage/storageAccounts/blobServices/containers@2024-01-01' = {
  parent: storageAccounts_multienterprisestorage01_name_default
  name: 'azure-webjobs-hosts'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_multienterprisestorage01_name_resource
  ]
}

resource storageAccounts_multienterprisestorage01_name_default_azure_webjobs_secrets 'Microsoft.Storage/storageAccounts/blobServices/containers@2024-01-01' = {
  parent: storageAccounts_multienterprisestorage01_name_default
  name: 'azure-webjobs-secrets'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_multienterprisestorage01_name_resource
  ]
}

resource storageAccounts_multienterprisestorage01_name_default_publicmedia 'Microsoft.Storage/storageAccounts/blobServices/containers@2024-01-01' = {
  parent: storageAccounts_multienterprisestorage01_name_default
  name: 'publicmedia'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_multienterprisestorage01_name_resource
  ]
}

resource storageAccounts_multienterprisestorage01_name_default_multifunc01b5f4 'Microsoft.Storage/storageAccounts/fileServices/shares@2024-01-01' = {
  parent: Microsoft_Storage_storageAccounts_fileServices_storageAccounts_multienterprisestorage01_name_default
  name: 'multifunc01b5f4'
  properties: {
    accessTier: 'TransactionOptimized'
    shareQuota: 102400
    enabledProtocols: 'SMB'
  }
  dependsOn: [
    storageAccounts_multienterprisestorage01_name_resource
  ]
}

resource storageAccounts_multienterprisestorage01_name_default_AzureFunctionsDiagnosticEvents202505 'Microsoft.Storage/storageAccounts/tableServices/tables@2024-01-01' = {
  parent: Microsoft_Storage_storageAccounts_tableServices_storageAccounts_multienterprisestorage01_name_default
  name: 'AzureFunctionsDiagnosticEvents202505'
  properties: {}
  dependsOn: [
    storageAccounts_multienterprisestorage01_name_resource
  ]
}