// index.js
const codeEditor = CodeMirror.fromTextArea(document.getElementById('codeEditor'), {
    mode: 'javascript',
    lineNumbers: true,
    theme: 'default',
});

const newBtn = document.getElementById('newBtn');
const saveBtn = document.getElementById('saveBtn');
const loadBtn = document.getElementById('loadBtn');
const deleteBtn = document.getElementById('deleteBtn');
const previewBtn = document.getElementById('previewBtn')
const currentFileName = document.getElementById('currentFileNameText');

let currentFile = {
    name: 'New File',
    isSaved: false,
};

newBtn.addEventListener('click', () => {
    const modalBody = document.getElementById('newModalBody');
    modalBody.innerHTML = `
        <p>Are you sure you want to start a new file? Any unsaved changes will be lost.</p>
    `;

    const modal = new bootstrap.Modal(document.getElementById('fileNewModal'));
    modal.show();

    const newModalBtn = document.getElementById('newModalBtn');
    newModalBtn.onclick = () => {
        codeEditor.setValue('');
        setCurrentFile('New File', false);
        modal.hide();
    };
});

saveBtn.addEventListener('click', () => {
    const code = codeEditor.getValue();

    if (currentFile.isSaved) {
        localStorage.setItem(currentFile.name, code);
        setCurrentFile(currentFile.name, true);
    } else {
        const modalBody = document.getElementById('saveModalBody');
        modalBody.innerHTML = `
            <label for="saveFileName" class="form-label">Enter file name:</label>
            <input type="text" class="form-control" id="saveFileName" placeholder="Enter file name">
        `;

        const modal = new bootstrap.Modal(document.getElementById('fileSaveModal'));
        modal.show();

        const saveModalBtn = document.getElementById('saveModalBtn');
        saveModalBtn.onclick = () => {
            const fileNameInput = document.getElementById('saveFileName');
            const fileName = fileNameInput.value.trim();
            if (fileName) {
                localStorage.setItem(fileName, code);
                setCurrentFile(fileName, true);
                modal.hide();
            }
        };
    }
});

loadBtn.addEventListener('click', () => {
    const savedFiles = Object.keys(localStorage);
    if (savedFiles.length === 0) {
        const modalBody = document.getElementById('modalBody');
        modalBody.innerHTML = '<p>No saved files available.</p>';

        const modal = new bootstrap.Modal(document.getElementById('fileSelectModal'));
        modal.show();
    } else {
        const select = document.createElement('select');
        select.className = 'form-select';
        select.id = 'loadFileSelect';

        savedFiles.forEach(fileName => {
            const option = document.createElement('option');
            option.value = fileName;
            option.textContent = fileName;
            select.appendChild(option);
        });

        const modalBody = document.getElementById('modalBody');
        modalBody.innerHTML = '';
        modalBody.appendChild(select);

        const modal = new bootstrap.Modal(document.getElementById('fileSelectModal'));
        modal.show();
    }
});

deleteBtn.addEventListener('click', () => {
    const savedFiles = Object.keys(localStorage);
    if (savedFiles.length === 0) {
        const modalBody = document.getElementById('deleteModalBody');
        modalBody.innerHTML = '<p>No saved files available.</p>';

        const modal = new bootstrap.Modal(document.getElementById('fileDeleteModal'));
        modal.show();
    } else {
        const select = document.createElement('select');
        select.className = 'form-select';
        select.id = 'deleteFileSelect';

        savedFiles.forEach(fileName => {
            const option = document.createElement('option');
            option.value = fileName;
            option.textContent = fileName;
            select.appendChild(option);
        });

        const modalBody = document.getElementById('deleteModalBody');
        modalBody.innerHTML = '';
        modalBody.appendChild(select);

        const modal = new bootstrap.Modal(document.getElementById('fileDeleteModal'));
        modal.show();
    }
});

previewBtn.addEventListener('click', function() {
    var code = editor.getValue();
    var previewWindow = window.open();
    previewWindow.document.write(code);
});

function loadSelectedFile() {
    const select = document.getElementById('loadFileSelect');
    const selectedFileName = select.value;
    if (selectedFileName) {
        const savedCode = localStorage.getItem(selectedFileName);
        codeEditor.setValue(savedCode);
        setCurrentFile(selectedFileName, true);
        const modal = bootstrap.Modal.getInstance(document.getElementById('fileSelectModal'));
        modal.hide();
    }
}

function deleteSelectedFile() {
    const select = document.getElementById('deleteFileSelect');
    const selectedFileName = select.value;
    if (selectedFileName) {
        localStorage.removeItem(selectedFileName);
        const modal = bootstrap.Modal.getInstance(document.getElementById('fileDeleteModal'));
        modal.hide();
        alert(`${selectedFileName} has been deleted.`);
    }
}

function setCurrentFile(fileName, isSaved) {
    currentFile.name = fileName;
    currentFile.isSaved = isSaved;
    currentFileName.textContent = currentFile.name;
    currentFileName.classList.remove('text-danger');
    currentFileName.classList.add(isSaved ? 'text-muted' : 'text-danger');
}
