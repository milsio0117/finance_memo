document.addEventListener('DOMContentLoaded',function() {
    const uploadButton = document.querySelector('.file-upload');
    const fileInput = document.querySelector('.hidden');
  
    uploadButton.disabled = true;
  
    fileInput.onchange = function() {
      if(fileInput.value) {
        submitButton.disabled = false;
      }
    };
  });