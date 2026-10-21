<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.shopsphere.model.Product,java.util.List,java.util.Map,com.shopsphere.model.User" %>
<%
    Product p = (Product) request.getAttribute("product");
    User u = (User) session.getAttribute("loggedInUser");
    Boolean isWish = (Boolean) request.getAttribute("isWishlisted");
    boolean isWishlisted = isWish != null && isWish;
    List<Map<String, Object>> reviews = (List<Map<String, Object>>) request.getAttribute("reviews");
    String ctx = request.getContextPath();

    // Default primary and gallery images
    String mainImage = (p != null && p.getImageUrl() != null && !p.getImageUrl().trim().isEmpty())
        ? p.getImageUrl()
        : "https://images.unsplash.com/photo-1579722821273-0f6c7d44362f?auto=format&fit=crop&w=1200&q=85";

    // Alternate angles for fitness gallery experience
    String img2 = (p != null && p.getCategoryId() == 2) 
        ? "https://images.unsplash.com/photo-1584735935682-2f2b69dff9d2?auto=format&fit=crop&w=1200&q=85" 
        : ((p != null && p.getCategoryId() == 3)
            ? "https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?auto=format&fit=crop&w=1200&q=85"
            : "https://images.unsplash.com/photo-1593095948071-474c5cc2989d?auto=format&fit=crop&w=1200&q=85");
    String img3 = (p != null && p.getCategoryId() == 3) 
        ? "https://images.unsplash.com/photo-1517838277536-f5f99be501cd?auto=format&fit=crop&w=1200&q=85" 
        : "https://images.unsplash.com/photo-1546483875-ad9014c88eba?auto=format&fit=crop&w=1200&q=85";

    // Calculate rating stats
    double avgRating = 0.0;
    int reviewCount = (reviews != null) ? reviews.size() : 0;
    if (reviewCount > 0) {
        int totalStars = 0;
        for (Map<String, Object> r : reviews) {
            Object rObj = r.get("rating");
            if (rObj != null) {
                totalStars += Integer.parseInt(String.valueOf(rObj));
            }
        }
        avgRating = (double) totalStars / reviewCount;
    }
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title><%= p != null ? p.getName() : "Product" %> — BEAST LIFE</title>
    <link rel="stylesheet" href="<%= ctx %>/assets/css/app.css">
    <style>
        .gallery-wrap { display: flex; gap: 16px; flex-direction: column; }
        .main-display-img { width: 100%; border: 1px solid var(--line); object-fit: cover; max-height: 480px; transition: transform 0.3s ease; }
        .thumbs-row { display: flex; gap: 10px; overflow-x: auto; padding-bottom: 4px; }
        .thumb-item { width: 76px; height: 76px; border: 2px solid transparent; cursor: pointer; object-fit: cover; opacity: 0.6; transition: all 0.2s; }
        .thumb-item.active, .thumb-item:hover { border-color: #ffffff; opacity: 1; }
        .trust-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 12px; margin: 24px 0; padding: 18px; background: #111111; border: 1px solid var(--line); }
        .trust-item { display: flex; align-items: center; gap: 10px; font-size: 12px; color: #cccccc; }
        .trust-icon { font-size: 18px; color: #ffffff; }
        .rating-summary-box { display: flex; align-items: center; gap: 14px; margin: 12px 0 20px; }
        .star-score { font-size: 22px; font-weight: bold; color: #ffffff; font-family: var(--font-display); }
    </style>
</head>
<body>
<div class="announcement-bar"><span>🔥 100% CLINICALLY TESTED • FREE SHIPPING OVER ₹999 • DISPATCH IN 24H</span></div>
<header class="nav-header">
    <div class="container nav-inner">
        <nav class="nav-menu">
            <a class="nav-link" href="<%= ctx %>/">Home</a>
            <a class="nav-link active" href="<%= ctx %>/products">All Products</a>
            <a class="nav-link" href="<%= ctx %>/products?category=1">Proteins</a>
            <a class="nav-link" href="<%= ctx %>/products?category=2">Creatine</a>
            <a class="nav-link" href="<%= ctx %>/products?category=3">Gym Gear</a>
        </nav>
        <a class="brand-logo" href="<%= ctx %>/">BEAST LIFE</a>
        <div>
            <a class="btn ghost" href="<%= ctx %>/wishlist">Wishlist</a>
            <a class="btn ghost" href="<%= u == null ? ctx + "/login" : ("ADMIN".equalsIgnoreCase(u.getRole()) ? ctx + "/admin/dashboard" : ctx + "/profile") %>">Account</a>
            <a class="btn ghost" href="<%= ctx %>/cart">Cart</a>
        </div>
    </div>
</header>

<main class="container section">
    <a href="<%= ctx %>/products" class="eyebrow" style="text-decoration:none; display:inline-block; margin-bottom:16px;">← BACK TO ALL PRODUCTS</a>
    
    <div class="detail-grid" style="margin-top: 10px;">
        <!-- Left: Image Gallery -->
        <div class="gallery-wrap">
            <div style="position: relative; overflow: hidden; border: 1px solid var(--line);">
                <img id="mainImage" class="main-display-img" src="<%= mainImage %>" alt="<%= p != null ? p.getName() : "" %>">
                <span class="product-tag" style="position:absolute; top:12px; left:12px;"><%= (p != null && p.getStock() > 0) ? "IN STOCK" : "SOLD OUT" %></span>
            </div>
            <div class="thumbs-row">
                <img class="thumb-item active" src="<%= mainImage %>" onclick="switchImage(this)" alt="Main view">
                <img class="thumb-item" src="<%= img2 %>" onclick="switchImage(this)" alt="Alternate view 1">
                <img class="thumb-item" src="<%= img3 %>" onclick="switchImage(this)" alt="Alternate view 2">
            </div>
        </div>

        <!-- Right: Product Information & Order Actions -->
        <div>
            <div style="display:flex; justify-content:space-between; align-items:center;">
                <span class="chip"><%= p != null && p.getBrand() != null ? p.getBrand() : "BEAST LIFE" %></span>
                <!-- Wishlist Toggle Button -->
                <form method="post" action="<%= ctx %>/wishlist" style="margin:0;">
                    <input type="hidden" name="_csrf" value="${csrfToken}" />
                    <input type="hidden" name="productId" value="<%= p != null ? p.getProductId() : 0 %>">
                    <% if (isWishlisted) { %>
                        <input type="hidden" name="action" value="remove">
                        <button class="btn secondary" type="submit" style="padding: 6px 14px; font-size: 11px;">❤️ Saved in Wishlist</button>
                    <% } else { %>
                        <button class="btn ghost" type="submit" style="padding: 6px 14px; font-size: 11px;">🤍 Add to Wishlist</button>
                    <% } %>
                </form>
            </div>

            <h1 style="font-size: 36px; margin: 14px 0 8px;"><%= p != null ? p.getName() : "" %></h1>

            <!-- Ratings Summary -->
            <div class="rating-summary-box">
                <div class="star-score">★ <%= (reviewCount > 0) ? String.format("%.1f", avgRating) : "5.0" %></div>
                <span class="muted">(<%= reviewCount %> verified athlete reviews)</span>
            </div>

            <div class="price" style="font-size: 30px; margin: 16px 0;">₹<%= p != null ? String.format("%.2f", p.getPrice()) : "0.00" %></div>

            <!-- Stock Status -->
            <div style="margin: 16px 0;">
                <% if (p != null && p.getStock() > 5) { %>
                    <span class="chip success">✓ In Stock (<%= p.getStock() %> units ready for dispatch)</span>
                <% } else if (p != null && p.getStock() > 0) { %>
                    <span class="chip danger" style="font-weight:bold;">⚡ Only <%= p.getStock() %> left in stock — Order soon!</span>
                <% } else { %>
                    <span class="chip danger">Currently Sold Out</span>
                <% } %>
            </div>

            <p class="muted" style="line-height: 1.7; margin: 18px 0; font-size: 14px;"><%= p != null ? p.getDescription() : "" %></p>

            <!-- Order / Add to Cart Form -->
            <% if (p != null && p.getStock() > 0) { %>
            <form method="post" action="<%= ctx %>/cart" style="margin-top: 24px;">
                <input type="hidden" name="_csrf" value="${csrfToken}" />
                <input type="hidden" name="productId" value="<%= p.getProductId() %>">
                <div style="display:flex; gap:12px; align-items:center;">
                    <div style="width: 100px;">
                        <label class="muted" style="font-size:11px; display:block; margin-bottom:4px; font-weight:700;">QUANTITY</label>
                        <input type="number" name="quantity" value="1" min="1" max="<%= p.getStock() %>" style="width:100%; padding:12px; background:#181818; border:1px solid #333; color:#fff;">
                    </div>
                    <div style="flex:1; margin-top:19px;">
                        <button type="submit" style="width:100%; padding:14px; font-weight:800; letter-spacing:0.12em;">Add to Cart</button>
                    </div>
                </div>
            </form>
            <% } %>

            <!-- Value Props & Athlete Trust Badges -->
            <div class="trust-grid">
                <div class="trust-item"><span class="trust-icon">🛡️</span><span>100% Certified Authentic & Dope-Free</span></div>
                <div class="trust-item"><span class="trust-icon">🚚</span><span>Free Tracked Priority 24-48h Shipping</span></div>
                <div class="trust-item"><span class="trust-icon">🔄</span><span>14 Days Sealed Hassle-Free Replacement</span></div>
                <div class="trust-item"><span class="trust-icon">🔒</span><span>256-Bit Encrypted Secure Checkout</span></div>
            </div>
        </div>
    </div>

    <!-- Customer Reviews Section -->
    <div class="section-head" style="margin-top: 70px;">
        <div>
            <span class="eyebrow">ATHLETE EXPERIENCES</span>
            <h2>Customer Reviews</h2>
        </div>
    </div>

    <div class="grid review-grid">
        <% if (reviews == null || reviews.isEmpty()) { %>
            <div class="card empty" style="grid-column: 1 / -1; padding: 40px; text-align: center;">
                <h3>No reviews yet</h3>
                <p class="muted">Be the first verified athlete to review this supplement or equipment.</p>
            </div>
        <% } else { %>
            <% for (Map<String, Object> r : reviews) { %>
                <article class="card" style="padding: 22px; background: #131313;">
                    <div style="display:flex; justify-content:space-between; align-items:center;">
                        <strong><%= r.get("name") != null ? r.get("name") : "Verified Athlete" %></strong>
                        <div class="rating" style="font-weight:bold;">★ <%= r.get("rating") %>/5</div>
                    </div>
                    <p style="margin: 12px 0; color: #dedede; line-height:1.5;"><%= r.get("reviewText") != null ? r.get("reviewText") : "" %></p>
                    <small class="muted" style="font-size:11px;"><%= r.get("createdAt") != null ? r.get("createdAt") : "" %></small>
                </article>
            <% } %>
        <% } %>
    </div>

    <!-- Review Form for Logged-In User -->
    <% if (u != null) { %>
    <div class="card" style="margin-top: 30px; background: #121212; border: 1px solid var(--line); padding: 30px;">
        <span class="eyebrow">YOUR ATHLETE FEEDBACK</span>
        <h3 style="font-size: 24px; margin: 8px 0 16px;">Write a Product Review</h3>
        <form method="post" action="<%= ctx %>/reviews">
            <input type="hidden" name="_csrf" value="${csrfToken}" />
            <input type="hidden" name="productId" value="<%= p != null ? p.getProductId() : 0 %>">
            <div class="field" style="margin-bottom: 14px;">
                <label style="display:block; margin-bottom:6px; font-size:11px;">Overall Rating</label>
                <select name="rating" required style="width: 100%; max-width: 260px; padding: 12px; background:#181818; border:1px solid #333; color:#fff;">
                    <option value="5">★★★★★ 5 — Exceptional Quality & Results</option>
                    <option value="4">★★★★☆ 4 — Very Good</option>
                    <option value="3">★★★☆☆ 3 — Average / Good</option>
                    <option value="2">★★☆☆☆ 2 — Needs Improvement</option>
                    <option value="1">★☆☆☆☆ 1 — Dissatisfied</option>
                </select>
            </div>
            <div class="field" style="margin-bottom: 14px;">
                <label style="display:block; margin-bottom:6px; font-size:11px;">Your Detailed Review</label>
                <textarea name="reviewText" rows="4" maxlength="1000" placeholder="Describe the mixability, taste, strength gains, build quality, and performance…" style="width: 100%; padding: 12px; background:#181818; border:1px solid #333; color:#fff;"></textarea>
            </div>
            <button type="submit" class="btn" style="padding: 12px 28px;">Publish Review</button>
        </form>
    </div>
    <% } else { %>
    <div class="card" style="margin-top: 24px; text-align: center; padding: 24px; background: #121212;">
        <p class="muted">Want to leave a review? <a href="<%= ctx %>/login" style="color:#ffffff; text-decoration:underline;">Sign in to your account</a></p>
    </div>
    <% } %>
</main>

<footer class="main-footer">
    <div class="container">
        <div class="footer-bottom">
            <span>© 2026 BEAST LIFE ATHLETICS • ALL RIGHTS RESERVED</span>
            <a href="<%= ctx %>/products">Continue shopping</a>
        </div>
    </div>
</footer>

<script>
function switchImage(el) {
    document.getElementById('mainImage').src = el.src;
    document.querySelectorAll('.thumb-item').forEach(t => t.classList.remove('active'));
    el.classList.add('active');
}
</script>
<script src="<%= ctx %>/assets/js/app.js"></script>
</body>
</html>