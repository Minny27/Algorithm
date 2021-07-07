import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Scanner;

public class BFSAndDFS {
        private int V;
        private LinkedList<Integer> adj[];

        // LinkedList를 이용해서 그래프 생성
        BFSAndDFS(int v) {
            V = v;
            adj = new LinkedList[v];
            for (int i = 0; i < v; i++)
                adj[i] = new LinkedList();
        }
        
        // v와 w의 양방향 연결(번호는 1번부터)
        void addEdge(int v, int w) {
            adj[v].add(w);
            adj[w].add(v);
            Collections.sort(adj[v]);
            Collections.sort(adj[w]);
        }

        void BFS(int s) {
            boolean visited[] = new boolean[V];
            LinkedList<Integer> queue = new LinkedList();

            visited[s] = true;
            queue.add(s);

            while(queue.size() != 0) {
                s = queue.poll();
                System.out.print(s + 1 + " "); // 출력 시에는 1 더한 값 출력

                Iterator<Integer> i = adj[s].listIterator();
                while(i.hasNext()) {
                    int n = i.next();
                    if(!visited[n]) {
                        visited[n] = true;
                        queue.add(n);
                    }
                }
            }
        }

        void DFSUtil(int s, boolean v[]) {
            v[s] = true;
            System.out.print(s + 1 + " "); // 출력 시에는 1 더한 값 출력

            Iterator<Integer> i = adj[s].listIterator();
            while(i.hasNext()) {
                int n = i.next();
                if(!v[n]) {
                    DFSUtil(n, v);
                }
            }
        }

        void DFS(int s) {
            boolean visited[] = new boolean[V];

            DFSUtil(s, visited);
        }
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        int N = s.nextInt(); // 정점 수
        int M = s.nextInt(); // 간선 수
        int start = s.nextInt(); // 시작 노드

        BFSAndDFS g = new BFSAndDFS(N);
        for(int i = 0; i < M; i++) {
            g.addEdge(s.nextInt() - 1, s.nextInt() - 1); // linkedList 배열은 0부터 시작이므로 1뺀 값 대입
        }
        g.DFS(start - 1);
        System.out.println();
        g.BFS(start - 1);
        System.out.println();
    }
}
