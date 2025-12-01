<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Model: Beranda_model
 * Author: luqman Aly Razak (Refactored & Synchronized)
 * Deskripsi: Menangani data untuk halaman beranda, fasilitas hotel, dan restoran.
 */

class Beranda_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    /* ==========================================================
       BAGIAN 1. TIPE KAMAR / ROOM TYPES
       ========================================================== */

    /**
     * Ambil semua tipe kamar (tanpa fitur)
     * @return array
     */
    public function get_all_tipe_kamar()
    {
        return $this->db->order_by('price', 'ASC')
            ->get('tipe_kamar')
            ->result();
    }

    /**
     * Ambil semua tipe kamar dengan daftar fitur
     * @return array
     */
    public function get_all_tipe_kamar_with_features()
    {
        $this->db->select('k.id, k.name, k.price, k.main_image, k.deskripsi, GROUP_CONCAT(f.nama_fitur SEPARATOR ", ") AS fitur');
        $this->db->from('tipe_kamar k');
        $this->db->join('fitur_kamar fk', 'fk.id_tipe_kamar = k.id', 'left');
        $this->db->join('fitur f', 'f.id = fk.id_fitur', 'left');
        $this->db->group_by('k.id');
        $this->db->order_by('k.price', 'ASC');
        return $this->db->get()->result();
    }
    public function get_min_room_price()
    {
        $this->db->select_min('price');
        $query = $this->db->get('tipe_kamar');
        $result = $query->row();
        return $result ? $result->price : null;
    }

    /**
     * Ambil detail satu kamar
     * @param int $id
     */
    public function get_room_detail($id)
    {
        return $this->db->get_where('tipe_kamar', ['id' => $id])->row();
    }

    /**
     * Ambil galeri kamar
     * @param int $id_kamar
     */
    public function get_room_gallery($id_kamar)
    {
        return $this->db->get_where('galeri_kamar', ['id_kamar' => $id_kamar])->result();
    }


    /* ==========================================================
       BAGIAN 2. FASILITAS HOTEL / AMENITIES
       ========================================================== */

    /**
     * Ambil semua fasilitas hotel berdasarkan ID hotel
     * @param int $id_hotel
     */
    public function get_all_amenities_by_hotel($id_hotel)
    {
        return $this->db->get_where('amenities', ['id_hotel' => $id_hotel])->result();
    }

    /**
     * Ambil satu detail fasilitas berdasarkan ID
     * @param int $id
     */
    public function get_amenity_details($id)
    {
        return $this->db->get_where('amenities', ['id' => $id])->row();
    }

    /**
     * Ambil beberapa fasilitas lain untuk ditampilkan di “fasilitas terkait”
     * @param int $exclude_id
     * @param int $limit
     */
    public function get_other_amenities($exclude_id, $limit = 4)
    {
        $this->db->where('id !=', $exclude_id);
        $this->db->limit($limit);
        return $this->db->get('amenities')->result();
    }

    /**
     * Ambil semua fasilitas (misalnya untuk sidebar)
     */
    public function get_all_facilities()
    {
        return $this->db->get('amenities')->result();
    }


    /* ==========================================================
       BAGIAN 3. RESTAURANT & TESTIMONIALS
       ========================================================== */

    /**
     * Ambil semua menu restoran
     */
    public function get_all_menus()
    {
        return $this->db->order_by('harga', 'ASC')
            ->get('restaurant_menu')
            ->result();
    }

    /**
     * Ambil testimoni tamu (default 5 terbaru)
     * @param int $limit
     */
    public function get_testimonials($limit = 5)
    {
        return $this->db->order_by('created_at', 'DESC')
            ->limit($limit)
            ->get('testimonials')
            ->result();
    }
}
