function calculate() {
    const expressionInput = document.getElementById('expression');
    const expression = expressionInput.value;

    try {
        const result = eval(expression);
        document.getElementById('result').textContent = `Result: ${result}`;
    } catch (error) {
        document.getElementById('result').textContent = 'Error: Invalid expression';
    }
}

const calculatorForm = document.getElementById('calculatorForm');
calculatorForm.addEventListener('submit', function(event) {
    event.preventDefault();
    calculate();
});