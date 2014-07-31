<?php
class ModelCatalogDMegaMenu extends Model {
	public function addItemMenu($data){
		foreach ($data as $item) {
			$this->db->query(" INSERT INTO " . DB_PREFIX . "dmm_items SET item_id = '" . (int)$item['category_id']."',  `status` = '" . (int)$item['status'] . "',   `parent_id` = '" . $this->db->escape($item['parent_id']) . "',  `store_id` = '" . (int)$this->config->get('config_store_id') . "' " );
			
		    $this->db->query(" INSERT INTO " . DB_PREFIX . "dmm_description SET item_id = '" . (int)$item['category_id']. "', `name` ='" . $this->db->escape($item['name']) . "',`description`='" . $this->db->escape($item['description']) . "', language_id = '" . (int)$item['language_id'] . "', `store_id` = '" . (int)$this->config->get('config_store_id') . "' ");
				
		}

	}

	 public function getCategories() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) WHERE  cd.language_id=".(int)$this->config->get('config_language_id')." ");

		return $query->rows;
	}

	public function getItem($id){
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."dmm_items i LEFT JOIN " . DB_PREFIX ."dmm_description d ON (i.item_id = d.item_id)  WHERE  i.item_id = " . (int)$id );
		
		foreach ($query->rows as $row) {
			$row['menu_type_params'] =  unserialize($row['menu_type_params']);
			$result[] = $row;

		}
		return $result;
	}

	public function getItems($store_id=0){
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."dmm_items i LEFT JOIN " . DB_PREFIX ."dmm_description d ON (i.item_id = d.item_id)  WHERE  i.store_id = ".(int)$store_id . " AND d.language_id=".(int)$this->config->get('config_language_id')." ORDER BY  i.sort_order ASC");
		
		return $query->rows;
	}

	public function getChildren($item_id,$tree){
		$result = array();

		foreach ($tree as $item) {
			if ($item['parent_id'] == $item_id) {
				$item['children'] = $this->getChildren($item['item_id'], $tree);
				$result[] = $item;
			}
		}
		return $result;
	}
		
	public function getTree($store_id=0){
		$result = array();

		$tree = $this->getItems($store_id);

		foreach ($tree as $item) {
			if ($item['parent_id'] == 0) {
				$item['children'] = $this->getChildren($item['item_id'], $tree);
				$result[] = $item;
			}
		}
		return $result;
	}

	public function saveMenu($data){
		$position = 1;
		foreach ($data as $item) {
			$this->db->query(" UPDATE " . DB_PREFIX . "dmm_items SET  `parent_id` = '" . $item['parentId'] . "', `sort_order` = '". $position ."' WHERE item_id= '". $item['menuId']. "'");
			$position++;
		}
	}

	public function addItem($data){
		$this->db->query(" INSERT INTO " . DB_PREFIX . "dmm_items SET  `parent_id` = '" . $this->db->escape($data['parent_id']) . "', `menu_type`='" . $data['d_mega_menu_type'] . "', `menu_type_params`='" . $this->db->escape(serialize($data['menu_type_params'])). "', `column_break` = '" .  (int)$data['column_break'] . "', `status` = '" . (int)$data['status'] . "', `color_text` = '" . $data['color_text'] . "', `font_size` = '" . $data['font_size'] . "', `color_background` = '" . $data['color_background'] . "', `font_family` = '" . $data['font_family'] . "', `font_weight` = '" . $data['font_weight'] . "', `store_id` = '" . (int)$this->config->get('config_store_id') . "' ");
		
		$item_id= $this->db->getLastId();

		$this->db->query(" INSERT INTO " . DB_PREFIX . "dmm_description SET item_id = '" . (int)$item_id . "', `name` ='" . $this->db->escape($data['dmm_description']['name']) . "',`description`='" . $this->db->escape($data['dmm_description']['description']) . "',language_id = '" . (int)$this->config->get('config_language_id') . "', `store_id` = '" . (int)$this->config->get('config_store_id') . "' ");
		
	}

	public function updateItemMenu($id, $data){
		
		$this->db->query(" UPDATE " . DB_PREFIX . "dmm_items  SET `parent_id` = '" . $this->db->escape($data['parent_id']) . "', `menu_type`='" . $data['d_mega_menu_type'] . "', `menu_type_params`='" . $this->db->escape(serialize($data['menu_type_params'])). "', `column_break` = '" . (int)$data['column_break'] . "', `status` = '" . (int)$data['status'] . "', `color_text` = '" . $data['color_text'] . "', `font_size` = '" . $data['font_size'] . "', `color_background` = '" . $data['color_background'] . "', `font_family` = '" . $data['font_family'] . "', `font_weight` = '" . $data['font_weight'] . "', `store_id` = '" . (int)$this->config->get('config_store_id') . "'  WHERE item_id = " . (int)$id);
		
		$this->db->query(" UPDATE " . DB_PREFIX . "dmm_description SET  `name` ='" . $this->db->escape($data['dmm_description']['name']) . "',`description`='" . $this->db->escape($data['dmm_description']['description']) . "',language_id = '" . (int)$this->config->get('config_language_id') . "', `store_id` = '" . (int)$this->config->get('config_store_id') . "'  WHERE item_id = " . (int)$id);
		
	}
	
	public function updateTree($data){
		$this->db->query(" UPDATE " . DB_PREFIX . "dmm_items SET  parent_id = '" . $data['parent_id'] . "' WHERE item_id=". $data['item_id']);
	}

	public function delete($id){
		$this->db->query(" DELETE FROM " . DB_PREFIX . "dmm_items WHERE item_id=".(int)$id);
		$this->db->query(" DELETE FROM " . DB_PREFIX . "dmm_description WHERE item_id=".(int)$id);
	 }

	public function installDMegaMenu(){
			$this->db->query(" CREATE TABLE  `".DB_PREFIX."dmm_description` (
				  `description_id` INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
				  `item_id` int(11) NOT NULL,
				  `name` varchar(255) NOT NULL,
				  `description` varchar(255) NOT NULL,
				  `language_id` int(11) NOT NULL,
				  `store_id` int(11) NOT NULL
				  ) ENGINE=MyISAM DEFAULT CHARSET=utf8;		
											
			      ");
			
			$this->db->query("	CREATE TABLE  `".DB_PREFIX."dmm_items` (
				  `item_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
				  `parent_id` int(11) NOT NULL DEFAULT '0',
				  `sort_order` int(5) NOT NULL,
				  `menu_type` varchar(10) DEFAULT 'category',
				  `menu_type_params` text NOT NULL DEFAULT '',
				  `column_break` tinyint(1) NOT NULL,
				  `status` tinyint(1) NOT NULL,
				  `color_text` varchar(10) NOT NULL DEFAULT '',
				  `font_size` varchar(10) NOT NULL DEFAULT '',
				  `color_background` varchar(10) NOT NULL DEFAULT '',
				  `font_family` varchar(10) NOT NULL DEFAULT '',
				  `font_weight` varchar(10) NOT NULL DEFAULT '',
				  `store_id` int(11) NOT NULL
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
			      ");
	
	}
	
	public function uninstallDMegaMenu(){
		$this->db->query("DROP TABLE " . DB_PREFIX . "dmm_items");
		$this->db->query("DROP TABLE " . DB_PREFIX . "dmm_description");

	}

	public function getCategoriesAutocomplete($data) {
		$sql = "SELECT * FROM ".DB_PREFIX."dmm_items i LEFT JOIN " . DB_PREFIX ."dmm_description d ON (i.item_id = d.item_id)  WHERE   d.language_id= '".(int)$this->config->get('config_language_id'). "'";
		
		if (!empty($data['filter_name'])) {
			$sql .= " AND d.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}				

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
		 
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
						
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
}
?>



