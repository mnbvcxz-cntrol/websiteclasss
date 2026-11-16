$urls = @(
    'https://lh3.googleusercontent.com/aida-public/AB6AXuANFS_p6kXRXZ9BfIvzVfXe5K_LA-2WVwaWizUJDnUCGbPKVSp3E2ibc14AkifSxo9HYZfOHaz14kxFfu3wxouhrksPH1YICSF2gq9OvgC_5oMP3TWqRfd15grUum3LyYOjQ4szX_VHa-3TRNPeIfOCNmgs54zINEnaaas9I3npuTpBBp089Wgti4GFoVpy18rrUkeQ8VUDU1rXPtiLtXyK1ssA9I8KM2pdJMQvbIuuCPRdbCH_i4EALQ',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAr7HsXd_3HoF_ap1yc9ZgY3qZ0KBPPc6HNrJV6yc1bkAFSp4Mv7lXG_93CFyd7VzLQOqJ8S-oMUsKOW7yb8Nca0PQn0acgtNY5KWcVhQFclPe_eJxlpUHsWOUe_0zjOWNV8lpuhcDUM7iX9Y4YKGF_p2JDCU0AAZJX-25XGei5ph22sGHkMLmk5GNcQDtUoXJ_o_7mJjTFvF3XbUbZmEsJav3GmGrUYhXx93t6m8TdwMX5iByaJjEc9Q',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCQMSxKtBRuD9AMfw1j4IapcxRlv8NSLSTz1_93-Y21yCbDnyWWXIG9vEXggYxeK6ecJQwhaV_IXHCY6kBoWe4XCVdJcKuh4r9kqKhn1IseHIh84uy1P_pQvAy0q6mhEzWXWrMq9iWilspVSAatCL2nkNtpH3jSbesiulTL4nL-oFF-5LQ4si-OD382JBF-1Pba6KKrPSIR47eDWD5SJ3QDdyIPed6CxqMqS6TlbJTuQ86TNA0i1buxsg',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCoFtfAjFb83i2-vXdurbvf_2noUEI_thgRifBm43b9Yxka6X2tJqR0uOvQZCw3cg6_v0DzUgnpW-HJkA9tmJW1B1DjVNJcpWjjPgV5w8YLuZ057bH95WUMYmWu_1qfaxoEXcVFQYxNsGghZ4UwMUZf4DQKhxU5vPh5iddQ0_mYRp3xDXPUhADNuVgbtQBBN-4rMBQXmyZK86HAeNTfUBZ0u3vMov5PliBpOsRgPJCtHuQJIeWMWQOnZw'
)

Add-Type -AssemblyName System.Drawing
foreach ($u in $urls) {
    $highRes = $u + '=s1600'
    Invoke-WebRequest $highRes -OutFile 't.jpg'
    $b = [System.Drawing.Bitmap]::FromFile((Resolve-Path 't.jpg'))
    Write-Output "Size with =s1600: $($b.Width) x $($b.Height)"
    $b.Dispose()
    Remove-Item 't.jpg'
}
