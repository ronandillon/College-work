function pageLoad() {
document.getElementById("submit").onClick = submit;
document.getElementById("testButton").onclick = onClick;
document.getElementById("link").onclick = linkClick;
}

function onClick() {
alert(“all grand now, I’m using window.onload");
}
function linkClick() {
alert(“all grand now, I’m using window.onload");
}
function submit()
{
	alert("well");
}
window.onload = pageLoad; 

