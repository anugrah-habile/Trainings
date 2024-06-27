// 1) class Car {
//     constructor(make, model) {
//         this.make = make;
//         this.model = model;
//     }

//     displayInfo() {
//         console.log(`Make: ${this.make}, Model: ${this.model}`);
//     }
// }

// let car1 = new Car('Toyota', 'Camry');
// car1.displayInfo();



// 2) class Engine {
//     start() {
//         console.log('Engine started');
//     }

//     stop() {
//         console.log('Engine stopped');
//     }
// }


// class Car {
//     constructor(make, model) {
//         this.make = make;
//         this.model = model;
//         this.engine = new Engine(); 
//     }

//     displayInfo() {
//         console.log(`Make: ${this.make}, Model: ${this.model}`);
//     }

//     start() {
//         this.engine.start();
//     }

//     stop() {
//         this.engine.stop();
//     }
// }

// class ElectricCar extends Car {
//     constructor(make, model, batteryCapacity) {
//         super(make, model); 
//         this.batteryCapacity = batteryCapacity;
//     }

//     displayInfo() {
//         super.displayInfo(); 
//         console.log(`Battery Capacity: ${this.batteryCapacity} kWh`);
//     }
// }

// let electricCar1 = new ElectricCar('Tesla', 'Model S', 100);
// let electricCar2 = new ElectricCar('Nissan', 'Leaf', 40);

// electricCar1.displayInfo();
// electricCar1.start(); 
// electricCar1.stop();  

// electricCar2.displayInfo();
// electricCar2.start(); 
// electricCar2.stop();  



// 3) function printPersonInfo(person){
//     const {name, age, city} = person;
//     console.log(`Name: ${name}`);
//     console.log(`Age: ${age}`);
//     console.log(`city: ${city}`);
// }

// let person={ name: 'Anugrah', age: '22', city: 'Kanpur'}
// printPersonInfo(person);



// 4) function printPersonInfo(person){
//     const {name, age = 'unknown', city = 'unknown'} = person;
//     console.log(`Name: ${name}`);
//     console.log(`Age: ${age}`);
//     console.log(`city: ${city}`);
// }

// let person1={ name: 'Anugrah', age: '22', city: 'Kanpur'}
// let person2={ name: 'Anugrah'}

// printPersonInfo(person1);
// printPersonInfo(person2);



// 5) function mergeObjects(object1, object2){
//     return {...object1, ...object2};
// }

// let object1 = {name: 'Anugrah', age: '22'};
// let object2 = {city: 'Kanpur', state: 'U.P.'};

// let mergedObj = mergeObjects(object1, object2);
// console.log(mergedObj);


// 6) function getRemainingObjects(obj1){
//     const {name, ...remainingProperties} = obj1;
//     return remainingProperties;
// }

// let person={ name: 'Anugrah', age: '22', city: 'Kanpur'};
// let remproperties = getRemainingObjects(person);
// console.log(remproperties);



// 7) function updatePersonInfo(name, newName){
//     return {...person, name: newName};

// }
// let person={ name: 'Anugrah', age: '22', city: 'Kanpur'};
// let updatePerson = updatePersonInfo(person, 'Anugrah1');
// console.log(updatePerson);