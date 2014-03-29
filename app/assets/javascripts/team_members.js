$(document).ready(function() {
  if ($('#team_member_role').find(":selected").text() == "") {
    $('.team_member_blurb, .team_member_image, .team_member_link').hide();
  }

  $("#team_member_role").change(function() {
    console.log("change");
     if($(this).val() == 0) { // head honcho
      $('.team_member_blurb, .team_member_image, team_member_link').show();
    } else if ($(this).val() == 1  || $(this).val() == 2) { // advisory board or young ambassador
      $('.team_member_blurb, .team_member_link').show();
      $('.team_member_image').hide();
    } else if ($(this).val() == 3) { // designer
      $('.team_member_link').show();
      $('.team_member_blurb, .team_member_image').hide();
    } else if ($(this).val() == 4) { // volunteer
      $('.team_member_blurb, .team_member_image, .team_member_link').hide();
    } else if ($(this).find(":selected").text() == "") {
      $('.team_member_blurb, .team_member_image, .team_member_link').hide();
    }
  });

  
});