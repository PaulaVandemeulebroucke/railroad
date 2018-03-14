function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var offerAddress = document.getElementById('offer_address');

    if (offerAddress) {
      var autocomplete = new google.maps.places.Autocomplete(offerAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(offerAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
