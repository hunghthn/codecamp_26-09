document.addEventListener('DOMContentLoaded', function() {
  let timeout;
  const searchInput = document.getElementById('search');

  searchInput.addEventListener('input', function() {
      clearTimeout(timeout);

      timeout = setTimeout(() => {
          fetch(`/books?query=${searchInput.value}`, {
              headers: { 'Accept': 'application/json' }
          })
          .then(response => response.json())
          .then(data => {
              const bookList = document.getElementById('book-list');
              bookList.innerHTML = '<ul></ul>';

              data.forEach(book => {
                  // Create a list item with a link for the book title
                  bookList.querySelector('ul').innerHTML += `
                      <li>
                          <strong>
                              <a href="${book.url}">${book.title}</a>
                          </strong>: ${book.content}
                      </li>`;
              });
          });
      }, 300);
  });
});
