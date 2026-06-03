param(
    [string]$DistDir = "dist",
    [string]$EnvironmentName = "yarp-openxrheadset"
)

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$distPath = Join-Path $repoRoot $DistDir

if (-not (Test-Path -LiteralPath $distPath)) {
    throw "Build output directory not found: $distPath. Run 'pixi build --output-dir dist' first."
}

$package = Get-ChildItem -LiteralPath $distPath -File |
    Where-Object { $_.Extension -in @(".conda", ".bz2") } |
    Sort-Object LastWriteTimeUtc -Descending |
    Select-Object -First 1

if (-not $package) {
    throw "No built pixi package was found in $distPath."
}

Write-Host "Installing $($package.Name) into pixi global environment '$EnvironmentName'..."
pixi global install `
    --environment $EnvironmentName `
    --channel conda-forge `
    --channel https://prefix.dev/robotology `
    --path $package.FullName
