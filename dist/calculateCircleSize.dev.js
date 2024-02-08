"use strict";

// Function to calculate the area of a circle given its radius
function calculateArea(radius) {
  return Math.PI * Math.pow(radius, 2);
} // Function to calculate the area of a circle and update the HTML with the result


function calculateCircleArea(event) {
  // Prevent the default form submission behavior
  event.preventDefault(); // Get the radius input value from the form

  var radiusInput = document.getElementById('radius');
  var radius = parseFloat(radiusInput.value); // Validate if the provided radius is a valid number

  if (isNaN(radius)) {
    alert('Error: Please provide a valid number for the radius.');
    return;
  } // Calculate the area of the circle


  var area = calculateArea(radius); // Update the HTML with the calculated area

  var areaOutput = document.getElementById('area');
  areaOutput.textContent = "The area of the circle with radius ".concat(radius, " is: ").concat(area.toFixed(2));
} // Get the form element and add an event listener for form submission


var circleForm = document.getElementById('circleForm');
circleForm.addEventListener('submit', calculateCircleArea);