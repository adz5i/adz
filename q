abstract class Queue {
    protected int[] array;
    protected int front;
    protected int rear;

    public Queue(int capacity) {
        array = new int[capacity];
        front = -1;
        rear = -1;
    }

    abstract void insert(int value);

    abstract int delete();

    abstract void display();

    @Override
    public String toString() {
        StringBuilder result = new StringBuilder("Queue: ");
        for (int i = front; i <= rear; i++) {
            result.append(array[i]).append(" ");
        }
        return result.toString();
    }
}

class DoubleEndedQueue extends Queue {
    public DoubleEndedQueue(int capacity) {
        super(capacity);
    }

    void front1(int value) {
        if (front == -1) {
            front = 0;
            rear = 0;
            array[front] = value;
        } else if (front > 0) {
            array[--front] = value;
        } else {
            System.out.println("Cannot insert at the front. Queue is full.");
        }
    }

    void rear1(int value) {
        if (rear == array.length - 1) {
            System.out.println("Cannot insert at the rear. Queue is full.");
        } else {
            array[++rear] = value;
        }
    }

    @Override
    void insert(int value) {
        rear1(value);
    }

    @Override
    int delete() {
        if (front == -1) {
            System.out.println("Cannot delete. Queue is empty.");
            return -1;
        } else {
            int deletedValue = array[front];
            if (front == rear) {
                front = -1;
                rear = -1;
            } else {
                front++;
            }
            return deletedValue;
        }
    }

    @Override
    void display() {
        System.out.println(toString());
    }
}

public class QueueTest {
    public static void main(String[] args) {
        // Create a DoubleEndedQueue
        DoubleEndedQueue queue = new DoubleEndedQueue(5);

        // Insert elements at the rear
        queue.insert(10);
        queue.insert(20);
        queue.insert(30);

        // Display the queue
        queue.display();

        // Insert elements at the front
        queue.front1(5);
        queue.front1(15);

        // Display the updated queue
        queue.display();

        // Delete an element
        int deletedValue = queue.delete();
        System.out.println("Deleted value: " + deletedValue);

        // Display the final queue
        queue.display();
    }
}
