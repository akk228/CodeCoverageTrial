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