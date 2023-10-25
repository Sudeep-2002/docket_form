// Fetch supplier data from suppliers.csv file and populate the supplier dropdown
fetch('suppliers.csv')
    .then(response => response.text())
    .then(data => {
        const suppliers = data.split('\n');
        const supplierDropdown = document.getElementById('supplier');
        suppliers.forEach(supplier => {
            const trimmedSupplier = supplier.trim(); // Trim to remove leading/trailing spaces
            const option = document.createElement('option');
            option.value = trimmedSupplier;
            option.text = trimmedSupplier;
            supplierDropdown.appendChild(option);
        });
    })
    .catch(error => {
        console.error('Error fetching supplier data:', error);
    });

// Event listener for supplier selection
document.getElementById('supplier').addEventListener('change', function() {
    const selectedSupplier = this.value;
    // Fetch purchase orders based on the selected supplier from purchaseOrders.csv
    fetch('purchaseOrders.csv')
        .then(response => response.text())
        .then(data => {
            const purchaseOrders = data.split('\n');
            const purchaseOrderDropdown = document.getElementById('purchaseOrder');
            purchaseOrderDropdown.innerHTML = ''; // Clear previous options
            purchaseOrders.forEach(order => {
                const [supplier, poNumber, description] = order.split(',');
                if (supplier.trim() === selectedSupplier) {
                    const option = document.createElement('option');
                    option.value = poNumber + ',' + description;
                    option.text = description; // Show Description in the dropdown
                    purchaseOrderDropdown.appendChild(option);
                }
            });
        })
        .catch(error => {
            console.error('Error fetching purchase order data:', error);
        });
});

// Form submission
document.getElementById('docketForm').addEventListener('submit', function(event) {
    event.preventDefault();
    const formData = new FormData(this);
    fetch('db_operations.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        alert(data); // Show success or error message
        // Optionally, close the popup or redirect to another page after successful submission
    })
    .catch(error => {
        console.error('Error:', error);
    });
});