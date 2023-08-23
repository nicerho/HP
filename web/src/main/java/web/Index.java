package web;

// module 파트
public class Index {
	int sum = 0;

	public String test(String a, String b) {
		/*
		 * Integer.valueOf : 문자를 숫자로 변환시 해당 값이 숫자인지 문자인지 검토 후 변환 Integer.parseInt : 문자를
		 * 숫자(int)로 변환
		 */
		this.sum = Integer.valueOf(a) + Integer.parseInt(b);
		System.out.println(this.sum);
		// return 시 자료형이 문자이므로 결과값을 리턴시킬 경우 숫자를 문자화하여 반환해야한다
		// return Integer.toString(this.sum);
		return String.valueOf(this.sum);
	}

	public String test2(int a, int b) {
		this.sum = a + b;
		return String.valueOf(this.sum);
		
	}

}
