var fs = require("fs");
var path = require("path");
function cleanDownloadedFiles(dir) {
    var arr = fs.readdirSync(dir);
    console.log(formatStr("Processing directory: %s", dir));
    arr.forEach((name) => {
        if (name.match(/^【.*】/)) {
            var fullPath = path.join(dir, name);
            console.log(formatStr("Processing sub directory: %s", fullPath));
            subFiles = fs.readdirSync(fullPath);
            subFiles.forEach((subName) => {
                if (subName.startsWith("【更多") || subName.startsWith("〔 高清")) {
                    // 删除无用文件
                    console.log(formatStr("Deleting file: %s", subName));
                    fs.unlinkSync(path.join(fullPath, subName));
                }
            })
            // 清除文件夹开头的广告
            var newName = name.replace(/^【.*】/, "");
            var newFullPath = path.join(dir, newName);
            console.log(formatStr("Renaming directory: %s to %s", name, newName));
            fs.renameSync(fullPath, newFullPath);
        }
    })
}

function formatStr(template, ...args) {
    if (arguments.length === 0) {
        throw new Error("缺少参数 ");
    }

    while (template.indexOf("%s") !== -1 && args.length) {
        template = template.replace("%s", args.shift());
    }

    return template;
}

// 清理 J:\115\云下载
cleanDownloadedFiles("J:/115/云下载");
