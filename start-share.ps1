$ErrorActionPreference = "Stop"

$project = "C:\Users\erens\OneDrive\Desktop\ArslanCamAyna"
$webDir = Join-Path $project "build\web"
$ngrok = "C:\Users\erens\AppData\Local\Microsoft\WinGet\Packages\Ngrok.Ngrok_Microsoft.Winget.Source_8wekyb3d8bbwe\ngrok.exe"

if (!(Test-Path (Join-Path $webDir "index.html"))) {
  Write-Host "build/web yok. Once su komutu calistir: flutter build web --release" -ForegroundColor Yellow
  exit 1
}

Get-CimInstance Win32_Process |
  Where-Object { $_.Name -in @("python.exe", "ngrok.exe") -and $_.CommandLine -match 'http.server 8080|ngrok\.exe"\s+http 8080' } |
  ForEach-Object { Stop-Process -Id $_.ProcessId -Force }

Start-Process -FilePath "python" -ArgumentList @("-m","http.server","8080","--bind","0.0.0.0","--directory",$webDir) -WindowStyle Hidden
Start-Sleep -Seconds 2

Start-Process -FilePath $ngrok -ArgumentList "http 8080" -WindowStyle Hidden
Start-Sleep -Seconds 3

$api = Invoke-RestMethod -Uri "http://127.0.0.1:4040/api/tunnels" -TimeoutSec 10
$url = $api.tunnels[0].public_url

Write-Host ""
Write-Host "Paylasim linkin hazir:" -ForegroundColor Green
Write-Host $url -ForegroundColor Cyan
Write-Host ""
Write-Host "Not: Telefon tarayicisinda direkt bu linki ac."
