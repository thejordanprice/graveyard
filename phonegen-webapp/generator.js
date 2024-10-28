// generator.js
async function generatePhoneNumbers(prefixes) {
  return new Promise(resolve => {
    const phoneNumbers = [];
    prefixes.forEach(async prefix => {
      for (let i = 0; i < 10000; i++) {
        const suffix = i.toString().padStart(4, '0');
        const phoneNumber = `${prefix}${suffix}`;
        phoneNumbers.push(phoneNumber);
      }
    });
    resolve(phoneNumbers);
  });
}

function downloadPhoneNumbers(phoneNumbers) {
  const blob = new Blob([phoneNumbers.join('\n')], { type: 'text/plain' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = 'phone_numbers.txt';
  document.body.appendChild(a);
  a.click();
  document.body.removeChild(a);
  URL.revokeObjectURL(url);
}

function validateInput(input) {
  const regex = /^(\d{6},\s*)*\d{6}$/;
  return regex.test(input);
}

async function main() {
  const generateButton = document.getElementById('generateButton');
  const downloadButton = document.getElementById('downloadButton');
  const prefixesInput = document.getElementById('prefixes');
  const prefixesHelp = document.getElementById('prefixesHelp');
  const phoneNumbersList = document.getElementById('phoneNumbersList');
  generateButton.addEventListener('click', async () => {
    const prefixes = prefixesInput.value.split(',').map(prefix => prefix.trim());
    if (!validateInput(prefixesInput.value)) {
      prefixesHelp.textContent = 'Enter comma-separated 6-digit prefixes. Invalid input.';
      prefixesHelp.style.color = 'red';
      prefixesInput.classList.add('is-invalid');
      return;
    } else {
      prefixesHelp.textContent = 'Enter comma-separated 6-digit prefixes.';
      prefixesHelp.style.color = 'black';
      prefixesInput.classList.remove('is-invalid');
    }
    const phoneNumbers = await generatePhoneNumbers(prefixes);
    phoneNumbersList.innerHTML = '';
    phoneNumbers.forEach(phoneNumber => {
      const phoneNumberDiv = document.createElement('div');
      phoneNumberDiv.className = 'bg-light p-2';
      phoneNumberDiv.textContent = phoneNumber;
      phoneNumbersList.appendChild(phoneNumberDiv);
    });
    downloadButton.disabled = false;
  });
  downloadButton.addEventListener('click', () => {
    const phoneNumbers = Array.from(phoneNumbersList.getElementsByTagName('div')).map(div => div.textContent);
    downloadPhoneNumbers(phoneNumbers);
  });
}

main();
