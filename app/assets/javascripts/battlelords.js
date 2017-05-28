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

function setCookieVals() {
    let vsRolls = $(".vs-rolls").data("vs-rolls");
    setCookie("vsNameList", $(".vs-names").data("vs-names"));
    setCookie("vsRolls", vsRolls);
    setCookie("vsRollsLeft", vsRolls)
}

function displayRaceTable(raceID) {
    let elements = document.querySelectorAll('.race-div')
    for (let i = 0; i < elements.length; i++) {
        elements[i].style.display = "none"
    }
    $('#race-' + raceID).css("display","block")
}

function getNames() {
    let vsNames = getCookie("vsNameList");
    return vsNames.split(',');
}

function getRollsLeft() {
    let rolls = getCookie("vsRollsLeft");
    return rolls.split(',').map(Number)
}

function getAllRolls() {
    let rolls = getCookie("vsRolls");
    return rolls.split(',').map(Number)
}

function remRoll(newVal) {
    let vsRolls = getRollsLeft();
    let i = vsRolls.indexOf(parseInt(newVal));
    vsRolls.splice(i, 1);
    return vsRolls
}

function addRoll(vsNames) {
    let selRolls = [];
    let idPrefix = '#battlelord_base_vs_attributes_';
    while (vsNames.length) { selRolls.push($(idPrefix + vsNames.shift()).val())}
    selRolls = selRolls.map(Number).filter(function(e) {return e !== 0});
    let vsRolls = getAllRolls();
    while (selRolls.length) {
        let i = vsRolls.indexOf(selRolls.pop());
        vsRolls.splice(i, 1)
    }
    return vsRolls
}

function updateSelectors(vsNames, vsRolls) {
    while (vsNames.length) {
        let optionsHTML = "<option value=''></option>";
        let currRolls = vsRolls.slice(0);
        let currID = '#battlelord_base_vs_attributes_' + vsNames.pop();
        let currVal = $(currID).val();
        if (currVal) {
            optionsHTML = optionsHTML + "<option value=" + currVal + " selected>" + currVal + "</option>\n"
        }
        while (currRolls.length) {
            currVal = currRolls.shift();
            optionsHTML = optionsHTML + "<option value=" + currVal + ">" + currVal + "</option>\n"
        }
        document.querySelector(currID).innerHTML = optionsHTML
    }
}

function updateRolls(newVal) {
    let rollsList = '';
    let vsNames = getNames();
    let vsRolls = null;
    if (newVal) {
        vsRolls = remRoll(newVal)
    } else {
        vsRolls = addRoll(vsNames.slice(0))
    }
    setCookie("vsRollsLeft", vsRolls);
    updateSelectors(vsNames.slice(0), vsRolls.slice(0));
    while (vsRolls.length) { rollsList = rollsList + vsRolls.shift() + "<br>"}
    document.querySelector("#rolls-list-target").innerHTML = rollsList;
}