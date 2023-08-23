let data;
let array;
function calldata(data) {
	this.array = data;
}
function abc() {
	this.array["member_list"].sort(function(a, b) {

		//return a["point"] - b["point"]; // 오름차순
		return b["point"] - a["point"]; // 내림차순
	});
	//console.log(this.array);
	let html = document.getElementById("list");
	//for in -> 배열 전용의 반복문 형태
	var s;
	for (s in this.array["member_list"]) {
		html.innerHTML += "<ul>";
		var f;
		for (f in this.array["member_list"][s]) {
			//console.log(f);
			if (f == "point") {
				html.innerHTML += "<li>" + this.array["member_list"][s][f].toLocaleString() + "</li>"
			} else {
				html.innerHTML += "<li>" + this.array["member_list"][s][f] + "</li>"
			}
			//console.log(this.array["member_list"][s][f])
		}
		html.innerHTML += "</ul>"
	}
}