# Install Python
Write-Host "Installing Python..."
Start-Process -Wait -FilePath "https://www.python.org/ftp/python/3.9.7/python-3.9.7-amd64.exe" -ArgumentList "/quiet", "InstallAllUsers=1", "PrependPath=1"
Write-Host "Python installed successfully."

# Install Flask using pip
Write-Host "Installing Flask..."
python -m pip install --upgrade pip
pip install flask
Write-Host "Flask installed successfully."

# Optional: Install additional packages (e.g., Flask packages or other dependencies)
# pip install flask-sqlalchemy
# pip install flask-restful

Write-Host "Python and Flask installation complete."
