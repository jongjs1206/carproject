// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable({
  	lengthMenu: [15, 25, 50, 100],
  	lengthChange: false,
  	info: false,
  	ordering: false,
  	});
});
