# ---- Inline wordlist (quick recon) ----
$dirs = @("admin","login","dashboard","api","uploads","backup","config",
          "db","phpmyadmin","wp-admin","panel","console","test","dev",
          "old","staging","private","secure","files","assets","static")

foreach ($dir in $dirs) {
    try {
        $r = Invoke-WebRequest -Uri "http://localhost/$dir/" `
             -UseBasicParsing -Method HEAD `
             -ErrorAction Stop
        Write-Host "[$($r.StatusCode)] /$dir/" -ForegroundColor Green
    } catch {
        $code = $_.Exception.Response.StatusCode.Value__
        if ($code -and $code -ne 404) {
            Write-Host "[$code] /$dir/  <-- interesting" -ForegroundColor Yellow
        }
    }
}
