[xml]$xml = Get-Content xunit-coverage.xml
$files = @{}
foreach ($file in $xml.CoverageSession.Modules.Module.Files.File) {
    $files[$file.uid] = $file.fullPath
}
foreach ($sp in $xml.SelectNodes('//SequencePoint[@vc>0]')) {
    $file = $files[$sp.fileid]
    $startLine = $sp.sl
    $endLine = $sp.el
    Write-Output \"File: $file, Lines: $startLine-$endLine\"
}

$gitDiff = git show --unified=0
$filesChanged = @{}
$currFile = ''
foreach ($line in $gitDiff) {
    if ($line -match '^\+\+\+ b/(.+)$') {
        $currFile = $Matches[1]
        $filesChanged[$currFile] = 0
    } elseif ($line -match '^\+[^\+]' -and $currFile) {
        $filesChanged[$currFile]++
    }
}
foreach ($file in $filesChanged.Keys) {
    Write-Output "File: $file, Lines changed: $($filesChanged[$file])"
}