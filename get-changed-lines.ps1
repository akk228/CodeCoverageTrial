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