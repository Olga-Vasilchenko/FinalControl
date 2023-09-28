package org.example;
import org.example.Beasts.Camel;
import org.example.Beasts.Donkey;
import org.example.Pets.Cat;
import org.example.Pets.Dog;


import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Farm<Animal> animalFarm = new Farm<>();

        animalFarm.adopt(new Cat(10, "Гулия", "2009-12-12", true));
        animalFarm.adopt(new Donkey(11, "Джордж", "2019-01-12", 10));
        animalFarm.adopt(new Camel(12, "Вася", "2016-07-15", 25));
        animalFarm.adopt(new Dog(15, "Байрон", "2018-07-15", false));

        try {
            while (true) {

                Menu.showMainMenu();
                try (
                        Scanner sc = new Scanner(System.in)) {
                    int i = sc.nextInt();
                    switch (i) {
                        case 1:
                            Farm.printAnimals();
                            break;
                        case 2:
                            Menu.printOnlyThisClass(animalFarm);
                            break;
                        case 3:
                            Menu.Comands();
                            break;
                        case 4:
                            Menu.newComand();
                            break;
                        case 5:
                            Menu.newAnimal();
                            break;
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Try one more time");
        }
    }
    }