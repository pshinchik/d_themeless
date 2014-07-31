<?php
class ModelCatalogDMegaMenu extends Model {
	public function getItems($store_id=0){
		$result = array();

		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."dmm_items i LEFT JOIN " . DB_PREFIX ."dmm_description d ON (i.item_id = d.item_id)  WHERE  i.store_id = ".(int)$store_id . "  AND i.status = '1' AND d.language_id=".(int)$this->config->get('config_language_id')." ORDER BY  i.sort_order ASC");
		
		foreach ($query->rows as $row) {
			$row['menu_type_params'] =  unserialize($row['menu_type_params']);
			$result[] = $row;
		}

		return $result;
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
		
	public function getMenu($store_id=0){
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
 }
?>