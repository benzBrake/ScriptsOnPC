$abzPhotos = [environment]::getfolderpath("mypictures") + "\爱壁纸UWP" # 爱壁纸UWP下载路径为 MyPhotos\爱壁纸UWP
$photoDirs = @()
# 遍历目录获取分类
Get-ChildItem $abzPhotos | ForEach-Object -Process{
    if($_ -is [System.IO.DirectoryInfo]) {
        $catName = $_.Name # 分类名称
        $_dir = $abzPhotos + "\" + $catName # 分类路径
        $baseDigital = 100 # 重命名基数
        # 遍历分类
        Write-Host "正在处理分类：$catName"
        Get-ChildItem $_dir | ForEach-Object -Process{
            $fileName = $_.Name
            $filePath = $_dir + "\" + $fileName
            $digital =  [int]$fileName.Split("-")[1].Split(".")[0]
            $suffix = $fileName.Split(".")[1]
            if ($digital -lt 100) {
                # 确定新文件名
                do {
                    $baseDigital = $baseDigital + 1
                } while (Test-Path "$_dir\$catName - $baseDigital.$suffix")
                # 重命名
                $newFileName = $catName + " - " + $baseDigital + "." + $suffix
                Write-Host "正在重命名 $filePath 到 $newFileName"
                Rename-Item $filePath $newFileName
            }
        }
    }
}
Write-Host "处理完毕"
