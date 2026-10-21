<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.shopsphere.model.User" %>
<%@ page import="com.shopsphere.model.Product" %>
<%@ page import="com.shopsphere.dao.ProductDAO" %>
<%@ page import="java.util.List" %>
<%
    User u = (User) session.getAttribute("loggedInUser");
    List<Product> featuredProducts;
    try {
        featuredProducts = new ProductDAO().search(null, 0, "newest", 1, 8);
    } catch (Exception e) {
        featuredProducts = java.util.Collections.emptyList();
    }
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BEAST LIFE — Elite Nutrition & Hardcore Gym Equipment</title>
    <meta name="description" content="BEAST LIFE — Fuel your gains with ultra-pure whey protein, micronized creatine, explosive pre-workout and heavy-duty gym equipment. Built for the relentless.">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
</head>
<body>
<div class="announcement-bar">
    <span>🔥 USE CODE <strong>BEAST10</strong> FOR 10% OFF &nbsp;•&nbsp; FREE SHIPPING OVER ₹999 &nbsp;•&nbsp; 100% AUTHENTIC GUARANTEE</span>
</div>

<header class="nav-header">
    <div class="container nav-inner">
        <nav class="nav-menu">
            <a class="nav-link active" href="${pageContext.request.contextPath}/">Home</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/products">All Products</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/products?category=1">Proteins</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/products?category=2">Creatine</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/products?category=3">Gym Gear</a>
        </nav>
        <a class="brand-logo" href="${pageContext.request.contextPath}/">
            BEAST LIFE
        </a>
        <div>
            <a class="btn ghost" href="${pageContext.request.contextPath}/products">Search</a>
            <% if (u == null) { %>
                <a class="btn ghost" href="${pageContext.request.contextPath}/login">Account</a>
            <% } else if ("ADMIN".equalsIgnoreCase(u.getRole())) { %>
                <a class="btn ghost" href="${pageContext.request.contextPath}/admin/dashboard">Admin</a>
            <% } else { %>
                <a class="btn ghost" href="${pageContext.request.contextPath}/profile">Account</a>
            <% } %>
            <a class="btn ghost" href="${pageContext.request.contextPath}/cart">Cart</a>
        </div>
    </div>
</header>

<section class="hero-wrapper">
    <div class="hero-grid">
        <div>
            <span class="badge-tag">⚡ LAB TESTED • 100% CLINICAL DOSAGES • ZERO FILLERS</span>
            <h1 class="hero-title">BEAST LIFE</h1>
            <p class="hero-subtitle">UNLEASH YOUR INNER BEAST. Ultra-pure whey protein isolate, micronized creatine, skin-splitting pre-workout and hardcore gym equipment engineered for maximum muscle growth and strength.</p>
            <div class="hero-buttons">
                <a class="btn" href="${pageContext.request.contextPath}/products">Shop Supplements & Gear</a>
                <a class="btn secondary" href="#featured-products">View Hardcore Lineup</a>
            </div>
        </div>
    </div>
</section>

<!-- Features Bar / Athlete Guarantees -->
<section class="features-grid container">
    <div class="feature-card">
        <h4>100% Authentic</h4>
        <p>Direct from manufacturer with batch-tested verification code.</p>
    </div>
    <div class="feature-card">
        <h4>Lab-Tested Purity</h4>
        <p>Zero banned substances, third-party tested and dope-free.</p>
    </div>
    <div class="feature-card">
        <h4>Express Dispatch</h4>
        <p>Complimentary express shipping across India on orders over ₹999.</p>
    </div>
    <div class="feature-card">
        <h4>Ironclad Guarantee</h4>
        <p>14-day hassle-free replacement on genuine sealed items.</p>
    </div>
</section>

<main>
<!-- Curated Fitness Collections -->
<section class="section container">
    <div class="section-head">
        <div>
            <span class="eyebrow">DOMINATE YOUR GOALS</span>
            <h2>Curated Athlete Categories</h2>
        </div>
        <span class="eyebrow">04 ESSENTIAL CATEGORIES</span>
    </div>
    <div class="curated-grid">
        <a class="curated-card" href="${pageContext.request.contextPath}/products?category=1">
            <img src="https://images.unsplash.com/photo-1579722821273-0f6c7d44362f?auto=format&fit=crop&w=1200&q=85" alt="Whey Protein & Isolate">
            <div class="curated-copy">
                <h3>Whey Protein</h3>
                <span>Explore Isolates & Blends →</span>
            </div>
        </a>
        <a class="curated-card" href="${pageContext.request.contextPath}/products?category=2">
            <img src="https://images.unsplash.com/photo-1584735935682-2f2b69dff9d2?auto=format&fit=crop&w=1200&q=85" alt="Creatine & Pre-workout">
            <div class="curated-copy">
                <h3>Creatine & Pre-Workout</h3>
                <span>Explosive Strength & Pump →</span>
            </div>
        </a>
        <a class="curated-card" href="${pageContext.request.contextPath}/products?category=3">
            <img src="https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?auto=format&fit=crop&w=1200&q=85" alt="Gym Equipment & Gear">
            <div class="curated-copy">
                <h3>Gym Equipment & Gear</h3>
                <span>Heavy Dumbbells, Belts & Bands →</span>
            </div>
        </a>
    </div>
</section>

<!-- Featured Fitness Products -->
<section id="featured-products" class="products-section container">
    <div class="section-head">
        <div>
            <span class="eyebrow">BESTSELLERS & NEW ARRIVALS</span>
            <h2>Engineered For Pure Performance</h2>
        </div>
        <a class="btn ghost" href="${pageContext.request.contextPath}/products">View Full Catalog</a>
    </div>
    <div class="grid">
        <% 
        String[] fallbackFitnessImages = {
            "https://images.unsplash.com/photo-1579722821273-0f6c7d44362f?auto=format&fit=crop&w=900&q=85",
            "https://images.unsplash.com/photo-1593095948071-474c5cc2989d?auto=format&fit=crop&w=900&q=85",
            "https://images.unsplash.com/photo-1584735935682-2f2b69dff9d2?auto=format&fit=crop&w=900&q=85",
            "https://images.unsplash.com/photo-1546483875-ad9014c88eba?auto=format&fit=crop&w=900&q=85",
            "https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?auto=format&fit=crop&w=900&q=85",
            "https://images.unsplash.com/photo-1517838277536-f5f99be501cd?auto=format&fit=crop&w=900&q=85",
            "https://images.unsplash.com/photo-1598289431512-b97b0917affc?auto=format&fit=crop&w=900&q=85",
            "https://images.unsplash.com/photo-1517963879433-6ad2b056d712?auto=format&fit=crop&w=900&q=85"
        };
        if (featuredProducts != null && !featuredProducts.isEmpty()) {
            int i = 0;
            for (Product p : featuredProducts) {
                String image = (p.getImageUrl() != null && !p.getImageUrl().trim().isEmpty()) ? p.getImageUrl() : fallbackFitnessImages[i % fallbackFitnessImages.length];
        %>
        <article class="product-card">
            <a class="product-image" href="${pageContext.request.contextPath}/product?id=<%= p.getProductId() %>">
                <img src="<%= image %>" alt="<%= p.getName() %>">
                <span class="product-tag"><%= p.getStock() > 0 ? "AUTHENTIC" : "OUT OF STOCK" %></span>
            </a>
            <div class="product-body">
                <span class="chip"><%= p.getBrand() != null ? p.getBrand() : "BEAST LIFE" %></span>
                <a class="product-title" href="${pageContext.request.contextPath}/product?id=<%= p.getProductId() %>"><%= p.getName() %></a>
                <p class="muted"><%= p.getDescription() != null && p.getDescription().length() > 75 ? p.getDescription().substring(0,75) + "…" : (p.getDescription() == null ? "" : p.getDescription()) %></p>
                <div style="display:flex;justify-content:space-between;align-items:center;margin-top:6px;">
                    <span class="price">₹<%= String.format("%.2f", p.getPrice()) %></span>
                    <% if (p.getStock() > 0) { %>
                        <span class="chip success">In Stock (<%= p.getStock() %>)</span>
                    <% } else { %>
                        <span class="chip danger">Sold Out</span>
                    <% } %>
                </div>
                <div class="product-actions">
                    <% if (p.getStock() > 0) { %>
                    <form method="post" action="${pageContext.request.contextPath}/cart">
                        <input type="hidden" name="_csrf" value="${csrfToken}" />
                        <input type="hidden" name="productId" value="<%= p.getProductId() %>">
                        <input type="hidden" name="quantity" value="1">
                        <button type="submit">Add to Cart</button>
                    </form>
                    <% } %>
                    <form method="post" action="${pageContext.request.contextPath}/wishlist">
                        <input type="hidden" name="_csrf" value="${csrfToken}" />
                        <input type="hidden" name="productId" value="<%= p.getProductId() %>">
                        <button class="btn ghost" type="submit" title="Add to wishlist">♡</button>
                    </form>
                </div>
            </div>
        </article>
        <% i++; } } else { %>
            <!-- Static showcase cards if DB not connected yet -->
            <article class="product-card">
                <a class="product-image" href="${pageContext.request.contextPath}/products">
                    <img src="https://images.unsplash.com/photo-1579722821273-0f6c7d44362f?auto=format&fit=crop&w=900&q=85" alt="Beast Life 100% Whey Isolate">
                    <span class="product-tag">BESTSELLER</span>
                </a>
                <div class="product-body">
                    <span class="chip">BEAST LIFE</span>
                    <a class="product-title" href="${pageContext.request.contextPath}/products">100% Whey Isolate (2kg)</a>
                    <p class="muted">27g pure protein, 5.9g BCAAs, zero added sugar. Ultra-rapid recovery.</p>
                    <div style="display:flex;justify-content:space-between;align-items:center;margin-top:6px;">
                        <span class="price">₹4,899.00</span>
                        <span class="chip success">In Stock</span>
                    </div>
                    <div class="product-actions">
                        <a class="btn" href="${pageContext.request.contextPath}/products" style="width:100%">View Product</a>
                    </div>
                </div>
            </article>

            <article class="product-card">
                <a class="product-image" href="${pageContext.request.contextPath}/products">
                    <img src="https://images.unsplash.com/photo-1584735935682-2f2b69dff9d2?auto=format&fit=crop&w=900&q=85" alt="Beast Life Micronized Creatine">
                    <span class="product-tag">TOP RATED</span>
                </a>
                <div class="product-body">
                    <span class="chip">BEAST LIFE</span>
                    <a class="product-title" href="${pageContext.request.contextPath}/products">Micronized Creatine (250g)</a>
                    <p class="muted">100% pure 200-mesh micronized monohydrate for raw power and muscle volume.</p>
                    <div style="display:flex;justify-content:space-between;align-items:center;margin-top:6px;">
                        <span class="price">₹1,199.00</span>
                        <span class="chip success">In Stock</span>
                    </div>
                    <div class="product-actions">
                        <a class="btn" href="${pageContext.request.contextPath}/products" style="width:100%">View Product</a>
                    </div>
                </div>
            </article>

            <article class="product-card">
                <a class="product-image" href="${pageContext.request.contextPath}/products">
                    <img src="https://images.unsplash.com/photo-1546483875-ad9014c88eba?auto=format&fit=crop&w=900&q=85" alt="Beast Life Savage Pre-Workout">
                    <span class="product-tag">HIGH INTENSITY</span>
                </a>
                <div class="product-body">
                    <span class="chip">BEAST LIFE</span>
                    <a class="product-title" href="${pageContext.request.contextPath}/products">Savage Pre-Workout (400g)</a>
                    <p class="muted">350mg caffeine, 6g Citrulline Malate, 3.2g Beta-Alanine for insane gym pumps.</p>
                    <div style="display:flex;justify-content:space-between;align-items:center;margin-top:6px;">
                        <span class="price">₹1,899.00</span>
                        <span class="chip success">In Stock</span>
                    </div>
                    <div class="product-actions">
                        <a class="btn" href="${pageContext.request.contextPath}/products" style="width:100%">View Product</a>
                    </div>
                </div>
            </article>

            <article class="product-card">
                <a class="product-image" href="${pageContext.request.contextPath}/products">
                    <img src="https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?auto=format&fit=crop&w=900&q=85" alt="Beast Life Cast Iron Dumbbells">
                    <span class="product-tag">HEAVY GEAR</span>
                </a>
                <div class="product-body">
                    <span class="chip">BEAST LIFE</span>
                    <a class="product-title" href="${pageContext.request.contextPath}/products">Cast Iron Dumbbell Set (20kg)</a>
                    <p class="muted">Heavy duty knurled handles and spinlock collars for brutal home workouts.</p>
                    <div style="display:flex;justify-content:space-between;align-items:center;margin-top:6px;">
                        <span class="price">₹3,499.00</span>
                        <span class="chip success">In Stock</span>
                    </div>
                    <div class="product-actions">
                        <a class="btn" href="${pageContext.request.contextPath}/products" style="width:100%">View Product</a>
                    </div>
                </div>
            </article>
        <% } %>
    </div>
</section>

<!-- Hardcore Brand Manifesto Section -->
<section class="editorial-feature">
    <div class="container">
        <div class="feature-copy">
            <span class="eyebrow">THE BEAST CODE</span>
            <h2>BUILT FOR THE COMMITTED.</h2>
            <p>We refuse to hide behind proprietary blends or watered-down formulas. Every tub of protein, scoop of creatine, and piece of iron is engineered to fuel relentless dedication in the gym.</p>
            <a class="btn" href="${pageContext.request.contextPath}/products">Explore All Equipment & Nutrition</a>
        </div>
    </div>
</section>
</main>

<footer class="main-footer">
    <div class="container">
        <div class="footer-grid">
            <div>
                <a class="brand-logo" href="${pageContext.request.contextPath}/">BEAST LIFE</a>
                <p class="muted" style="max-width:360px;margin-top:14px;">
                    Hardcore sports nutrition and heavy-duty gym equipment engineered for athletes who refuse to settle. Unleash your inner beast.
                </p>
            </div>
            <div>
                <h4 class="footer-title">Categories</h4>
                <ul class="footer-links">
                    <li><a href="${pageContext.request.contextPath}/products">All Products</a></li>
                    <li><a href="${pageContext.request.contextPath}/products?category=1">Whey Protein & Isolate</a></li>
                    <li><a href="${pageContext.request.contextPath}/products?category=2">Creatine & Pre-Workout</a></li>
                    <li><a href="${pageContext.request.contextPath}/products?category=3">Gym Equipment & Gear</a></li>
                    <li><a href="${pageContext.request.contextPath}/products?category=4">Vitamins & Recovery</a></li>
                </ul>
            </div>
            <div>
                <h4 class="footer-title">Athlete Hub</h4>
                <ul class="footer-links">
                    <li><a href="${pageContext.request.contextPath}/profile">My Account</a></li>
                    <li><a href="${pageContext.request.contextPath}/orders">Order Tracking</a></li>
                    <li><a href="${pageContext.request.contextPath}/wishlist">Wishlist</a></li>
                    <li><a href="${pageContext.request.contextPath}/cart">Shopping Cart</a></li>
                </ul>
            </div>
            <div>
                <h4 class="footer-title">Beast Life</h4>
                <ul class="footer-links">
                    <li><a href="${pageContext.request.contextPath}/login">Sign In</a></li>
                    <li><a href="${pageContext.request.contextPath}/register">Join The Beast Squad</a></li>
                    <li><a href="${pageContext.request.contextPath}/syllabus">Advanced Java Project</a></li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <span>© 2026 BEAST LIFE ATHLETICS • ALL RIGHTS RESERVED</span>
            <span>UNLEASH YOUR INNER BEAST • AUTHENTIC PERFORMANCE NUTRITION</span>
        </div>
    </div>
</footer>

<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</body>
</html>