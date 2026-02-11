Write-Host "📥 Downloading plugins..." -ForegroundColor Green

$plugins = @(
    "https://download.luckperms.net/1535/bukkit/loader/LuckPerms-Bukkit-5.4.127.jar",
    "https://ci.ender.zone/job/EssentialsX/lastSuccessfulBuild/artifact/EssentialsX/target/EssentialsX-2.20.1.jar",
    "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot"
)

New-Item -ItemType Directory -Force -Path "plugins" | Out-Null

foreach ($plugin in $plugins) {
    $name = Split-Path $plugin -Leaf
    Write-Host "   ⏳ $name ..." -ForegroundColor Yellow
    try {
        Invoke-WebRequest -Uri $plugin -OutFile "plugins/$name" -ErrorAction Stop
        Write-Host "   ✅ Downloaded" -ForegroundColor Green
    } catch {
        Write-Host "   ❌ Failed" -ForegroundColor Red
    }
}

Write-Host "`n🎉 All plugins downloaded!" -ForegroundColor Green
