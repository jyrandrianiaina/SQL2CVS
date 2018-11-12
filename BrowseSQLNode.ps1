. ./ExportCVS.ps1


function BrowseSQLNodes() {
    param([string]$node_filepath)
    $mycvs = CreateCVS
    $mypath = Get-Content $node_filepath

    foreach ($node in $mypath) {
        Write-Host "---------------" $node " -------------"
        if (!$node) {
            #Escape empty line ...
        }
        else {
        $connexion_state, $string_connexion, $servername = SQLConnexion $node MASTER
        $result = GetSQLDetails $connexion_state
        AppendDataToMyCVS $result $mycvs $node
    }
}
}
BrowseSQLNodes ./allnodes.txt