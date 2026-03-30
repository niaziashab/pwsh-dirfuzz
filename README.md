# ps-dirbuster

A lightweight PowerShell-based web directory enumerator for authorized penetration testing and security assessments. Uses only built-in PowerShell cmdlets — no external tools required.

##  Legal Disclaimer

This tool is intended **for authorized security testing only**. Only use it against systems you own or have explicit written permission to test. Unauthorized use against systems you do not own is illegal.

## Features

- No external dependencies — pure PowerShell (`Invoke-WebRequest`)
- Works in restricted shell environments where tools like `ffuf`/`dirbuster` are unavailable
- Detects `200`, `301`, `302`, `401`, `403`, `500` responses
- Highlights `403 Forbidden` paths (directory exists but access is restricted)
- Compatible with LiteSpeed, Apache, Nginx

## Usage

```powershell
# Basic run
.\recon.ps1

# If execution policy blocks the script
powershell -ExecutionPolicy Bypass -File .\recon.ps1
```

## Customization

Edit the `$dirs` array in `recon.ps1` to use your own wordlist, or pipe in from a file:

```powershell
Get-Content wordlist.txt | ForEach-Object {
    # replace $dirs with file-based enumeration
}
```

## Response Code Reference

| Code | Meaning |
|------|---------|
| `200` | Found and accessible |
| `301/302` | Redirect — path exists |
| `403` | **Forbidden — path exists** (investigate further) |
| `401` | Auth required |
| `500` | Server error — potential vulnerability |

## Requirements

- PowerShell 5.1+ (Windows) or PowerShell 7+ (cross-platform)
- Network access to the target host

## License

MIT
