# Describes my steps to get a fresh Windows installation up and running.
#
# Usage: powershell.exe -ExecutionPolicy RemoteSigned -File .\setup.ps1

#################
# Initial Setup #
#################

# Allow local scripts to run for the current user
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

############
# Software #
############

# Remove bloatware programs
# Also remove third-party crap that Microsoft thinks is acceptable to ship with their OS
$PreinstalledApps = @(
    "Microsoft.Getstarted",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.MixedReality.Portal",
    "Microsoft.Office.OneNote",
    "Microsoft.OneConnect",
    "Microsoft.Print3D",
    "Microsoft.SkypeApp",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.WindowsSoundRecorder",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo",
    "SpotifyAB.SpotifyMusic",
    "king.com.CandyCrushFriends",
    "king.com.FarmHeroesSaga"
)
foreach ($App in $PreinstalledApps) {
    Get-AppxPackage -Name $App | Remove-AppxPackage
}

# Install Chocolatey, a community-built package manager for Windows
if(-Not (Get-Command choco)) {
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Install programs
$ChocoPackages = @(
    "7zip",
    "battle.net",
    "discord",
    "firefox",
    "geforce-experience",
    "git-lfs",
    "goggalaxy",
    "golang",
    "marktext",
    "nodejs",
    "origin",
    "python3",
    "spotify",
    "steam",
    "uplay",
    "vscode",
    "wireshark"
)
choco install -y @ChocoPackages
