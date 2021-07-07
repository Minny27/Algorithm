package Ref;
import java.io.*;

// 1157	
// 단어 공부	
public class StudyWordRef {

	public static void main(String[] args) throws IOException {
		//BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		//String st = br.readLine();
		//char ch[] = st.toCharArray();
		
		int alp[] = new int[26];
		
		for(int i = 0; i < alp.length; i++)
			alp[i] = 0;
		
		for(int i = System.in.read(); i >= 'A'; i = System.in.read())
		{
			if(i > 'Z')
				alp[i-'a'] += 1;
			else
				alp[i-'A'] += 1;
		}
		
		int max=0, maxidx = 0;
		for(int i = 0; i < alp.length; i++)
		{
            // max가 같은 조건을 먼저 주면 max값을 변경하면서가 가능
			if(alp[i] == max)
				maxidx = -1;
			else if(alp[i] > max)
			{
				max = alp[i];
				maxidx = i;
			}
				
		}
		
		if(maxidx == -1)
			System.out.println("?");
		else
			System.out.println((char)(maxidx+'A'));
	}

}

