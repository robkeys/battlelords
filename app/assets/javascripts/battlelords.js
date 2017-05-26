// get & set cookies functions c/o: https://www.w3schools.com/js/js_cookies.asp
function setCookie(cname, cvalue, exdays=2) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function getSearchParams(k){
    var p={};
    location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi,function(s,k,v){p[k]=v});
    return k?p[k]:p;
}

function updateList(newVal) {
    var rollsList = '';
    var vsRolls = getCookie("vsRollsLeft");
    if (!vsRolls) {
        vsRolls = $(".vs-rolls").data("vs-rolls");
        setCookie("vsRolls", vsRolls)
    } else {
        vsRolls = vsRolls.split(',').map(Number)
    }
    console.log(vsRolls);
    var i = vsRolls.indexOf(parseInt(newVal));
    vsRolls.splice(i, 1);
    setCookie("vsRollsLeft", vsRolls);
    while (vsRolls.length) {rollsList = rollsList + vsRolls.shift() + "<br>\n"}
    document.querySelector("#rolls-list-target").innerHTML = rollsList
}