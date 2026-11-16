$path = 'C:\Users\Aisha\Downloads\stitch_maison_handmade_luxury_boutique\index.html'
$content = Get-Content $path -Raw

# Replace any aida-public URL that does not end with =s... or =w... with =s1600
$updated = [regex]::Replace($content, '(https://lh3\.googleusercontent\.com/aida-public/[a-zA-Z0-9_\-]+)(?!=)', '$1=s1600')

$countMatches = ([regex]::Matches($updated, '=s1600')).Count
Write-Output "Total high-res images updated: $countMatches"

Set-Content -Path $path -Value $updated -NoNewline
