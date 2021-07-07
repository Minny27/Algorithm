import java.util.*;

/* 인접 리스트를 이용한 방향성 있는 그래프 클래스 */
// class Graph {
public class BFSTest {

    private int V; // 노드의 개수
    private LinkedList<Integer> adj[]; // 인접 리스트
    

    /** 생성자 */
    BFSTest(int v) {
        V = v;
        adj = new LinkedList[v];
        for (int i = 0; i < v; ++i) // 인접 리스트 초기화
            adj[i] = new LinkedList();
    }

    /** 노드를 연결 v->w */
    void addEdge(int v, int w) {
        adj[v].add(w);
    }

    /** s를 시작 노드으로 한 BFS로 탐색하면서 탐색한 노드들을 출력 */
    void BFS(int s) {
        // 노드의 방문 여부 판단 (초깃값: false)
        boolean visited[] = new boolean[V];
        // BFS 구현을 위한 큐(Queue) 생성
        LinkedList<Integer> queue = new LinkedList();

        // 현재 노드를 방문한 것으로 표시하고 큐에 삽입(enqueue)
        visited[s] = true;
        queue.add(s);

        // 큐(Queue)가 빌 때까지 반복
        while (queue.size() != 0) {
            // 방문한 노드를 큐에서 추출(dequeue)하고 값을 출력
            s = queue.poll();
            System.out.print(s + " ");

            // 방문한 노드와 인접한 모든 노드를 가져온다.
            Iterator<Integer> i = adj[s].listIterator();
            while (i.hasNext()) {
                int n = i.next();
                // 방문하지 않은 노드면 방문한 것으로 표시하고 큐에 삽입(enqueue)
                if (!visited[n]) {
                    visited[n] = true;
                    queue.add(n);
                }
            }
        }
    }

    /** 사용 방법 */
    public static void main(String args[]) {
        BFSTest g = new BFSTest(6);
        g.addEdge(0, 1);
        g.addEdge(0, 2);
        g.addEdge(1, 3);
        g.addEdge(2, 4);
        g.addEdge(2, 5);
        g.BFS(0); /* 주어진 노드를 시작 노드로 BFS 탐색 */
    }
}
