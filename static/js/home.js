window.addEventListener("DOMContentLoaded", () => {
	if (document.getElementById("sideNav")) {
		new bootstrap.ScrollSpy(document.body, {
			target: "#sideNav",
			rootMargin: "0px 0px -40%",
		});
	}

	const navbarToggler = document.querySelector(".navbar-toggler");
	if (!navbarToggler) return;

	document.querySelectorAll("#navbarResponsive .nav-link").forEach((link) => {
		link.addEventListener("click", () => {
			if (window.getComputedStyle(navbarToggler).display !== "none") {
				navbarToggler.click();
			}
		});
	});
});
