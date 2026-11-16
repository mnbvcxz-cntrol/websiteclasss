Add-Type -AssemblyName System.Drawing
$content = Get-Content 'C:\Users\Aisha\Downloads\stitch_maison_handmade_luxury_boutique\index.html' -Raw
$pattern = 'https://lh3\.googleusercontent\.com/aida-public/[^"''\s>=]+'
$matches = [regex]::Matches($content, $pattern) | ForEach-Object { $_.Value } | Select-Object -Unique

foreach ($u in $matches) {
    try {
        $testUrl = $u + '=s1600'
        $wc = New-Object System.Net.WebClient
        $data = $wc.DownloadData($testUrl)
        $ms = New-Object System.IO.MemoryStream(,$data)
        $bmp = [System.Drawing.Bitmap]::FromStream($ms)
        Write-Output "$($bmp.Width) x $($bmp.Height) : $u"
        $bmp.Dispose()
        $ms.Dispose()
    } catch {
        Write-Output "Error on $u : $_"
    }
}
