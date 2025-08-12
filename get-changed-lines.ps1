# $gitDiff = git diff --unified=0
# $filesChanged = @{}
# $currFile = ''
# foreach ($line in $gitDiff) {
#     if ($line -match '^\+\+\+ b/(.+)$') {
#         $currFile = $Matches[1]
#         $filesChanged[$currFile] = 0
#     } elseif ($line -match '^\+[^\+]' -and $currFile) {
#         $filesChanged[$currFile]++
#     }
# }
# foreach ($file in $filesChanged.Keys) {
#     Write-Output "File: $file, Lines changed: $($filesChanged[$file])"
# }

git diff --unified=0 --no-color |
    ForEach-Object {
        if ($_ -match '^\+\+\+ b/(.+)') {
            $file = $matches[1]
        }
        elseif ($_ -match '^@@ -\d+(?:,\d+)? \+(\d+)(?:,(\d+))? @@') {
            $start = [int]$matches[1]
            $count = if ($matches[2]) { [int]$matches[2] } else { 1 }
            for ($i = $start; $i -lt $start + $count; $i++) {
                "$file`:$i"
            }
        }
    }
