
Import-Module SqlServer
function SQLConnexion() {

    Param ( [String]$servername,[String]$database
          )
    $userid="username"
    $password="password"
        try {
            Write-Host -ForegroundColor red "Trying to connect into the server $servername with the instance $database"
            $SQLConnection = New-Object System.Data.SQLClient.SQLConnection 
            $SQLConnection.ConnectionString ="Server=$servername;Database=$database;User ID=$userid;Password=$password"
            $SQLConnection.Open()
            Write-Host -ForegroundColor Green "Connected to $servername"
            $state = $True
            }
        catch [System.Management.Automation.ItemNotFoundException] {
            Write-Host("Failed to connect SQL Server $servername")
            $state = $False
        }
    return $state, $SQLConnection
    }
   
