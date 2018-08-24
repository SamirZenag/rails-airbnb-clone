function activeTab () {
  if (window.location.hash == '#%23profile') {
    $("#home-title").toggleClass("active");
    $("#bookings-title").toggleClass("active")
    $("#rentals-title").toggleClass("active")
    $("#home").toggleClass("active");
    $("#bookings").toggleClass("active")
    $("#rentals").toggleClass("active")
  };
}

export {activeTab};
