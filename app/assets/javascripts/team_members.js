// $(document).ready(function() {
//   console.log("ready!");
//   // display appropriate forms on page load
//   if ($('#team_member_role').val() == 1 || $('#team_member_role').val() == 2) {
//     $('.team_member_image').hide();
//   } else if ($('#team_member_role').val() == 3) {
//     $('.team_member_blurb, .team_member_image').hide();
//   } else if ($('#team_member_role').val() == 4) {
//     $('.team_member_blurb, .team_member_image, .team_member_link').hide();
//   } else if ($('#team_member_role').find(":selected").text() == "") {
//     $('.team_member_blurb, .team_member_image, .team_member_link').hide();
//   }

//   // change fields appropriately when dropdown is changed
//   $("#team_member_role").change(function() {
//      if($(this).val() == 0) { // head honcho
//       $('.team_member_blurb, .team_member_image, team_member_link').show();
//     } else if ($(this).val() == 1  || $(this).val() == 2) { // advisory board or young ambassador
//       $('.team_member_blurb, .team_member_link').show();
//       $('.team_member_image').hide();
//     } else if ($(this).val() == 3) { // designer
//       $('.team_member_link').show();
//       $('.team_member_blurb, .team_member_image').hide();
//     } else if ($(this).val() == 4) { // volunteer
//       $('.team_member_blurb, .team_member_image, .team_member_link').hide();
//     } else if ($(this).find(":selected").text() == "") {
//       $('.team_member_blurb, .team_member_image, .team_member_link').hide();
//     }
//   });

//   // prevent multiple images being added
//   $("#add_image_team_member").click(function() {
//     $("#add_image_team_member").hide();
//   });
// });

// give the option of adding a photo when 'remove' is clicked
// JS written this way b/c gem interferes with the remove link
$(document).on('nested:fieldRemoved', function(event) {
  $("#add_image_team_member").show();
});