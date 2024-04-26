document.getElementById('uploadButton').addEventListener('click', function() {
    const imageInput = document.getElementById('imageInput');
    if(imageInput.files.length === 0){
        alert("Please select an image file first!");
        return;
    }

    const formData = new FormData();
    formData.append('image', imageInput.files[0]);

    fetch('http://localhost:5000/upload', {
        method: 'POST',
        body: formData,
        credentials: 'include'
    })
    .then(response => response.blob())
    .then(blob => {
        const imageUrl = URL.createObjectURL(blob);
        const imageElement = document.getElementById('filteredImage');
        imageElement.src = imageUrl;
        imageElement.style.display = 'block';
    })
    .catch(error => console.error('Error:', error));
});