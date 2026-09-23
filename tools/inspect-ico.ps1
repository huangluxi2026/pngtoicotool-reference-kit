param(
    [Parameter(Mandatory = $true)]
    [string]$Path
)

$resolvedPath = (Resolve-Path -LiteralPath $Path -ErrorAction Stop).Path
$bytes = [System.IO.File]::ReadAllBytes($resolvedPath)

if ($bytes.Length -lt 6) {
    throw 'The file is too small to contain an ICO directory.'
}

$reserved = [BitConverter]::ToUInt16($bytes, 0)
$type = [BitConverter]::ToUInt16($bytes, 2)
$count = [BitConverter]::ToUInt16($bytes, 4)

if ($reserved -ne 0 -or $type -ne 1) {
    throw 'The file header is not an ICO header.'
}

$directoryEnd = 6 + (16 * $count)
if ($bytes.Length -lt $directoryEnd) {
    throw 'The file ends before the complete ICO directory.'
}

$entries = for ($index = 0; $index -lt $count; $index++) {
    $offset = 6 + (16 * $index)
    $width = [int]$bytes[$offset]
    $height = [int]$bytes[$offset + 1]

    if ($width -eq 0) { $width = 256 }
    if ($height -eq 0) { $height = 256 }

    [PSCustomObject]@{
        index = $index
        width_px = $width
        height_px = $height
        color_count = [int]$bytes[$offset + 2]
        planes = [BitConverter]::ToUInt16($bytes, $offset + 4)
        bit_count = [BitConverter]::ToUInt16($bytes, $offset + 6)
        byte_size = [BitConverter]::ToUInt32($bytes, $offset + 8)
        data_offset = [BitConverter]::ToUInt32($bytes, $offset + 12)
    }
}

[PSCustomObject]@{
    file = $resolvedPath
    format = 'ICO'
    reserved = $reserved
    type = $type
    image_count = $count
    entries = @($entries)
} | ConvertTo-Json -Depth 4
