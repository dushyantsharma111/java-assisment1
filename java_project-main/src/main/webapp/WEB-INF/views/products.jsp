<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.shopsphere.model.Product,java.util.List,com.shopsphere.model.User" %>
<% 
    User u = (User) session.getAttribute("loggedInUser"); 
    List<Product> products = (List<Product>) request.getAttribute("products"); 
    String query = (String) request.getAttribute("query"); if (query == null) query = ""; 
    String sort = (String) request.getAttribute("sort"); if (sort == null) sort = "newest"; 
    Integer pageObj = (Integer) request.getAttribute("page"); int currentPage = pageObj == null ? 1 : pageObj; 
    Integer currentCat = (Integer) request.getAttribute("category"); if (currentCat == null) currentCat = 0;
    List<String[]> catList = (List<String[]>) request.getAttribute("categories");
    String ctx = request.getContextPath();
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>All Products — BEAST LIFE</title>
    <meta name="description" content="Shop authentic whey protein isolate, micronized creatine, explosive pre-workout and heavy duty gym gear at BEAST LIFE.">
    <link rel="stylesheet" href="<%= ctx %>/assets/css/app.css">
</head>
<body>
<div class="announcement-bar">
    <span>🔥 USE CODE <strong>BEAST10</strong> FOR 10% OFF &nbsp;•&nbsp; 100% LAB-TESTED FORMULAS &nbsp;•&nbsp; FREE SHIPPING OVER ₹999</span>
</div>
<header class="nav-header">
    <div class="container nav-inner">
        <nav class="nav-menu">
            <a class="nav-link" href="<%= ctx %>/">Home</a>
            <a class="nav-link <%= currentCat == 0 ? "active" : "" %>" href="<%= ctx %>/products">All Products</a>
            <a class="nav-link <%= currentCat == 1 ? "active" : "" %>" href="<%= ctx %>/products?category=1">Proteins</a>
            <a class="nav-link <%= currentCat == 2 ? "active" : "" %>" href="<%= ctx %>/products?category=2">Creatine</a>
            <a class="nav-link <%= currentCat == 3 ? "active" : "" %>" href="<%= ctx %>/products?category=3">Gym Gear</a>
        </nav>
        <a class="brand-logo" href="<%= ctx %>/">BEAST LIFE</a>
        <div>
            <a class="btn ghost" href="<%= ctx %>/products">Search</a>
            <a class="btn ghost" href="<%= u == null ? ctx + "/login" : ("ADMIN".equalsIgnoreCase(u.getRole()) ? ctx + "/admin/dashboard" : ctx + "/profile") %>">Account</a>
            <a class="btn ghost" href="<%= ctx %>/cart">Cart</a>
        </div>
    </div>
</header>
<main class="container products-section">
    <div class="section-head">
        <div>
            <span class="eyebrow">THE ARSENAL</span>
            <h1 class="section-title">All Products.</h1>
            <p class="muted">Explore authentic supplements, performance formulas and gym equipment.</p>
        </div>
    </div>

    <!-- Search & Sort Bar -->
    <div class="filter-bar">
        <form method="get" action="<%= ctx %>/products" class="filter-form">
            <input name="q" value="<%= query %>" placeholder="Search protein, creatine, dumbbells, gear…">
            <input type="hidden" name="category" value="<%= currentCat %>">
            <select name="sort">
                <option value="newest" <%= "newest".equals(sort) ? "selected" : "" %>>Newest</option>
                <option value="price_asc" <%= "price_asc".equals(sort) ? "selected" : "" %>>Price: Low to High</option>
                <option value="price_desc" <%= "price_desc".equals(sort) ? "selected" : "" %>>Price: High to Low</option>
                <option value="stock" <%= "stock".equals(sort) ? "selected" : "" %>>Availability</option>
            </select>
            <button type="submit">Filter</button>
            <% if (!query.isEmpty() || currentCat > 0) { %>
                <a class="btn ghost" href="<%= ctx %>/products">Clear</a>
            <% } %>
        </form>
    </div>

    <!-- Category Pill Bar -->
    <div class="category-pill-bar">
        <a class="cat-pill <%= currentCat == 0 ? "active" : "" %>" href="<%= ctx %>/products?q=<%= query %>&sort=<%= sort %>">All Gear & Nutrition</a>
        <% if (catList != null && !catList.isEmpty()) { 
            for (String[] c : catList) {
                int cId = 0;
                try { cId = Integer.parseInt(c[0]); } catch(Exception ignored){}
        %>
            <a class="cat-pill <%= currentCat == cId ? "active" : "" %>" href="<%= ctx %>/products?category=<%= cId %>&q=<%= query %>&sort=<%= sort %>"><%= c[1] %></a>
        <%  } 
           } else { %>
            <a class="cat-pill <%= currentCat == 1 ? "active" : "" %>" href="<%= ctx %>/products?category=1&q=<%= query %>&sort=<%= sort %>">Proteins & Mass Gainers</a>
            <a class="cat-pill <%= currentCat == 2 ? "active" : "" %>" href="<%= ctx %>/products?category=2&q=<%= query %>&sort=<%= sort %>">Creatine & Pre-Workout</a>
            <a class="cat-pill <%= currentCat == 3 ? "active" : "" %>" href="<%= ctx %>/products?category=3&q=<%= query %>&sort=<%= sort %>">Gym Equipment & Gear</a>
            <a class="cat-pill <%= currentCat == 4 ? "active" : "" %>" href="<%= ctx %>/products?category=4&q=<%= query %>&sort=<%= sort %>">Vitamins & Recovery</a>
        <% } %>
    </div>

    <% if (products == null || products.isEmpty()) { %>
        <div class="card empty">
            <h3>No products found.</h3>
            <p class="muted">Try searching with another keyword or browse our full fitness collection.</p>
            <a class="btn" href="<%= ctx %>/products" style="margin-top:18px">Reset Filters</a>
        </div>
    <% } else { %>
        <div class="grid">
        <% 
            java.util.Set<Integer> wishIds = (java.util.Set<Integer>) request.getAttribute("wishlistIds");
            String[] images = {
                "https://images.unsplash.com/photo-1579722821273-0f6c7d44362f?auto=format&fit=crop&w=900&q=85",
                "https://images.unsplash.com/photo-1593095948071-474c5cc2989d?auto=format&fit=crop&w=900&q=85",
                "https://images.unsplash.com/photo-1584735935682-2f2b69dff9d2?auto=format&fit=crop&w=900&q=85",
                "https://images.unsplash.com/photo-1546483875-ad9014c88eba?auto=format&fit=crop&w=900&q=85",
                "https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?auto=format&fit=crop&w=900&q=85",
                "https://images.unsplash.com/photo-1517838277536-f5f99be501cd?auto=format&fit=crop&w=900&q=85",
                "https://images.unsplash.com/photo-1598289431512-b97b0917affc?auto=format&fit=crop&w=900&q=85",
                "https://images.unsplash.com/photo-1517963879433-6ad2b056d712?auto=format&fit=crop&w=900&q=85"
            };
            int i = 0;
            for (Product p : products) {
                String image = (p.getImageUrl() != null && !p.getImageUrl().trim().isEmpty()) ? p.getImageUrl() : images[i++ % images.length];
                boolean isItemWishlisted = (wishIds != null && wishIds.contains(p.getProductId()));
        %>
            <article class="product-card">
                <a class="product-image" href="<%= ctx %>/product?id=<%= p.getProductId() %>">
                    <img src="<%= image %>" alt="<%= p.getName() %>">
                    <span class="product-tag"><%= p.getStock() > 0 ? "AUTHENTIC" : "SOLD OUT" %></span>
                </a>
                <div class="product-body">
                    <span class="chip"><%= p.getBrand() != null ? p.getBrand() : "BEAST LIFE" %></span>
                    <a class="product-title" href="<%= ctx %>/product?id=<%= p.getProductId() %>"><%= p.getName() %></a>
                    <p class="muted"><%= p.getDescription() != null && p.getDescription().length() > 80 ? p.getDescription().substring(0, 80) + "…" : (p.getDescription() == null ? "" : p.getDescription()) %></p>
                    <div style="display:flex;justify-content:space-between;align-items:center; margin: 6px 0;">
                        <span class="price">₹<%= String.format("%.2f", p.getPrice()) %></span>
                        <% if (p.getStock() <= 5 && p.getStock() > 0) { %>
                            <span class="chip danger">Only <%= p.getStock() %> left!</span>
                        <% } else if (p.getStock() > 0) { %>
                            <span class="chip success">In Stock (<%= p.getStock() %>)</span>
                        <% } else { %>
                            <span class="chip danger">Sold Out</span>
                        <% } %>
                    </div>
                    <div class="product-actions" style="display:flex; gap:8px;">
                        <% if (p.getStock() > 0) { %>
                        <form method="post" action="<%= ctx %>/cart" style="flex:1;">
                            <input type="hidden" name="_csrf" value="${csrfToken}" />
                            <input type="hidden" name="productId" value="<%= p.getProductId() %>">
                            <input type="hidden" name="quantity" value="1">
                            <button type="submit" style="width:100%;">Add to Cart</button>
                        </form>
                        <% } %>
                        <form method="post" action="<%= ctx %>/wishlist">
                            <input type="hidden" name="_csrf" value="${csrfToken}" />
                            <input type="hidden" name="productId" value="<%= p.getProductId() %>">
                            <% if (isItemWishlisted) { %>
                                <input type="hidden" name="action" value="remove">
                                <button class="btn secondary" type="submit" title="Remove from wishlist">❤️</button>
                            <% } else { %>
                                <button class="btn ghost" type="submit" title="Save to wishlist">🤍</button>
                            <% } %>
                        </form>
                    </div>
                </div>
            </article>
        <% } %>
        </div>

        <div class="filter-bar" style="margin-top:40px">
            <span class="muted">Page <%= currentPage %></span>
            <div style="display:flex;gap:8px">
                <% if (currentPage > 1) { %>
                <a class="btn ghost" href="?q=<%= query %>&category=<%= currentCat %>&sort=<%= sort %>&page=<%= currentPage - 1 %>">Previous</a>
                <% } %>
                <a class="btn ghost" href="?q=<%= query %>&category=<%= currentCat %>&sort=<%= sort %>&page=<%= currentPage + 1 %>">Next</a>
            </div>
        </div>
    <% } %>
</main>
<footer class="main-footer">
    <div class="container">
        <div class="footer-bottom">
            <span>© 2026 BEAST LIFE ATHLETICS • ALL RIGHTS RESERVED</span>
            <span>UNLEASH YOUR INNER BEAST • AUTHENTIC PERFORMANCE NUTRITION</span>
        </div>
    </div>
</footer>
<script src="<%= ctx %>/assets/js/app.js"></script>
</body>
</html>
