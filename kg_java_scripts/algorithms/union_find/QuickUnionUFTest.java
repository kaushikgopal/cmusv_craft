import org.junit.* ;
import static org.junit.Assert.* ;

public class QuickUnionUFTest {

  QuickUnionUF quf;

  @Before
  public void initialize() {
    quf = new QuickUnionUF(5);
    quf.seedSomeData();
  }

  @Test
  public void testGetRootOf() {
    assertEquals(quf.getRootOf(1), 6);
    assertEquals(quf.getRootOf(7), 6);
    assertEquals(quf.getRootOf(0), 0);
    assertEquals(quf.getRootOf(8), 0);
  }

  @Test
  public void testConnected() {
    assertTrue(quf.connected(3, 7));
    assertTrue(quf.connected(1, 7));
    assertFalse(quf.connected(8, 5));
  }

  @Test
  public void testUnion() {
    assertFalse(quf.connected(8, 5));
    quf.union(8, 5);
    assertTrue(quf.connected(8, 5));
  }

}