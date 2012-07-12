jQuery ->
  toggle_display =->
    if $('#lend_use_text').is(':checked')
      $('#select_friend').hide()
      $('#use_text_friend').show()
      $('option:selected').removeAttr('selected')
    else
      $('#use_text_friend').hide()
      $('#select_friend').show()

     
  $('#lend_use_text').click(toggle_display)
  $(document).ready(toggle_display)