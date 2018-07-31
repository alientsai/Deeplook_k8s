 # Deploy Database postgrsql
 
 ## Using Helm
 
 ### Cityeyes database
 `helm install --name cityeyes -f cityeyes/values.yaml stable/postgresql`
 
 ### PaaS database
 `helm install --name paas -f paas/values.yaml stable/postgresql`

 ### Import sql file on container
 `psql -h 0.0.0.0 -d postgres -U snake_eyes -f <file.sql>`