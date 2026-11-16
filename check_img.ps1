Add-Type -AssemblyName System.Drawing
$urls = @(
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBvsdMqEs6v8z3LokYT6yjOZFCUbSXQoAEl5nNiJcsQEu-tY-hOkPAseMj77l0BWpZZrE5sfl4HxZskZhju8mRACJRgprtSctnwRZvKROFQ5Gpc75__brlWIFj_enFXdVLxYALz9rxKEgzkGa2Inq6it8iAy9FMgqkM3ougOxlTgyeJV57QMnYqLNxklQDrn_NIvSgj5mMfipPoyymuHBm93YeXoai36PZKXfZKIL81SexL6L3W0wfWcA=w900-h1200-c',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBvsdMqEs6v8z3LokYT6yjOZFCUbSXQoAEl5nNiJcsQEu-tY-hOkPAseMj77l0BWpZZrE5sfl4HxZskZhju8mRACJRgprtSctnwRZvKROFQ5Gpc75__brlWIFj_enFXdVLxYALz9rxKEgzkGa2Inq6it8iAy9FMgqkM3ougOxlTgyeJV57QMnYqLNxklQDrn_NIvSgj5mMfipPoyymuHBm93YeXoai36PZKXfZKIL81SexL6L3W0wfWcA=s1600'
)
foreach ($u in $urls) {
    try {
        Invoke-WebRequest $u -OutFile 'test.jpg'
        $b = [System.Drawing.Bitmap]::FromFile((Resolve-Path 'test.jpg'))
        Write-Output "$u -> $($b.Width) x $($b.Height)"
        $b.Dispose()
        Remove-Item 'test.jpg'
    } catch {
        Write-Output "$u -> Error: $_"
    }
}
