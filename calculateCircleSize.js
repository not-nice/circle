// Function to calculate the area of a circle given its radius
function calculateArea(radius) {
    return Math.PI * Math.pow(radius, 2);
}

// Function to calculate the area of a circle and update the HTML with the result
function calculateCircleArea(event) {
    // Prevent the default form submission behavior
    event.preventDefault();

    // Get the radius input value from the form
    const radiusInput = document.getElementById('radius');
    const radius = parseFloat(radiusInput.value);

    // Validate if the provided radius is a valid number
    if (isNaN(radius)) {
        alert('Error: Please provide a valid number for the radius.');
        return;
    }

    // Calculate the area of the circle
    const area = calculateArea(radius);

    // Update the HTML with the calculated area
    const areaOutput = document.getElementById('area');
    areaOutput.textContent = `The area of the circle with radius ${radius} is: ${area.toFixed(2)}`;
}

// Get the form element and add an event listener for form submission
const circleForm = document.getElementById('circleForm');
circleForm.addEventListener('submit', calculateCircleArea);