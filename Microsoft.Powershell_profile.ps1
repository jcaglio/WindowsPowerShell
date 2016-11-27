$HOST.UI.RawUI.ForegroundColor = "Gray"
$HOST.UI.RawUI.BackgroundColor = "Black"

Clear-Host
Write-Host "Hello ${ENV:USERNAME}"
Write-Host "Let me start loading your profile for you"

<# Setting the Prompt #>
function prompt {
$Today = Get-Date
$Timestamp = $Today.ToString("MM/dd/yyyy hh:mm:ss.ff")

Write-Host ""
Write-Host "$Timestamp" -ForegroundColor Green
Write-Host "$PWD" -ForegroundColor Green
Write-Host "${ENV:COMPUTERNAME}:>" -NoNewLine -ForegroundColor Green

return " "
}

<# Setting powershell environment variables for development #>
$visualstudio_env_filepath = "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat"
cmd /c "`"$visualstudio_env_filepath`" & set" | Foreach-Object {
    $var, $value = $_.split('=')
    if($var -and $value) {
        Set-Item -Path ENV:$var -Value $value
    }
} 2> $null

Set-Item -Path ENV:Path -Value "${ENV:Path};C:\Strawberry\perl\bin"
Set-Alias -Name "edit" -Value "${Env:ProgramFiles(x86)}\Vim\vim74\gvim.exe"
