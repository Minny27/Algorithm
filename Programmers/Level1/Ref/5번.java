import java.io.*;
class Main {
	public static void main(String[] args) throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String input = br.readLine();
        System.out.println("Hello Goorm! Your input is " + input);
        if(Integer.parseInt(input) < 1000)
            continue;
        if(Integer.parseInt(input) >= 1000)
            System.out.printf("%s,000\n", input);
            continue;
        return;
        // if(Integer.parseInt(input) >= 10000)
        // if(Integer.parseInt(input) < 1000)
        // if(Integer.parseInt(input) < 1000)
        // if(Integer.parseInt(input) < 1000)
        // if(Integer.parseInt(input) < 1000) 
	}
}