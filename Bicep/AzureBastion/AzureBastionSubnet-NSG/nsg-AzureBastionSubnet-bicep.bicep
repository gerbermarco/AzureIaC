resource nsg 'Microsoft.Network/networkSecurityGroups@2021-03-01' = {
    name: 'nsg-AzureBastionSubnet'
    location: 'switzerlandnorth'
    tags: {}
    properties: {
        securityRules: [
            {
                name: 'AllowHttpsInbound'
                properties: {
                    protocol: 'Tcp'
                    sourcePortRange: '*'
                    sourceAddressPrefix: 'Internet'
                    destinationPortRange: '443'
                    destinationAddressPrefix: '*'
                    access: 'Allow'
                    priority: 120
                    direction: 'Inbound'
                }
            }
            {
                name: 'AllowGatewayManagerInbound'
                properties: {
                    protocol: 'Tcp'
                    sourcePortRange: '*'
                    sourceAddressPrefix: 'GatewayManager'
                    destinationPortRange: '443'
                    destinationAddressPrefix: '*'
                    access: 'Allow'
                    priority: 130
                    direction: 'Inbound'
                }
            }
            {
                name: 'AllowAzureLoadBalancerInbound'
                properties: {
                    protocol: 'Tcp'
                    sourcePortRange: '*'
                    sourceAddressPrefix: 'AzureLoadBalancer'
                    destinationPortRange: '443'
                    destinationAddressPrefix: '*'
                    access: 'Allow'
                    priority: 140
                    direction: 'Inbound'
                }
            }
            {
                name: 'AllowBastionHostCommunication'
                properties: {
                    protocol: '*'
                    sourcePortRange: '*'
                    sourceAddressPrefix: 'VirtualNetwork'
                    destinationPortRanges: [
                        '8080'
                        '5701'
                    ]
                    destinationAddressPrefix: 'VirtualNetwork'
                    access: 'Allow'
                    priority: 150
                    direction: 'Inbound'
                }
            }
            {
                name: 'AllowSshRdpOutbound'
                properties: {
                    protocol: '*'
                    sourcePortRange: '*'
                    sourceAddressPrefix: '*'
                    destinationPortRanges: [
                        '22'
                        '3389'
                    ]
                    destinationAddressPrefix: 'VirtualNetwork'
                    access: 'Allow'
                    priority: 100
                    direction: 'Outbound'
                }
            }
            {
                name: 'AllowAzureCloudOutbound'
                properties: {
                    protocol: 'Tcp'
                    sourcePortRange: '*'
                    sourceAddressPrefix: '*'
                    destinationPortRange: '443'
                    destinationAddressPrefix: 'AzureCloud'
                    access: 'Allow'
                    priority: 110
                    direction: 'Outbound'
                }
            }
            {
                name: 'AllowBastionCommunication'
                properties: {
                    protocol: '*'
                    sourcePortRange: '*'
                    sourceAddressPrefix: 'VirtualNetwork'
                    destinationPortRanges: [
                        '8080'
                        '5701'
                    ]
                    destinationAddressPrefix: 'VirtualNetwork'
                    access: 'Allow'
                    priority: 120
                    direction: 'Outbound'
                }
            }
        ]
    }
}
