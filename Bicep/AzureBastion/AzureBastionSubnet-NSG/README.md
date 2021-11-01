# Network security group for AzureBastionSubnet
If you ever deployed an Azure Bastion host, you'll know that it needs to be in a dedicated subnet called 'AzureBastionSubnet', which can only be used for Bastion hosts. We can further secure the subnet using a network security group.

Because Azure Bastion is a fully managed Azure service, we need to add a specific set of rules for all needed communication from the Bastion host to the backend services, otherwise the service can be degraded as mentioned from Microsoft:

> If you choose to use an NSG with your Azure Bastion resource, you must create all of the following ingress and egress traffic rules. Omitting any of the following rules in your NSG will block your Azure Bastion resource from receiving necessary updates in the future and therefore open up your resource to future security vulnerabilities.

The NSG rules in the template follow the declarations from this Docs article:
https://docs.microsoft.com/en-us/azure/bastion/bastion-nsg#apply

# Deploy the template file

For testing purposes we can simply deploy the template with Azure CLI.

1. Signin with Azure CLI
```bash
az login
```
2. Create resource group
```bash
az group create --location <location> --name <resourceGroupName>
```
3. Deploy the NSG to the resource group

To deploy the Bicep template, use:
```bash
az deployment group create --resource-group <resourceGroupName> --template-file nsg-bastionsubnet.bicep
```

To deploy the ARM template, use:
```bash
az deployment group create --resource-group <resourceGroupName> --template-file nsg-bastionsubnet.json
```
4. Associate the new NSG to the subnet 'AzureBastionSubnet'
```bash
az network vnet subnet update --resource-group <resourceGroupName> --name AzureBastionSubnet --vnet-name <vnetName> --network-security-group nsg-AzureBastionSubnet
```