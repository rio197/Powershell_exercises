# Example: Search for the Deal name = 'SYZ Capital - Equity Hedge' from the CAR Report "Report.csv":

# List the column names to query on
PS C:\Users> Get-Content 'Report.csv' -Head 1

# Query the .csv file using the column name
PS C:\Users> Import-Csv -Delimiter "," -Path 'Report.csv' | where { $_.DealName -eq "SYZ Capital - Equity Hedge" } | select DealName,HedgeFundName
