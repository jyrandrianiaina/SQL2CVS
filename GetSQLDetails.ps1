. .\SQLConnexion.ps1


function GetSQLDetails() {
Param ([string]$connexion_state
)
Write-Host -ForegroundColor Green "Running querry"
    if ($connexion_state -eq $True) 
    {
        [string]$sql_query = "SELECT d.name, ROUND(SUM(mf.size) * 8 / 1024, 0) Size_MBs  FROM sys.master_files mf INNER JOIN sys.databases d ON d.database_id = mf.database_id WHERE d.database_id > 1 GROUP BY d.name ORDER BY d.name "
        Write-Host -ForegroundColor Green $sql_query
        $Command = New-Object System.Data.SQLClient.SQLCommand
        $Command.Connection = $string_connexion
        $Command.CommandText = $sql_query

        $SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
        $SqlAdapter.SelectCommand = $Command
        $DataSet = New-Object System.Data.DataSet

        $sqlAdapter.Fill($DataSet)
        $Return_InstanceID=$DataSet.Tables[0]
        $Command.Connection.Close()
        return $Return_InstanceID

    }

}


