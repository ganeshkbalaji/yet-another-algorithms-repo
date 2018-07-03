/**
 * Created by ganeshkb on 7/2/18.
 */


import java.util.*;

public class LinkedListTest {

    public static void main(String args[]) {

        //Create object of linked list class
        LinkedList object = new LinkedList();

        //Adding elements to the linked list
        object.add("H");
        object.add("E");
        object.add("L");
        object.add("L");
        object.add("O");
        object.add("S");


        System.out.println("Linked list : " + object);


        //remove elements from the linked list

        object.remove("S");

        System.out.println("Linked list after deletion : " + object);


        //Find elmement in the linked list

        boolean status = object.contains("H");

        if(status) {
            System.out.println("this works");
        } else {
            System.out.println("this doesnt work");
        }


        //number of elements in the linked list
        int size = object.size();
        System.out.println("Size of linked list = " + size);


        //get and set elements from linked list
        Object element = object.get(2);
        System.out.println("Element returned by get() : " + element);
        object.set(4, "Y");
        System.out.println("Linked list after change : " + object);
    }
}
