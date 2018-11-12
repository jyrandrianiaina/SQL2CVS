. ./GetSQLDetails.ps1

function CreateCVS() {
    $myfile = "databasecontent.cvs"
    if (Test-Path $myfile) {
        Write-Host -ForegroundColor red "Deleting CVS file $myfile if existe"
        Remove-Item -Path $myfile
    }
    $csvContents = @() 
    $row = New-Object System.Object
    $csvContents += $row
    $csvContents | Export-CSV -Path $myfile
    return $myfile
}
function AppendDataToMyCVS(){
    Param($result,$mycvs,$mynode)
    $myfile = $mycvs
    Write-Host -ForegroundColor red "Appending all database data into $mycvs"
    foreach ($database_details in $result) {
        
        if (!$database_details.name) {
            #Escape empty line ...
        }
        else {
            
            $content = '"'+$mynode +'","'+$database_details.name+'”,"'+$database_details.Size_Mbs+'”'
            Add-Content -Path $myfile $content  
        }
        Write-Host -ForegroundColor Yellow "Deleting Empty line"
        Get-Content $mycvs | ? {$_.trim() -ne "" } | set-content $mycvs
        

    }
    Write-Host "--------------- Ending access into " $node " -------------"
}

