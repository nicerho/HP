var data; //ajax용
var array; //json값을 배열로 받을 수 있는 변수명
function abc() {
	function win() { // 통신 규약에 대한 인스턴스를 생성
		if (window.XMLHttpRequest) {
			return new XMLHttpRequest();
		}
	}
	function file() { //서버 접속 성공 유무를 확인, 해당 로드할 파일이 정삭적으로 로드가 되었는지 확인하는 공간
		if (data.readyState == XMLHttpRequest.DONE && data.status == 200) {
			array = JSON.parse(this.response); //JSON 파일은 기본이 문자열, 해당 문자열을 정상적인 배열로 변환시키는 메서드 -> JSON.parse() response:결과값 반환
			console.log(array);
		} else if (data.status == 404 || data.status == 405) {
			console.log("해당 파일 및 서버에 접속 불가능");
			
		}
	}
	data = win(); //통신오픈
	data.onreadystatechange = file; //조건에 맞는 결과값을 출력하는 역할
	//어떤 파일을 로드 할 것인지 설정 open('통신형태','파일 또는 URL','동기,혹은 비동기 설정')
	//통신형태의 종류 : post get put delete update fetch
	data.open("get", "./data.json", true);
	data.send(); //해당 서버에 접속 및 실행
}