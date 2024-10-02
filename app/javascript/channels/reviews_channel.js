
import consumer from "./consumer"

const bookId = document.getElementById('book-id').value;

consumer.subscriptions.create(
  { channel: "ReviewsChannel", book_id: bookId },
  {
    received(data) {
      const reviewsDiv = document.getElementById('reviews');
      const reviewElement = document.createElement('p');
      reviewElement.innerText = data.content;
      reviewsDiv.appendChild(reviewElement);
    }
  }
);
