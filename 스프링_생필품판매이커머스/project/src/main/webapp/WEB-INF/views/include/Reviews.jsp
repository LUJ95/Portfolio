<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Detail</title>
    <style type="text/css">
 /* Global Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Arial', sans-serif;
}

/* Body and Basic Layout */
body {
    background-color: #f8faf9; /* Very light grayish background for freshness */
    color: #333;
    padding: 20px;
    line-height: 1.6;
}

/* Main container */
.container {
    max-width: 1200px;
    margin: 0 auto;
}

/* Review Container */
.review-container {
    background-color: #ffffff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    margin-bottom: 30px;
    transition: transform 0.3s ease-in-out;
}

.review-container:hover {
    transform: scale(1.02);
}

.review-container h3 {
    font-size: 1.5rem;
    color: #2a9d8f;
    margin-bottom: 20px;
    text-transform: uppercase;
    font-weight: bold;
    letter-spacing: 0.05em;
}

/* Review Summary Section */
.review-summary {
    background-color: #eaf6f0; /* Light green background for summary */
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 20px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.review-summary p {
    font-size: 1.1rem;
    color: #2a9d8f;
    margin: 8px 0;
}

.review-summary strong {
    font-weight: bold;
}

/* Review Item Styling */
.review-item {
    background-color: #f9fbf7; /* Slightly off-white background */
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 20px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out;
}

.review-item:hover {
    transform: scale(1.02);
}

.review-item h3 {
    color: #2a9d8f;
    font-size: 1.25rem;
    margin-bottom: 10px;
    font-weight: normal;
}

.review-item p {
    color: #666;
    font-size: 1rem;
    margin-bottom: 8px;
}

.review-item a {
    color: #2a9d8f;
    text-decoration: none;
    margin-right: 20px;
    font-weight: bold;
}

.review-item a:hover {
    text-decoration: underline;
}

.review-item a:active {
    color: #1b7e6d;
}

/* Edit Form */
.edit-form {
    margin-top: 20px;
    background-color: #eaf6f0;
    padding: 20px;
    border-radius: 8px;
    display: none;
}

.edit-form label {
    display: block;
    font-weight: bold;
    margin-bottom: 8px;
    color: #333;
}

.edit-form select,
.edit-form textarea {
    width: 100%;
    padding: 12px;
    margin: 5px 0;
    border: 1px solid #ddd;
    border-radius: 5px;
}

.edit-form button {
    background-color: #2a9d8f;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1rem;
    margin-top: 10px;
}

.edit-form button:hover {
    background-color: #21867a;
}

/* Review Form Styles */
h2 {
    color: #2a9d8f;
    font-size: 1.5rem;
    margin-bottom: 20px;
}

form {
    background-color: #ffffff;
    padding: 25px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    margin: 0 auto;
}

form div {
    margin-bottom: 20px;
}

label {
    font-size: 1rem;
    color: #333;
    display: block;
    margin-bottom: 5px;
}

input[type="text"], textarea, select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 1rem;
}

textarea {
    min-height: 150px;
}

button[type="submit"] {
    background-color: #2a9d8f;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1.1rem;
    width: 100%;
}

button[type="submit"]:hover {
    background-color: #21867a;
}

/* Link back to product list */
p a {
    color: #2a9d8f;
    text-decoration: none;
    font-size: 1rem;
}

p a:hover {
    text-decoration: underline;
}

/* Responsive Design */
@media (max-width: 768px) {
    .review-container {
        padding: 20px;
    }

    .review-summary {
        padding: 12px;
    }

    form {
        padding: 15px;
    }

    h2 {
        font-size: 1.25rem;
    }

    button[type="submit"] {
        font-size: 1rem;
    }
}
 
    </style>
</head>
<body>

    <h2>Reviews</h2>
    
     <div class="review-container">
        <h3>Review Summary</h3>
        <p><strong>Total Reviews:</strong> ${count}</p>
        <p><strong>Average Rating:</strong> ${avg} / 5</p>
    </div>
    
    <div class="review-container" id="review-container">
    <c:forEach var="review" items="${reviews}">
        <div class="review-item">
            <h3>${review.cid}</h3>
           <a href="javascript:void(0);" onclick="toggleEditForm(${review.rid})">Edit Review</a>
            <a href="javascript:void(0);" onclick="deleteReview(${review.rid}, ${review.pno})">Delete Review</a>
            <p>Date: ${review.rdate}</p>
            <p>Rating: ${review.rating} / 5</p>
            <p>${review.rcontext}</p>
            
                <div id="${review.rid }-edit" class="edit-form" style="display: none;">
                    <form onsubmit="editReview(event, ${review.rid}, ${review.pno})">
                    <input type="hidden" name="productId" value="${review.pno}" />
                        <div>
                            <label for="rating">Rating</label>
                            <select id="rating-${review.rid}" name="rating">
                                <option value="1" <c:if test="${review.rating == 1}">selected</c:if>>1</option>
                                <option value="2" <c:if test="${review.rating == 2}">selected</c:if>>2</option>
                                <option value="3" <c:if test="${review.rating == 3}">selected</c:if>>3</option>
                                <option value="4" <c:if test="${review.rating == 4}">selected</c:if>>4</option>
                                <option value="5" <c:if test="${review.rating == 5}">selected</c:if>>5</option>
                            </select>
                        </div>
                        <div>
                            <label for="rcontext">Review</label>
                            <textarea id="edit-rcontext-${review.rid}" name="rcontext">${review.rcontext}</textarea>
                        </div>
                        <button type="submit">Save Changes</button>
                    </form>
                </div>
        </div>
    </c:forEach>
    </div>

    <h2>Write a Review</h2>
    <form id="review-form">
        <input type="hidden" name="productId" value="${pno}" />
        <div>
            <label for="rating">Rating</label>
            <select name="rating" id="rating" required>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
        </div>
        <div>
            <label for="rcontext">Your Review</label>
            <textarea name="rcontext" id="rcontext" required></textarea>
        </div>
        <button type="submit">Submit Review</button>
    </form>

    <p><a href="shopGrid">Back to product list</a></p>
   <script>
   var pno = ${pno};  // Pass pno from JSP to JS
   console.log(pno);
   window.onload = function() {
       const reviewForm = document.getElementById('review-form');
      
       reviewForm.addEventListener('submit', function(event) {
           event.preventDefault();  

           const rating = document.getElementById('rating').value;
           console.log(rating);
           const rcontext = document.getElementById('rcontext').value;
           console.log(rcontext);

           const formData = new FormData();
           formData.append('rating', rating);
           formData.append('rcontext', rcontext);
           formData.append('pno', pno); 
           
           const xhr = new XMLHttpRequest();

           xhr.open('POST', '/shopDetail', true);

           xhr.onreadystatechange = function() {
               if (xhr.readyState === 4) {
                   if (xhr.status === 200) {
                       console.log('Review Submitted');
                       window.location.href = '/shopDetail?pno=' + pno;
                       updateReviews(); 
                   } else {
                       console.log('Request failed with status: ' + xhr.status);
                   }
               }
           };

           xhr.send(formData);
       });
   };
   
   function toggleEditForm(rid) {
		console.log(rid);
	   
	    const editForm = document.getElementById(rid+'-edit');
	    console.log(editForm);
	    
	    if (!editForm) {
	        console.error('No form found for review ID: ${rid}'	);
	        return;  // Exit the function if no form is found
	    }

	    // Check if the form is hidden using the inline style display property
	    if (editForm.style.display === 'none' || editForm.style.display === '') {
	        editForm.style.display = 'block';  // Show the form
	    } else {
	        editForm.style.display = 'none';   // Hide the form
	    }
	}

  function editReview(event, rid, pno) {
	event.preventDefault();
	
	const ratingElement = document.getElementById('rating-'+rid);
	const rcontextElement = document.getElementById('edit-rcontext-' + rid);
	
	const rating = ratingElement.value;
	const rcontext = rcontextElement.value;
	
	console.log(rating);
	console.log(rcontext);
	
	const formData = new FormData();
	formData.append('rating', rating);
	formData.append('rcontext', rcontext);
	formData.append('rid', rid);
	formData.append('pno', pno);
	
	fetch('editReview', {
	method: 'POST',
	body: formData
	})
	.then(response => {
	if (response.ok) {
		console.log('Review updated');
		updateReviews();
		window.location.href = '/shopDetail?pno=' + pno;
	} else {
	alert('Please login first');
	console.log('NAHHH');
	}
	})
	.catch(error => {
	console.error('Error', error);
	})
  }
  
  function deleteReview(rid, pno) {
	    console.log('Review ID:', rid);  // This will check if rid is passed correctly
	    console.log('Product ID:', pno);  // This will check if pno is passed correctly

	    // Check if rid and pno are valid
	    if (!rid || !pno) {
	        console.error('Invalid review ID or product ID');
	        return; // Exit the function if IDs are not valid
	    }

	    const formData = new FormData();
	    formData.append('rid', rid);
	    formData.append('pno', pno);

	    fetch('deleteReview', {
	        method: 'POST',
	        body: formData
	    })
	    .then(response => {
	        if (response.ok) {
	            console.log('Review Deleted');
	            updateReviews();
	            window.location.href = '/shopDetail?pno=' + pno;
	        } else {
	            alert('Please login first');
	            console.log('Uh..no..');
	        }
	    })
	    .catch(error => {
	        console.error('Error', error);
	    });
	}

  
  function updateReviews() {
	   const reviewsContainer = document.getElementById('review-container');
      const xhr = new XMLHttpRequest();
      xhr.open('GET', 'getReviews?pno=' + pno, true);
      xhr.setRequestHeader('Accept', 'application/json');

      xhr.onreadystatechange = function() {
   	    if (xhr.readyState === 4 && xhr.status === 200) {
   	        const response = JSON.parse(xhr.responseText); 
   	        reviewsContainer.innerHTML = ''; 
   	        
   	        const reviews = response.reviews || [];
   	        reviews.forEach(function(review) {
                   const reviewItem = document.createElement('div');
                   reviewItem.classList.add('review-item');

                 
                   const reviewCid = document.createElement('h3');
                   reviewCid.textContent = review.cid;
                   reviewItem.appendChild(reviewCid);

                   
                   const editLink = document.createElement('a');
                   editLink.href = "editReview?pno=" + pno + "&rid=" + review.rid;
                   editLink.textContent = "Edit Review";
                   reviewItem.appendChild(editLink);
                   
                   const deleteLink = document.createElement('a');
                   deleteLink.href = "deleteReview?pno=" + pno + "&rid=" + review.rid;
                   deleteLink.textContent = "Delete Review";
                   reviewItem.appendChild(deleteLink);

                   
                   const reviewDate = document.createElement('p');
                   reviewDate.textContent = "Date: " + review.rdate;
                   reviewItem.appendChild(reviewDate);

                  
                   const reviewRating = document.createElement('p');
                   reviewRating.textContent = "Rating: " + review.rating + " / 5";
                   reviewItem.appendChild(reviewRating);

                  
                   const reviewContext = document.createElement('p');
                   reviewContext.textContent = review.rcontext;
                   reviewItem.appendChild(reviewContext);

                   
                   reviewsContainer.appendChild(reviewItem);
   	        });
   	    }
   	};
   	xhr.send();
  }
</script>

</body>
</html>
