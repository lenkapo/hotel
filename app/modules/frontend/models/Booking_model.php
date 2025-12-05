<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Booking_model extends CI_Model
{
    protected $table = 'bookings';  // ubah kalau tabel Anda beda

    public function create_booking($data_reservasi)
    {
        $this->db->trans_start();

        $this->db->insert('reservasi', $data_reservasi);
        // optionally insert detail / tamu

        $this->db->trans_complete();

        if ($this->db->trans_status() === FALSE) {
            // rollback & error
        } else {
            // sukses
        }
    }
}
