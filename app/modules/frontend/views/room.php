    <!-- Banner -->
    <section class="section-banner">
        <div class="row banner-image" style="background-image:url('<?= base_url("assets/img/hero/hero-section-2.jpg") ?>');">
            <div class=" banner-overlay"></div>
            <div class="banner-section">
                <div class="lh-banner-contain">
                    <h2>Room</h2>
                    <div class="lh-breadcrumb">
                        <h5>
                            <span class="lh-inner-breadcrumb">
                                <a href="<?= base_url(); ?>">Home</a>
                            </span>
                            <span> / </span>
                            <span>
                                <a href="javascript:void(0)">Room</a>
                            </span>
                        </h5>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner -->

    <!-- Rooms -->
    <section class="section-rooms bg-gray padding-tb-100">
        <div class="container">
            <div class="banner" data-aos="fade-up" data-aos-duration="2000" style="padding-bottom: 50px;">
                <h2>Choose Your Luxurious <span>Room</span></h2>
            </div>
            <div class="row mtb-m-12">
                <?php if (!empty($all_tipe_kamar)) : ?>
                    <?php foreach ($all_tipe_kamar as $room) : ?>
                        <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-duration="1500">
                            <div class="rooms-card">
                                <img src="<?= base_url('assets/img/room /' . $room->main_image); ?>" alt="<?= $room->name; ?>">
                                <div class="details">
                                    <h3><?= $room->name; ?></h3>
                                    <span>Rp <?= number_format($room->price, 0, ',', '.'); ?> / Night</span>
                                    <ul>
                                        <li><i class="ri-group-line"></i><?= $room->capacity; ?> Persons</li>
                                        <li><i class="ri-hotel-bed-line"></i><?= $room->bed; ?> Bed<?= $room->bed > 1 ? 's' : ''; ?></li>
                                        <?php if (!empty($room->amenities)) : ?>
                                            <?php
                                            $amenities = explode(',', $room->amenities);
                                            foreach ($amenities as $amenity) :
                                            ?>
                                                <li><i class="ri-check-line"></i><?= trim($amenity); ?></li>
                                            <?php endforeach; ?>
                                        <?php endif; ?>
                                    </ul>
                                    <a href="<?= base_url('beranda/details/' . $room->id); ?>" class="lh-buttons-2">
                                        View More <i class="ri-arrow-right-line"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                <?php else : ?>
                    <div class="col-12">
                        <p class="text-center">Belum ada kamar tersedia.</p>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </section>
    <!-- End Rooms -->