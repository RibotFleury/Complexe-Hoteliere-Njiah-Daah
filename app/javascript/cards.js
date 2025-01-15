document.addEventListener("turbo:load", function () {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add("visible");
      }
    });
  });

  const cardText = document.querySelectorAll(".card-text");
  cardText.forEach((el) => observer.observe(el));
});
