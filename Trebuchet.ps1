# AoC 2023
# Trebuchet

$sourceFile = $PSScriptRoot + "\puzzleInput.csv"

$sourceLines = Get-Content $sourceFile

$numberOfLines = $sourceLines.Count

$results = [System.Collections.ArrayList]::new()

[int]$finalResult = 0

Clear-Host

Write-Host "The example file contains $numberOfLines lines.`n"

foreach ($line in $sourceLines)
{
    # Extract numbers
    $numbers = $line -replace "[^0-9]", ''
    $length = $numbers.Length

    if ($length -eq 1)
    {
        $result = [int]"$numbers$numbers"
        $results.Add($result)

    }

    if ($length -ge 2)
    {
        $first = $numbers.Substring(0,1)
        $last = $numbers.Substring($length -1)
        $result = [int]"$first$last"
        $results.Add($result)

    }
}

foreach ($result in $results)

{
        $finalResult = $finalResult + $result
}

Set-Clipboard -Value $finalResult

write-host "The final result is $finalResult. The result has been copied to the clipboard ;)"