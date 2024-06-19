# Given the following .csv format
RIC,ISIN,Round Lot,Last Price,Deal Size,ADV/MDV,ADV/MDV Source
BSL1.SA,BRBSLIRBLA1,100,0,100843,756323,(X% of Deal Size)
BSL2.SA,BRBSLIRBLA2,1,155.6,2012000,15032058,(X% of Deal Size)

# Use the following Powershell script to generate the publishing command
$param1=$args[0]

$ricadv=Import-Csv -Delimiter "," -Path $param1 | select ric,adv/mdv

foreach ($item in $ricadv)
{
  write-host ("update_ds.pl -p ""NY id {0} ,e {1} ,adv20 {2} ,mdv21 {3} ,;""" -f ($item.ric.tolower() -Split '\.')[0], ($item.ric.tolower() -Split '\.')[1], $item."adv/mdv", $item."adv/mdv")
}

Example usage
# .\Publishing_command_advmdv1.ps1 RICS.csv
update_ds.pl -p NY "id bsl1 ,e sa ,adv20 756323 ,mdv21 756323 ,;"
update_ds.pl -p NY "id bsl2 ,e sa ,adv20 15032058 ,mdv21 15032058 ,;"
