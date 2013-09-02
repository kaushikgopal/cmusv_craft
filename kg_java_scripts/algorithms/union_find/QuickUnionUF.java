/**
 * Quick Union (lazy approach)
 * Runtime efficiency: N
*/
public class QuickUnionUF {

  private int[] arr;

  public QuickUnionUF(int N) {
    arr = new int[N];
    for (int i = 0; i < N ; i++) {
      arr[i] = i;
    }
  }

  public void seedSomeData() {
    arr = new int[]{0, 9, 6, 5, 4, 2, 6, 1, 0, 5};
  }

  public int getRootOf(int el) {
    while (arr[el] != el) {
      el = arr[el];
    }
    return el;
  }

  public boolean connected(int p, int q){
    return getRootOf(p) == getRootOf (q);
  }

  public void union(int p, int q) {
    arr[getRootOf(p)] = arr[getRootOf(q)];
  }



}