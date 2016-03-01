ready =->
		$('#users').dataTable({"aoColumnDefs": [{ 'bSortable': false, 'aTargets': [ 2,3,4] }]});

		changeUserRole = ()->
				$('.user-role').on 'change',()->
					input_id=$(this).attr('id')
					role=$(this).val()
					user_id=input_id.split('_').reverse()[0]
					url="/static_pages/#{user_id}/change_role"

					$.ajax
						url: url
						type: 'GET'
						data: {user: {role: role}}
						success: () ->
							alert('updated')

		changeUserRole()
$(document).ready(ready)
$(document).on('page:load',ready)