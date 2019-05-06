
//读Cookie1
const getCookie = (objName) => {//获取指定名称的cookie的值
    var arrStr = document.cookie.split("; ");
    for (var i = 0; i < arrStr.length; i++) {
        var temp = arrStr[i].split("=");
        if (temp[0] == objName) return unescape(temp[1]);
    }
    return "";
}
//设置cookie的值
const setCookie = (cname, cvalue, exdays) => {
    var d = new Date();
    console.log(cname + '/' + cvalue + '/' + exdays)
    d.setTime(d.getTime() + (exdays * 1000));
    var expires = "expires=" + d.toGMTString();
    document.cookie = cname + "=" + escape(cvalue) + "; " + expires + ";path=/";
}
export {
    getCookie,
    setCookie
}