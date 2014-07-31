<div class="box well">
  		<div class="box-heading breadcrumb">
		  	<h5 class="visible-desktop"><?php echo $heading_title; ?></h5>
		  	<a class="btn btn-navbar hidden-desktop" data-target=".nav-categories" data-toggle="collapse">
		  		<span class="icon icon-align-justify"></span> <?php echo $heading_title; ?>
			</a>
		  </div>
  		<div class="box-category box-content">
      			<ul class="nav nav-tabs nav-collapse collapse nav-categories">
        		<?php foreach ($categories as $category) { ?>
        			<li>
					<i class="icon-chevron-right"></i>
          			<?php if ($category['category_id'] == $category_id) { ?>
          				<a href="<?php echo $category['href']; ?>" class="active">
          					<?php echo $category['name']; ?>
          					<?php if ($category['children']) { ?>
          					<span class="icon icon-white icon-align-justify pull-right cat-toggle"></span>
          					<?php } ?>
          				</a>
          			<?php } else { ?>
          				<a href="<?php echo $category['href']; ?>">
          					<?php echo $category['name']; ?>
          					<?php if ($category['children']) { ?>
          					<span class="icon icon-white icon-align-justify pull-right cat-toggle"></span>
          					<?php } ?>
          				</a>
          			<?php } ?>
          			<?php if ($category['children']) { ?>
          				<ul class="nav nav-pills" style="display: none;">
            			<?php foreach ($category['children'] as $child) { ?>
            				<li>
              				<?php if ($child['category_id'] == $child_id) { ?>
              					<a href="<?php echo $child['href']; ?>" class="active"> - <?php echo $child['name']; ?></a>
              					<?php } else { ?>
              					<a href="<?php echo $child['href']; ?>"> - <?php echo $child['name']; ?></a>
              				<?php } ?>
            				</li>
            			<?php } ?>
          				</ul>
          			<?php } ?>
        			</li>
        		<?php } ?>
      			</ul>
  		</div>
</div>
