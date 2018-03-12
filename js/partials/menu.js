window.addEventListener("load", function(event) {
    //image lzayload
    observer = lozad(); // lazy loads elements with default selector as '.lozad'
    observer.observe();

    // menu elements
    categoryDropdownToggle = '[data-dropdown-id="categories-dropdown"]';
    menuContainer = document.getElementById("menuCategories");
    menuButton = document.getElementById("nav-menu-categories__link");
    menuButton.addEventListener("click", toggleMenu);
    // window.addEventListener("click", hideMenu);

  });


function toggleMenu() {
    event.preventDefault();
    menuButton.classList.toggle("is_open");
    menuContainer.classList.toggle("is_open");
}

function hideMenu() {
    menuButton.classList.remove("is_open");
    menuContainer.classList.remove("is_open");
}