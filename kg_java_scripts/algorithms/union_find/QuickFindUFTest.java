import org.junit.* ;
import static org.junit.Assert.* ;

public class QuickFindUFTest {

  QuickFindUF quf;

  @Before
  public void initialize() {
    quf = new QuickFindUF(5);
  }

  @Test
  public void TestSimpleConnected() {
    quf.union(3, 4);
    assertTrue(quf.connected(3, 4));
    assertFalse(quf.connected(2, 4));
  }

}