$content = Get-Content 'C:\Users\Aisha\Downloads\stitch_maison_handmade_luxury_boutique\index.html' -Raw
$pattern = 'https://lh3\.googleusercontent\.com/aida-public/[^"''\s>]+'
$matches = [regex]::Matches($content, $pattern) | ForEach-Object { $_.Value } | Select-Object -Unique
Write-Output "Found $($matches.Count) unique image URLs:"
$matches | ForEach-Object { Write-Output $_ }
