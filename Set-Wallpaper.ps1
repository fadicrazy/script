$url  = "https://picsum.photos/1920/1080.jpg"
$path = "$env:PUBLIC\Pictures\wall.jpg"

Invoke-WebRequest -Uri $url -OutFile $path -UseBasicParsing

Add-Type @"
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

[Wallpaper]::SystemParametersInfo(20, 0, $path, 3) | Out-Null
