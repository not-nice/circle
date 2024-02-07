function calculateArea(radius) {
    return Math.PI * Math.pow(radius, 2);
}

function calculateCircleArea(radius) {
    const area = calculateArea(radius);
    return `The area of the circle with radius ${radius} is: ${area.toFixed(2)}`;
}

// Check if command-line arguments are provided
if (process.argv.length <= 2) {
    console.log('Usage: node calculateCircleSize.js <radius>');
    process.exit(1);
}

const radius = parseFloat(process.argv[2]);
if (isNaN(radius)) {
    console.log('Error: Please provide a valid number for the radius.');
    process.exit(1);
}

console.log(calculateCircleArea(radius));
console.log(process.env.PORT);