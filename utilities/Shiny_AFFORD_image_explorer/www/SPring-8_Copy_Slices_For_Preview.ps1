# Original script template from https://codeigo.com/powershell/copy-and-rename-files/

$src = "P:\"
$dest = "F:\SPring-8_Preview_Slices_0749"
# Get all files at the source. Using Slice 749, since Slice 750 is available twice, once in rec and once in raw
$files = Get-ChildItem -Filter "rec00749.tif" -Recurse -Path $src -File
# Loop through files at the source.
ForEach($file in $files){
    # New name will comprise of basename + "_COPY" and the original extension.
    # For example, marks1.txt has marks1 as Basename and ".txt" as the extension.
    # And the new name will be "marks1_COPY.txt"
	
	# FullName gets the name and path of the file. Split converts the name into an array, where "\" corresponds to the separation qualifier. [1] then calls the second element of that array, whihc is the top level folder.
	$topLevelFolder = $file.FullName.split("\")[1]
	
	if ($file.FullName.split("\").length -gt 5) {
		$bottomLevelFolder = $file.FullName.split("\")[3]	
		$newfile = "$topLevelFolder"+"_"+$bottomLevelFolder+"_"+"$($file.BaseName)$($file.Extension)"
	}
	else {
		$newfile = "$topLevelFolder"+"_"+"$($file.BaseName)$($file.Extension)"
	}		
    # Pipe file into Copy-Item command to be copied.
    # Join-Path joins the $dest with the new filename, $newfile
	echo "Copying: $newfile"
	$file | Copy-Item -Destination (Join-Path $dest $newfile)
}
