//= require jquery.nestable.js
//= require_self

$(document).ready ->
  $tree_nodes = $('#tree_nodes')
  $tree_nodes_options = {}
  $tree_nodes_max_depth = $tree_nodes.data('max-depth')

  if $tree_nodes_max_depth && $tree_nodes_max_depth != 'false'
    $tree_nodes_options['maxDepth'] = $tree_nodes_max_depth

  $tree_nodes
    .nestable( $tree_nodes_options )
    .on
      change: (event) ->
        $this = $(this)
        serialized_tree = $this.nestable('serialize')

        $.ajax
          url: $this.data('update-path'),
          type: 'POST',
          data:
            tree_nodes: serialized_tree
          complete: (event, XMLHttpRequest, ajaxOptions) ->
            console.dir event
            console.dir XMLHttpRequest
            console.dir ajaxOptions