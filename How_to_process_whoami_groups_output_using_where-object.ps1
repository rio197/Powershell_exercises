#How to process whoami groups output using where-object
whoami /groups /FO csv | convertfrom-csv | where-object SID -match "SID_of_AD_Group"
