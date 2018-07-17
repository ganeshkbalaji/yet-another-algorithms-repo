import java.util.LinkedList;

public class middleOfLInkedList extends LinkedListImplementation {

    Node head;

    void printMiddle() {
        Node slow_pointer = head;
        Node fast_pointer = head;

        if (head != null) {
            while(fast_pointer != null && fast_pointer.next != null) {
                fast_pointer = fast_pointer.next.next;
                slow_pointer = slow_pointer.next;
            }
            System.out.println("The middle elmement is [" + slow_pointer.data + " ] \n");
        }
    }


    public void push(int newData) {

        Node newNode = new Node(newData);

        newNode.next = head;

        head = newNode;
    }

    public void printList()
    {
        Node tnode = head;
        while (tnode != null)
        {
            System.out.print(tnode.data+"->");
            tnode = tnode.next;
        }
        System.out.println("NULL");
    }

    public static void main(String [] args) {
        LinkedList llist = new middleOfLInkedList();
        for (int i=5; i>0; --i)
        {
            llist.push(i);
            llist.printList();
            llist.printMiddle();
        }
    }
}
