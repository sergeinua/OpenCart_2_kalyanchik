<?php if ($modules) { ?>
<column id="column-left" class="col-sm-3 hidden-xs">
	<button type="button" id="close-offcanvas" class="btn-link" href="" role="button">
        ×
	</button>
  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
</column>
<?php } ?>