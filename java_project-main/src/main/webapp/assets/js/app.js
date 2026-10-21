// BEAST LIFE — Interactive Client Logic
document.addEventListener("DOMContentLoaded", function () {
    // Client-side quick filter
    document.querySelectorAll("[data-search]").forEach(function (input) {
        var target = document.querySelector(input.dataset.search);
        if (!target) return;
        input.addEventListener("input", function () {
            var q = input.value.toLowerCase().trim();
            target.querySelectorAll("[data-search-item]").forEach(function (item) {
                item.style.display = item.textContent.toLowerCase().includes(q) ? "" : "none";
            });
        });
    });

    // Confirmation dialogs
    document.querySelectorAll("[data-confirm]").forEach(function (el) {
        el.addEventListener("click", function (e) {
            if (!confirm(el.dataset.confirm)) e.preventDefault();
        });
    });

    // Sticky nav elevation on scroll
    var nav = document.querySelector(".nav-header");
    if (nav) {
        window.addEventListener("scroll", function () {
            if (window.scrollY > 20) {
                nav.style.borderBottomColor = "rgba(255, 255, 255, 0.22)";
                nav.style.background = "rgba(7, 7, 7, 0.96)";
            } else {
                nav.style.borderBottomColor = "rgba(255, 255, 255, 0.12)";
                nav.style.background = "rgba(7, 7, 7, 0.92)";
            }
        });
    }
});