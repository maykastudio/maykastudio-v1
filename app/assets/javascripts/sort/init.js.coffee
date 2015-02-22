$ ->
  $('.js-sortable').sortable(
    connectWith: '.js-connected-sortable'
    placeholder: 'col-lg-4 sortable-placeholder'

    update: (event, ui) ->
      $this = $(this)
      $.post($this.data('sort-url'), $this.sortable('serialize'))
  ).disableSelection()
  return
