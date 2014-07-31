<?php
class ModelDesignLayout extends Model {	

                
                public function getLayoutForAllPages()
                {
                    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout
                        WHERE LOWER(name) like '%all pages%'
                        LIMIT 1");
                    if ($query->num_rows) {
                        return $query->row['layout_id'];
                    } else {
                        $sql = "INSERT INTO ".DB_PREFIX."layout SET `name`='All Pages'";
                        $query = $this->db->query( $sql );
                        $layout_id = $this->db->getLastId();
                        return $layout_id;
                    }
                    return 0;
                }
                
            
	public function getLayout($route) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout_route WHERE '" . $this->db->escape($route) . "' LIKE CONCAT(route, '%') AND store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY route DESC LIMIT 1");
		
		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return 0;	
		}
	}
}
?>