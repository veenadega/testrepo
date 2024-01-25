# Install Python
Write-Host "Installing Python..."
Start-Process -Wait -FilePath "https://www.python.org/ftp/python/3.9.7/python-3.9.7-amd64.exe" -ArgumentList "/quiet", "InstallAllUsers=1", "PrependPath=1"
Write-Host "Python installed successfully."

# Set the path to the Python executable
$pythonPath = Join-Path $env:ProgramFiles 'Python' 'Python3.9'

# Add Python to the system PATH
[Environment]::SetEnvironmentVariable("Path", "$($env:Path);$pythonPath", [EnvironmentVariableTarget]::Machine)

# Install Flask using pip
Write-Host "Installing Flask..."
$pythonExecutable = Join-Path $pythonPath 'python.exe'
$pipExecutable = Join-Path $pythonPath 'Scripts\pip.exe'
Start-Process -Wait -FilePath $pipExecutable -ArgumentList "install", "--upgrade", "pip"
Start-Process -Wait -FilePath $pipExecutable -ArgumentList "install", "flask"
Write-Host "Flask installed successfully."

# Optional: Install additional packages (e.g., Flask packages or other dependencies)
# Start-Process -Wait -FilePath $pipExecutable -ArgumentList "install", "flask-sqlalchemy"
# Start-Process -Wait -FilePath $pipExecutable -ArgumentList "install", "flask-restful"

Write-Host "Python and Flask installation complete."
