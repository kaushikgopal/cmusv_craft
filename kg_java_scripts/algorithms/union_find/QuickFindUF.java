public class QuickFindUF {

  private int[] arr;

  public QuickFindUF(int N) {
    arr = new int[N];
    for (int i = 0; i < N ; i++) {
      arr[i] = i;
    }
  }

  public boolean connected(int p, int q){
    return arr[p] == arr[q];
  }

  public void union(int p, int q) {
    int pid = arr[p];
    int qid = arr[q];

    for ( int i=0 ; i < arr.length ; i++ ) {
      if (arr[i] == pid) {
        arr[i] = qid ;
      }

    }
  }



}