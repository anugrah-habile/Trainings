document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('signup-form');

    const saveFormData = () => {
        const formData = {
            uname: document.getElementById("uname").value,
            email: document.getElementById("email").value,
            password: document.getElementById("password").value,
            confirm_password: document.getElementById("confirm_password").value,
            dob: document.getElementById("dob").value,
            phone: document.getElementById("phone").value,
            street: document.getElementById("street").value,
            city: document.getElementById("city").value,
            state: document.getElementById("state").value,
            zipcode: document.getElementById("zipcode").value
        };
        localStorage.setItem('formData', JSON.stringify(formData));
    };

    const loadFormData = () => {
        const savedData = JSON.parse(localStorage.getItem('formData')) || {};
        Object.keys(savedData).forEach(key => {
            const input = form.elements[key];
            if (input) input.value = savedData[key];
        });
    };

    const validateForm = () => {
        let isValid = true;

        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        const unamePattern = /^[a-zA-Z][a-zA-Z0-9._]*$/;
        const phonePattern = /^(\(\d{3}\)\s|\d{3}-)\d{3}-\d{4}$/;
        const cityPattern = /^[a-zA-Z]+$/;
        const statePattern = /^[A-Z]{2}$/;
        const zipPattern = /^\d{5}(-\d{4})?$/;

        const username = document.getElementById("uname").value;
        const unametxt = document.getElementById("uname-msg");

        if (username.length < 5 || username.length > 15) {
            unametxt.textContent = "Username invalid.";
            isValid = false;
        } else if (!unamePattern.test(username)) {
            unametxt.textContent = "Invalid username.";
            isValid = false;
        } else {
            unametxt.textContent = "";
        }

        const email = document.getElementById("email").value;
        const emailtxt = document.getElementById("email-msg");

        if (!emailPattern.test(email)) {
            emailtxt.textContent = "Enter a valid email.";
            isValid = false;
        } else {
            emailtxt.textContent = "";
        }

        const password = document.getElementById("password").value;
        const confirmPassword = document.getElementById("confirm_password").value;
        const passwordMsg = document.getElementById("password-msg");
        const confirmPasswordMsg = document.getElementById("confirm-password-msg"); 

        if (password.length < 8) {
            passwordMsg.textContent = "Password invalid.";
            isValid = false;
        } else {
            passwordMsg.textContent = "";
        }
        if (password !== confirmPassword) {
            confirmPasswordMsg.textContent = "Passwords do not match.";
            isValid = false;
        } else {
            confirmPasswordMsg.textContent = "";
        }

        const phone = document.getElementById("phone").value;
        const phoneMsg = document.getElementById("phone-msg");

        if (!phonePattern.test(phone)) {
            phoneMsg.textContent = "Invalid number.";
            isValid = false;
        } else {
            phoneMsg.textContent = "";
        }

        const city = document.getElementById("city").value;
        const citytxt = document.getElementById("city-msg");

        if (!cityPattern.test(city)) {
            citytxt.textContent = "City must contain only letters.";
            isValid = false;
        } else {
            citytxt.textContent = "";
        }
        const state = document.getElementById("state").value;
        const statetxt = document.getElementById("state-msg");

        if (!statePattern.test(state)) {
            statetxt.textContent = "It must be a valid two-letter abbreviation.";
            isValid = false;
        } else {
            statetxt.textContent = "";
        }

        const zipcode = document.getElementById("zipcode").value;
        const ziptxt = document.getElementById("zipcode-msg");

        if (!zipPattern.test(zipcode)) {
            ziptxt.textContent = "Enter a valid ZIP code.";
            isValid = false;
        } else {
            ziptxt.textContent = "";
        }

        return isValid;
    };

    form.addEventListener('input', () => {
        saveFormData();
    });


    form.addEventListener('submit', (e) => {
        e.preventDefault();
        if (validateForm()) {
            saveFormData();
            form.reset(); 
            localStorage.removeItem('formData');
        }
    });

   
    loadFormData();
});

/*function updateData(key) {
    let allFormData = {};
    if (localStorage.getItem("formData")) {
        allFormData = JSON.parse(localStorage.getItem("formData"))
    }
    allFormData[key] = document.getElementById(key).value;
    localStorage.setItem('formData', JSON.stringify(allFormData));
}*/
