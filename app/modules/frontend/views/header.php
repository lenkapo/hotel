<!--
    Item Name: Luxurious - Hotel Booking HTML Template + Admin Dashboard.
    Author: ashishmaraviya
    Version: 2.2.0
    Copyright 2024
	Author URI: https://themeforest.net/user/ashishmaraviya
-->
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Best Luxurious Hotel Booking Template.">
	<meta name="keywords"
		content="hotel, booking, business, restaurant, spa, resort, landing, agency, corporate, start up, site design, new business site, business template, professional template, classic, modern">
	<title>Luxurious - Hotel Booking</title>

	<link rel="icon" href="assets/img/favicons/favicon-2.png" type="image/x-icon">

	<!-- Css All Plugins Files -->
	<link rel="stylesheet" href="<?= base_url('assets/css/vendor/bootstrap.min.css'); ?>">
	<link rel="stylesheet" href="<?= base_url('assets/css/vendor/magnific-popup.css'); ?>">
	<link rel="stylesheet" href="<?= base_url('assets/css/vendor/aos.css'); ?>">
	<link rel="stylesheet" href="<?= base_url('assets/css/vendor/remixicon.css'); ?>">
	<link rel="stylesheet" href="<?= base_url('assets/css/vendor/materialdesignicons.min.css'); ?>">
	<link rel="stylesheet" href="<?= base_url('assets/css/vendor/swiper-bundle.min.css'); ?>">
	<link rel="stylesheet" href="<?= base_url('assets/css/vendor/semantic.min.css'); ?>">
	<link rel="stylesheet" href="<?= base_url('assets/css/vendor/slick.min.css'); ?>">

	<!-- Main Style -->
	<link rel="stylesheet" href="<?= base_url('assets/css/demo-2.css'); ?>">
	<link rel="stylesheet" href="<?= base_url('assets/css/box-radius.css'); ?>" id="add_radius_mode">
	<link rel="stylesheet" href="<?= base_url('assets/css/color-9.css'); ?>" id="add_class">

	<style>
		.nav-link.active {
			color: #b19777 !important;
			font-weight: 600;
			border-bottom: 2px solid #b19777;
			transition: all 0.3s ease;
		}
	</style>

</head>

<body>
	<!-- Overlay -->
	<div class="overlay"></div>
	<div class="lh-loader">
		<span class="loader"></span>
	</div>

	<!-- Header -->
	<header>
		<div class="lh-header">
			<div class="container">
				<div class="row">
					<nav class="navbar navbar-expand-lg">
						<a class="navbar-brand" href="index.html">
							<img src="assets/img/logo/logo-2.png" alt="logo" class="lh-logo">
						</a>
						<button class="navbar-toggler shadow-none" type="button" data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
							aria-expanded="false" aria-label="Toggle navigation">
							<i class="ri-menu-2-line"></i>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav me-auto mb-2 mb-lg-0">
								<!-- HOME -->
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle <?= ($this->uri->segment(1) == '' || $this->uri->segment(1) == 'beranda') ? 'active' : ''; ?>"
										href="<?= site_url('/'); ?>">
										Home
									</a>
								</li>

								<!-- Gallery -->
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle <?= ($this->uri->segment(1) == 'gallery') ? 'active' : ''; ?>"
										href="<?= site_url('gallery'); ?>">
										Gallery
									</a>
								</li>

								<!-- ROOM -->
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle <?= ($this->uri->segment(1) == 'room' || $this->uri->segment(1) == 'room') ? 'active' : ''; ?>"
										href="<?= site_url('room'); ?>">
										Room
									</a>
								</li>

								<!-- PAGES -->
								<li class="nav-item dropdown <?= ($this->uri->segment(1) == 'pages') ? 'active' : ''; ?>">
									<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
										Pages
									</a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="<?= site_url('pages/about'); ?>">About</a></li>
										<li><a class="dropdown-item" href="<?= site_url('pages/contact'); ?>">Contact</a></li>
										<li><a class="dropdown-item" href="<?= site_url('pages/gallery'); ?>">Gallery</a></li>
									</ul>
								</li>

								<!-- BLOG -->
								<li class="nav-item">
									<a class="nav-link <?= ($this->uri->segment(1) == 'blog') ? 'active' : ''; ?>"
										href="<?= site_url('blog'); ?>">
										Blog
									</a>
								</li>

								<!-- RESTAURANT -->
								<li class="nav-item">
									<a class="nav-link <?= ($this->uri->segment(2) == 'restaurant') ? 'active' : ''; ?>"
										href="<?= site_url('beranda/restaurant'); ?>">
										Restaurant
									</a>
								</li>
							</ul>

						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>

	<!-- Mobile-menu -->
	<div class="lh-sidebar-overlay"></div>
	<div id="lh_mobile_menu" class="lh-side-cart lh-mobile-menu">
		<div class="lh-menu-title">
			<span class="menu-title">My Menu</span>
			<button class="lh-close">×</button>
		</div>
		<div class="lh-menu-inner">
			<input type="text" placeholder="Search" class="lh-menu-box">
			<div class="lh-menu-content">
				<ul>
					<li class="dropdown drop-list">
						<a href="#" class="dropdown-list">Home</a>
						<ul class="sub-menu">
							<li><a href="index.html">Home Layout 1</a></li>
							<li><a href="demo-2.html">Home Layout 2</a></li>
						</ul>
					</li>
					<li class="dropdown drop-list">
						<a href="#" class="dropdown-list">Categories</a>
						<ul class="sub-menu">
							<li><a href="gallery.html">gallery 1</a></li>
							<li><a href="gallery-2.html">gallery 2</a></li>
						</ul>
					</li>
					<li class="dropdown drop-list">
						<a href="#" class="dropdown-list">Room</a>
						<ul class="sub-menu">
							<li><a href="room.html">Rooms 1</a></li>
							<li><a href="room-2.html">Rooms 2</a></li>
							<li><a href="room-details.html">Room Details</a></li>
						</ul>
					</li>
					<li class="dropdown drop-list">
						<a href="#" class="dropdown-list">Pages</a>
						<ul class="sub-menu">
							<li><a href="about.html">About Us</a></li>
							<li><a href="contact.html">Contact</a></li>
							<li><a href="facilities.html">Facilities</a></li>
							<li><a href="faq.html">Faq</a></li>
							<li><a href="prices.html">Prices</a></li>
							<li><a href="services.html">Services</a></li>
							<li><a href="spa.html">Spa</a></li>
							<li><a href="team.html">Team</a></li>
							<li><a href="checkout.html">Checkout</a></li>
						</ul>
					</li>
					<li class="dropdown drop-list">
						<a href="#" class="dropdown-list">Blog</a>
						<ul class="sub-menu">
							<li><a href="blog.html">Blog</a></li>
							<li><a href="blog-details.html">Blog Details</a></li>
						</ul>
					</li>
					<li class="dropdown drop-list">
						<a href="restaurant.html">Restaurant</a>
					</li>
				</ul>
			</div>
		</div>
	</div>