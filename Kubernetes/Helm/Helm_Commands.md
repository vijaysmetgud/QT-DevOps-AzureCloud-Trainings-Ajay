## Helm Commands:

* Command To create helm chart
   
      helm create chart
      helm create <chart_name>

* Command to install helm chart

      helm install myfirstchart my-chart
      helm install <name_deployed> <created_chart_name>

* Command to list helm service which are running

        helm list 

* Command to run test and identify possible errors/issues
    
       helm lint <chart_name>

* Command to uninstall helm chart

      helm uninstall myfirstchart
      helm uninstall <name_deployed>

* Command to pull the chart from repository

       helm pull <chart_name>

* Command to push the chart in the repository

      helm push <chart_name>

* Command to re-direct helm template to readable formate

      helm template attempt my-chart --output-dir check
      helm template <name_deployed> <chart_name> --output-dir <folder_name_re-direct>

* Command to upgrade helm chart means values.yml/template files

      helm upgrade myhelloworld-release hello-world
      helm upgrade <name_deployed> <chart_name>

* Command to rollback to previous version

      helm rollback myhelloworld-release 1
      helm rollback <name_deployed> <revision_no>

* Command to debug and dry run helm chart 

      helm install helloworld-release --debug --dry-run hello-world`
       helm install <name_deploy> --debug --dry-run <chart_name>`

* Command to get yml output using template

      helm template hello-world
      helm template <chart_name>

## Helmfile Commands:

* Command to deploy helmfile charts on cluster
   * Note: installed set to true

         helmfile sync

             or
         helm init
         helmfile apply    

* Command to  delete/destroy helmfile charts on cluster
  * Note: installed set to false

        helmfile sync 
            
            or
        
        helmfile delete

## Helm Repo/hub Command:

* Command to search repo/hub in hub artifact

       helm search hub/repo nginx
       helm search hub/repo <package_name>

* Command to list the repo add to local

       helm repo list

* Command to remove repo in the call

         helm repo remove stable
         helm repo remove <repo_name>

* Command to add repo into local

        helm repo add stable  https://charts.helm.sh/stable
        
        helm repo add <repo_name><url>

        

              
       