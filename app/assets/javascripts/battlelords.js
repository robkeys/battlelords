
function displayRaceTable(raceID) {
    let elements = document.querySelectorAll('.race-div');
    for (let i = 0; i < elements.length; i++) {
        elements[i].style.display = "none"
    }
    $('#race-' + raceID).css("display","block")
}

function getSelectedRolls(vsNames) {
    console.log("*** RUNNING selectedRolls ***");
    let selRolls = [];
    let idPrefix = '#battlelord_base_vs_attributes_';
    while (vsNames.length) { selRolls.push($(idPrefix + vsNames.shift()).val())}
    selRolls = selRolls.map(Number).filter(function(e) {return e !== 0});
    return selRolls
}

function updateSelectors(vsNames, availRolls) {
    console.log("*** RUNNING updateSelectors ***");
    while (vsNames.length) {
        let optionsHTML = "<option value=''></option>";
        let currAvailRolls = availRolls.slice(0);
        let currID = '#battlelord_base_vs_attributes_' + vsNames.pop();
        let currVal = $(currID).val();
        if (currVal) {
            optionsHTML = optionsHTML + "<option value=" + currVal + " selected>" + currVal + "</option>\n"
        }
        while (currAvailRolls.length) {
            currVal = currAvailRolls.shift();
            optionsHTML = optionsHTML + "<option value=" + currVal + ">" + currVal + "</option>\n"
        }
        document.querySelector(currID).innerHTML = optionsHTML
    }
}

function updateScores(selRolls, allRolls) {
    console.log("*** RUNNING updateScores ***");
    let newHTML = "";
    for (let n = 0; n < allRolls.length; n++ ) {
        let newLine = "";
        i = selRolls.indexOf(allRolls[n]);
        if (i >= 0) {
            newLine = "<del>" + allRolls[n] + "</del><br>";
            selRolls.splice(i, 1);
        } else {
            newLine = allRolls[n] + "<br>"
        }
        newHTML = newHTML + newLine
    }
    document.querySelector("#rolls-list-target").innerHTML = newHTML;
}

function updateRolls() {
    console.log("*** RUNNING updateRolls ***");
    let vsNames = $(".vs-names").data("vs-names").slice(0);
    let selRolls = getSelectedRolls(vsNames.slice(0));
    let allRolls = $(".vs-rolls").data("vs-rolls").slice(0);
    let availRolls = allRolls.slice(0);
    for (let n = 0; n < selRolls.length; n++) {
        let i = availRolls.indexOf(selRolls[n]);
        if (i >= 0) {
            availRolls.splice(i, 1);
        }
    }
    updateSelectors(vsNames.slice(0), availRolls.slice(0));
    updateScores(selRolls.slice(0), allRolls.slice(0))
}