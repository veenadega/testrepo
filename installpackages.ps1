# Install Chocolatey (a package manager for Windows)
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Add Chocolatey Binaries Directory to PATH
$chocolateyBinPath = 'C:\ProgramData\chocolatey\bin'
[Environment]::SetEnvironmentVariable("Path", "$env:Path;$chocolateyBinPath", [EnvironmentVariableTarget]::Machine)

# Install Python using Chocolatey
choco install python3 -y

# Check if Python is installed
$pythonCommand = Get-Command python -ErrorAction SilentlyContinue

if ($pythonCommand) {
    # If Python is installed, proceed with verification
    $pythonPath = $pythonCommand.Source
    $pythonVersion = & $pythonPath --version
    echo "Python is installed successfully. Version: $pythonVersion"

    # Verify Flask Installation
    $pythonScriptsPath = Join-Path $pythonPath "Scripts"
    $flaskExecutable = Join-Path $pythonScriptsPath "flask.exe"

    if (Test-Path $flaskExecutable) {
        # Flask executable found, print version
        $flaskVersion = & $flaskExecutable --version
        echo "Flask is installed successfully. Version: $flaskVersion"
    } else {
        echo "Error: Flask executable not found. Verify Flask installation."
    }
} else {
    # Python is not installed, install it
    echo "Installing Python..."
    
    # Install Python using Chocolatey
    choco install python3 -y

    # Add Python and Scripts directories to the PATH
    $pythonPath = Get-Command python | ForEach-Object { $_.Source }
    $pythonScriptsPath = Join-Path $pythonPath "Scripts"
    [Environment]::SetEnvironmentVariable("Path", "$env:Path;$pythonPath;$pythonScriptsPath", [EnvironmentVariableTarget]::Machine)

    # Refresh the environment variables
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)

    # Verify Python installation
    $pythonVersion = & $pythonPath --version
    echo "Python is installed successfully. Version: $pythonVersion"

    # Verify Flask Installation
    $flaskExecutable = Join-Path $pythonScriptsPath "flask.exe"

    if (Test-Path $flaskExecutable) {
        # Flask executable found, print version
        $flaskVersion = & $flaskExecutable --version
        echo "Flask is installed successfully. Version: $flaskVersion"
    } else {
        echo "Error: Flask executable not found. Verify Flask installation."
    }
}
