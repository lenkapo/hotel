<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Controller: Beranda
 * Author: Maulana Rahman (refactored)
 * Deskripsi: Menangani halaman utama, detail kamar, dan tampilan fasilitas hotel.
 */

class Beranda extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model(['Beranda_model', 'Kamar_model', 'Reservasi_model', 'Gallery_model']);
		$this->load->helper(['url', 'form']);
		$this->load->library(['session', 'form_validation']);
	}

	/**
	 * Halaman utama website (beranda)
	 */
	public function index()
	{
		// ambil layanan
		$extra_services = $this->Beranda_model->get_all_extra_services();

		// ambil fitur layanan
		foreach ($extra_services as $s) {
			$s->fitur = $this->Beranda_model->get_features_by_service($s->id);
		}

		$data = [
			'title' => 'Beranda',
			'all_tipe_kamar' => $this->Beranda_model->get_all_tipe_kamar_with_features(),
			'all_amenities' => $this->Beranda_model->get_all_amenities_by_hotel(1),
			'room_min_price' => $this->Beranda_model->get_min_room_price(),
			'extra_services' => $extra_services,   // ⬅ FIX paling penting
			'testimonials' => $this->Beranda_model->get_testimonials()
		];

		$this->_load_template('beranda', $data);
	}


	/**
	 * Detail fasilitas hotel
	 * @param int $id_amenity
	 */
	public function facilities($id_amenity)
	{
		$amenity = $this->Beranda_model->get_amenity_details($id_amenity);
		if (!$amenity) {
			show_404();
			return;
		}

		$data = [
			'title' => "{$amenity->nama_amenity} - Detail Fasilitas",
			'amenity_detail' => $amenity,
			'featured_amenities' => $this->Beranda_model->get_other_amenities($id_amenity, 4),
			'facilities' => $this->Beranda_model->get_all_facilities()
		];

		$this->_load_template('facilities', $data);
	}

	/**
	 * Halaman restoran
	 */
	public function restaurant()
	{
		$data = [
			'title' => 'Restaurant',
			'menus' => $this->Beranda_model->get_all_menus(),
			'testimonials' => $this->Beranda_model->get_testimonials()
		];

		// Proses form booking meja
		if ($this->input->post('book_table')) {
			$this->_submit_booking();
		}

		$this->_load_template('restaurant', $data);
	}

	/**
	 * Form reservasi kamar
	 * @param string|null $no_kamar
	 */
	public function reserve($no_kamar = NULL)
	{
		$search_data = $this->session->userdata('search_data');
		if (!$search_data || !$no_kamar) {
			redirect('booking');
		}

		$room_details = $this->Kamar_model->get_kamar_details_by_no($no_kamar);
		if (!$room_details) {
			show_404();
		}

		$arrival = new DateTime($search_data['arrival']);
		$leave = new DateTime($search_data['leave']);
		$durasi = max($arrival->diff($leave)->days, 1);

		$data = [
			'title' => 'Lengkapi Detail Reservasi',
			'no_kamar' => $no_kamar,
			'room' => $room_details,
			'search_data' => $search_data,
			'durasi' => $durasi,
			'total_harga' => $durasi * $room_details->harga_per_malam
		];

		$this->_load_template('booking/form_reservasi', $data);
	}

	/**
	 * Proses penyimpanan reservasi
	 */
	public function process_reserve()
	{
		$this->form_validation->set_rules('nama_tamu', 'Nama Lengkap', 'required');
		$this->form_validation->set_rules('email', 'Email', 'required|valid_email');
		$this->form_validation->set_rules('no_telp', 'Nomor Telepon', 'required|numeric');

		$no_kamar = $this->input->post('no_kamar', TRUE);
		if ($this->form_validation->run() == FALSE) {
			$this->session->set_flashdata('error', validation_errors());
			redirect('beranda/reserve/' . $no_kamar);
		}

		// Ambil input
		$data_tamu = [
			'nama_tamu' => $this->input->post('nama_tamu', TRUE),
			'email'     => $this->input->post('email', TRUE),
			'no_telp'   => $this->input->post('no_telp', TRUE),
			'alamat'    => $this->input->post('alamat', TRUE)
		];

		$data_reservasi = [
			'kode_reservasi'    => $this->Reservasi_model->generate_kode_reservasi(),
			'tgl_reservasi'     => date('Y-m-d H:i:s'),
			'check_in_date'     => $this->input->post('arrival_date', TRUE),
			'check_out_date'    => $this->input->post('leave_date', TRUE),
			'total_biaya'       => $this->input->post('total_harga', TRUE),
			'status_reservasi'  => 'Pending'
		];

		$data_detail = [
			'no_kamar'             => $no_kamar,
			'jumlah_dewasa'        => $this->input->post('adults', TRUE),
			'jumlah_anak'          => $this->input->post('children', TRUE),
			'harga_saat_reservasi' => $this->input->post('harga_per_malam', TRUE)
		];

		// Simpan data ke DB via model
		$id_reservasi = $this->Beranda_model->simpan_reservasi($data_tamu, $data_reservasi, $data_detail);

		if ($id_reservasi) {
			$this->session->set_flashdata('success', 'Reservasi berhasil! Kode Anda: ' . $data_reservasi['kode_reservasi']);
			redirect('booking/confirmation/' . $data_reservasi['kode_reservasi']);
		} else {
			$this->session->set_flashdata('error', 'Reservasi gagal, coba lagi.');
			redirect('booking');
		}
	}

	/**
	 * Detail kamar
	 * @param int $id
	 */
	public function details($id = 1)
	{
		$room = $this->Beranda_model->get_room_detail($id);
		if (!$room) {
			show_404();
		}

		$room->gallery = $this->Beranda_model->get_room_gallery($id);
		$room->cover_image = !empty($room->main_image)
			? [(object)['image_path' => 'assets/hotel/hote_img/' . $room->main_image, 'caption' => $room->name . ' Cover Image']]
			: [];

		$data = [
			'title' => "Detail Kamar: " . $room->name,
			'room' => $room,
			'room_price' => number_format($room->price, 2, '.', ','),
			'amenities' => !empty($room->amenities) ? explode(',', $room->amenities) : []
		];

		$this->_load_template('room_detail', $data);
	}

	public function room()
	{
		$data = [
			'title' => 'Beranda',
			'all_tipe_kamar' => $this->Beranda_model->get_all_tipe_kamar_with_features(),
			'all_amenities' => $this->Beranda_model->get_all_amenities_by_hotel(1),
			'room_min_price' => $this->Beranda_model->get_min_room_price(),
		];
		$this->_load_template('room', $data);
	}

	// Halaman galeri
	public function gallery()
	{
		$data = [
			'title' => 'Gallery',
			'all_gallery' => $this->Gallery_model->get_all_gallery()
		];
		$this->_load_template('gallery', $data);
	}
	/**
	 * Helper untuk memuat template (header + footer)
	 */
	private function _load_template($view, $data = [])
	{
		$this->load->view('frontend/header', $data);
		$this->load->view($view, $data);
		$this->load->view('frontend/footer');
	}
	/**
	 * Halaman daftar kamar
	 */
}
