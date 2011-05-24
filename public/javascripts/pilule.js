$(document).ready(function() {

  // On cache la liste des paramètres au départ
  $('#accordion').hide();
  
  // On affiche la liste des paramètres lorsqu'on clique sur le bouton adéquat
  $('#bouton-parametres').click(function() {
    $('#accordion').toggle();
  });

	$('#accordion list-divider').click(function() {
		$(this).next().toggle();
		return false;
	}).next().hide();
  
  // On affiche la carte lorsqu'on clique sur le bouton adéquat
  $("#bouton-carte").click(function() {
  
    // On vérifie que l'url est au bon format
    if (window.location.pathname.match("^/campuses(/[0-9]+/batiments(/[0-9]+)?)?$") != null)
    {
      // Si oui, on ajoute '/carte' à la fin de l'url
      window.location = window.location.pathname + '/carte';
    }
    else
    {
      // Sinon on désactive le bouton Carte
      $(this).attr("disabled", "disabled");
    }
  });
});
