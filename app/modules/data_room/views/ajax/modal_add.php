<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/temaalus/dist/css/bootstrap-datetimepicker.min.css">
<script src="<?php echo base_url(); ?>assets/temaalus/dist/js/bootstrap-datetimepicker.min.js"></script>
<div class="modal-content">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title" id="myModalLabel"><?= $title; ?></h4>
  </div>
  <div class="modal-body">
    <!-- FORM -->
    <form id="form_add" enctype="multipart/form-data">
      <!-- KONTEN -->
      <input type="hidden" name="<?= $this->security->get_csrf_token_name(); ?>" value="<?= $this->security->get_csrf_hash(); ?>" />
      <div class="form-group">
        <label>Room Name</label>
        <input type="text" class="form-control" name="name">
      </div>
      <div class="form-group">
        <label>Deskripsi</label>
        <textarea name="deskripsi" class="form-control" rows="10"></textarea>
      </div>
      <div class="form-group">
        <label>Harga</label>
        <input type="number" class="form-control" name="price">
      </div>
      <div class="form-group">
        <label>Amenities</label>
        <input type="text" class="form-control" name="amenities">
      </div>
      <div class="form-group">
        <label>Capacity</label>
        <input type="number" class="form-control" name="capacity" min="0" max="4">
      </div>
      <div class="form-group">
        <label>Tipe Kasur</label>
        <select name="bed" class="form-control">
          <option value=""><b>--- Pilih Tipe Kasur sesuaikan dengan Room --- </b></option>
          <option value="Single Bed"><b>Single Bed</b></option>
          <option value="Double Bed"><b>Double Bed</b></option>
          <option value="Queen Bed"><b>Queen Bed</b></option>
          <option value="King Bed"><b>King Bed</b></option>
        </select>
      </div>
      <div class="form-group">
        <div class="callout callout-warning">
          <p>Panduan Ukuran Gambar: L: 192px T: 270px</p>
        </div>
      </div>
      <div class="form-group">
        <label>Gambar</label>
        <input type="file" name="main_image">
      </div>
      <div class="form-group">
        <label>Status</label>
        <select name="is_active" class="form-control">
          <option value="1">Aktif</option>
          <option value="0">Tidak Aktif</option>
        </select>
      </div>
      <hr>
      <!-- END KONTEN -->
    </form>
    <!-- END FORM -->
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    <button type="button" onClick="btn_save_add()" class="btn btn-primary">Save changes</button>
  </div>
</div>