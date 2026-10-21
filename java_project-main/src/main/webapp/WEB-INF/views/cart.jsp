<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List,com.shopsphere.model.CartItem" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Your Cart — BEAST LIFE</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
</head>
<body>
<div class="announcement-bar"><span>🔥 FREE SHIPPING OVER ₹999 • USE CODE BEAST10 FOR 10% OFF</span></div>
<header class="nav-header">
    <div class="container nav-inner">
        <nav class="nav-menu">
            <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/products">All Products</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/products?category=1">Proteins</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/products?category=2">Creatine</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/products?category=3">Gym Gear</a>
        </nav>
        <a class="brand-logo" href="${pageContext.request.contextPath}/">BEAST LIFE</a>
        <div>
            <a class="btn ghost" href="${pageContext.request.contextPath}/wishlist">Wishlist</a>
            <a class="btn ghost" href="${pageContext.request.contextPath}/orders">Orders</a>
        </div>
    </div>
</header>
<main class="container section">
    <div class="section-head">
        <div>
            <span class="eyebrow">ATHLETE CART</span>
            <h1 class="section-title">Shopping Cart.</h1>
        </div>
        <a class="btn ghost" href="${pageContext.request.contextPath}/products">Continue Shopping</a>
    </div>
    <div class="card">
        <%
            double total = 0;
            List<CartItem> items = (List<CartItem>) request.getAttribute("items");
            if (items == null || items.isEmpty()) {
        %>
            <div class="empty">
                <h3>Your gym cart is empty.</h3>
                <p class="muted">Add protein, creatine, or heavy gym equipment to unleash your inner beast.</p>
                <a class="btn" href="${pageContext.request.contextPath}/products" style="margin-top:18px">Explore Products</a>
            </div>
        <% } else {
            for (CartItem x : items) {
                total += x.getSubtotal();
        %>
            <div class="cart-row">
                <div>
                    <strong style="font-size:16px;"><%= x.getProductName() %></strong>
                    <div class="muted">₹<%= String.format("%.2f", x.getPrice()) %> each</div>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/cart" class="inline">
                    <input type="hidden" name="_csrf" value="${csrfToken}" />
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="productId" value="<%= x.getProductId() %>">
                    <input type="number" name="quantity" min="1" value="<%= x.getQuantity() %>" style="width:90px" required>
                    <button class="btn ghost" type="submit">Update</button>
                </form>
                <div>
                    <strong style="font-size:16px;">₹<%= String.format("%.2f", x.getSubtotal()) %></strong>
                    <form method="post" action="${pageContext.request.contextPath}/cart" style="margin-top:8px">
                        <input type="hidden" name="_csrf" value="${csrfToken}" />
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="productId" value="<%= x.getProductId() %>">
                        <button class="btn danger" type="submit">Remove</button>
                    </form>
                </div>
            </div>
        <% } %>
            <div class="summary">
                <div class="summary-line">
                    <span>Subtotal</span>
                    <strong>₹<%= String.format("%.2f", total) %></strong>
                </div>
                <div class="summary-line">
                    <span>Shipping</span>
                    <strong><%= total >= 999 ? "FREE (Orders over ₹999)" : "₹99 Flat Rate" %></strong>
                </div>
                <div class="summary-line summary-total">
                    <span>Estimated Total</span>
                    <strong>₹<%= String.format("%.2f", total) %></strong>
                </div>
                <a class="btn" href="${pageContext.request.contextPath}/checkout" style="width:100%;margin-top:12px;padding:14px;font-size:12px;">Proceed To Secure Checkout</a>
            </div>
        <% } %>
    </div>
</main>
<footer class="main-footer">
    <div class="container">
        <div class="footer-bottom">
            <span>© 2026 BEAST LIFE ATHLETICS • ALL RIGHTS RESERVED</span>
            <a href="${pageContext.request.contextPath}/products">Back to store</a>
        </div>
    </div>
</footer>
</body>
</html>