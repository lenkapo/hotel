<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @author      Luqman Aly Razak youngsta446@gmail.com
 */

class Data_room extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Model', 'Alus_items');
    }

    public function index()
    {
        if ($this->alus_auth->logged_in()) {
            $title_head = "Data Room";
            $head['title'] = $title_head;
            $data['title_head'] = $title_head;

            $this->load->view('template/temaalus/header', $head);
            $this->load->view('index', $data);
            $this->load->view('template/temaalus/footer');
        } else {
            redirect('admin/login', 'refresh');
        }
    }

    /*AJAX LIST*/
    public function ajax_list()
    {
        $list = $this->Alus_items->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $person) {
            $no++;
            $row = array();
            $row[] = $no;
            $row[] = '<img src="' . base_url('assets/data_img_hotel/') . $person->main_image . '" width="200px" height="auto">';
            $row[] = $person->name;
            $row[] = $person->deskripsi;
            $row[] = $person->price;
            $row[] = $person->amenities;
            $row[] = $person->bed;
            $row[] = $person->capacity;
            if ($person->is_active) {
                $row[] = "<span class='label label-success'>Tersedia</span>";
            } else {
                $row[] = "<span class='label label-danger'>Tidak Tersedia</span>";
            }
            $row[] = "<a href='javascript:' onClick='btn_modal_edit(" . $person->id . ")' data-toggle='tooltip' data-placement='bottom' title='Edit' class='btn btn-xs btn-flat btn-primary' style='background:#00897b'><i class='fa fa-edit'></i> Edit</a>" . "<a href='javascript:' onClick='btn_modal_delete(" . $person->id . ")' data-toggle='tooltip' data-placement='bottom' title='Delete' class='btn btn-xs btn-flat btn-danger'><i class='fa fa-trash'></i> Delete</a>";
            //add html for action
            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->Alus_items->count_all(),
            "recordsFiltered" => $this->Alus_items->count_filtered(),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
    }

    function modal_add()
    {
        $data['title'] = "Tambah Data Room";
        $this->load->view('ajax/modal_add', $data, FALSE);
    }

    function modal_edit($id)
    {
        $data['data'] = $this->Alus_items->getid($id);
        $data['title'] = "Edit Data Room";
        $this->load->view('ajax/modal_edit', $data, FALSE);
    }

    /*ACTION*/

    function save()
    {
        $data = array(
            'name' => $this->input->post('name'),
            'deskripsi' => $this->input->post('deskripsi'),
            'price' => $this->input->post('price'),
            'amenities' => $this->input->post('amenities'),
            'bed' => $this->input->post('bed'),
            'capacity' => $this->input->post('capacity'),
            'is_active' => $this->input->post('is_active'),
        );

        if (isset($_FILES['main_image']) && $_FILES['main_image']['name'] != '') {
            //--upload
            $upload = $this->_do_upload('main_image'); // Meneruskan 'main_image' ke fungsi upload
            $m_file = $upload;

            // Simpan nama file hasil upload ke database dengan kolom 'main_image'
            $data['main_image'] = $m_file;
        }

        $q = $this->Alus_items->save($data);
        if ($q) {
            $output = array(
                "status" => true,
                "message" => "Berhasil",
            );
        } else {
            $output = array(
                "status" => false,
                "message" => "Gagal Simpan",
            );
        }

        //output to json format
        echo json_encode($output);
    }


    function edit()
    {
        $data = array(
            'name' => $this->input->post('name'),
            'deskripsi' => $this->input->post('deskripsi'),
            'price' => $this->input->post('price'),
            'amenities' => $this->input->post('amenities'),
            'bed' => $this->input->post('bed'),
            'capacity' => $this->input->post('capacity'),
            'is_active' => $this->input->post('is_active'),
        );

        if ($_FILES['main_image']['name'] != '') {
            /*cek jika file lama ada, maka hapus */
            if ($this->input->post('main_image') != "") {
                if (file_exists('./assets/data_img_hotel/' . $this->input->post('userfile_lama'))) {
                    unlink('assets/data_img_hotel/' . $this->input->post('userfile_lama'));
                }
            }
            /*cek*/

            //--upload
            $upload = $this->_do_upload('main_image');
            $m_file = $upload;

            $data['main_image'] = $m_file;
        }

        $q = $this->Alus_items->edit($data);
        if ($q) {
            $output = array(
                "status" => true,
                "message" => "Berhasil",
            );
        } else {
            $output = array(
                "status" => false,
                "message" => "Gagal Simpan",
            );
        }

        //output to json format
        echo json_encode($output);
    }

    function delete($id)
    {
        $this->db->where('id', $id);
        $dt_lama = $this->db->get('tipe_kamar');

        if ($dt_lama->num_rows() > 0) {
            if (file_exists('./assets/data_img_hotel/' . $dt_lama->row()->main_image)) {
                unlink('assets/data_img_hotel/' . $dt_lama->row()->main_image);
            }
        }

        $q = $this->Alus_items->delete($id);
        if ($q) {
            $output = array(
                "status" => true,
                "message" => "Berhasil",
            );
        } else {
            $output = array(
                "status" => false,
                "message" => "Gagal",
            );
        }

        //output to json format
        echo json_encode($output);
    }

    private function _do_upload($key)
    {
        $config['upload_path']          = './assets/data_img_hotel';
        $config['allowed_types']        = '*';
        $config['max_size']             = 10000; //set max size allowed in Kilobyte
        $config['file_name']            = round(microtime(true) * 100); //just milisecond timestamp fot unique name

        $this->load->library('upload', $config);

        if (!$this->upload->do_upload($key)) //upload and validate
        {
            echo json_encode(array("status" => FALSE, "msg" => $this->upload->display_errors('', '')));

            exit();
        } else {
            $gbr = $this->upload->data();
            //Compress Image
            $config['image_library'] = 'gd2';
            $config['source_image'] = './assets/data_img_hotel' . $gbr['file_name'];
            $config['create_thumb'] = FALSE;
            $config['maintain_ratio'] = FALSE;
            $config['quality'] = '100%';
            $config['width'] = 400;
            $config['height'] = 600;
            $config['new_image'] = './assets/data_img_hotel' . $gbr['file_name'];
            $this->load->library('image_lib', $config);
            $this->image_lib->resize();
            return $gbr['file_name'];
        }
    }

    private function _do_upload_movie($key)
    {
        $config['upload_path']          = './assets/data_img_hotel';
        $config['allowed_types']        = '*';
        $config['max_size']             = 100000000000; //set max size allowed in Kilobyte
        $config['file_name']            = "Hotel_" . round(microtime(true) * 100); //just milisecond timestamp fot unique name

        $this->load->library('upload', $config);

        if (!$this->upload->do_upload($key)) //upload and validate
        {
            echo json_encode(array("status" => FALSE, "msg" => $this->upload->display_errors('', '')));

            exit();
        } else {
            $gbr = $this->upload->data();
            return $gbr['file_name'];
        }
    }
}

/* Location: ./application/modules/X/controllers/X.php */
/* End of file X.php */
