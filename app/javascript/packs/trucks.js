document.addEventListener('DOMContentLoaded', function() {
    const editButton = document.getElementById('edit_truck_button');
    if (editButton) {
      editButton.addEventListener('click', function() {
        const formFields = document.querySelectorAll('.edit_truck_form input, .edit_truck_form select');
        formFields.forEach(function(field) {
          field.disabled = false;
        });
      });
    }
  });