<div class="box">
  		<div class="box-heading breadcrumb">
		  	<h5 class="visible-desktop"><?php echo $heading_title; ?></h5>
		  	<a class="btn btn-navbar hidden-desktop" data-target=".nav-filters" data-toggle="collapse">
		  		<span class="icon icon-align-justify"></span> <?php echo $heading_title; ?>
			</a>
		  </div>
  <div class="box-content nav-collapse collapse nav-filters">
    <ul class="box-filter nav nav-tabs nav-stacked unstyled">
      <?php foreach ($filter_groups as $filter_group) { ?>
      <li><span id="filter-group<?php echo $filter_group['filter_group_id']; ?>"><h5><span class="icon icon-filter"></span> <?php echo $filter_group['name']; ?></h5></span>
        <ul class="unstyled">
          <?php foreach ($filter_group['filter'] as $filter) { ?>
          <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
          <li>
          	<label for="filter<?php echo $filter['filter_id']; ?>" class="checkbox">
            <input type="checkbox" value="<?php echo $filter['filter_id']; ?>" id="filter<?php echo $filter['filter_id']; ?>" checked="checked" />
            <?php echo $filter['name']; ?></label>
          </li>
          <?php } else { ?>
          <li>
          	<label for="filter<?php echo $filter['filter_id']; ?>" class="checkbox">
            <input type="checkbox" value="<?php echo $filter['filter_id']; ?>" id="filter<?php echo $filter['filter_id']; ?>" />
            <?php echo $filter['name']; ?></label>
          </li>
          <?php } ?>
          <?php } ?>
        </ul>
      </li>
      <?php } ?>
    </ul>
    <a id="button-filter" class="button"><span class="icon icon-white icon-filter"></span> <?php echo $button_filter; ?></a>
  </div>
</div>
<script type="text/javascript"><!--
$('#button-filter').bind('click', function() {
	filter = [];
	
	$('.box-filter input[type=\'checkbox\']:checked').each(function(element) {
		filter.push(this.value);
	});
	
	location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
//--></script> 
