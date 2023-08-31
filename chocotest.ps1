$workdir = "c:\installer"

If (Test-Path -Path $workdir -PathType Container)
{ Write-Host "$workdir already exists" -ForegroundColor Red}
ELSE
{ New-Item -Path $workdir -ItemType directory }

cd $workdir

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

$programs = @(
		@{'Name' = 'googlechrome', 'taskbar' = 'No'},
		@{'Name' = 'notepadplusplus', 'taskbar' = 'No'},
		@{'Name' = 'python3', 'taskbar' = 'No'}
		@{'Name' = 'firefox', 'taskbar' = 'No'}
)
foreach ($program in $programs) {  

	Write-Host "Installing: $($program['Name'])" 
	choco install $($program['Name']} -y
	
	
} 