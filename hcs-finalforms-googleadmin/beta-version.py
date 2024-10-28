import csv

# Function to parse FinalForms CSV, filter students missing email, and sort by class year
def filter_students(finalforms_csv_file_path, google_admin_csv_file_path, output_csv_file_path):
    students_missing_email = []
    email_addresses_needed = 0

    # Step 1: Parse the Google Admin CSV and create a set of email addresses
    google_admin_emails = set()
    with open(google_admin_csv_file_path, mode='r') as google_file:
        google_csv_reader = csv.reader(google_file)
        next(google_csv_reader)  # Skip the header row

        for row in google_csv_reader:
            email = row[2].strip()  # Assuming email is in the third column
            google_admin_emails.add(email)

    # Step 2: Parse the FinalForms CSV and find students missing emails
    finalforms_data = []
    with open(finalforms_csv_file_path, mode='r') as finalforms_file:
        finalforms_csv_reader = csv.reader(finalforms_file)
        header = next(finalforms_csv_reader)  # Skip the header row

        for row in finalforms_csv_reader:
            student_id = row[1].strip()  # Assuming StudentID is in the first column
            building = row[2].strip()
            email = row[9].strip()
            first_name = row[4].strip()
            last_name = row[6].strip()
            date_of_birth = row[8].strip()  # Assuming Date Of Birth is in the ninth column
            class_year = row[19].strip()

            # Check if the student has been assigned a building and is missing an email
            if building and not email:
                email_exists = False
                generated_email = f"{first_name[0].lower()}{last_name.lower()}{class_year[-2:]}@huronstudents.com"
                if generated_email in google_admin_emails:
                    email_exists = True
                else:
                    email_addresses_needed += 1

                students_missing_email.append((student_id, generated_email))

    # Sort the list of students by the graduating class year (class_year)
    students_missing_email.sort(key=lambda x: x[1])

    # Format the output CSV
    with open(output_csv_file_path, mode='w', newline='') as output_file:
        csv_writer = csv.writer(output_file)
        # Write header
        csv_writer.writerow(['StudentID', 'Email'])
        # Write data rows
        csv_writer.writerows(students_missing_email)

    # Format the output for printing
    formatted_students = [
        f"{first_name} {last_name}, Class of {class_year}, Building: {building}, Email Exists: {email_exists}"
        for student_id, generated_email in students_missing_email
    ]

    return formatted_students, email_addresses_needed

# Usage
finalforms_csv_file_path = 'finalforms_students.csv'
google_admin_csv_file_path = 'google_admin_students_new.csv'
output_csv_file_path = 'update_emails_finalforms.csv'
missing_email_students, email_addresses_needed = filter_students(finalforms_csv_file_path, google_admin_csv_file_path, output_csv_file_path)

# Print results
for student in missing_email_students:
    print(student)

# Print the final count and email addresses needed
print(f"Total students missing email: {len(missing_email_students)}")
print(f"Total email addresses needed to be created: {email_addresses_needed}")
