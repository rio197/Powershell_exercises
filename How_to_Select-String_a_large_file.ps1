# How to do Select-String on a very large file
# In this example, the input file is a CSV with around 2 million lines.

# Extract the file header
Get-Content .\File_with_2_million_lines.csv -head 1 | Tee-Object -file output.csv -Append

# Filter the lines where Pattern1 and Pattern2 must exist, and Pattern3 & Pattern4 can alternately exist
# You can modulate the ReadCount value according to the size of your input file
Get-Content .\File_with_2_million_lines.csv -ReadCount 1000000 | ForEach { $_ -match "Pattern1" \
| Select-String -Pattern "pattern2" | Select-String -Pattern "pattern3|pattern4" | Tee-Object -file output.csv -Append}
