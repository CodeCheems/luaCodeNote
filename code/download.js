//文本下载 js/ts
function downl(fileName,json){
                const url = window.URL || window.webkitURL || window;
                const blob = new Blob([json]);
                const saveLink = document.createElementNS('http://www.w3.org/1999/xhtml','a');
                saveLink.href = url.createObjectURL(blob);
                saveLink.download = fileName;
                saveLink.click();
            }
downl('text.txt',"奥术大师多");

--excel插件
ClosedXML