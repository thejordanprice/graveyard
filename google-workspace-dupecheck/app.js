function processCSV() {
  const fileInput = document.getElementById('csvFile');
  const file = fileInput.files[0];
  const reader = new FileReader();

  reader.onload = function(e) {
      const text = e.target.result;
      const rows = text.split('\n').slice(1); // skip header row
      const users = {};
      let usersWithMultipleAccountsCount = 0;
      let totalMultipleAccountsCount = 0;

      rows.forEach(row => {
          // Split only if the row is not empty
          if (row.trim()) {
              const columns = row.split(',');

              // Ensure the row has the expected number of columns
              if (columns.length >= 3) {
                  const firstName = columns[0].trim();
                  const lastName = columns[1].trim();
                  const email = columns[2].trim();

                  if (firstName && lastName) {
                      const fullName = `${firstName} ${lastName}`;

                      if (!users[fullName]) {
                          users[fullName] = [];
                      }

                      users[fullName].push(email);
                  }
              }
          }
      });

      // Calculate statistics and display results
      for (const fullName in users) {
          const emails = users[fullName];
          if (emails.length > 1) {
              usersWithMultipleAccountsCount++;
              totalMultipleAccountsCount += emails.length;
          }
      }

      displayResults(users);
      updateStatistics(usersWithMultipleAccountsCount, totalMultipleAccountsCount);
  };

  reader.readAsText(file);
}

function displayResults(users) {
  const tbody = document.getElementById('resultTable').querySelector('tbody');
  tbody.innerHTML = ''; // clear existing rows

  for (const fullName in users) {
      const emails = users[fullName];
      if (emails.length > 1) {
          const row = document.createElement('tr');
          const firstNameCell = document.createElement('td');
          const lastNameCell = document.createElement('td');
          const emailCell = document.createElement('td');

          const [firstName, lastName] = fullName.split(' ');
          firstNameCell.textContent = firstName;
          lastNameCell.textContent = lastName;
          emailCell.textContent = emails.join(', ');

          row.appendChild(firstNameCell);
          row.appendChild(lastNameCell);
          row.appendChild(emailCell);

          tbody.appendChild(row);
      }
  }
}

function updateStatistics(usersWithMultipleAccounts, totalMultipleAccounts) {
  document.getElementById('usersWithMultipleAccounts').textContent = `${usersWithMultipleAccounts}`;
  document.getElementById('totalMultipleAccounts').textContent = `${totalMultipleAccounts}`;
}
