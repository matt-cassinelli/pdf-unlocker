$ErrorActionPreference = "Stop" # Halt at any error.

function Get-ScriptRoot {
    if ($PSScriptRoot) { 
        $PSScriptRoot
    }
    elseif ($psISE) {
        Split-Path -Path $psISE.CurrentFile.FullPath
    }
    elseif ($profile -match "VScode") {
        Split-Path $psEditor.GetEditorContext().CurrentFile.Path
    }
    else { 
        throw "Script path not detected"
    } 
}

$scriptRoot = Get-ScriptRoot

$qpdf = Get-ChildItem $scriptRoot -Recurse -Filter "qpdf.exe"

while ($true) {
    $files = Get-ChildItem "$scriptRoot\Files To Decrypt" -Filter "*.pdf"
    if ($files.Count -gt 0) {
        break
    }
    else {
        "Please place PDF file(s) in the decryption directory."
        Read-Host
    }
}

Write-Host "Queued for decryption:"

$files | ForEach-Object {Write-Host "- $($_.Name)"}

$password = Read-Host -Prompt "Please provide the password"

$files | ForEach-Object {& $qpdf.FullName --decrypt --password=$password $_.FullName "$scriptRoot\Decrypted\$($_.Name)"}

Write-Host "Success, please check output folder."