class Isnum {
    public boolean solution(String s) {
        boolean answer = true;
        int i;
        if((s.length() != 4) && (s.length() != 6))
            return answer = false;
        else 
            for(i=0; i<s.length(); i++)
                if((s.charAt(i)>= '0') && (s.charAt(i) <='9'))
                    answer = true;
                else return answer = false;
        return answer;
    }

// class Isnum {
//   public boolean solution(String s) {
//       if(s.length() == 4 || s.length() == 6){
//           try{
//               int x = Integer.parseInt(s);
//               return true;
//           } catch(NumberFormatException e){
//               return false;
//           }
//       }
//       else return false;
//   }

    public static void main(String args[]) {
        Isnum st = new Isnum();
        System.out.println(st.solution("123a"));
        System.out.println(st.solution("1234"));
    }
}