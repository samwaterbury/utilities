# Configures the extensions and settings typically I use with VS Code.
#
# Usage: .\setup.ps1

# Install extensions
code `
    --install-extension adpyke.vscode-sql-formatter `
    --install-extension christian-kohler.path-intellisense `
    --install-extension editorconfig.editorconfig `
    --install-extension michelemelluso.code-beautifier `
    --install-extension mikestead.dotenv `
    --install-extension ms-azuretools.vscode-docker `
    --install-extension ms-dotnettools.csharp `
    --install-extension ms-python.python `
    --install-extension ms-vscode-remote.vscode-remote-extensionpack `
    --install-extension ms-vscode.cmake-tools `
    --install-extension ms-vscode.cpptools `
    --install-extension ms-vscode.cpptools `
    --install-extension ms-vscode.powershell `
    --install-extension naumovs.color-highlight `
    --install-extension njpwerner.autodocstring `
    --install-extension rust-lang.rust `
    --install-extension samuelcolvin.jinjahtml `
    --install-extension sdras.night-owl `
    --install-extension tyriar.sort-lines

# Copy settings over
New-Item -ItemType Directory -Force -Path ~\AppData\Roaming\Code\User\ `
    | Out-Null

# (TODO)
