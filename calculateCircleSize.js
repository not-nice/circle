// calculateCircleSize.js

function calculateArea(radius) {
    return Math.PI * Math.pow(radius, 2);
}

function handleSubmit(event) {
    event.preventDefault();

    const radiusInput = document.getElementById('radius');
    const areaDisplay = document.getElementById('area');

    const radius = parseFloat(radiusInput.value);
    const area = calculateArea(radius);

    areaDisplay.textContent = `The area of the circle is: ${area.toFixed(2)}`;
}

const form = document.getElementById('circleForm');
form.addEventListener('submit', handleSubmit);