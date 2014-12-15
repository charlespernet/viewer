$(document).ready(function() {
  if ($('#new_event').length > 0) {
    var $select = $('#event_building');
    var $all_options = $select.find('option');

    $('#event_category').on('change', function() {
      var category = $(this).val();
      if (category == 'economy') {
        $('#eco').removeClass("hidden");
      }
    });

    var show_buildings = function() {
      var $options;
      $select.empty();
      race_id = $('.update_race').find('option:selected').data('race')
      if (race_id) {
        $options = $all_options.filter(function() {
          return $(this).data('race') == race_id
        })
        $select.html($options);
      } else {
        $select.html("<option>Select a player first</option>");
      }
    }
    show_buildings();
    $('.update_race').on('change', show_buildings);
  }


});
