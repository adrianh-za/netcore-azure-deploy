1) Install software
* install terraform and add into path
* install Azure CLI

2) Login to Azure
az login
** Choose the subscription.

3) Create the SQL Server instance for the app in docker
** The double quotes are needed.  Using single quotes on ACCEPT EULA does not work

docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Admin@123" -p 1433:1433 --name sql-dometrain mcr.microsoft.com/mssql/server:latest

4) migrate EFCore into DB

cd formulaone/dataservice
dotnet ef database update --startup-project ../FormulaOne.Api

5) When setting up the azure login
az ad sp create-for-rbac --name github-auth --role contributor --scopes /subscriptions/2eb09d37-aeca-4527-8df1-69a4246ca026/resourceGroups/f1-rg --json-auth --output json


6) later on for terraform
az role assignment create --assignee 814d1fb6-db5a-4224-bba9-5cde44d6aaff --role Contributor --scope /subscriptions/2eb09d37-aeca-4527-8df1-69a4246ca026