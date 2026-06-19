//Library Management System

class Book {
    private String title;
    private String author;
    private boolean isAvailable;

    // Constructor
    public Book(String title, String author) {
        this.title = title;
        this.author = author;
        this.isAvailable = true; // Book is available by default
    }

    // Getter methods
    public String getTitle() {
        return title;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    // Method to borrow the book
    public void borrowBook() {
        if (isAvailable) {
            isAvailable = false;
            System.out.println("Success: You borrowed '" + title + "'.");
        } else {
            System.out.println("Sorry, '" + title + "' is currently unavailable.");
        }
    }

    // Method to return the book
    public void returnBook() {
        isAvailable = true;
        System.out.println("Success: You returned '" + title + "'.");
    }
}

class Member {
    private String name;

    // Constructor
    public Member(String name) {
        this.name = name;
    }

    // Getter method
    public String getName() {
        return name;
    }
}

public class LibraryManagementSystem {
    public static void main(String[] args) {
        // 1. Create a Book object
        Book myBook = new Book("Learn Java", "John Doe");

        // 2. Create a Member object
        Member student = new Member("Alice");

        System.out.println("--- OUK Library System ---");
        System.out.println("Member: " + student.getName());

        // 3. Perform borrowing transactions directly using methods
        
        // Alice borrows the book
        myBook.borrowBook();

        // Alice tries to borrow it again
        myBook.borrowBook();

        // Alice returns the book
        myBook.returnBook();
    }
}
