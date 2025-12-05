<!-- <pre><?php print_r($all_tipe_kamar); ?></pre> -->
<!-- Hero Slider Start -->
<section class="section lh-hero m-tb-40">

	<div class="lh-main-content">
		<!-- Hero Slider Start -->
		<div class="lh-slider-content hero-image">
			<div class="lh-main-slider">
				<div class="lh-main-slider swiper-container main-slider-nav main-slider-dot">
					<!-- Main slider  -->
					<div class="swiper-wrapper">
						<div class="lh-slide-item swiper-slide d-flex slide-1">
							<div class="lh-slide-content slider-animation">
								<p>Mulai dari Rp <?= number_format($room_min_price ?? 200000, 0, ',', '.'); ?>/night</p>
								<h1 class="lh-slide-title">Best Five Star Hotel & Facilities.</h1>
								<div class="lh-slide-btn">
									<a href="#" class="lh-buttons-2">Rooms & Suites<i
											class="fi-rr-angle-double-small-right" aria-hidden="true"></i></a>
								</div>
							</div>
						</div>
						<div class="lh-slide-item swiper-slide d-flex slide-2">
							<div class="lh-slide-content slider-animation">
								<p>Spa Starting at $150</p>
								<h1 class="lh-slide-title">Enjoy the best spa facilities.</h1>
								<div class="lh-slide-btn">
									<a href="#" class="lh-buttons-2">Book Now <i
											class="fi-rr-angle-double-small-right" aria-hidden="true"></i></a>
								</div>
							</div>
						</div>
						<div class="lh-slide-item swiper-slide d-flex slide-3">
							<div class="lh-slide-content slider-animation">
								<p>Sun, Fun, and Poolside Escape.</p>
								<h1 class="lh-slide-title">Make Waves of Memories Here.</h1>
								<div class="lh-slide-btn">
									<a href="#" class="lh-buttons-2">Book Now <i
											class="fi-rr-angle-double-small-right" aria-hidden="true"></i></a>
								</div>
							</div>
						</div>
					</div>
					<div class="swiper-pagination swiper-pagination-white"></div>

				</div>
			</div>
		</div>
	</div>
</section>
<!-- Hero Slider End -->

<!-- search-control -->
<section class="section-search-control">
	<div class="container">
		<form>
			<div class="search-control-boxing">
				<div class="lh-col">
					<div class="search-box search-box">
						<h4 class="heading">
							Check in
						</h4>
						<div class="calendar" id="date_1">
							<i class="ri-calendar-2-line"></i>
							<input type="text" placeholder="Arrival Date" class="lh-book-form-control">
						</div>
					</div>
				</div>
				<div class="lh-col">
					<div class="search-box search-box-2">
						<h4 class="heading">
							Check Out
						</h4>
						<div class="calendar" id="date_2">
							<i class="ri-calendar-2-line"></i>
							<input type="text" placeholder="Leave Date" class="lh-book-form-control">
						</div>
					</div>
				</div>
				<div class="lh-col">
					<div class="search-box search-box-2">
						<h4 class="heading">
							Adults
						</h4>
						<div class="custom-select">
							<select>
								<option value="option1">Select</option>
								<option value="option2">One</option>
								<option value="option3">Two</option>
								<option value="option4">Three</option>
							</select>
						</div>
					</div>
				</div>
				<div class="lh-col">
					<div class="search-box search-box-2">
						<h4 class="heading">
							Children
						</h4>
						<div class="custom-select">
							<select>
								<option value="option1">Select</option>
								<option value="option2">One</option>
								<option value="option3">Two</option>
								<option value="option4">Three</option>
							</select>
						</div>
					</div>
				</div>
				<div class="lh-col-check">
					<div class="search-control-button">
						<a class="lh-buttons result-placeholder" href="checkout.html">
							Check Now
						</a>
					</div>
				</div>
			</div>
		</form>
	</div>
</section>

<!-- About -->
<section class="section-about padding-tb-100">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 rs-pb-24" data-aos="fade-up" data-aos-duration="1500">
				<img src="assets/img/about/about-3.png" alt="about" class="w-100">
			</div>
			<div class="col-lg-6 rs-pb-24" data-aos="fade-up" data-aos-duration="2000">
				<div class="lh-about-detail">
					<div class="banner t-left">
						<span><img class="logo" src="assets/img/logo/logo-3.png" alt="logo"></span>
						<h2>Enjoy the best Luxury hotel <span>Experience</span>.</h2>
					</div>
					<div class="lh-branches-paragraph">
						<p>This is the dolor sit amet consectetur adipisicing elit. Quasi eos ducimus magnam unde
							fugit qui perferendis repudiandae modi officia. Quae eaque fugiat minima quasi sapiente,
							vel
							dolore numquam quo!</p>
						<p>Quasi eos ducimus magnam unde fugit qui perferendis This is the dolor sit amet
							consectetur adipisicing elit. Quasi eos ducimus magnam unde
							fugit qui perferendis repudiandae modi officia. Quae eaque fugiat minima quasi sapiente,
							vel dolore numquam quo!</p>
					</div>
					<div class="lh-abouts-buttons">
						<a class="lh-buttons result-placeholder" href="about.html">
							View More
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Rooms -->
<section class="section-rooms bg-gray padding-tb-100">
	<div class="container">
		<div class="banner" data-aos="fade-up" data-aos-duration="2000">
			<h2>Our Luxury <span>Rooms</span></h2>
			<p>Checkout our luxury rooms and enjoy!</p>
		</div>
		<div class="row" data-aos="fade-up" data-aos-duration="2000">
			<div class="rooms-slider">
				<?php if (!empty($all_tipe_kamar)) : ?>
					<?php foreach ($all_tipe_kamar as $room): ?>
						<div class="rooms-card">
							<!-- Gambar kamar -->
							<img src="<?= base_url('assets/data_img_hotel/' . $room->main_image); ?>"
								alt="<?= htmlspecialchars($room->name); ?>">

							<div class="details">
								<h3><?= htmlspecialchars($room->name); ?></h3>
								<span>Rp <?= number_format($room->price, 0, ',', '.'); ?> / Malam</span>

								<ul>
									<?php if (!empty($room->fitur)): ?>
										<?php
										// Pisahkan fitur dengan koma dan hapus spasi berlebih
										$fitur_list = array_map('trim', explode(',', $room->fitur));
										?>
										<?php foreach ($fitur_list as $fitur): ?>
											<?php if (!empty($fitur)): ?>
												<li><i class="ri-check-line"></i> <?= htmlspecialchars($fitur); ?></li>
											<?php endif; ?>
										<?php endforeach; ?>
									<?php else: ?>
										<li><em>Tidak ada fitur terdaftar</em></li>
									<?php endif; ?>
								</ul>

								<a href="<?= site_url('room_detail/' . $room->id); ?>" class="lh-buttons-2">
									View More <i class="ri-arrow-right-line"></i>
								</a>
							</div>
						</div>
					<?php endforeach; ?>
				<?php else : ?>
					<p class="text-muted text-center">Belum ada kamar tersedia.</p>
				<?php endif; ?>
			</div>
		</div>

	</div>
</section>

<!-- Amenities -->
<section class="section-amenities padding-tb-100">
	<div class="container">
		<div class="banner d-none" data-aos="fade-up" data-aos-duration="2000">
			<h2>Amenities At <span>Hotel</span></h2>
		</div>
		<div class="row mtb-m-12">
			<div class="col-md-6 col-sm-12 m-tb-12">
				<div class="lh-amenities" data-aos="fade-up" data-aos-duration="1500">
					<div class="amenities-detail">
						<div class="amenities-box">
							<img src="assets/img/amenities/1.jpg" alt="amenities_1" class="amenities-left-image">
						</div>
						<div class="amenities-box detail-box">
							<div class="lh-amenities-in">
								<h4 class="side-number">01</h4>
								<div class="lh-top-dish">
									<img src="assets/img/amenities/amenities-dish-1.svg" class="svg-img"
										alt="amenities-dish-1">
								</div>
								<div class="amenities-contain">
									<h4 class="amenities-heading">Our Restaurant</h4>
									<p>This is the dolor sit amet adipisicing elit. Ducimus corrupti sit amet
										tempore placeat ipsa.</p>
									<a href="facilities.html">Read more <i class="ri-arrow-right-line"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-12 m-tb-12">
				<div class="lh-amenities" data-aos="fade-up" data-aos-duration="2000">
					<div class="amenities-detail">
						<div class="amenities-box">
							<img src="assets/img/amenities/2.jpg" alt="amenities_2" class="amenities-left-image">
						</div>
						<div class="amenities-box detail-box">
							<div class="lh-amenities-in">
								<h4 class="side-number">02</h4>
								<div class="lh-top-dish">
									<img src="assets/img/amenities/amenities-dish-2.svg" class="svg-img"
										alt="amenities-dish-2">
								</div>
								<div class="amenities-contain">
									<h4 class="amenities-heading">Spa & Beauty</h4>
									<p>This is the dolor sit amet adipisicing elit. Ducimus corrupti sit amet
										tempore placeat ipsa.</p>
									<a href="facilities.html">Read more <i class="ri-arrow-right-line"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-12 m-tb-12">
				<div class="lh-amenities" data-aos="fade-up" data-aos-duration="1500">
					<div class="amenities-detail">
						<div class="amenities-box detail-box">
							<div class="lh-amenities-in lh-amenities-right">
								<h4 class="side-number">03</h4>
								<div class="lh-top-dish">
									<img src="assets/img/amenities/amenities-dish-4.svg" class="svg-img"
										alt="amenities-dish-3">
								</div>
								<div class="amenities-contain">
									<h4 class="amenities-heading">Golf & Garden</h4>
									<p>This is the dolor sit amet adipisicing elit. Ducimus corrupti sit amet
										tempore placeat ipsa.</p>
									<a href="facilities.html">Read more <i class="ri-arrow-right-line"></i></a>
								</div>
							</div>
						</div>
						<div class="amenities-box">
							<img src="assets/img/amenities/3.jpg" alt="amenities_3" class="amenities-right-image">
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-12 m-tb-12">
				<div class="lh-amenities" data-aos="fade-up" data-aos-duration="2000">
					<div class="amenities-detail">
						<div class="amenities-box detail-box">
							<div class="lh-amenities-in lh-amenities-right">
								<h4 class="side-number">04</h4>
								<div class="lh-top-dish">
									<img src="assets/img/amenities/amenities-dish-3.svg" class="svg-img"
										alt="amenities-dish-4">
								</div>
								<div class="amenities-contain">
									<h4 class="amenities-heading">Fitness & Gym</h4>
									<p>This is the dolor sit amet adipisicing elit. Ducimus corrupti sit amet
										tempore placeat ipsa.</p>
									<a href="facilities.html">Read more <i class="ri-arrow-right-line"></i></a>
								</div>
							</div>
						</div>
						<div class="amenities-box">
							<img src="assets/img/amenities/4.jpg" alt="amenities_4" class="amenities-right-image">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Services -->
<section class="section-services dark-bg padding-tb-100">
	<div class="container">
		<div class="banner" data-aos="fade-up" data-aos-duration="1200">
			<h2>Enjoy Our Best <span>Services</span></h2>
			<p>Enjoy our best luxury service!</p>
		</div>
		<div class="row mtb-m-12">
			<div class="col-lg-4 col-md-6 m-tb-12">
				<div class="lh-services" data-aos="fade-up" data-aos-duration="1200">
					<div class="lh-services-contain">
						<div class="lh-icon">
							<img src="assets/img/services/service-1.svg" class="svg-img" alt="services img">
						</div>
						<h4 class="lh-services-heading">Private Dining Rooms</h4>
						<p>This is the dolor sit amet consectetur adipisicing eligendi.</p>
						<a class="direct" href="services.html"><i class="ri-arrow-right-line"></i></a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 m-tb-12">
				<div class="lh-services" data-aos="fade-up" data-aos-duration="1800">
					<div class="lh-services-contain">
						<div class="lh-icon">
							<img src="assets/img/services/service-2.svg" class="svg-img" alt="services img">
						</div>
						<h4 class="lh-services-heading">Distinctive Rooms</h4>
						<p>This is the dolor sit amet consectetur adipisicing eligendi.</p>
						<a class="direct" href="services.html"><i class="ri-arrow-right-line"></i></a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 m-tb-12">
				<div class="lh-services" data-aos="fade-up" data-aos-duration="2500">
					<div class="lh-services-contain">
						<div class="lh-icon">
							<img src="assets/img/services/service-3.svg" class="svg-img" alt="services img">
						</div>
						<h4 class="lh-services-heading">Complimentary Offers</h4>
						<p>This is the dolor sit amet consectetur adipisicing eligendi.</p>
						<a class="direct" href="services.html"><i class="ri-arrow-right-line"></i></a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 m-tb-12">
				<div class="lh-services" data-aos="fade-up" data-aos-duration="1200">
					<div class="lh-services-contain">
						<div class="lh-icon">
							<img src="assets/img/services/service-4.svg" class="svg-img" alt="services img">
						</div>
						<h4 class="lh-services-heading">The Pool</h4>
						<p>This is the dolor sit amet consectetur adipisicing eligendi.</p>
						<a class="direct" href="services.html"><i class="ri-arrow-right-line"></i></a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 m-tb-12">
				<div class="lh-services" data-aos="fade-up" data-aos-duration="1800">
					<div class="lh-services-contain">
						<div class="lh-icon">
							<img src="assets/img/services/service-5.svg" class="svg-img" alt="services img">
						</div>
						<h4 class="lh-services-heading">Fitness Center</h4>
						<p>This is the dolor sit amet consectetur adipisicing eligendi.</p>
						<a class="direct" href="services.html"><i class="ri-arrow-right-line"></i></a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 m-tb-12">
				<div class="lh-services" data-aos="fade-up" data-aos-duration="2500">
					<div class="lh-services-contain">
						<div class="lh-icon">
							<img src="assets/img/services/service-6.svg" class="svg-img" alt="services img">
						</div>
						<h4 class="lh-services-heading">Spa Center</h4>
						<p>This is the dolor sit amet consectetur adipisicing eligendi.</p>
						<a class="direct" href="services.html"><i class="ri-arrow-right-line"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Prices -->
<section class="section-prices padding-tb-100">
	<div class="container">
		<div class="row">

			<div class="banner" data-aos="fade-up" data-aos-duration="1000">
				<h2>The Best <span>Extra Services</span></h2>
				<p>Enjoy our best luxury extra service!</p>
			</div>

			<?php foreach ($extra_services as $service): ?>
				<div class="col-lg-4 rs-pb-24">
					<div class="lh-prices" data-aos="fade-up" data-aos-duration="1000">

						<img src="<?= base_url('assets/img/room/' . $service->gambar) ?>"
							alt="<?= $service->nama_layanan ?>"
							class="prices-image">

						<div class="lh-prices-out">
							<div class="lh-prices-in">
								<h4 class="lh-price-dollar">
									<span>$</span><?= $service->harga ?>
									<code> / Per Malam</code>
								</h4>

								<h4 class="lh-prices-heading"><?= $service->nama_layanan ?></h4>
							</div>

							<div class="lh-prices-viwe">
								<ul>
									<?php foreach ($service->fitur as $ft): ?>
										<li>
											<span><?= $ft->fitur ?></span>
											<i class="ri-arrow-right-line"></i>
										</li>
									<?php endforeach; ?>
								</ul>
							</div>

						</div>
					</div>
				</div>
			<?php endforeach; ?>

		</div>
	</div>
</section>


<!-- Video -->
<section class="section-video v-bg padding-tb-100 p-0">
	<div class="banner d-none" data-aos="fade-up" data-aos-duration="1000">
		<h2>The Best <span>Video</span></h2>
	</div>
	<div class="container" data-aos="fade-up" data-aos-duration="2000">
		<div class="v-details">
			<div class="banner">
				<h2>The Best <span>Luxurious</span> Hotel In Indonesia.</h2>
				<p>This is the dolor sit amet consectetur adipisicing elit. Quasi eos ducimus magnam unde
					fugit qui perferendis repudiandae modi officia. Quae eaque fugiat minima quasi sapiente,
					vel</p>
				<a class="lh-header-btn lh-header-wishlist lh-video-icon" data-link-action="quickview" title="video Player" data-bs-toggle="modal" data-bs-target="#lh_video_player_modal">
					<div class="header-icon"><i class="ri-play-line"></i></div>
				</a>
			</div>
		</div>
	</div>
</section>

<!-- Testimonials -->
<section class="section-testimonials v-bg padding-tb-100">
	<div class="container">
		<div class="row">
			<div class="col-lg-12" data-aos="fade-up" data-aos-duration="2000">
				<!-- <button id="themeToggle" class="theme-toggle">🌙</button> -->

				<!-- Swiper container -->
				<div class="swiper testimonialSwiper">

					<div class="swiper-wrapper">
						<?php foreach ($testimonials as $t):
							$photo = (!empty($t->foto) && file_exists(FCPATH . 'assets/img/testimonials/' . $t->foto))
								? base_url('assets/img/testimonials/' . $t->foto)
								: base_url('assets/img/businessman/businessman-1.jpg');
						?>
							<div class="swiper-slide">
								<div class="lh-testimonials">
									<div class="mb-3 lh-testimonials-inner">
										<div class="lh-testimonials-name-detalis">
											<h5><?= $t->nama; ?></h5>
											<span><?= $t->asal; ?></span>
										</div>
										<div class="lh-testimonials-side-image ms-auto">
										</div>
									</div>

									<p>"<?= $t->pesan ?>"</p>

									<div class="lh-testimonials-holiday mt-3">
										<span>"Pengunjung Review"</span>
										<div class="lh-star">
											<?php for ($i = 1; $i <= $t->rating; $i++): ?>
												<i class="ri-star-fill"></i>
											<?php endfor ?>
										</div>
									</div>
								</div>
							</div>
						<?php endforeach; ?>
					</div>

					<!-- Swiper navigation -->
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>

				</div>

			</div>
		</div>
	</div>
</section>






<!-- Blog -->
<section class="section-blog bg-gray padding-tb-100">
	<div class="container">
		<div class="banner" data-aos="fade-up" data-aos-duration="2000">
			<h2>Stay Update With <span>Us</span></h2>
			<p>Check our latest news & Blogs and stay update!</p>
		</div>
		<div class="slick-slider blog-slider" data-aos="fade-up" data-aos-duration="2000">
			<div class="blog-card">
				<figure><img src="assets/img/blog/2.jpg" alt="blog-img" class="blog-image-top"></figure>
				<div class="lh-blog">
					<div class="lh-blog-date">
						<span><code>Restaurant</code> - 09 Jan 2024 - 05 Comment</span>
					</div>
					<a class="top-heding" href="blog-details.html">Offers Exclusive amenities & Facilities To Guests
						and free offers.</a>
				</div>
			</div>
			<div class="blog-card">
				<figure><img src="assets/img/blog/3.jpg" alt="blog-img" class="blog-image-top"></figure>
				<div class="lh-blog">
					<div class="lh-blog-date">
						<span><code>Marketing</code> - 15 Feb 2024 - 22 Comment</span>
					</div>
					<a class="top-heding" href="blog-details.html">Announces A Private Island Hotel In The Maldives
						for couple.</a>
				</div>
			</div>
			<div class="blog-card">
				<figure><img src="assets/img/blog/4.jpg" alt="blog-img" class="blog-image-top"></figure>
				<div class="lh-blog">
					<div class="lh-blog-date">
						<span><code>Hotel</code> - 22 Dec 2024 - 00 Comment</span>
					</div>
					<a class="top-heding" href="blog-details.html">Exclusive amenities Facilities to Guests Offers
						rooms free.</a>
				</div>
			</div>
			<div class="blog-card">
				<figure><img src="assets/img/blog/5.jpg" alt="blog-img" class="blog-image-top"></figure>
				<div class="lh-blog">
					<div class="lh-blog-date">
						<span><code>Rooms</code> - 11 Nov 2024 - 01 Comment</span>
					</div>
					<a class="top-heding" href="blog-details.html">Island Hotel In The Maldives Exclusive amenities
						Facilities.</a>
				</div>
			</div>
			<div class="blog-card">
				<figure><img src="assets/img/blog/6.jpg" alt="blog-img" class="blog-image-top"></figure>
				<div class="lh-blog">
					<div class="lh-blog-date">
						<span><code>Spa</code> - 02 Mar 2024 - 25 Comment</span>
					</div>
					<a class="top-heding" href="blog-details.html">Amenities Facilities to Guests Offers rooms free
						Exclusive.</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- end section beranda -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script>
	var swiper = new Swiper(".testimonialSwiper", {
		loop: true,
		centeredSlides: true,
		slidesPerView: 1,
		spaceBetween: 30,
		navigation: {
			nextEl: ".swiper-button-next",
			prevEl: ".swiper-button-prev",
		},
		breakpoints: {
			768: {
				slidesPerView: 1,
			},
			992: {
				slidesPerView: 1,
			}
		}
	});
	const toggle = document.getElementById("themeToggle");
	toggle.addEventListener("click", () => {
		document.body.classList.toggle("dark-mode");
		toggle.textContent = document.body.classList.contains("dark-mode") ? "☀️" : "🌙";
	});
</script>