param(
  [string]$source="c:\Azure Icons\azure-icons",
  [string]$dest="c:\Azure Icons\azure-icons-pngs",
  [string]$svgconsole="C:\Azure Icons\SvgConsole\SvgConsole.exe",
  [int]$maxwidth=48,
  [int]$maxheight=48
)
New-Item -Path $dest -ItemType directory -ErrorAction SilentlyContinue
Push-Location $source
$targetdir = Resolve-Path -Path $dest
Get-ChildItem -Recurse |
  Foreach-Object { 
    if ($_.PSIsContainer -eq $True) {
        $reldir = Resolve-Path -Path $_.FullName -Relative
        $targetdir = Join-Path -Path $dest -ChildPath $reldir -ErrorAction SilentlyContinue
        New-Item -Path $targetdir -ItemType directory -ErrorAction SilentlyContinue
        $targetdir = Resolve-Path -Path $targetdir
        write-host "Directory: $targetdir"
        write-host "    Transforming all SVG files in $($_.FullName)"
        &$svgconsole -d $_.FullName -o $targetdir --width $maxwidth --height $maxheight
    } else {
        $sourcefile = $_.FullName
        if ($_.Extension.ToLower().trim() -eq ".png") {
            $targetfile = Join-Path -Path $targetdir -ChildPath $_Name
            write-host "    Copying $sourcefile to $targetfile"
            copy $sourcefile $targetfile
        }

    }
  }
Pop-Location
