param sites_multifunc01_name string = 'multifunc01'
param serverfarms_ASP_multiresource_a098_externalid string = '/subscriptions/cba56540-399e-44ef-a7de-26dbc93a7bfc/resourceGroups/multiresource/providers/Microsoft.Web/serverfarms/ASP-multiresource-a098'

resource sites_multifunc01_name_resource 'Microsoft.Web/sites@2024-04-01' = {
  name: sites_multifunc01_name
  location: 'Italy North'
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/cba56540-399e-44ef-a7de-26dbc93a7bfc/resourceGroups/multiresource/providers/Microsoft.Insights/components/multifunc01'
  }
  kind: 'functionapp'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_multifunc01_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_multifunc01_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_ASP_multiresource_a098_externalid
    reserved: false
    isXenon: false
    hyperV: false
    dnsConfiguration: {}
    vnetRouteAllEnabled: false
    vnetImagePullEnabled: false
    vnetContentShareEnabled: false
    siteConfig: {
      numberOfWorkers: 1
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 200
      minimumElasticInstanceCount: 0
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    ipMode: 'IPv4'
    vnetBackupRestoreEnabled: false
    customDomainVerificationId: 'A8C5CC4B36AA6FB7B0CB4F9069C11D2D81D3602D8610902D38DCB69DDD27BD08'
    containerSize: 1536
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    endToEndEncryptionEnabled: false
    redundancyMode: 'None'
    publicNetworkAccess: 'Enabled'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_multifunc01_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2024-04-01' = {
  parent: sites_multifunc01_name_resource
  name: 'ftp'
  location: 'Italy North'
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/cba56540-399e-44ef-a7de-26dbc93a7bfc/resourceGroups/multiresource/providers/Microsoft.Insights/components/multifunc01'
  }
  properties: {
    allow: false
  }
}

resource sites_multifunc01_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2024-04-01' = {
  parent: sites_multifunc01_name_resource
  name: 'scm'
  location: 'Italy North'
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/cba56540-399e-44ef-a7de-26dbc93a7bfc/resourceGroups/multiresource/providers/Microsoft.Insights/components/multifunc01'
  }
  properties: {
    allow: false
  }
}

resource sites_multifunc01_name_web 'Microsoft.Web/sites/config@2024-04-01' = {
  parent: sites_multifunc01_name_resource
  name: 'web'
  location: 'Italy North'
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/cba56540-399e-44ef-a7de-26dbc93a7bfc/resourceGroups/multiresource/providers/Microsoft.Insights/components/multifunc01'
  }
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
    ]
    netFrameworkVersion: 'v8.0'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: 'REDACTED'
    scmType: 'None'
    use32BitWorkerProcess: false
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    publicNetworkAccess: 'Enabled'
    cors: {
      allowedOrigins: [
        'https://portal.azure.com'
      ]
      supportCredentials: false
    }
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 0
    functionAppScaleLimit: 200
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 0
    azureStorageAccounts: {}
  }
}

resource sites_multifunc01_name_sites_multifunc01_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2024-04-01' = {
  parent: sites_multifunc01_name_resource
  name: '${sites_multifunc01_name}.azurewebsites.net'
  location: 'Italy North'
  properties: {
    siteName: 'multifunc01'
    hostNameType: 'Verified'
  }
}