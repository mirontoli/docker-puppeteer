az login
az account set --subscription mirontoli-msdn
az group create --name docker-puppeteer --location westeurope
az storage account create --name tolledockerpup --location westeurope --resource-group docker-puppeteer --sku Standard_LRS
#this didn't work: az functionapp: 'plan' is not in the 'az functionapp' command group. 
az functionapp plan create --resource-group docker-puppeteer --name tollepremiumplan --location westeurope --number-of-workers 1 --sku EP1 --is-linux

az functionapp create --name tolle-docker-puppe --storage-account  tolledockerpup  --resource-group docker-puppeteer --plan tollepremiumplan --deployment-container-image-name mirontoli/puppeteer-azure-function:v1.0.1

#remove "$" if you run the commands in bash
$storageConnectionString = $(az storage account show-connection-string --resource-group docker-puppeteer --name tolledockerpup --query connectionString --output tsv)

az functionapp config appsettings set --name tolle-docker-puppe --resource-group docker-puppeteer --settings AzureWebJobsStorage=$storageConnectionString

# didnt work: az functionapp deployment: 'container' is not in the 'az functionapp deployment' command group.
az functionapp deployment container config --enable-cd --query CI_CD_URL --output tsv --name tolle-docker-puppe --resource-group docker-puppeteer

#navigate to https://tolle-docker-puppe.azurewebsites.net/api/spo-pageload-check


#Clean up
az group delete --name docker-puppeteer