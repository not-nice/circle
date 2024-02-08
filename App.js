function handleUtility(utility) {
    if (utility === 'C') {
        clearDisplay();
    } else if (utility === 'π') {
        appendToDisplay(Math.PI);
    } else if (utility === 'e') {
        appendToDisplay(Math.E);
    } else if (utility === '√') {
        appendToDisplay('√(');
    } else if (utility === 'log') {
        appendToDisplay('log(');
    } else if (utility === 'ln') {
        appendToDisplay('ln(');
    } else if (utility === 'sin' || utility === 'cos' || utility === 'tan') {
        appendToDisplay(utility + '(');
    } else if (utility === '←') {
        backspace();
    } else if (utility === 'CE') {
        clearDisplay();
    }
}

function appendToDisplay(value) {
    document.getElementById('display').value += value;
}

function appendOperator(operator) {
    document.getElementById('display').value += operator;
}

function clearDisplay() {
    document.getElementById('display').value = '';
}

function backspace() {
    let displayValue = document.getElementById('display').value;
    document.getElementById('display').value = displayValue.slice(0, -1);
}

function handleBackspace() {
    backspace();
}

function clearEntry() {
    let displayValue = document.getElementById('display').value;
    document.getElementById('display').value = displayValue.slice(0, -1);
}


document.getElementById('equals').addEventListener('click', function() {
    calculateResult();
});

function calculateResult() {
    try {
        let expression = document.getElementById('display').value.trim();
        // Replace trigonometric functions with JavaScript equivalents
        expression = expression.replace(/sin/g, 'Math.sin');
        expression = expression.replace(/cos/g, 'Math.cos');
        expression = expression.replace(/tan/g, 'Math.tan');
        // Replace logarithmic functions with JavaScript equivalents
        expression = expression.replace(/log/g, 'Math.log10');
        expression = expression.replace(/ln/g, 'Math.log');
        // Replace square root and exponentiation functions with JavaScript equivalents
        expression = expression.replace(/√/g, 'Math.sqrt');
        expression = expression.replace(/\^/g, '**');
        // Evaluate the expression using eval()
        const result = eval(expression);
        document.getElementById('display').value = result;
    } catch (error) {
        console.error('Error:', error.message);
        document.getElementById('display').value = 'Error';
    }
}