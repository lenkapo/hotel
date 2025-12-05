<?php foreach ($data as $key => $room); ?>
<div class="modal-content">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title" id="myModalLabel"><?php echo $title; ?></h4>
  </div>
  <div class="modal-body">
    <!-- FORM -->
    <form id="form_edit">
      <input type="hidden" name="id" value="<?php echo $room->id; ?>" required>
      <input type="hidden" name="<?= $this->security->get_csrf_token_name(); ?>" value="<?= $this->security->get_csrf_hash(); ?>" />
      <!-- KONTEN -->
      <div class="form-group">
        <label>Room Name</label>
        <input type="text" class="form-control" name="name" value="<?= isset($room->name) ? htmlspecialchars($room->name) : '' ?>">
      </div>

      <div class="form-group">
        <label>Deskripsi</label>
        <textarea name="deskripsi" class="form-control" rows="10"><?= isset($room->deskripsi) ? htmlspecialchars($room->deskripsi) : '' ?></textarea>
      </div>

      <div class="form-group">
        <label>Harga</label>
        <input type="number" class="form-control" name="price" value="<?= isset($room->price) ? $room->price : '' ?>">
      </div>

      <div class="form-group">
        <label>Amenities</label>
        <input type="text" class="form-control" name="amenities" value="<?= isset($room->amenities) ? htmlspecialchars($room->amenities) : '' ?>">
      </div>

      <div class="form-group">
        <label>Capacity</label>
        <input type="number" class="form-control" name="capacity" min="0" max="10" value="<?= isset($room->capacity) ? $room->capacity : '' ?>">
      </div>

      <div class="form-group">
        <label>Tipe Kasur</label>
        <select name="bed" class="form-control">
          <?php $beds = ['Single Bed', 'Double Bed', 'Queen Bed', 'King Bed']; ?>
          <?php foreach ($beds as $b): ?>
            <option value="<?= $b ?>" <?= (isset($room->bed) && $room->bed === $b) ? 'selected' : '' ?>><?= $b ?></option>
          <?php endforeach; ?>
        </select>
      </div>

      <div class="form-group">
        <label>Gambar / Cover</label><br>
        <?php if (!empty($room->main_image)): ?>
          <img src="<?= base_url('assets/data_img_hotel/' . $room->main_image) ?>" alt="Cover" style="max-width:200px; margin-bottom:10px;"><br>
          <small>Kosongkan jika tidak ingin mengganti gambar.</small>
        <?php endif; ?>
        <input type="file" name="main_image">
      </div>

      <div class="form-group">
        <label>Status</label>
        <select name="is_active" class="form-control">
          <option value="1" <?= (isset($room->is_active) && $room->is_active == 1) ? 'selected' : '' ?>>Tersedia</option>
          <option value="0" <?= (isset($room->is_active) && $room->is_active == 0) ? 'selected' : '' ?>>Tidak Teredia</option>
        </select>
      </div>
      <hr>

      <!-- END KONTEN -->
    </form>
    <!-- END FORM -->
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    <button type="button" onClick="btn_save_edit()" class="btn btn-primary">Save changes</button>
  </div>
</div>