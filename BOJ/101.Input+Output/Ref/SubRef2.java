package Ref;

class SubRef2 {
	public static void main(String[] args) throws java.io.IOException{
        // System.in.read()함수를 이용해서 토큰 하나씩 값을 얻을 수 있다.
		int a = System.in.read();
		System.in.read();
		int b = System.in.read();
		System.out.println(a-b);
	}
}
