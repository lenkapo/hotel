<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Reservasi_model extends CI_Model
{
    protected $table = 'reservasi';  // sesuaikan nama tabel Anda

    public function generate_kode_reservasi()
    {
        return 'RES' . strtoupper(uniqid());
    }

    public function simpan_reservasi($data_reservasi, $data_detail = [])
    {
        $this->db->trans_begin();

        // Insert reservasi
        $this->db->insert($this->table, $data_reservasi);
        $reservasi_id = $this->db->insert_id();
        if (!$reservasi_id) {
            $this->db->trans_rollback();
            return false;
        }

        // Jika ada data detail, simpan detail
        if (!empty($data_detail)) {
            // misal tabel detail_reservasi
            $data_detail['reservasi_id'] = $reservasi_id;
            $this->db->insert('detail_reservasi', $data_detail);
            if ($this->db->affected_rows() < 1) {
                $this->db->trans_rollback();
                return false;
            }
        }

        $this->db->trans_commit();
        return $reservasi_id;
    }

    public function get_booking($id)
    {
        return $this->db->get_where($this->table, ['id' => $id])->row();
    }
}
