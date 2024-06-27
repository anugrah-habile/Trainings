// 1) function multiplyWithCallback(num1, num2, callback){
//     let result = num1 * num2;
//     callback(result);
// }

// function display(value){
//     console.log(value);
// }

// multiplyWithCallback(2, 3, display);



// 2) function doAsyncOperation(callback){
//     setTimeout(() =>{
//         callback(null, 'Success');
//     },2000)
// }

// function handle(error,message){
//     if (error){
//         console.log('Error :',error);
//     }
//     else{
//         console.log(message);
//     }
// }

// console.log('Starting:..');
// doAsyncOperation(handle);



// 3) function delay(delayTime){
//     return new Promise((resolve, reject) =>{
//         setTimeout(() => {
//             resolve(`resolved after ${delayTime} seconds`)
//         }, delayTime);
//     })
// }

// delay(2000).then((message) =>{
//     console.log(message);
// })



// 4) function fetchData() {
    
//     const apiUrl = 'https://jsonplaceholder.typicode.com/posts/1';

//     return fetch(apiUrl)
//         .then(response => {
//             if (!response.ok) {
//                 throw new Error(`HTTP error! Status: ${response.status}`);
//             }
//             return response.json();
//         })
//         .then(data => {
//             return data; 
//         })
//         .catch(error => {
//             throw new Error(`Fetch error: ${error.message}`);
//         });
// }

// fetchData()
//     .then(data => {
//         console.log('Data fetched successfully:', data);
//     })
//     .catch(error => {
//         console.error('Error fetching data:', error);
//     });



// 8) const numbers = [1,2,3,4,5];
// const newNums = numbers.map((num) => {
//     return num*2
// })
// console.log(newNums);


// 9) const numbers = [1,2,3,4,5];
// numbers.forEach((ele,index) =>{
//     console.log(`Element at index ${index} is : ${ele}`);
// })


// 10) const numbers = [5, 8, 15, 3, 2];
// const newNums = numbers.filter((num) =>{
//     return num>10;
// })
// console.log(newNums);


// 11) const numbers = [1, 2, 3, -4, 5];
// const positive = numbers.every(number => number > 0);

// if (positive) {
//     console.log("All elements are positive");
// } 
// else {
//     console.log("Not all elements are positive");
// }


// 12) const numbers = [1, 2, 3, 4, 5, 6];
// const myNums = numbers.filter((num) =>{
//     if(num%2==0) return num;
// })
// console.log(myNums);



