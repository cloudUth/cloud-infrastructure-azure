param workspaces_multienterpriseworkspace01_name string = 'multienterpriseworkspace01'

resource workspaces_multienterpriseworkspace01_name_resource 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  name: workspaces_multienterpriseworkspace01_name
  location: 'italynorth'
  properties: {
    sku: {
      name: 'pergb2018'
    }
    retentionInDays: 31
    features: {
      legacy: 0
      searchVersion: 1
      enableLogAccessUsingOnlyResourcePermissions: true
    }
    workspaceCapping: {
      dailyQuotaGb: json('-1')
    }
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_General_AlphabeticallySortedComputers 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_General|AlphabeticallySortedComputers'
  properties: {
    category: 'General Exploration'
    displayName: 'All Computers with their most recent data'
    version: 2
    query: 'search not(ObjectName == "Advisor Metrics" or ObjectName == "ManagedSpace") | summarize AggregatedValue = max(TimeGenerated) by Computer | limit 500000 | sort by Computer asc\r\n// Oql: NOT(ObjectName="Advisor Metrics" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) by Computer | top 500000 | Sort Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_General_dataPointsPerManagementGroup 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_General|dataPointsPerManagementGroup'
  properties: {
    category: 'General Exploration'
    displayName: 'Which Management Group is generating the most data points?'
    version: 2
    query: 'search * | summarize AggregatedValue = count() by ManagementGroupName\r\n// Oql: * | Measure count() by ManagementGroupName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_General_dataTypeDistribution 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_General|dataTypeDistribution'
  properties: {
    category: 'General Exploration'
    displayName: 'Distribution of data Types'
    version: 2
    query: 'search * | extend Type = $table | summarize AggregatedValue = count() by Type\r\n// Oql: * | Measure count() by Type // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_General_StaleComputers 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_General|StaleComputers'
  properties: {
    category: 'General Exploration'
    displayName: 'Stale Computers (data older than 24 hours)'
    version: 2
    query: 'search not(ObjectName == "Advisor Metrics" or ObjectName == "ManagedSpace") | summarize lastdata = max(TimeGenerated) by Computer | limit 500000 | where lastdata < ago(24h)\r\n// Oql: NOT(ObjectName="Advisor Metrics" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) as lastdata by Computer | top 500000 | where lastdata < NOW-24HOURS // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_AllEvents 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|AllEvents'
  properties: {
    category: 'Log Management'
    displayName: 'All Events'
    version: 2
    query: 'Event | sort by TimeGenerated desc\r\n// Oql: Type=Event // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_AllSyslog 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|AllSyslog'
  properties: {
    category: 'Log Management'
    displayName: 'All Syslogs'
    version: 2
    query: 'Syslog | sort by TimeGenerated desc\r\n// Oql: Type=Syslog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_AllSyslogByFacility 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|AllSyslogByFacility'
  properties: {
    category: 'Log Management'
    displayName: 'All Syslog Records grouped by Facility'
    version: 2
    query: 'Syslog | summarize AggregatedValue = count() by Facility\r\n// Oql: Type=Syslog | Measure count() by Facility // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_AllSyslogByProcess 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|AllSyslogByProcessName'
  properties: {
    category: 'Log Management'
    displayName: 'All Syslog Records grouped by ProcessName'
    version: 2
    query: 'Syslog | summarize AggregatedValue = count() by ProcessName\r\n// Oql: Type=Syslog | Measure count() by ProcessName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_AllSyslogsWithErrors 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|AllSyslogsWithErrors'
  properties: {
    category: 'Log Management'
    displayName: 'All Syslog Records with Errors'
    version: 2
    query: 'Syslog | where SeverityLevel == "error" | sort by TimeGenerated desc\r\n// Oql: Type=Syslog SeverityLevel=error // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_AverageHTTPRequestTimeByClientIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|AverageHTTPRequestTimeByClientIPAddress'
  properties: {
    category: 'Log Management'
    displayName: 'Average HTTP Request time by Client IP Address'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by cIP\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_AverageHTTPRequestTimeHTTPMethod 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|AverageHTTPRequestTimeHTTPMethod'
  properties: {
    category: 'Log Management'
    displayName: 'Average HTTP Request time by HTTP Method'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by csMethod\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_CountIISLogEntriesClientIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|CountIISLogEntriesClientIPAddress'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by Client IP Address'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by cIP\r\n// Oql: Type=W3CIISLog | Measure count() by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_CountIISLogEntriesHTTPRequestMethod 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|CountIISLogEntriesHTTPRequestMethod'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by HTTP Request Method'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csMethod\r\n// Oql: Type=W3CIISLog | Measure count() by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_CountIISLogEntriesHTTPUserAgent 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|CountIISLogEntriesHTTPUserAgent'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by HTTP User Agent'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUserAgent\r\n// Oql: Type=W3CIISLog | Measure count() by csUserAgent // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_CountOfIISLogEntriesByHostRequestedByClient 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|CountOfIISLogEntriesByHostRequestedByClient'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by Host requested by client'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csHost\r\n// Oql: Type=W3CIISLog | Measure count() by csHost // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_CountOfIISLogEntriesByURLForHost 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|CountOfIISLogEntriesByURLForHost'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by URL for the host "www.contoso.com" (replace with your own)'
    version: 2
    query: 'search csHost == "www.contoso.com" | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog csHost="www.contoso.com" | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_CountOfIISLogEntriesByURLRequestedByClient 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|CountOfIISLogEntriesByURLRequestedByClient'
  properties: {
    category: 'Log Management'
    displayName: 'Count of IIS Log Entries by URL requested by client (without query strings)'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_CountOfWarningEvents 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|CountOfWarningEvents'
  properties: {
    category: 'Log Management'
    displayName: 'Count of Events with level "Warning" grouped by Event ID'
    version: 2
    query: 'Event | where EventLevelName == "warning" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event EventLevelName=warning | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_DisplayBreakdownRespondCodes 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|DisplayBreakdownRespondCodes'
  properties: {
    category: 'Log Management'
    displayName: 'Shows breakdown of response codes'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by scStatus\r\n// Oql: Type=W3CIISLog | Measure count() by scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_EventsByEventLog 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|EventsByEventLog'
  properties: {
    category: 'Log Management'
    displayName: 'Count of Events grouped by Event Log'
    version: 2
    query: 'Event | summarize AggregatedValue = count() by EventLog\r\n// Oql: Type=Event | Measure count() by EventLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_EventsByEventsID 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|EventsByEventsID'
  properties: {
    category: 'Log Management'
    displayName: 'Count of Events grouped by Event ID'
    version: 2
    query: 'Event | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_EventsByEventSource 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|EventsByEventSource'
  properties: {
    category: 'Log Management'
    displayName: 'Count of Events grouped by Event Source'
    version: 2
    query: 'Event | summarize AggregatedValue = count() by Source\r\n// Oql: Type=Event | Measure count() by Source // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_EventsInOMBetween2000to3000 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|EventsInOMBetween2000to3000'
  properties: {
    category: 'Log Management'
    displayName: 'Events in the Operations Manager Event Log whose Event ID is in the range between 2000 and 3000'
    version: 2
    query: 'Event | where EventLog == "Operations Manager" and EventID >= 2000 and EventID <= 3000 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog="Operations Manager" EventID:[2000..3000] // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_EventsWithStartedinEventID 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|EventsWithStartedinEventID'
  properties: {
    category: 'Log Management'
    displayName: 'Count of Events containing the word "started" grouped by EventID'
    version: 2
    query: 'search in (Event) "started" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event "started" | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_FindMaximumTimeTakenForEachPage 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|FindMaximumTimeTakenForEachPage'
  properties: {
    category: 'Log Management'
    displayName: 'Find the maximum time taken for each page'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = max(TimeTaken) by csUriStem\r\n// Oql: Type=W3CIISLog | Measure Max(TimeTaken) by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_IISLogEntriesForClientIP 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|IISLogEntriesForClientIP'
  properties: {
    category: 'Log Management'
    displayName: 'IIS Log Entries for a specific client IP Address (replace with your own)'
    version: 2
    query: 'search cIP == "192.168.0.1" | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc | project csUriStem, scBytes, csBytes, TimeTaken, scStatus\r\n// Oql: Type=W3CIISLog cIP="192.168.0.1" | Select csUriStem,scBytes,csBytes,TimeTaken,scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_ListAllIISLogEntries 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|ListAllIISLogEntries'
  properties: {
    category: 'Log Management'
    displayName: 'All IIS Log Entries'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc\r\n// Oql: Type=W3CIISLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_NoOfConnectionsToOMSDKService 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|NoOfConnectionsToOMSDKService'
  properties: {
    category: 'Log Management'
    displayName: 'How many connections to Operations Manager\'s SDK service by day'
    version: 2
    query: 'Event | where EventID == 26328 and EventLog == "Operations Manager" | summarize AggregatedValue = count() by bin(TimeGenerated, 1d) | sort by TimeGenerated desc\r\n// Oql: Type=Event EventID=26328 EventLog="Operations Manager" | Measure count() interval 1DAY // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_ServerRestartTime 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|ServerRestartTime'
  properties: {
    category: 'Log Management'
    displayName: 'When did my servers initiate restart?'
    version: 2
    query: 'search in (Event) "shutdown" and EventLog == "System" and Source == "User32" and EventID == 1074 | sort by TimeGenerated desc | project TimeGenerated, Computer\r\n// Oql: shutdown Type=Event EventLog=System Source=User32 EventID=1074 | Select TimeGenerated,Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_Show404PagesList 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|Show404PagesList'
  properties: {
    category: 'Log Management'
    displayName: 'Shows which pages people are getting a 404 for'
    version: 2
    query: 'search scStatus == 404 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog scStatus=404 | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_ShowServersThrowingInternalServerError 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|ShowServersThrowingInternalServerError'
  properties: {
    category: 'Log Management'
    displayName: 'Shows servers that are throwing internal server error'
    version: 2
    query: 'search scStatus == 500 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by sComputerName\r\n// Oql: Type=W3CIISLog scStatus=500 | Measure count() by sComputerName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_TotalBytesReceivedByEachAzureRoleInstance 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|TotalBytesReceivedByEachAzureRoleInstance'
  properties: {
    category: 'Log Management'
    displayName: 'Total Bytes received by each Azure Role Instance'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by RoleInstance\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by RoleInstance // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_TotalBytesReceivedByEachIISComputer 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|TotalBytesReceivedByEachIISComputer'
  properties: {
    category: 'Log Management'
    displayName: 'Total Bytes received by each IIS Computer'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by Computer | limit 500000\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_TotalBytesRespondedToClientsByClientIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|TotalBytesRespondedToClientsByClientIPAddress'
  properties: {
    category: 'Log Management'
    displayName: 'Total Bytes responded back to clients by Client IP Address'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_TotalBytesRespondedToClientsByEachIISServerIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|TotalBytesRespondedToClientsByEachIISServerIPAddress'
  properties: {
    category: 'Log Management'
    displayName: 'Total Bytes responded back to clients by each IIS ServerIP Address'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by sIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by sIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_TotalBytesSentByClientIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|TotalBytesSentByClientIPAddress'
  properties: {
    category: 'Log Management'
    displayName: 'Total Bytes sent by Client IP Address'
    version: 2
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_WarningEvents 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|WarningEvents'
  properties: {
    category: 'Log Management'
    displayName: 'All Events with level "Warning"'
    version: 2
    query: 'Event | where EventLevelName == "warning" | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLevelName=warning // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_WindowsFireawallPolicySettingsChanged 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|WindowsFireawallPolicySettingsChanged'
  properties: {
    category: 'Log Management'
    displayName: 'Windows Firewall Policy settings have changed'
    version: 2
    query: 'Event | where EventLog == "Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" and EventID == 2008 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog="Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" EventID=2008 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_LogManagement_workspaces_multienterpriseworkspace01_name_LogManagement_WindowsFireawallPolicySettingsChangedByMachines 'Microsoft.OperationalInsights/workspaces/savedSearches@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogManagement(${workspaces_multienterpriseworkspace01_name})_LogManagement|WindowsFireawallPolicySettingsChangedByMachines'
  properties: {
    category: 'Log Management'
    displayName: 'On which machines and how many times have Windows Firewall Policy settings changed'
    version: 2
    query: 'Event | where EventLog == "Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" and EventID == 2008 | summarize AggregatedValue = count() by Computer | limit 500000\r\n// Oql: Type=Event EventLog="Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" EventID=2008 | measure count() by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
  }
}

resource workspaces_multienterpriseworkspace01_name_AACAudit 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AACAudit'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AACAudit'
      displayName: 'AACAudit'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AACHttpRequest 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AACHttpRequest'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AACHttpRequest'
      displayName: 'AACHttpRequest'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADB2CRequestLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADB2CRequestLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADB2CRequestLogs'
      displayName: 'AADB2CRequestLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADCustomSecurityAttributeAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADCustomSecurityAttributeAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADCustomSecurityAttributeAuditLogs'
      displayName: 'AADCustomSecurityAttributeAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADDomainServicesAccountLogon 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADDomainServicesAccountLogon'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesAccountLogon'
      displayName: 'AADDomainServicesAccountLogon'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADDomainServicesAccountManagement 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADDomainServicesAccountManagement'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesAccountManagement'
      displayName: 'AADDomainServicesAccountManagement'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADDomainServicesDirectoryServiceAccess 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADDomainServicesDirectoryServiceAccess'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesDirectoryServiceAccess'
      displayName: 'AADDomainServicesDirectoryServiceAccess'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADDomainServicesDNSAuditsDynamicUpdates 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADDomainServicesDNSAuditsDynamicUpdates'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesDNSAuditsDynamicUpdates'
      displayName: 'AADDomainServicesDNSAuditsDynamicUpdates'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADDomainServicesDNSAuditsGeneral 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADDomainServicesDNSAuditsGeneral'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesDNSAuditsGeneral'
      displayName: 'AADDomainServicesDNSAuditsGeneral'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADDomainServicesLogonLogoff 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADDomainServicesLogonLogoff'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesLogonLogoff'
      displayName: 'AADDomainServicesLogonLogoff'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADDomainServicesPolicyChange 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADDomainServicesPolicyChange'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesPolicyChange'
      displayName: 'AADDomainServicesPolicyChange'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADDomainServicesPrivilegeUse 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADDomainServicesPrivilegeUse'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesPrivilegeUse'
      displayName: 'AADDomainServicesPrivilegeUse'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADFirstPartyToFirstPartySignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADFirstPartyToFirstPartySignInLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADFirstPartyToFirstPartySignInLogs'
      displayName: 'AADFirstPartyToFirstPartySignInLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADManagedIdentitySignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADManagedIdentitySignInLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADManagedIdentitySignInLogs'
      displayName: 'AADManagedIdentitySignInLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADNonInteractiveUserSignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADNonInteractiveUserSignInLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADNonInteractiveUserSignInLogs'
      displayName: 'AADNonInteractiveUserSignInLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADProvisioningLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADProvisioningLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADProvisioningLogs'
      displayName: 'AADProvisioningLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADRiskyServicePrincipals 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADRiskyServicePrincipals'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADRiskyServicePrincipals'
      displayName: 'AADRiskyServicePrincipals'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADRiskyUsers 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADRiskyUsers'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADRiskyUsers'
      displayName: 'AADRiskyUsers'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADServicePrincipalRiskEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADServicePrincipalRiskEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADServicePrincipalRiskEvents'
      displayName: 'AADServicePrincipalRiskEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADServicePrincipalSignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADServicePrincipalSignInLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADServicePrincipalSignInLogs'
      displayName: 'AADServicePrincipalSignInLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AADUserRiskEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AADUserRiskEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AADUserRiskEvents'
      displayName: 'AADUserRiskEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ABSBotRequests 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ABSBotRequests'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ABSBotRequests'
      displayName: 'ABSBotRequests'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACICollaborationAudit 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACICollaborationAudit'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACICollaborationAudit'
      displayName: 'ACICollaborationAudit'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACRConnectedClientList 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACRConnectedClientList'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACRConnectedClientList'
      displayName: 'ACRConnectedClientList'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACREntraAuthenticationAuditLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACREntraAuthenticationAuditLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACREntraAuthenticationAuditLog'
      displayName: 'ACREntraAuthenticationAuditLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSAdvancedMessagingOperations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSAdvancedMessagingOperations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSAdvancedMessagingOperations'
      displayName: 'ACSAdvancedMessagingOperations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSAuthIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSAuthIncomingOperations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSAuthIncomingOperations'
      displayName: 'ACSAuthIncomingOperations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSBillingUsage 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSBillingUsage'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSBillingUsage'
      displayName: 'ACSBillingUsage'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSCallAutomationIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSCallAutomationIncomingOperations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSCallAutomationIncomingOperations'
      displayName: 'ACSCallAutomationIncomingOperations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSCallAutomationMediaSummary 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSCallAutomationMediaSummary'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSCallAutomationMediaSummary'
      displayName: 'ACSCallAutomationMediaSummary'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSCallClientMediaStatsTimeSeries 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSCallClientMediaStatsTimeSeries'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSCallClientMediaStatsTimeSeries'
      displayName: 'ACSCallClientMediaStatsTimeSeries'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSCallClientOperations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSCallClientOperations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSCallClientOperations'
      displayName: 'ACSCallClientOperations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSCallClientServiceRequestAndOutcome 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSCallClientServiceRequestAndOutcome'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSCallClientServiceRequestAndOutcome'
      displayName: 'ACSCallClientServiceRequestAndOutcome'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSCallClosedCaptionsSummary 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSCallClosedCaptionsSummary'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSCallClosedCaptionsSummary'
      displayName: 'ACSCallClosedCaptionsSummary'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSCallDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSCallDiagnostics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSCallDiagnostics'
      displayName: 'ACSCallDiagnostics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSCallDiagnosticsUpdates 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSCallDiagnosticsUpdates'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSCallDiagnosticsUpdates'
      displayName: 'ACSCallDiagnosticsUpdates'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSCallingMetrics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSCallingMetrics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSCallingMetrics'
      displayName: 'ACSCallingMetrics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSCallRecordingIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSCallRecordingIncomingOperations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSCallRecordingIncomingOperations'
      displayName: 'ACSCallRecordingIncomingOperations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSCallRecordingSummary 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSCallRecordingSummary'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSCallRecordingSummary'
      displayName: 'ACSCallRecordingSummary'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSCallSummary 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSCallSummary'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSCallSummary'
      displayName: 'ACSCallSummary'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSCallSummaryUpdates 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSCallSummaryUpdates'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSCallSummaryUpdates'
      displayName: 'ACSCallSummaryUpdates'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSCallSurvey 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSCallSurvey'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSCallSurvey'
      displayName: 'ACSCallSurvey'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSChatIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSChatIncomingOperations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSChatIncomingOperations'
      displayName: 'ACSChatIncomingOperations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSEmailSendMailOperational 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSEmailSendMailOperational'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSEmailSendMailOperational'
      displayName: 'ACSEmailSendMailOperational'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSEmailStatusUpdateOperational 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSEmailStatusUpdateOperational'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSEmailStatusUpdateOperational'
      displayName: 'ACSEmailStatusUpdateOperational'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSEmailUserEngagementOperational 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSEmailUserEngagementOperational'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSEmailUserEngagementOperational'
      displayName: 'ACSEmailUserEngagementOperational'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSJobRouterIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSJobRouterIncomingOperations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSJobRouterIncomingOperations'
      displayName: 'ACSJobRouterIncomingOperations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSOptOutManagementOperations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSOptOutManagementOperations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSOptOutManagementOperations'
      displayName: 'ACSOptOutManagementOperations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSRoomsIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSRoomsIncomingOperations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSRoomsIncomingOperations'
      displayName: 'ACSRoomsIncomingOperations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ACSSMSIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ACSSMSIncomingOperations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ACSSMSIncomingOperations'
      displayName: 'ACSSMSIncomingOperations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADAssessmentRecommendation'
      displayName: 'ADAssessmentRecommendation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AddonAzureBackupAlerts 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AddonAzureBackupAlerts'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupAlerts'
      displayName: 'AddonAzureBackupAlerts'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AddonAzureBackupJobs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AddonAzureBackupJobs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupJobs'
      displayName: 'AddonAzureBackupJobs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AddonAzureBackupPolicy 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AddonAzureBackupPolicy'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupPolicy'
      displayName: 'AddonAzureBackupPolicy'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AddonAzureBackupProtectedInstance 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AddonAzureBackupProtectedInstance'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupProtectedInstance'
      displayName: 'AddonAzureBackupProtectedInstance'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AddonAzureBackupStorage 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AddonAzureBackupStorage'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupStorage'
      displayName: 'AddonAzureBackupStorage'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADFActivityRun 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADFActivityRun'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADFActivityRun'
      displayName: 'ADFActivityRun'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADFAirflowSchedulerLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADFAirflowSchedulerLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADFAirflowSchedulerLogs'
      displayName: 'ADFAirflowSchedulerLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADFAirflowTaskLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADFAirflowTaskLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADFAirflowTaskLogs'
      displayName: 'ADFAirflowTaskLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADFAirflowWebLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADFAirflowWebLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADFAirflowWebLogs'
      displayName: 'ADFAirflowWebLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADFAirflowWorkerLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADFAirflowWorkerLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADFAirflowWorkerLogs'
      displayName: 'ADFAirflowWorkerLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADFPipelineRun 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADFPipelineRun'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADFPipelineRun'
      displayName: 'ADFPipelineRun'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADFSandboxActivityRun 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADFSandboxActivityRun'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADFSandboxActivityRun'
      displayName: 'ADFSandboxActivityRun'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADFSandboxPipelineRun 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADFSandboxPipelineRun'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADFSandboxPipelineRun'
      displayName: 'ADFSandboxPipelineRun'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADFSSignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADFSSignInLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADFSSignInLogs'
      displayName: 'ADFSSignInLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADFSSISIntegrationRuntimeLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADFSSISIntegrationRuntimeLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISIntegrationRuntimeLogs'
      displayName: 'ADFSSISIntegrationRuntimeLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADFSSISPackageEventMessageContext 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADFSSISPackageEventMessageContext'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageEventMessageContext'
      displayName: 'ADFSSISPackageEventMessageContext'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADFSSISPackageEventMessages 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADFSSISPackageEventMessages'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageEventMessages'
      displayName: 'ADFSSISPackageEventMessages'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADFSSISPackageExecutableStatistics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADFSSISPackageExecutableStatistics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageExecutableStatistics'
      displayName: 'ADFSSISPackageExecutableStatistics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADFSSISPackageExecutionComponentPhases 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADFSSISPackageExecutionComponentPhases'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageExecutionComponentPhases'
      displayName: 'ADFSSISPackageExecutionComponentPhases'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADFSSISPackageExecutionDataStatistics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADFSSISPackageExecutionDataStatistics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageExecutionDataStatistics'
      displayName: 'ADFSSISPackageExecutionDataStatistics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADFTriggerRun 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADFTriggerRun'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADFTriggerRun'
      displayName: 'ADFTriggerRun'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADReplicationResult 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADReplicationResult'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADReplicationResult'
      displayName: 'ADReplicationResult'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADSecurityAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADSecurityAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADSecurityAssessmentRecommendation'
      displayName: 'ADSecurityAssessmentRecommendation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADTDataHistoryOperation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADTDataHistoryOperation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADTDataHistoryOperation'
      displayName: 'ADTDataHistoryOperation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADTDigitalTwinsOperation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADTDigitalTwinsOperation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADTDigitalTwinsOperation'
      displayName: 'ADTDigitalTwinsOperation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADTEventRoutesOperation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADTEventRoutesOperation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADTEventRoutesOperation'
      displayName: 'ADTEventRoutesOperation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADTModelsOperation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADTModelsOperation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADTModelsOperation'
      displayName: 'ADTModelsOperation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADTQueryOperation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADTQueryOperation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADTQueryOperation'
      displayName: 'ADTQueryOperation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADXCommand 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADXCommand'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADXCommand'
      displayName: 'ADXCommand'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADXDataOperation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADXDataOperation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADXDataOperation'
      displayName: 'ADXDataOperation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADXIngestionBatching 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADXIngestionBatching'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADXIngestionBatching'
      displayName: 'ADXIngestionBatching'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADXJournal 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADXJournal'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADXJournal'
      displayName: 'ADXJournal'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADXQuery 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADXQuery'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADXQuery'
      displayName: 'ADXQuery'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADXTableDetails 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADXTableDetails'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADXTableDetails'
      displayName: 'ADXTableDetails'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ADXTableUsageStatistics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ADXTableUsageStatistics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ADXTableUsageStatistics'
      displayName: 'ADXTableUsageStatistics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AegDataPlaneRequests 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AegDataPlaneRequests'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AegDataPlaneRequests'
      displayName: 'AegDataPlaneRequests'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AegDeliveryFailureLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AegDeliveryFailureLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AegDeliveryFailureLogs'
      displayName: 'AegDeliveryFailureLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AegPublishFailureLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AegPublishFailureLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AegPublishFailureLogs'
      displayName: 'AegPublishFailureLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AEWAssignmentBlobLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AEWAssignmentBlobLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AEWAssignmentBlobLogs'
      displayName: 'AEWAssignmentBlobLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AEWAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AEWAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AEWAuditLogs'
      displayName: 'AEWAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AEWComputePipelinesLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AEWComputePipelinesLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AEWComputePipelinesLogs'
      displayName: 'AEWComputePipelinesLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AEWExperimentAssignmentSummary 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AEWExperimentAssignmentSummary'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AEWExperimentAssignmentSummary'
      displayName: 'AEWExperimentAssignmentSummary'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AEWExperimentScorecardMetricPairs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AEWExperimentScorecardMetricPairs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AEWExperimentScorecardMetricPairs'
      displayName: 'AEWExperimentScorecardMetricPairs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AEWExperimentScorecards 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AEWExperimentScorecards'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AEWExperimentScorecards'
      displayName: 'AEWExperimentScorecards'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AFSAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AFSAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AFSAuditLogs'
      displayName: 'AFSAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AGCAccessLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AGCAccessLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AGCAccessLogs'
      displayName: 'AGCAccessLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AgriFoodApplicationAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AgriFoodApplicationAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodApplicationAuditLogs'
      displayName: 'AgriFoodApplicationAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AgriFoodFarmManagementLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AgriFoodFarmManagementLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodFarmManagementLogs'
      displayName: 'AgriFoodFarmManagementLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AgriFoodFarmOperationLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AgriFoodFarmOperationLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodFarmOperationLogs'
      displayName: 'AgriFoodFarmOperationLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AgriFoodInsightLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AgriFoodInsightLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodInsightLogs'
      displayName: 'AgriFoodInsightLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AgriFoodJobProcessedLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AgriFoodJobProcessedLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodJobProcessedLogs'
      displayName: 'AgriFoodJobProcessedLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AgriFoodModelInferenceLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AgriFoodModelInferenceLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodModelInferenceLogs'
      displayName: 'AgriFoodModelInferenceLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AgriFoodProviderAuthLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AgriFoodProviderAuthLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodProviderAuthLogs'
      displayName: 'AgriFoodProviderAuthLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AgriFoodSatelliteLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AgriFoodSatelliteLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodSatelliteLogs'
      displayName: 'AgriFoodSatelliteLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AgriFoodSensorManagementLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AgriFoodSensorManagementLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodSensorManagementLogs'
      displayName: 'AgriFoodSensorManagementLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AgriFoodWeatherLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AgriFoodWeatherLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodWeatherLogs'
      displayName: 'AgriFoodWeatherLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AGSGrafanaLoginEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AGSGrafanaLoginEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AGSGrafanaLoginEvents'
      displayName: 'AGSGrafanaLoginEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AGSGrafanaUsageInsightsEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AGSGrafanaUsageInsightsEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AGSGrafanaUsageInsightsEvents'
      displayName: 'AGSGrafanaUsageInsightsEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AGWAccessLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AGWAccessLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AGWAccessLogs'
      displayName: 'AGWAccessLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AGWFirewallLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AGWFirewallLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AGWFirewallLogs'
      displayName: 'AGWFirewallLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AGWPerformanceLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AGWPerformanceLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AGWPerformanceLogs'
      displayName: 'AGWPerformanceLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AHDSDeidAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AHDSDeidAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AHDSDeidAuditLogs'
      displayName: 'AHDSDeidAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AHDSDicomAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AHDSDicomAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AHDSDicomAuditLogs'
      displayName: 'AHDSDicomAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AHDSDicomDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AHDSDicomDiagnosticLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AHDSDicomDiagnosticLogs'
      displayName: 'AHDSDicomDiagnosticLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AHDSMedTechDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AHDSMedTechDiagnosticLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AHDSMedTechDiagnosticLogs'
      displayName: 'AHDSMedTechDiagnosticLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AirflowDagProcessingLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AirflowDagProcessingLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AirflowDagProcessingLogs'
      displayName: 'AirflowDagProcessingLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AKSAudit 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AKSAudit'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AKSAudit'
      displayName: 'AKSAudit'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AKSAuditAdmin 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AKSAuditAdmin'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AKSAuditAdmin'
      displayName: 'AKSAuditAdmin'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AKSControlPlane 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AKSControlPlane'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AKSControlPlane'
      displayName: 'AKSControlPlane'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ALBHealthEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ALBHealthEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ALBHealthEvent'
      displayName: 'ALBHealthEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_Alert 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'Alert'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'Alert'
      displayName: 'Alert'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlComputeClusterEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlComputeClusterEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeClusterEvent'
      displayName: 'AmlComputeClusterEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlComputeClusterNodeEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlComputeClusterNodeEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeClusterNodeEvent'
      displayName: 'AmlComputeClusterNodeEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlComputeCpuGpuUtilization 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlComputeCpuGpuUtilization'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeCpuGpuUtilization'
      displayName: 'AmlComputeCpuGpuUtilization'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlComputeInstanceEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlComputeInstanceEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeInstanceEvent'
      displayName: 'AmlComputeInstanceEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlComputeJobEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlComputeJobEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeJobEvent'
      displayName: 'AmlComputeJobEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlDataLabelEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlDataLabelEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlDataLabelEvent'
      displayName: 'AmlDataLabelEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlDataSetEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlDataSetEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlDataSetEvent'
      displayName: 'AmlDataSetEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlDataStoreEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlDataStoreEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlDataStoreEvent'
      displayName: 'AmlDataStoreEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlDeploymentEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlDeploymentEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlDeploymentEvent'
      displayName: 'AmlDeploymentEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlEnvironmentEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlEnvironmentEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlEnvironmentEvent'
      displayName: 'AmlEnvironmentEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlInferencingEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlInferencingEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlInferencingEvent'
      displayName: 'AmlInferencingEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlModelsEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlModelsEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlModelsEvent'
      displayName: 'AmlModelsEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlOnlineEndpointConsoleLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlOnlineEndpointConsoleLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlOnlineEndpointConsoleLog'
      displayName: 'AmlOnlineEndpointConsoleLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlOnlineEndpointEventLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlOnlineEndpointEventLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlOnlineEndpointEventLog'
      displayName: 'AmlOnlineEndpointEventLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlOnlineEndpointTrafficLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlOnlineEndpointTrafficLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlOnlineEndpointTrafficLog'
      displayName: 'AmlOnlineEndpointTrafficLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlPipelineEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlPipelineEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlPipelineEvent'
      displayName: 'AmlPipelineEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlRegistryReadEventsLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlRegistryReadEventsLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlRegistryReadEventsLog'
      displayName: 'AmlRegistryReadEventsLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlRegistryWriteEventsLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlRegistryWriteEventsLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlRegistryWriteEventsLog'
      displayName: 'AmlRegistryWriteEventsLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlRunEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlRunEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlRunEvent'
      displayName: 'AmlRunEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AmlRunStatusChangedEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AmlRunStatusChangedEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AmlRunStatusChangedEvent'
      displayName: 'AmlRunStatusChangedEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AMSKeyDeliveryRequests 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AMSKeyDeliveryRequests'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AMSKeyDeliveryRequests'
      displayName: 'AMSKeyDeliveryRequests'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AMSLiveEventOperations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AMSLiveEventOperations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AMSLiveEventOperations'
      displayName: 'AMSLiveEventOperations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AMSMediaAccountHealth 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AMSMediaAccountHealth'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AMSMediaAccountHealth'
      displayName: 'AMSMediaAccountHealth'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AMSStreamingEndpointRequests 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AMSStreamingEndpointRequests'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AMSStreamingEndpointRequests'
      displayName: 'AMSStreamingEndpointRequests'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AMWMetricsUsageDetails 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AMWMetricsUsageDetails'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AMWMetricsUsageDetails'
      displayName: 'AMWMetricsUsageDetails'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ANFFileAccess 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ANFFileAccess'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ANFFileAccess'
      displayName: 'ANFFileAccess'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AOIDatabaseQuery 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AOIDatabaseQuery'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AOIDatabaseQuery'
      displayName: 'AOIDatabaseQuery'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AOIDigestion 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AOIDigestion'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AOIDigestion'
      displayName: 'AOIDigestion'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AOIStorage 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AOIStorage'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AOIStorage'
      displayName: 'AOIStorage'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ApiManagementGatewayLlmLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ApiManagementGatewayLlmLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ApiManagementGatewayLlmLog'
      displayName: 'ApiManagementGatewayLlmLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ApiManagementGatewayLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ApiManagementGatewayLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ApiManagementGatewayLogs'
      displayName: 'ApiManagementGatewayLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ApiManagementWebSocketConnectionLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ApiManagementWebSocketConnectionLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ApiManagementWebSocketConnectionLogs'
      displayName: 'ApiManagementWebSocketConnectionLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_APIMDevPortalAuditDiagnosticLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'APIMDevPortalAuditDiagnosticLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'APIMDevPortalAuditDiagnosticLog'
      displayName: 'APIMDevPortalAuditDiagnosticLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppAvailabilityResults 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppAvailabilityResults'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppAvailabilityResults'
      displayName: 'AppAvailabilityResults'
    }
    retentionInDays: 90
  }
}

resource workspaces_multienterpriseworkspace01_name_AppBrowserTimings 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppBrowserTimings'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppBrowserTimings'
      displayName: 'AppBrowserTimings'
    }
    retentionInDays: 90
  }
}

resource workspaces_multienterpriseworkspace01_name_AppCenterError 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppCenterError'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppCenterError'
      displayName: 'AppCenterError'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppDependencies 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppDependencies'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppDependencies'
      displayName: 'AppDependencies'
    }
    retentionInDays: 90
  }
}

resource workspaces_multienterpriseworkspace01_name_AppEnvSessionConsoleLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppEnvSessionConsoleLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppEnvSessionConsoleLogs'
      displayName: 'AppEnvSessionConsoleLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppEnvSessionLifecycleLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppEnvSessionLifecycleLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppEnvSessionLifecycleLogs'
      displayName: 'AppEnvSessionLifecycleLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppEnvSessionPoolEventLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppEnvSessionPoolEventLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppEnvSessionPoolEventLogs'
      displayName: 'AppEnvSessionPoolEventLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppEnvSpringAppConsoleLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppEnvSpringAppConsoleLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppEnvSpringAppConsoleLogs'
      displayName: 'AppEnvSpringAppConsoleLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppEvents'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppEvents'
      displayName: 'AppEvents'
    }
    retentionInDays: 90
  }
}

resource workspaces_multienterpriseworkspace01_name_AppExceptions 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppExceptions'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppExceptions'
      displayName: 'AppExceptions'
    }
    retentionInDays: 90
  }
}

resource workspaces_multienterpriseworkspace01_name_AppMetrics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppMetrics'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppMetrics'
      displayName: 'AppMetrics'
    }
    retentionInDays: 90
  }
}

resource workspaces_multienterpriseworkspace01_name_AppPageViews 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppPageViews'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppPageViews'
      displayName: 'AppPageViews'
    }
    retentionInDays: 90
  }
}

resource workspaces_multienterpriseworkspace01_name_AppPerformanceCounters 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppPerformanceCounters'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppPerformanceCounters'
      displayName: 'AppPerformanceCounters'
    }
    retentionInDays: 90
  }
}

resource workspaces_multienterpriseworkspace01_name_AppPlatformBuildLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppPlatformBuildLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformBuildLogs'
      displayName: 'AppPlatformBuildLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppPlatformContainerEventLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppPlatformContainerEventLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformContainerEventLogs'
      displayName: 'AppPlatformContainerEventLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppPlatformIngressLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppPlatformIngressLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformIngressLogs'
      displayName: 'AppPlatformIngressLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppPlatformLogsforSpring 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppPlatformLogsforSpring'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformLogsforSpring'
      displayName: 'AppPlatformLogsforSpring'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppPlatformSystemLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppPlatformSystemLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformSystemLogs'
      displayName: 'AppPlatformSystemLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppRequests 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppRequests'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppRequests'
      displayName: 'AppRequests'
    }
    retentionInDays: 90
  }
}

resource workspaces_multienterpriseworkspace01_name_AppServiceAntivirusScanAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppServiceAntivirusScanAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppServiceAntivirusScanAuditLogs'
      displayName: 'AppServiceAntivirusScanAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppServiceAppLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppServiceAppLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppServiceAppLogs'
      displayName: 'AppServiceAppLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppServiceAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppServiceAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppServiceAuditLogs'
      displayName: 'AppServiceAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppServiceAuthenticationLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppServiceAuthenticationLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppServiceAuthenticationLogs'
      displayName: 'AppServiceAuthenticationLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppServiceConsoleLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppServiceConsoleLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppServiceConsoleLogs'
      displayName: 'AppServiceConsoleLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppServiceEnvironmentPlatformLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppServiceEnvironmentPlatformLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppServiceEnvironmentPlatformLogs'
      displayName: 'AppServiceEnvironmentPlatformLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppServiceFileAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppServiceFileAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppServiceFileAuditLogs'
      displayName: 'AppServiceFileAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppServiceHTTPLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppServiceHTTPLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppServiceHTTPLogs'
      displayName: 'AppServiceHTTPLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppServiceIPSecAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppServiceIPSecAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppServiceIPSecAuditLogs'
      displayName: 'AppServiceIPSecAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppServicePlatformLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppServicePlatformLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppServicePlatformLogs'
      displayName: 'AppServicePlatformLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppServiceServerlessSecurityPluginData 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppServiceServerlessSecurityPluginData'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AppServiceServerlessSecurityPluginData'
      displayName: 'AppServiceServerlessSecurityPluginData'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AppSystemEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppSystemEvents'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppSystemEvents'
      displayName: 'AppSystemEvents'
    }
    retentionInDays: 90
  }
}

resource workspaces_multienterpriseworkspace01_name_AppTraces 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AppTraces'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppTraces'
      displayName: 'AppTraces'
    }
    retentionInDays: 90
  }
}

resource workspaces_multienterpriseworkspace01_name_ArcK8sAudit 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ArcK8sAudit'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ArcK8sAudit'
      displayName: 'ArcK8sAudit'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ArcK8sAuditAdmin 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ArcK8sAuditAdmin'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ArcK8sAuditAdmin'
      displayName: 'ArcK8sAuditAdmin'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ArcK8sControlPlane 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ArcK8sControlPlane'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ArcK8sControlPlane'
      displayName: 'ArcK8sControlPlane'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ASCAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ASCAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ASCAuditLogs'
      displayName: 'ASCAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ASCDeviceEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ASCDeviceEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ASCDeviceEvents'
      displayName: 'ASCDeviceEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ASRJobs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ASRJobs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ASRJobs'
      displayName: 'ASRJobs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ASRReplicatedItems 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ASRReplicatedItems'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ASRReplicatedItems'
      displayName: 'ASRReplicatedItems'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ASRv2HealthEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ASRv2HealthEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ASRv2HealthEvents'
      displayName: 'ASRv2HealthEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ASRv2JobEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ASRv2JobEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ASRv2JobEvents'
      displayName: 'ASRv2JobEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ASRv2ProtectedItems 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ASRv2ProtectedItems'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ASRv2ProtectedItems'
      displayName: 'ASRv2ProtectedItems'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ASRv2ReplicationExtensions 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ASRv2ReplicationExtensions'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ASRv2ReplicationExtensions'
      displayName: 'ASRv2ReplicationExtensions'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ASRv2ReplicationPolicies 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ASRv2ReplicationPolicies'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ASRv2ReplicationPolicies'
      displayName: 'ASRv2ReplicationPolicies'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ASRv2ReplicationVaults 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ASRv2ReplicationVaults'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ASRv2ReplicationVaults'
      displayName: 'ASRv2ReplicationVaults'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ATCExpressRouteCircuitIpfix 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ATCExpressRouteCircuitIpfix'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ATCExpressRouteCircuitIpfix'
      displayName: 'ATCExpressRouteCircuitIpfix'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ATCMicrosoftPeeringMetadata 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ATCMicrosoftPeeringMetadata'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ATCMicrosoftPeeringMetadata'
      displayName: 'ATCMicrosoftPeeringMetadata'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ATCPrivatePeeringMetadata 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ATCPrivatePeeringMetadata'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ATCPrivatePeeringMetadata'
      displayName: 'ATCPrivatePeeringMetadata'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AuditLogs'
      displayName: 'AuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AutoscaleEvaluationsLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AutoscaleEvaluationsLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AutoscaleEvaluationsLog'
      displayName: 'AutoscaleEvaluationsLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AutoscaleScaleActionsLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AutoscaleScaleActionsLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AutoscaleScaleActionsLog'
      displayName: 'AutoscaleScaleActionsLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AVNMConnectivityConfigurationChange 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AVNMConnectivityConfigurationChange'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AVNMConnectivityConfigurationChange'
      displayName: 'AVNMConnectivityConfigurationChange'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AVNMIPAMPoolAllocationChange 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AVNMIPAMPoolAllocationChange'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AVNMIPAMPoolAllocationChange'
      displayName: 'AVNMIPAMPoolAllocationChange'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AVNMNetworkGroupMembershipChange 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AVNMNetworkGroupMembershipChange'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AVNMNetworkGroupMembershipChange'
      displayName: 'AVNMNetworkGroupMembershipChange'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AVNMRuleCollectionChange 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AVNMRuleCollectionChange'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AVNMRuleCollectionChange'
      displayName: 'AVNMRuleCollectionChange'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AVSSyslog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AVSSyslog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AVSSyslog'
      displayName: 'AVSSyslog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZFWApplicationRule 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZFWApplicationRule'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZFWApplicationRule'
      displayName: 'AZFWApplicationRule'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZFWApplicationRuleAggregation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZFWApplicationRuleAggregation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZFWApplicationRuleAggregation'
      displayName: 'AZFWApplicationRuleAggregation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZFWDnsQuery 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZFWDnsQuery'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZFWDnsQuery'
      displayName: 'AZFWDnsQuery'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZFWFatFlow 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZFWFatFlow'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZFWFatFlow'
      displayName: 'AZFWFatFlow'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZFWFlowTrace 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZFWFlowTrace'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZFWFlowTrace'
      displayName: 'AZFWFlowTrace'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZFWIdpsSignature 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZFWIdpsSignature'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZFWIdpsSignature'
      displayName: 'AZFWIdpsSignature'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZFWInternalFqdnResolutionFailure 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZFWInternalFqdnResolutionFailure'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZFWInternalFqdnResolutionFailure'
      displayName: 'AZFWInternalFqdnResolutionFailure'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZFWNatRule 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZFWNatRule'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZFWNatRule'
      displayName: 'AZFWNatRule'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZFWNatRuleAggregation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZFWNatRuleAggregation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZFWNatRuleAggregation'
      displayName: 'AZFWNatRuleAggregation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZFWNetworkRule 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZFWNetworkRule'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZFWNetworkRule'
      displayName: 'AZFWNetworkRule'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZFWNetworkRuleAggregation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZFWNetworkRuleAggregation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZFWNetworkRuleAggregation'
      displayName: 'AZFWNetworkRuleAggregation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZFWThreatIntel 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZFWThreatIntel'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZFWThreatIntel'
      displayName: 'AZFWThreatIntel'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZKVAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZKVAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZKVAuditLogs'
      displayName: 'AZKVAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZKVPolicyEvaluationDetailsLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZKVPolicyEvaluationDetailsLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZKVPolicyEvaluationDetailsLogs'
      displayName: 'AZKVPolicyEvaluationDetailsLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZMSApplicationMetricLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZMSApplicationMetricLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZMSApplicationMetricLogs'
      displayName: 'AZMSApplicationMetricLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZMSArchiveLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZMSArchiveLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZMSArchiveLogs'
      displayName: 'AZMSArchiveLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZMSAutoscaleLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZMSAutoscaleLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZMSAutoscaleLogs'
      displayName: 'AZMSAutoscaleLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZMSCustomerManagedKeyUserLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZMSCustomerManagedKeyUserLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZMSCustomerManagedKeyUserLogs'
      displayName: 'AZMSCustomerManagedKeyUserLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZMSDiagnosticErrorLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZMSDiagnosticErrorLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZMSDiagnosticErrorLogs'
      displayName: 'AZMSDiagnosticErrorLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZMSHybridConnectionsEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZMSHybridConnectionsEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZMSHybridConnectionsEvents'
      displayName: 'AZMSHybridConnectionsEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZMSKafkaCoordinatorLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZMSKafkaCoordinatorLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZMSKafkaCoordinatorLogs'
      displayName: 'AZMSKafkaCoordinatorLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZMSKafkaUserErrorLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZMSKafkaUserErrorLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZMSKafkaUserErrorLogs'
      displayName: 'AZMSKafkaUserErrorLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZMSOperationalLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZMSOperationalLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZMSOperationalLogs'
      displayName: 'AZMSOperationalLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZMSRunTimeAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZMSRunTimeAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZMSRunTimeAuditLogs'
      displayName: 'AZMSRunTimeAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AZMSVnetConnectionEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AZMSVnetConnectionEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AZMSVnetConnectionEvents'
      displayName: 'AZMSVnetConnectionEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AzureActivity 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AzureActivity'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AzureActivity'
      displayName: 'AzureActivity'
    }
    retentionInDays: 90
  }
}

resource workspaces_multienterpriseworkspace01_name_AzureActivityV2 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AzureActivityV2'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AzureActivityV2'
      displayName: 'AzureActivityV2'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AzureAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AzureAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AzureAssessmentRecommendation'
      displayName: 'AzureAssessmentRecommendation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AzureAttestationDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AzureAttestationDiagnostics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AzureAttestationDiagnostics'
      displayName: 'AzureAttestationDiagnostics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AzureBackupOperations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AzureBackupOperations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AzureBackupOperations'
      displayName: 'AzureBackupOperations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AzureDevOpsAuditing 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AzureDevOpsAuditing'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AzureDevOpsAuditing'
      displayName: 'AzureDevOpsAuditing'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AzureLoadTestingOperation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AzureLoadTestingOperation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AzureLoadTestingOperation'
      displayName: 'AzureLoadTestingOperation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AzureMetrics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AzureMetrics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AzureMetrics'
      displayName: 'AzureMetrics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_AzureMetricsV2 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'AzureMetricsV2'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'AzureMetricsV2'
      displayName: 'AzureMetricsV2'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_BehaviorEntities 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'BehaviorEntities'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'BehaviorEntities'
      displayName: 'BehaviorEntities'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_BehaviorInfo 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'BehaviorInfo'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'BehaviorInfo'
      displayName: 'BehaviorInfo'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_BlockchainApplicationLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'BlockchainApplicationLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'BlockchainApplicationLog'
      displayName: 'BlockchainApplicationLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_BlockchainProxyLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'BlockchainProxyLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'BlockchainProxyLog'
      displayName: 'BlockchainProxyLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CassandraAudit 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CassandraAudit'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CassandraAudit'
      displayName: 'CassandraAudit'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CassandraLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CassandraLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CassandraLogs'
      displayName: 'CassandraLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CCFApplicationLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CCFApplicationLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CCFApplicationLogs'
      displayName: 'CCFApplicationLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CDBCassandraRequests 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CDBCassandraRequests'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CDBCassandraRequests'
      displayName: 'CDBCassandraRequests'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CDBControlPlaneRequests 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CDBControlPlaneRequests'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CDBControlPlaneRequests'
      displayName: 'CDBControlPlaneRequests'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CDBDataPlaneRequests 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CDBDataPlaneRequests'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CDBDataPlaneRequests'
      displayName: 'CDBDataPlaneRequests'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CDBDataPlaneRequests15M 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CDBDataPlaneRequests15M'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CDBDataPlaneRequests15M'
      displayName: 'CDBDataPlaneRequests15M'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CDBDataPlaneRequests5M 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CDBDataPlaneRequests5M'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CDBDataPlaneRequests5M'
      displayName: 'CDBDataPlaneRequests5M'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CDBGremlinRequests 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CDBGremlinRequests'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CDBGremlinRequests'
      displayName: 'CDBGremlinRequests'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CDBMongoRequests 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CDBMongoRequests'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CDBMongoRequests'
      displayName: 'CDBMongoRequests'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CDBPartitionKeyRUConsumption 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CDBPartitionKeyRUConsumption'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CDBPartitionKeyRUConsumption'
      displayName: 'CDBPartitionKeyRUConsumption'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CDBPartitionKeyStatistics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CDBPartitionKeyStatistics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CDBPartitionKeyStatistics'
      displayName: 'CDBPartitionKeyStatistics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CDBQueryRuntimeStatistics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CDBQueryRuntimeStatistics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CDBQueryRuntimeStatistics'
      displayName: 'CDBQueryRuntimeStatistics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CDBTableApiRequests 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CDBTableApiRequests'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CDBTableApiRequests'
      displayName: 'CDBTableApiRequests'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ChaosStudioExperimentEventLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ChaosStudioExperimentEventLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ChaosStudioExperimentEventLogs'
      displayName: 'ChaosStudioExperimentEventLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CHSMServiceOperationAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CHSMServiceOperationAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CHSMServiceOperationAuditLogs'
      displayName: 'CHSMServiceOperationAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CIEventsAudit 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CIEventsAudit'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CIEventsAudit'
      displayName: 'CIEventsAudit'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CIEventsOperational 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CIEventsOperational'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CIEventsOperational'
      displayName: 'CIEventsOperational'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CloudHsmServiceOperationAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CloudHsmServiceOperationAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CloudHsmServiceOperationAuditLogs'
      displayName: 'CloudHsmServiceOperationAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ComputerGroup 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ComputerGroup'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ComputerGroup'
      displayName: 'ComputerGroup'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ContainerAppConsoleLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ContainerAppConsoleLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ContainerAppConsoleLogs'
      displayName: 'ContainerAppConsoleLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ContainerAppSystemLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ContainerAppSystemLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ContainerAppSystemLogs'
      displayName: 'ContainerAppSystemLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ContainerEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ContainerEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ContainerEvent'
      displayName: 'ContainerEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ContainerImageInventory 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ContainerImageInventory'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ContainerImageInventory'
      displayName: 'ContainerImageInventory'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ContainerInstanceLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ContainerInstanceLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ContainerInstanceLog'
      displayName: 'ContainerInstanceLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ContainerInventory 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ContainerInventory'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ContainerInventory'
      displayName: 'ContainerInventory'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ContainerLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ContainerLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ContainerLog'
      displayName: 'ContainerLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ContainerLogV2 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ContainerLogV2'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ContainerLogV2'
      displayName: 'ContainerLogV2'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ContainerNodeInventory 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ContainerNodeInventory'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ContainerNodeInventory'
      displayName: 'ContainerNodeInventory'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ContainerRegistryLoginEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ContainerRegistryLoginEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ContainerRegistryLoginEvents'
      displayName: 'ContainerRegistryLoginEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ContainerRegistryRepositoryEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ContainerRegistryRepositoryEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ContainerRegistryRepositoryEvents'
      displayName: 'ContainerRegistryRepositoryEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ContainerServiceLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ContainerServiceLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ContainerServiceLog'
      displayName: 'ContainerServiceLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_CoreAzureBackup 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'CoreAzureBackup'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'CoreAzureBackup'
      displayName: 'CoreAzureBackup'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksAccounts 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksAccounts'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksAccounts'
      displayName: 'DatabricksAccounts'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksApps 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksApps'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksApps'
      displayName: 'DatabricksApps'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksBrickStoreHttpGateway 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksBrickStoreHttpGateway'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksBrickStoreHttpGateway'
      displayName: 'DatabricksBrickStoreHttpGateway'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksBudgetPolicyCentral 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksBudgetPolicyCentral'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksBudgetPolicyCentral'
      displayName: 'DatabricksBudgetPolicyCentral'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksCapsule8Dataplane 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksCapsule8Dataplane'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksCapsule8Dataplane'
      displayName: 'DatabricksCapsule8Dataplane'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksClamAVScan 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksClamAVScan'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksClamAVScan'
      displayName: 'DatabricksClamAVScan'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksCloudStorageMetadata 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksCloudStorageMetadata'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksCloudStorageMetadata'
      displayName: 'DatabricksCloudStorageMetadata'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksClusterLibraries 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksClusterLibraries'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksClusterLibraries'
      displayName: 'DatabricksClusterLibraries'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksClusterPolicies 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksClusterPolicies'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksClusterPolicies'
      displayName: 'DatabricksClusterPolicies'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksClusters 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksClusters'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksClusters'
      displayName: 'DatabricksClusters'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksDashboards 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksDashboards'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDashboards'
      displayName: 'DatabricksDashboards'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksDatabricksSQL 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksDatabricksSQL'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDatabricksSQL'
      displayName: 'DatabricksDatabricksSQL'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksDataMonitoring 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksDataMonitoring'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDataMonitoring'
      displayName: 'DatabricksDataMonitoring'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksDataRooms 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksDataRooms'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDataRooms'
      displayName: 'DatabricksDataRooms'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksDBFS 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksDBFS'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDBFS'
      displayName: 'DatabricksDBFS'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksDeltaPipelines 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksDeltaPipelines'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDeltaPipelines'
      displayName: 'DatabricksDeltaPipelines'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksFeatureStore 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksFeatureStore'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksFeatureStore'
      displayName: 'DatabricksFeatureStore'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksFiles 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksFiles'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksFiles'
      displayName: 'DatabricksFiles'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksFilesystem 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksFilesystem'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksFilesystem'
      displayName: 'DatabricksFilesystem'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksGenie 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksGenie'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksGenie'
      displayName: 'DatabricksGenie'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksGitCredentials 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksGitCredentials'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksGitCredentials'
      displayName: 'DatabricksGitCredentials'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksGlobalInitScripts 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksGlobalInitScripts'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksGlobalInitScripts'
      displayName: 'DatabricksGlobalInitScripts'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksGroups 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksGroups'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksGroups'
      displayName: 'DatabricksGroups'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksIAMRole 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksIAMRole'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksIAMRole'
      displayName: 'DatabricksIAMRole'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksIngestion 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksIngestion'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksIngestion'
      displayName: 'DatabricksIngestion'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksInstancePools 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksInstancePools'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksInstancePools'
      displayName: 'DatabricksInstancePools'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksJobs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksJobs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksJobs'
      displayName: 'DatabricksJobs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksLakeviewConfig 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksLakeviewConfig'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksLakeviewConfig'
      displayName: 'DatabricksLakeviewConfig'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksLineageTracking 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksLineageTracking'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksLineageTracking'
      displayName: 'DatabricksLineageTracking'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksMarketplaceConsumer 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksMarketplaceConsumer'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksMarketplaceConsumer'
      displayName: 'DatabricksMarketplaceConsumer'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksMarketplaceProvider 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksMarketplaceProvider'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksMarketplaceProvider'
      displayName: 'DatabricksMarketplaceProvider'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksMLflowAcledArtifact 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksMLflowAcledArtifact'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksMLflowAcledArtifact'
      displayName: 'DatabricksMLflowAcledArtifact'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksMLflowExperiment 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksMLflowExperiment'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksMLflowExperiment'
      displayName: 'DatabricksMLflowExperiment'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksModelRegistry 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksModelRegistry'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksModelRegistry'
      displayName: 'DatabricksModelRegistry'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksNotebook 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksNotebook'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksNotebook'
      displayName: 'DatabricksNotebook'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksOnlineTables 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksOnlineTables'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksOnlineTables'
      displayName: 'DatabricksOnlineTables'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksPartnerHub 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksPartnerHub'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksPartnerHub'
      displayName: 'DatabricksPartnerHub'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksPredictiveOptimization 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksPredictiveOptimization'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksPredictiveOptimization'
      displayName: 'DatabricksPredictiveOptimization'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksRBAC 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksRBAC'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksRBAC'
      displayName: 'DatabricksRBAC'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksRemoteHistoryService 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksRemoteHistoryService'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksRemoteHistoryService'
      displayName: 'DatabricksRemoteHistoryService'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksRepos 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksRepos'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksRepos'
      displayName: 'DatabricksRepos'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksRFA 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksRFA'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksRFA'
      displayName: 'DatabricksRFA'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksSecrets 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksSecrets'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksSecrets'
      displayName: 'DatabricksSecrets'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksServerlessRealTimeInference 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksServerlessRealTimeInference'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksServerlessRealTimeInference'
      displayName: 'DatabricksServerlessRealTimeInference'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksSQL 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksSQL'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksSQL'
      displayName: 'DatabricksSQL'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksSQLPermissions 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksSQLPermissions'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksSQLPermissions'
      displayName: 'DatabricksSQLPermissions'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksSSH 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksSSH'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksSSH'
      displayName: 'DatabricksSSH'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksUnityCatalog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksUnityCatalog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksUnityCatalog'
      displayName: 'DatabricksUnityCatalog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksVectorSearch 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksVectorSearch'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksVectorSearch'
      displayName: 'DatabricksVectorSearch'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksWebhookNotifications 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksWebhookNotifications'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksWebhookNotifications'
      displayName: 'DatabricksWebhookNotifications'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksWebTerminal 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksWebTerminal'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksWebTerminal'
      displayName: 'DatabricksWebTerminal'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksWorkspace 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksWorkspace'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksWorkspace'
      displayName: 'DatabricksWorkspace'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DatabricksWorkspaceFiles 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DatabricksWorkspaceFiles'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DatabricksWorkspaceFiles'
      displayName: 'DatabricksWorkspaceFiles'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DataTransferOperations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DataTransferOperations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DataTransferOperations'
      displayName: 'DataTransferOperations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DCRLogErrors 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DCRLogErrors'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DCRLogErrors'
      displayName: 'DCRLogErrors'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DCRLogTroubleshooting 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DCRLogTroubleshooting'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DCRLogTroubleshooting'
      displayName: 'DCRLogTroubleshooting'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DevCenterAgentHealthLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DevCenterAgentHealthLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DevCenterAgentHealthLogs'
      displayName: 'DevCenterAgentHealthLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DevCenterBillingEventLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DevCenterBillingEventLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DevCenterBillingEventLogs'
      displayName: 'DevCenterBillingEventLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DevCenterConnectionLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DevCenterConnectionLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DevCenterConnectionLogs'
      displayName: 'DevCenterConnectionLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DevCenterDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DevCenterDiagnosticLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DevCenterDiagnosticLogs'
      displayName: 'DevCenterDiagnosticLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DevCenterResourceOperationLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DevCenterResourceOperationLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DevCenterResourceOperationLogs'
      displayName: 'DevCenterResourceOperationLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DeviceBehaviorEntities 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DeviceBehaviorEntities'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DeviceBehaviorEntities'
      displayName: 'DeviceBehaviorEntities'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DeviceBehaviorInfo 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DeviceBehaviorInfo'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DeviceBehaviorInfo'
      displayName: 'DeviceBehaviorInfo'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DNSQueryLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DNSQueryLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DNSQueryLogs'
      displayName: 'DNSQueryLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DSMDataClassificationLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DSMDataClassificationLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DSMDataClassificationLogs'
      displayName: 'DSMDataClassificationLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_DSMDataLabelingLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'DSMDataLabelingLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'DSMDataLabelingLogs'
      displayName: 'DSMDataLabelingLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_EGNFailedHttpDataPlaneOperations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'EGNFailedHttpDataPlaneOperations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'EGNFailedHttpDataPlaneOperations'
      displayName: 'EGNFailedHttpDataPlaneOperations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_EGNFailedMqttConnections 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'EGNFailedMqttConnections'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'EGNFailedMqttConnections'
      displayName: 'EGNFailedMqttConnections'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_EGNFailedMqttPublishedMessages 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'EGNFailedMqttPublishedMessages'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'EGNFailedMqttPublishedMessages'
      displayName: 'EGNFailedMqttPublishedMessages'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_EGNFailedMqttSubscriptions 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'EGNFailedMqttSubscriptions'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'EGNFailedMqttSubscriptions'
      displayName: 'EGNFailedMqttSubscriptions'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_EGNMqttDisconnections 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'EGNMqttDisconnections'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'EGNMqttDisconnections'
      displayName: 'EGNMqttDisconnections'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_EGNSuccessfulHttpDataPlaneOperations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'EGNSuccessfulHttpDataPlaneOperations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'EGNSuccessfulHttpDataPlaneOperations'
      displayName: 'EGNSuccessfulHttpDataPlaneOperations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_EGNSuccessfulMqttConnections 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'EGNSuccessfulMqttConnections'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'EGNSuccessfulMqttConnections'
      displayName: 'EGNSuccessfulMqttConnections'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_EnrichedMicrosoft365AuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'EnrichedMicrosoft365AuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'EnrichedMicrosoft365AuditLogs'
      displayName: 'EnrichedMicrosoft365AuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ETWEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ETWEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ETWEvent'
      displayName: 'ETWEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_Event 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'Event'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'Event'
      displayName: 'Event'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ExchangeAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ExchangeAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ExchangeAssessmentRecommendation'
      displayName: 'ExchangeAssessmentRecommendation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ExchangeOnlineAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ExchangeOnlineAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ExchangeOnlineAssessmentRecommendation'
      displayName: 'ExchangeOnlineAssessmentRecommendation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_FailedIngestion 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'FailedIngestion'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'FailedIngestion'
      displayName: 'FailedIngestion'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_FunctionAppLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'FunctionAppLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'FunctionAppLogs'
      displayName: 'FunctionAppLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightAmbariClusterAlerts 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightAmbariClusterAlerts'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightAmbariClusterAlerts'
      displayName: 'HDInsightAmbariClusterAlerts'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightAmbariSystemMetrics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightAmbariSystemMetrics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightAmbariSystemMetrics'
      displayName: 'HDInsightAmbariSystemMetrics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightGatewayAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightGatewayAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightGatewayAuditLogs'
      displayName: 'HDInsightGatewayAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightHadoopAndYarnLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightHadoopAndYarnLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHadoopAndYarnLogs'
      displayName: 'HDInsightHadoopAndYarnLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightHadoopAndYarnMetrics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightHadoopAndYarnMetrics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHadoopAndYarnMetrics'
      displayName: 'HDInsightHadoopAndYarnMetrics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightHBaseLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightHBaseLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHBaseLogs'
      displayName: 'HDInsightHBaseLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightHBaseMetrics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightHBaseMetrics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHBaseMetrics'
      displayName: 'HDInsightHBaseMetrics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightHiveAndLLAPLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightHiveAndLLAPLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHiveAndLLAPLogs'
      displayName: 'HDInsightHiveAndLLAPLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightHiveAndLLAPMetrics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightHiveAndLLAPMetrics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHiveAndLLAPMetrics'
      displayName: 'HDInsightHiveAndLLAPMetrics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightHiveQueryAppStats 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightHiveQueryAppStats'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHiveQueryAppStats'
      displayName: 'HDInsightHiveQueryAppStats'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightHiveTezAppStats 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightHiveTezAppStats'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHiveTezAppStats'
      displayName: 'HDInsightHiveTezAppStats'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightJupyterNotebookEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightJupyterNotebookEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightJupyterNotebookEvents'
      displayName: 'HDInsightJupyterNotebookEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightKafkaLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightKafkaLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightKafkaLogs'
      displayName: 'HDInsightKafkaLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightKafkaMetrics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightKafkaMetrics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightKafkaMetrics'
      displayName: 'HDInsightKafkaMetrics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightKafkaServerLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightKafkaServerLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightKafkaServerLog'
      displayName: 'HDInsightKafkaServerLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightOozieLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightOozieLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightOozieLogs'
      displayName: 'HDInsightOozieLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightRangerAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightRangerAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightRangerAuditLogs'
      displayName: 'HDInsightRangerAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightSecurityLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightSecurityLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSecurityLogs'
      displayName: 'HDInsightSecurityLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightSparkApplicationEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightSparkApplicationEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkApplicationEvents'
      displayName: 'HDInsightSparkApplicationEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightSparkBlockManagerEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightSparkBlockManagerEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkBlockManagerEvents'
      displayName: 'HDInsightSparkBlockManagerEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightSparkEnvironmentEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightSparkEnvironmentEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkEnvironmentEvents'
      displayName: 'HDInsightSparkEnvironmentEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightSparkExecutorEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightSparkExecutorEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkExecutorEvents'
      displayName: 'HDInsightSparkExecutorEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightSparkExtraEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightSparkExtraEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkExtraEvents'
      displayName: 'HDInsightSparkExtraEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightSparkJobEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightSparkJobEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkJobEvents'
      displayName: 'HDInsightSparkJobEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightSparkLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightSparkLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkLogs'
      displayName: 'HDInsightSparkLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightSparkSQLExecutionEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightSparkSQLExecutionEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkSQLExecutionEvents'
      displayName: 'HDInsightSparkSQLExecutionEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightSparkStageEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightSparkStageEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkStageEvents'
      displayName: 'HDInsightSparkStageEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightSparkStageTaskAccumulables 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightSparkStageTaskAccumulables'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkStageTaskAccumulables'
      displayName: 'HDInsightSparkStageTaskAccumulables'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightSparkTaskEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightSparkTaskEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkTaskEvents'
      displayName: 'HDInsightSparkTaskEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightStormLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightStormLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightStormLogs'
      displayName: 'HDInsightStormLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightStormMetrics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightStormMetrics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightStormMetrics'
      displayName: 'HDInsightStormMetrics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HDInsightStormTopologyMetrics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HDInsightStormTopologyMetrics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HDInsightStormTopologyMetrics'
      displayName: 'HDInsightStormTopologyMetrics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_HealthStateChangeEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'HealthStateChangeEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'HealthStateChangeEvent'
      displayName: 'HealthStateChangeEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_Heartbeat 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'Heartbeat'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'Heartbeat'
      displayName: 'Heartbeat'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_InsightsMetrics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'InsightsMetrics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'InsightsMetrics'
      displayName: 'InsightsMetrics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_IntuneAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'IntuneAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'IntuneAuditLogs'
      displayName: 'IntuneAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_IntuneDeviceComplianceOrg 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'IntuneDeviceComplianceOrg'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'IntuneDeviceComplianceOrg'
      displayName: 'IntuneDeviceComplianceOrg'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_IntuneDevices 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'IntuneDevices'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'IntuneDevices'
      displayName: 'IntuneDevices'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_IntuneOperationalLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'IntuneOperationalLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'IntuneOperationalLogs'
      displayName: 'IntuneOperationalLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_KubeEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'KubeEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'KubeEvents'
      displayName: 'KubeEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_KubeHealth 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'KubeHealth'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'KubeHealth'
      displayName: 'KubeHealth'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_KubeMonAgentEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'KubeMonAgentEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'KubeMonAgentEvents'
      displayName: 'KubeMonAgentEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_KubeNodeInventory 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'KubeNodeInventory'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'KubeNodeInventory'
      displayName: 'KubeNodeInventory'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_KubePodInventory 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'KubePodInventory'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'KubePodInventory'
      displayName: 'KubePodInventory'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_KubePVInventory 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'KubePVInventory'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'KubePVInventory'
      displayName: 'KubePVInventory'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_KubeServices 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'KubeServices'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'KubeServices'
      displayName: 'KubeServices'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_LAQueryLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LAQueryLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'LAQueryLogs'
      displayName: 'LAQueryLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_LASummaryLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LASummaryLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'LASummaryLogs'
      displayName: 'LASummaryLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_LogicAppWorkflowRuntime 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'LogicAppWorkflowRuntime'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'LogicAppWorkflowRuntime'
      displayName: 'LogicAppWorkflowRuntime'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MCCEventLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MCCEventLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MCCEventLogs'
      displayName: 'MCCEventLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MCVPAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MCVPAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MCVPAuditLogs'
      displayName: 'MCVPAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MCVPOperationLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MCVPOperationLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MCVPOperationLogs'
      displayName: 'MCVPOperationLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MDCDetectionDNSEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MDCDetectionDNSEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MDCDetectionDNSEvents'
      displayName: 'MDCDetectionDNSEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MDCDetectionFimEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MDCDetectionFimEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MDCDetectionFimEvents'
      displayName: 'MDCDetectionFimEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MDCDetectionGatingValidationEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MDCDetectionGatingValidationEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MDCDetectionGatingValidationEvents'
      displayName: 'MDCDetectionGatingValidationEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MDCFileIntegrityMonitoringEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MDCFileIntegrityMonitoringEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MDCFileIntegrityMonitoringEvents'
      displayName: 'MDCFileIntegrityMonitoringEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MDECustomCollectionDeviceFileEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MDECustomCollectionDeviceFileEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MDECustomCollectionDeviceFileEvents'
      displayName: 'MDECustomCollectionDeviceFileEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MDPResourceLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MDPResourceLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MDPResourceLog'
      displayName: 'MDPResourceLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MicrosoftAzureBastionAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MicrosoftAzureBastionAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftAzureBastionAuditLogs'
      displayName: 'MicrosoftAzureBastionAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MicrosoftDataShareReceivedSnapshotLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MicrosoftDataShareReceivedSnapshotLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftDataShareReceivedSnapshotLog'
      displayName: 'MicrosoftDataShareReceivedSnapshotLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MicrosoftDataShareSentSnapshotLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MicrosoftDataShareSentSnapshotLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftDataShareSentSnapshotLog'
      displayName: 'MicrosoftDataShareSentSnapshotLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MicrosoftDataShareShareLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MicrosoftDataShareShareLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftDataShareShareLog'
      displayName: 'MicrosoftDataShareShareLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MicrosoftGraphActivityLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MicrosoftGraphActivityLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftGraphActivityLogs'
      displayName: 'MicrosoftGraphActivityLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MicrosoftHealthcareApisAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MicrosoftHealthcareApisAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftHealthcareApisAuditLogs'
      displayName: 'MicrosoftHealthcareApisAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MNFDeviceUpdates 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MNFDeviceUpdates'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MNFDeviceUpdates'
      displayName: 'MNFDeviceUpdates'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MNFSystemSessionHistoryUpdates 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MNFSystemSessionHistoryUpdates'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MNFSystemSessionHistoryUpdates'
      displayName: 'MNFSystemSessionHistoryUpdates'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_MNFSystemStateMessageUpdates 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'MNFSystemStateMessageUpdates'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'MNFSystemStateMessageUpdates'
      displayName: 'MNFSystemStateMessageUpdates'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NatGatewayFlowlogsV1 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NatGatewayFlowlogsV1'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NatGatewayFlowlogsV1'
      displayName: 'NatGatewayFlowlogsV1'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NCBMBreakGlassAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NCBMBreakGlassAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NCBMBreakGlassAuditLogs'
      displayName: 'NCBMBreakGlassAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NCBMSecurityDefenderLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NCBMSecurityDefenderLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NCBMSecurityDefenderLogs'
      displayName: 'NCBMSecurityDefenderLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NCBMSecurityLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NCBMSecurityLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NCBMSecurityLogs'
      displayName: 'NCBMSecurityLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NCBMSystemLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NCBMSystemLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NCBMSystemLogs'
      displayName: 'NCBMSystemLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NCCKubernetesLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NCCKubernetesLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NCCKubernetesLogs'
      displayName: 'NCCKubernetesLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NCCPlatformOperationsLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NCCPlatformOperationsLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NCCPlatformOperationsLogs'
      displayName: 'NCCPlatformOperationsLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NCCVMOrchestrationLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NCCVMOrchestrationLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NCCVMOrchestrationLogs'
      displayName: 'NCCVMOrchestrationLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NCMClusterOperationsLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NCMClusterOperationsLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NCMClusterOperationsLogs'
      displayName: 'NCMClusterOperationsLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NCSStorageAlerts 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NCSStorageAlerts'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NCSStorageAlerts'
      displayName: 'NCSStorageAlerts'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NCSStorageAudits 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NCSStorageAudits'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NCSStorageAudits'
      displayName: 'NCSStorageAudits'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NCSStorageLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NCSStorageLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NCSStorageLogs'
      displayName: 'NCSStorageLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NetworkAccessAlerts 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NetworkAccessAlerts'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NetworkAccessAlerts'
      displayName: 'NetworkAccessAlerts'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NetworkAccessConnectionEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NetworkAccessConnectionEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NetworkAccessConnectionEvents'
      displayName: 'NetworkAccessConnectionEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NetworkAccessTraffic 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NetworkAccessTraffic'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NetworkAccessTraffic'
      displayName: 'NetworkAccessTraffic'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NginxUpstreamUpdateLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NginxUpstreamUpdateLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NginxUpstreamUpdateLogs'
      displayName: 'NginxUpstreamUpdateLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NGXOperationLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NGXOperationLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NGXOperationLogs'
      displayName: 'NGXOperationLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NGXSecurityLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NGXSecurityLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NGXSecurityLogs'
      displayName: 'NGXSecurityLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NSPAccessLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NSPAccessLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NSPAccessLogs'
      displayName: 'NSPAccessLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NTAInsights 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NTAInsights'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NTAInsights'
      displayName: 'NTAInsights'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NTAIpDetails 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NTAIpDetails'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NTAIpDetails'
      displayName: 'NTAIpDetails'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NTANetAnalytics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NTANetAnalytics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NTANetAnalytics'
      displayName: 'NTANetAnalytics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NTATopologyDetails 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NTATopologyDetails'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NTATopologyDetails'
      displayName: 'NTATopologyDetails'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NWConnectionMonitorDNSResult 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NWConnectionMonitorDNSResult'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NWConnectionMonitorDNSResult'
      displayName: 'NWConnectionMonitorDNSResult'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NWConnectionMonitorPathResult 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NWConnectionMonitorPathResult'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NWConnectionMonitorPathResult'
      displayName: 'NWConnectionMonitorPathResult'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_NWConnectionMonitorTestResult 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'NWConnectionMonitorTestResult'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'NWConnectionMonitorTestResult'
      displayName: 'NWConnectionMonitorTestResult'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_OEPAirFlowTask 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'OEPAirFlowTask'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'OEPAirFlowTask'
      displayName: 'OEPAirFlowTask'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_OEPAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'OEPAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'OEPAuditLogs'
      displayName: 'OEPAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_OEPDataplaneLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'OEPDataplaneLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'OEPDataplaneLogs'
      displayName: 'OEPDataplaneLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_OEPElasticOperator 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'OEPElasticOperator'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'OEPElasticOperator'
      displayName: 'OEPElasticOperator'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_OEPElasticsearch 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'OEPElasticsearch'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'OEPElasticsearch'
      displayName: 'OEPElasticsearch'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_OEWExperimentAssignmentSummary 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'OEWExperimentAssignmentSummary'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'OEWExperimentAssignmentSummary'
      displayName: 'OEWExperimentAssignmentSummary'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_OEWExperimentScorecardMetricPairs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'OEWExperimentScorecardMetricPairs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'OEWExperimentScorecardMetricPairs'
      displayName: 'OEWExperimentScorecardMetricPairs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_OEWExperimentScorecards 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'OEWExperimentScorecards'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'OEWExperimentScorecards'
      displayName: 'OEWExperimentScorecards'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_OLPSupplyChainEntityOperations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'OLPSupplyChainEntityOperations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'OLPSupplyChainEntityOperations'
      displayName: 'OLPSupplyChainEntityOperations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_OLPSupplyChainEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'OLPSupplyChainEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'OLPSupplyChainEvents'
      displayName: 'OLPSupplyChainEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_Operation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'Operation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'Operation'
      displayName: 'Operation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_Perf 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'Perf'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'Perf'
      displayName: 'Perf'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_PFTitleAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'PFTitleAuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'PFTitleAuditLogs'
      displayName: 'PFTitleAuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_PowerBIAuditTenant 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'PowerBIAuditTenant'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'PowerBIAuditTenant'
      displayName: 'PowerBIAuditTenant'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_PowerBIDatasetsTenant 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'PowerBIDatasetsTenant'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'PowerBIDatasetsTenant'
      displayName: 'PowerBIDatasetsTenant'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_PowerBIDatasetsWorkspace 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'PowerBIDatasetsWorkspace'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'PowerBIDatasetsWorkspace'
      displayName: 'PowerBIDatasetsWorkspace'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_PowerBIReportUsageTenant 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'PowerBIReportUsageTenant'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'PowerBIReportUsageTenant'
      displayName: 'PowerBIReportUsageTenant'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_PowerBIReportUsageWorkspace 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'PowerBIReportUsageWorkspace'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'PowerBIReportUsageWorkspace'
      displayName: 'PowerBIReportUsageWorkspace'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_PurviewDataSensitivityLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'PurviewDataSensitivityLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'PurviewDataSensitivityLogs'
      displayName: 'PurviewDataSensitivityLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_PurviewScanStatusLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'PurviewScanStatusLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'PurviewScanStatusLogs'
      displayName: 'PurviewScanStatusLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_PurviewSecurityLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'PurviewSecurityLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'PurviewSecurityLogs'
      displayName: 'PurviewSecurityLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_REDConnectionEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'REDConnectionEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'REDConnectionEvents'
      displayName: 'REDConnectionEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_RemoteNetworkHealthLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'RemoteNetworkHealthLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'RemoteNetworkHealthLogs'
      displayName: 'RemoteNetworkHealthLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ResourceManagementPublicAccessLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ResourceManagementPublicAccessLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ResourceManagementPublicAccessLogs'
      displayName: 'ResourceManagementPublicAccessLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_RetinaNetworkFlowLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'RetinaNetworkFlowLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'RetinaNetworkFlowLogs'
      displayName: 'RetinaNetworkFlowLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SCCMAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SCCMAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SCCMAssessmentRecommendation'
      displayName: 'SCCMAssessmentRecommendation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SCGPoolExecutionLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SCGPoolExecutionLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SCGPoolExecutionLog'
      displayName: 'SCGPoolExecutionLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SCGPoolRequestLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SCGPoolRequestLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SCGPoolRequestLog'
      displayName: 'SCGPoolRequestLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SCOMAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SCOMAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SCOMAssessmentRecommendation'
      displayName: 'SCOMAssessmentRecommendation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ServiceFabricOperationalEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ServiceFabricOperationalEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ServiceFabricOperationalEvent'
      displayName: 'ServiceFabricOperationalEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ServiceFabricReliableActorEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ServiceFabricReliableActorEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ServiceFabricReliableActorEvent'
      displayName: 'ServiceFabricReliableActorEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_ServiceFabricReliableServiceEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'ServiceFabricReliableServiceEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'ServiceFabricReliableServiceEvent'
      displayName: 'ServiceFabricReliableServiceEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SfBAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SfBAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SfBAssessmentRecommendation'
      displayName: 'SfBAssessmentRecommendation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SfBOnlineAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SfBOnlineAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SfBOnlineAssessmentRecommendation'
      displayName: 'SfBOnlineAssessmentRecommendation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SharePointOnlineAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SharePointOnlineAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SharePointOnlineAssessmentRecommendation'
      displayName: 'SharePointOnlineAssessmentRecommendation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SignalRServiceDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SignalRServiceDiagnosticLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SignalRServiceDiagnosticLogs'
      displayName: 'SignalRServiceDiagnosticLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SigninLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SigninLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SigninLogs'
      displayName: 'SigninLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SPAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SPAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SPAssessmentRecommendation'
      displayName: 'SPAssessmentRecommendation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SQLAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SQLAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SQLAssessmentRecommendation'
      displayName: 'SQLAssessmentRecommendation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SQLSecurityAuditEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SQLSecurityAuditEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SQLSecurityAuditEvents'
      displayName: 'SQLSecurityAuditEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_StorageBlobLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'StorageBlobLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'StorageBlobLogs'
      displayName: 'StorageBlobLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_StorageCacheOperationEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'StorageCacheOperationEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'StorageCacheOperationEvents'
      displayName: 'StorageCacheOperationEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_StorageCacheUpgradeEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'StorageCacheUpgradeEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'StorageCacheUpgradeEvents'
      displayName: 'StorageCacheUpgradeEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_StorageCacheWarningEvents 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'StorageCacheWarningEvents'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'StorageCacheWarningEvents'
      displayName: 'StorageCacheWarningEvents'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_StorageFileLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'StorageFileLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'StorageFileLogs'
      displayName: 'StorageFileLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_StorageMalwareScanningResults 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'StorageMalwareScanningResults'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'StorageMalwareScanningResults'
      displayName: 'StorageMalwareScanningResults'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_StorageMoverCopyLogsFailed 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'StorageMoverCopyLogsFailed'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'StorageMoverCopyLogsFailed'
      displayName: 'StorageMoverCopyLogsFailed'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_StorageMoverCopyLogsTransferred 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'StorageMoverCopyLogsTransferred'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'StorageMoverCopyLogsTransferred'
      displayName: 'StorageMoverCopyLogsTransferred'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_StorageMoverJobRunLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'StorageMoverJobRunLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'StorageMoverJobRunLogs'
      displayName: 'StorageMoverJobRunLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_StorageQueueLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'StorageQueueLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'StorageQueueLogs'
      displayName: 'StorageQueueLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_StorageTableLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'StorageTableLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'StorageTableLogs'
      displayName: 'StorageTableLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SucceededIngestion 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SucceededIngestion'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SucceededIngestion'
      displayName: 'SucceededIngestion'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SVMPoolExecutionLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SVMPoolExecutionLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SVMPoolExecutionLog'
      displayName: 'SVMPoolExecutionLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SVMPoolRequestLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SVMPoolRequestLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SVMPoolRequestLog'
      displayName: 'SVMPoolRequestLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseBigDataPoolApplicationsEnded 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseBigDataPoolApplicationsEnded'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseBigDataPoolApplicationsEnded'
      displayName: 'SynapseBigDataPoolApplicationsEnded'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseBuiltinSqlPoolRequestsEnded 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseBuiltinSqlPoolRequestsEnded'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseBuiltinSqlPoolRequestsEnded'
      displayName: 'SynapseBuiltinSqlPoolRequestsEnded'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseDXCommand 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseDXCommand'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXCommand'
      displayName: 'SynapseDXCommand'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseDXFailedIngestion 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseDXFailedIngestion'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXFailedIngestion'
      displayName: 'SynapseDXFailedIngestion'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseDXIngestionBatching 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseDXIngestionBatching'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXIngestionBatching'
      displayName: 'SynapseDXIngestionBatching'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseDXQuery 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseDXQuery'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXQuery'
      displayName: 'SynapseDXQuery'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseDXSucceededIngestion 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseDXSucceededIngestion'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXSucceededIngestion'
      displayName: 'SynapseDXSucceededIngestion'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseDXTableDetails 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseDXTableDetails'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXTableDetails'
      displayName: 'SynapseDXTableDetails'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseDXTableUsageStatistics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseDXTableUsageStatistics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXTableUsageStatistics'
      displayName: 'SynapseDXTableUsageStatistics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseGatewayApiRequests 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseGatewayApiRequests'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseGatewayApiRequests'
      displayName: 'SynapseGatewayApiRequests'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseIntegrationActivityRuns 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseIntegrationActivityRuns'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseIntegrationActivityRuns'
      displayName: 'SynapseIntegrationActivityRuns'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseIntegrationPipelineRuns 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseIntegrationPipelineRuns'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseIntegrationPipelineRuns'
      displayName: 'SynapseIntegrationPipelineRuns'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseIntegrationTriggerRuns 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseIntegrationTriggerRuns'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseIntegrationTriggerRuns'
      displayName: 'SynapseIntegrationTriggerRuns'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseLinkEvent 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseLinkEvent'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseLinkEvent'
      displayName: 'SynapseLinkEvent'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseRbacOperations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseRbacOperations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseRbacOperations'
      displayName: 'SynapseRbacOperations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseScopePoolScopeJobsEnded 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseScopePoolScopeJobsEnded'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseScopePoolScopeJobsEnded'
      displayName: 'SynapseScopePoolScopeJobsEnded'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseScopePoolScopeJobsStateChange 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseScopePoolScopeJobsStateChange'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseScopePoolScopeJobsStateChange'
      displayName: 'SynapseScopePoolScopeJobsStateChange'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseSqlPoolDmsWorkers 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseSqlPoolDmsWorkers'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolDmsWorkers'
      displayName: 'SynapseSqlPoolDmsWorkers'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseSqlPoolExecRequests 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseSqlPoolExecRequests'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolExecRequests'
      displayName: 'SynapseSqlPoolExecRequests'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseSqlPoolRequestSteps 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseSqlPoolRequestSteps'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolRequestSteps'
      displayName: 'SynapseSqlPoolRequestSteps'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseSqlPoolSqlRequests 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseSqlPoolSqlRequests'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolSqlRequests'
      displayName: 'SynapseSqlPoolSqlRequests'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_SynapseSqlPoolWaits 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'SynapseSqlPoolWaits'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolWaits'
      displayName: 'SynapseSqlPoolWaits'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_Syslog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'Syslog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'Syslog'
      displayName: 'Syslog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_TOUserAudits 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'TOUserAudits'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'TOUserAudits'
      displayName: 'TOUserAudits'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_TOUserDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'TOUserDiagnostics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'TOUserDiagnostics'
      displayName: 'TOUserDiagnostics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_TSIIngress 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'TSIIngress'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'TSIIngress'
      displayName: 'TSIIngress'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_UCClient 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'UCClient'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'UCClient'
      displayName: 'UCClient'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_UCClientReadinessStatus 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'UCClientReadinessStatus'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'UCClientReadinessStatus'
      displayName: 'UCClientReadinessStatus'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_UCClientUpdateStatus 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'UCClientUpdateStatus'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'UCClientUpdateStatus'
      displayName: 'UCClientUpdateStatus'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_UCDeviceAlert 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'UCDeviceAlert'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'UCDeviceAlert'
      displayName: 'UCDeviceAlert'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_UCDOAggregatedStatus 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'UCDOAggregatedStatus'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'UCDOAggregatedStatus'
      displayName: 'UCDOAggregatedStatus'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_UCDOStatus 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'UCDOStatus'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'UCDOStatus'
      displayName: 'UCDOStatus'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_UCServiceUpdateStatus 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'UCServiceUpdateStatus'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'UCServiceUpdateStatus'
      displayName: 'UCServiceUpdateStatus'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_UCUpdateAlert 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'UCUpdateAlert'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'UCUpdateAlert'
      displayName: 'UCUpdateAlert'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_Usage 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'Usage'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'Usage'
      displayName: 'Usage'
    }
    retentionInDays: 90
  }
}

resource workspaces_multienterpriseworkspace01_name_VCoreMongoRequests 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'VCoreMongoRequests'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'VCoreMongoRequests'
      displayName: 'VCoreMongoRequests'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_VIAudit 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'VIAudit'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'VIAudit'
      displayName: 'VIAudit'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_VIIndexing 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'VIIndexing'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'VIIndexing'
      displayName: 'VIIndexing'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_VMConnection 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'VMConnection'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'VMConnection'
      displayName: 'VMConnection'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_W3CIISLog 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'W3CIISLog'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'W3CIISLog'
      displayName: 'W3CIISLog'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WebPubSubConnectivity 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WebPubSubConnectivity'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WebPubSubConnectivity'
      displayName: 'WebPubSubConnectivity'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WebPubSubHttpRequest 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WebPubSubHttpRequest'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WebPubSubHttpRequest'
      displayName: 'WebPubSubHttpRequest'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WebPubSubMessaging 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WebPubSubMessaging'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WebPubSubMessaging'
      displayName: 'WebPubSubMessaging'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_Windows365AuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'Windows365AuditLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'Windows365AuditLogs'
      displayName: 'Windows365AuditLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WindowsClientAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WindowsClientAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WindowsClientAssessmentRecommendation'
      displayName: 'WindowsClientAssessmentRecommendation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WindowsServerAssessmentRecommendation 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WindowsServerAssessmentRecommendation'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WindowsServerAssessmentRecommendation'
      displayName: 'WindowsServerAssessmentRecommendation'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WorkloadDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WorkloadDiagnosticLogs'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WorkloadDiagnosticLogs'
      displayName: 'WorkloadDiagnosticLogs'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WOUserAudits 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WOUserAudits'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WOUserAudits'
      displayName: 'WOUserAudits'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WOUserDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WOUserDiagnostics'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WOUserDiagnostics'
      displayName: 'WOUserDiagnostics'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WVDAgentHealthStatus 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WVDAgentHealthStatus'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WVDAgentHealthStatus'
      displayName: 'WVDAgentHealthStatus'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WVDAutoscaleEvaluationPooled 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WVDAutoscaleEvaluationPooled'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WVDAutoscaleEvaluationPooled'
      displayName: 'WVDAutoscaleEvaluationPooled'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WVDCheckpoints 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WVDCheckpoints'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WVDCheckpoints'
      displayName: 'WVDCheckpoints'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WVDConnectionGraphicsDataPreview 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WVDConnectionGraphicsDataPreview'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WVDConnectionGraphicsDataPreview'
      displayName: 'WVDConnectionGraphicsDataPreview'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WVDConnectionNetworkData 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WVDConnectionNetworkData'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WVDConnectionNetworkData'
      displayName: 'WVDConnectionNetworkData'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WVDConnections 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WVDConnections'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WVDConnections'
      displayName: 'WVDConnections'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WVDErrors 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WVDErrors'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WVDErrors'
      displayName: 'WVDErrors'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WVDFeeds 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WVDFeeds'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WVDFeeds'
      displayName: 'WVDFeeds'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WVDHostRegistrations 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WVDHostRegistrations'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WVDHostRegistrations'
      displayName: 'WVDHostRegistrations'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WVDManagement 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WVDManagement'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WVDManagement'
      displayName: 'WVDManagement'
    }
    retentionInDays: 31
  }
}

resource workspaces_multienterpriseworkspace01_name_WVDSessionHostManagement 'Microsoft.OperationalInsights/workspaces/tables@2023-09-01' = {
  parent: workspaces_multienterpriseworkspace01_name_resource
  name: 'WVDSessionHostManagement'
  properties: {
    totalRetentionInDays: 31
    plan: 'Analytics'
    schema: {
      name: 'WVDSessionHostManagement'
      displayName: 'WVDSessionHostManagement'
    }
    retentionInDays: 31
  }
}