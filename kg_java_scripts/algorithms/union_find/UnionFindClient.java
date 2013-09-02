import java.util.*;

class UnionFindClient {

  public static void main(String[] args) {
    System.out.println("Union Find Client \n ***********");

    Scanner in = new Scanner(System.in);

    System.out.println("Enter number of elements:");
    int N = in.nextInt();
    UF uf = new UF(N);

    while (!in.isEmpty()) {
      System.out.println("read two elements:");
      System.out.println("read element 1");
      int p = in.nextInt();
      System.out.println("read element 2");
      int q = in.nextInt();

      if (!uf.connected(p, q)) {
        uf.union(p, q);
        System.out.println(p + " now connected to " + q);
      }
    }

    System.out.println("You entered the number "+N);
  }
}