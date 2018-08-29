document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const addPlace = (event) => {
    event.preventDefault();
    const input = document.getElementsByClassName('favorite-input')[0];
    const newLi = document.createElement('li');
    newLi.innerText = input.value;

    const SFList = document.getElementById('sf-places');
    SFList.appendChild(newLi);
    input.value = '';
  }

  const faveForm = document.getElementById('sf-form');
  faveForm.addEventListener('submit', addPlace);


  // adding new photos

  // Toggling Hidden Class
  const toggleClass = (event) => {
    const photoForm = document.getElementsByClassName('photo-form-container')[0];
    if (photoForm.className.includes('hidden')) {
      photoForm.className = photoForm.className.split(' hidden').join('');
    } else {
      photoForm.className += ' hidden';
    }
  }

  const toggleButton = document.getElementsByClassName('photo-show-button')[0];
  toggleButton.addEventListener('click', toggleClass);

  // Actually adding the photos
  const addPhoto = (event) => {
    event.preventDefault();
    const input = document.getElementsByClassName('photo-url-input')[0];
    const newLi = document.createElement('li');
    const newImg = document.createElement('img');
    newImg.setAttribute('src', input.value);
    newLi.appendChild(newImg);

    const photoList = document.getElementsByClassName('dog-photos')[0];
    photoList.appendChild(newLi);
    input.value = '';
  }

  const photoForm = document.getElementsByClassName('photo-form-container')[0];
  photoForm.addEventListener('submit', addPhoto);

});
