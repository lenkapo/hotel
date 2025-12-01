<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Gallery_model extends CI_Model
{

    public function get_all_gallery()
    {
        return $this->db->order_by('id', 'ASC')->get('gallery')->result();
    }

    public function insert($data)
    {
        return $this->db->insert('gallery', $data);
    }

    public function delete($id)
    {
        return $this->db->delete('gallery', ['id' => $id]);
    }
}
