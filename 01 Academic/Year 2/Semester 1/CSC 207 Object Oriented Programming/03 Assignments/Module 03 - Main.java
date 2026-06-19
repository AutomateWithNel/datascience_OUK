class Vehicle {
    protected String make;
    protected String model;
    protected int year;
    protected double mileage;

    public Vehicle(String make, String model, int year, double mileage) {
        this.make = make;
        this.model = model;
        this.year = year;
        this.mileage = mileage;
    }

    public void displayInfo() {
        System.out.println("Vehicle Info:");
        System.out.println("Make: " + make);
        System.out.println("Model: " + model);
        System.out.println("Year: " + year);
        System.out.println("Mileage: " + mileage + " miles");
    }
}

class Car extends Vehicle {
    private int numDoors;
    private boolean convertible;

    public Car(String make, String model, int year, double mileage, int numDoors, boolean convertible) {
        super(make, model, year, mileage);
        this.numDoors = numDoors;
        this.convertible = convertible;
    }

    @Override
    public void displayInfo() {
        super.displayInfo();
        System.out.println("Type: Car");
        System.out.println("Doors: " + numDoors);
        System.out.println("Convertible: " + (convertible ? "Yes" : "No"));
        System.out.println("-------------------------");
    }
}

class Truck extends Vehicle {
    private double payloadCapacity;

    public Truck(String make, String model, int year, double mileage, double payloadCapacity) {
        super(make, model, year, mileage);
        this.payloadCapacity = payloadCapacity;
    }

    @Override
    public void displayInfo() {
        super.displayInfo();
        System.out.println("Type: Truck");
        System.out.println("Payload Capacity: " + payloadCapacity + " tons");
        System.out.println("-------------------------");
    }
}

class Motorcycle extends Vehicle {
    private boolean hasSidecar;

    public Motorcycle(String make, String model, int year, double mileage, boolean hasSidecar) {
        super(make, model, year, mileage);
        this.hasSidecar = hasSidecar;
    }

    @Override
    public void displayInfo() {
        super.displayInfo();
        System.out.println("Type: Motorcycle");
        System.out.println("Has Sidecar: " + (hasSidecar ? "Yes" : "No"));
        System.out.println("-------------------------");
    }
}

public class Main {
    public static void main(String[] args) {
        // Create instances of Car, Truck, and Motorcycle
        Car myCar = new Car("Toyota", "Camry", 2022, 15000.5, 4, false);
        Truck myTruck = new Truck("Ford", "F-150", 2020, 45000.0, 3.5);
        Motorcycle myBike = new Motorcycle("Harley-Davidson", "Street Glide", 2021, 8000.2, true);

        // Display information for each vehicle
        myCar.displayInfo();
        myTruck.displayInfo();
        myBike.displayInfo();
    }
}
