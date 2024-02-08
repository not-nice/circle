// Function to calculate the area of a circle given its radius
function calculateArea(radius) {
    return Math.PI * Math.pow(radius, 2);
}

// Function to calculate the circumference of a circle given its radius
function calculateCircumference(radius) {
    return 2 * Math.PI * radius;
}

// Function to calculate both area and circumference of a circle and update the HTML with the results
function calculateCircle(event) {
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

    // Calculate the area and circumference of the circle
    const area = calculateArea(radius);
    const circumference = calculateCircumference(radius);

    // Update the HTML with the calculated area and circumference
    const results = document.getElementById('results');
    results.innerHTML = `
        <p>Area: ${area.toFixed(2)}</p>
        <p>Circumference: ${circumference.toFixed(2)}</p>
    `;
}

// Get the form element and add an event listener for form submission
const circleForm = document.getElementById('circleForm');
circleForm.addEventListener('submit', calculateCircle);