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
		$this->load->model([
			'Beranda_model',
			'Kamar_model',
			'Reservasi_model',
			'Gallery_model',
			'Post_model',
			'Category_model',
			'User_model',
			'Comment_model',
			'Booking_model'
		]);
		$this->load->helper(['url', 'form', 'text']);
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
	public function details($id)
	{
		$room = $this->Beranda_model->get_room_detail($id);

		if (!$room) {
			show_404();
		}

		$room->gallery = $this->Beranda_model->get_room_gallery($id);

		$room->cover_image = !empty($room->main_image)
			? [(object)[
				'file_name' => $room->main_image,          // hanya nama file
				'caption'   => $room->name . ' Cover Image'
			]]
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
	 * Halaman Blog - daftar artikel
	 */
	public function blog()
	{
		// pagination setup
		$this->load->library('pagination');

		$config['base_url'] = site_url('beranda/blog');
		$config['total_rows'] = $this->Post_model->count_posts();
		$config['per_page'] = 5;
		$config['uri_segment'] = 3;

		// bootstrap style pagination
		$config['full_tag_open'] = '<ul class="pagination justify-content-center">';
		$config['full_tag_close'] = '</ul>';

		$config['cur_tag_open'] = '<li class="page-item active"><span class="page-link">';
		$config['cur_tag_close'] = '</span></li>';

		$config['num_tag_open'] = '<li class="page-item"><span class="page-link">';
		$config['num_tag_close'] = '</span></li>';

		$config['next_tag_open'] = '<li class="page-item"><span class="page-link">';
		$config['next_tag_close'] = '</span></li>';

		$config['prev_tag_open'] = '<li class="page-item"><span class="page-link">';
		$config['prev_tag_close'] = '</span></li>';

		$this->pagination->initialize($config);

		$page = $this->uri->segment(3, 0);

		$data = [
			'title'         => 'Blog Classic',
			'posts'         => $this->Post_model->get_all_posts($config['per_page'], $page),
			'categories'    => $this->Category_model->get_all_categories(),
			'recent_posts'  => $this->Post_model->get_recent_posts(5),
			'admin'         => $this->User_model->get_admin_profile(),
			'post_count' => $this->Post_model->count_posts(),
			'popular' => $this->Post_model->get_popular_posts(5),
			'popular_tags'  => $this->Post_model->get_popular_tags(10),
			'paging'        => $this->pagination->create_links()
		];

		$this->_load_template('blog', $data);
	}

	/**
	 * Halaman Detail Blog
	 */
	public function blog_detail($slug)
	{
		$post = $this->Post_model->get_post_by_slug($slug);
		$comments = $this->Comment_model->get_comments($post->id);

		if (!$post) {
			show_404();
			return;
		}

		$data = [
			'title'         => $post->title,
			'post'          => $post,
			'categories'    => $this->Category_model->get_all_categories(),
			'recent_posts'  => $this->Post_model->get_recent_posts(5),
			'comments'      => $comments,
			'popular' => $this->Post_model->get_popular_posts(5),
			'popular_tags'  => $this->Post_model->get_popular_tags(10),
			'quotes'        => $this->Post_model->get_quotes(1),
			'topics'        => $this->Post_model->get_top_topics(10),
		];

		$this->_load_template('blog_detail', $data);
	}
	public function add_comment()
	{
		$post_id = $this->input->post('post_id');
		$slug    = $this->input->post('slug'); // slug dikirim dari form
		$name    = $this->input->post('name');
		$email   = $this->input->post('email');
		$comment = $this->input->post('comment');

		$this->load->model('Comment_model');

		$this->Comment_model->insert_comment([
			'post_id'     => $post_id,
			'name'        => $name,
			'email'       => $email,
			'comment'     => $comment,
			'created_at'  => date('Y-m-d H:i:s')
		]);

		redirect('blog_detail/' . $this->input->post('slug'), 'refresh');
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
	 * Halaman proses booking
	 */

	public function process_room_booking()
	{
		// 1. Simpan data tamu dulu
		$data_tamu = [
			'nama_tamu'     => $this->input->post('customer_name', TRUE),
			'email'    => $this->input->post('customer_email', TRUE),
			'no_telp'  => $this->input->post('customer_phone', TRUE),
			'alamat'   => $this->input->post('customer_address', TRUE),
		];
		$this->db->insert('tamu', $data_tamu);
		$tamu_id = $this->db->insert_id();
		// Atur rules validasi
		$this->form_validation->set_rules('room_id',         'Room ID',       'required|integer');
		$this->form_validation->set_rules('check_in_date',   'Check In Date',  'required');
		$this->form_validation->set_rules('check_out_date',  'Check Out Date', 'required');
		$this->form_validation->set_rules('customer_email',  'Email',         'required|valid_email');
		$this->form_validation->set_rules('guest_count',     'Jumlah Tamu',   'required|integer|greater_than[0]');

		if ($this->form_validation->run() === FALSE) {
			// Jika validasi gagal ➜ redirect kembali ke form
			$this->session->set_flashdata('error', validation_errors());
			redirect($_SERVER['HTTP_REFERER']);
			return;
		}

		// Ambil data dari POST
		$room_id      = $this->input->post('room_id', TRUE);
		$room_name    = $this->input->post('room_name', TRUE);   // jika Anda kirim nama kamar
		$check_in_raw  = $this->input->post('check_in_date', TRUE);
		$check_out_raw = $this->input->post('check_out_date', TRUE);
		$check_in  = date('Y-m-d', strtotime($check_in_raw));
		$check_out = date('Y-m-d', strtotime($check_out_raw));
		$email        = $this->input->post('customer_email', TRUE);
		$guest_count  = (int) $this->input->post('guest_count', TRUE);

		// Validasi logika tanggal: check-out harus setelah check-in
		$d1 = new DateTime($check_in);
		$d2 = new DateTime($check_out);
		if ($d2 <= $d1) {
			$this->session->set_flashdata('error', 'Tanggal Check-Out harus setelah Check-In.');
			redirect($_SERVER['HTTP_REFERER']);
			return;
		}

		// Hitung durasi malam
		$interval = $d2->diff($d1);
		$nights = max($interval->days, 1);

		// Misalnya Anda punya harga kamar per malam — bisa Anda ambil dari model Kamar
		// Asumsi: Anda mengirimkan harga per malam lewat form atau Anda ambil dari DB
		$price_per_night = (float) $this->input->post('room_price', TRUE) ?? 0;
		$total_price = $price_per_night * $nights;

		// Siapkan data untuk tabel reservasi
		$data_reservasi = [
			'id_tamu' => $tamu_id ?? NULL, // jika Anda punya sistem user/tamu
			'kode_reservasi'   => $this->Reservasi_model->generate_kode_reservasi(),
			'tgl_reservasi'    => date('Y-m-d H:i:s'),
			'check_in_date'    => $check_in,
			'check_out_date'   => $check_out,
			'total_biaya'      => $total_price,
			'status_reservasi' => 'Pending'
		];

		// Siapkan data detail (jika Anda punya tabel detail_reservasi atau kolom tambahan)
		$data_detail = [
			'room_id'     => $room_id,
			'room_name'   => $room_name,
			'guest_count' => $guest_count,
			'price_per_night' => $price_per_night,
			'nights'         => $nights,
			'subtotal'         => $total_price,
		];

		// Simpan ke DB lewat model — dengan transaksi jika model mendukung
		$id_reservasi = $this->Reservasi_model->simpan_reservasi($data_reservasi, $data_detail);

		if ($id_reservasi) {
			$this->session->set_flashdata('success', 'Booking berhasil! Kode reservasi: ' . $data_reservasi['kode_reservasi']);
			redirect('booking/confirmation/' . $data_reservasi['kode_reservasi']);
		} else {
			$this->session->set_flashdata('error', 'Booking gagal — silakan coba lagi.');
			redirect($_SERVER['HTTP_REFERER']);
		}
	}
}
