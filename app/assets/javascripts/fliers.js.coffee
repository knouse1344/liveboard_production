# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

jQuery ->

  $('#flier_start_time').datetimepicker({
  dateFormat: 'mm-d-yy',
  ampm: true,
  minDate: 0,
  stepMinute: 5,
  separator: ' @ '
  })
