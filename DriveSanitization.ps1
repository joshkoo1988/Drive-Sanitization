<#
.SYNOPSIS
    Securely sanitizes a non-system drive by overwriting free space and optionally formatting the drive.

.DESCRIPTION
    This script:
    1. Uses cipher.exe to overwrite deleted files on the target drive.
    2. (Optional) Formats the drive to remove all content.

.PARAMETER DriveLetter
    The drive letter to sanitize (e.g., "E").

.PARAMETER Format
    Optional switch to format the drive after overwriting.

.EXAMPLE
    .\DriveSanitization.ps1 -DriveLetter "E"

.EXAMPLE
    .\DriveSanitization.ps1 -DriveLetter "F" -Format
#>

param (
    [Parameter(Mandatory = $true)]
    [ValidatePattern("^[A-Z]$")]
    [string]$DriveLetter,

    [switch]$Format
)

# Normalize drive path
$drivePath = "$DriveLetter`:\"

if (!(Test-Path $drivePath)) {
    Write-Error "Drive $DriveLetter does not exist or is not accessible."
    exit 1
}

Write-Host "Starting sanitization of drive $DriveLetter..."

# Step 1: Overwrite deleted space
Write-Host "Overwriting free space with cipher..."
cipher /w:$drivePath

# Step 2: Optional format
if ($Format) {
    $confirm = Read-Host "Are you sure you want to format drive $DriveLetter? This will erase ALL data. Type 'YES' to continue"
    if ($confirm -eq 'YES') {
        Write-Host "Formatting drive $DriveLetter..."
        Format-Volume -DriveLetter $DriveLetter -FileSystem NTFS -Confirm:$false -Force
    } else {
        Write-Host "Drive format cancelled."
    }
}

Write-Host "Drive sanitization complete."
