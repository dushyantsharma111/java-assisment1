<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List,com.shopsphere.model.Address" %>
<% 
    List<Address> addresses = (List<Address>) request.getAttribute("addresses"); 
    String msg = (String) session.getAttribute("msg");
    if (msg != null) session.removeAttribute("msg");
    String error = (String) session.getAttribute("error");
    if (error != null) session.removeAttribute("error");
    String ctx = request.getContextPath();
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Saved Addresses — BEAST LIFE</title>
    <link rel="stylesheet" href="<%= ctx %>/assets/css/app.css">
    <style>
        .addr-card { background:#121212; border:1px solid var(--line); border-radius:2px; padding:20px; display:flex; justify-content:space-between; align-items:center; transition: all 0.2s ease; }
        .addr-card:hover { border-color:#ffffff; box-shadow:0 6px 20px rgba(0,0,0,0.5); }
    </style>
</head>
<body>
<div class="announcement-bar"><span>🔥 100% CLINICAL PURITY • FREE SHIPPING OVER ₹999</span></div>
<header class="nav-header">
    <div class="container nav-inner">
        <nav class="nav-menu">
            <a class="nav-link" href="<%= ctx %>/">Home</a>
            <a class="nav-link" href="<%= ctx %>/products">All Products</a>
        </nav>
        <a class="brand-logo" href="<%= ctx %>/">BEAST LIFE</a>
        <div>
            <a class="btn ghost" href="<%= ctx %>/profile">Profile</a>
            <a class="btn ghost" href="<%= ctx %>/orders">Orders</a>
        </div>
    </div>
</header>
<main class="container section">
    <div class="section-head">
        <div>
            <span class="eyebrow">ATHLETE ADDRESSES</span>
            <h2>Saved Shipping Locations</h2>
            <p class="muted">Manage your delivery addresses for seamless nutrition & gear deliveries.</p>
        </div>
        <a class="btn ghost" href="<%= ctx %>/profile">← Back to Profile</a>
    </div>

    <% if (msg != null) { %>
        <div class="alert success"><%= msg %></div>
    <% } %>

    <% if (error != null) { %>
        <div class="alert error"><%= error %></div>
    <% } %>
    
    <div class="grid" style="grid-template-columns: 1fr 2fr; gap: 24px;">
        <section class="card">
            <h3 style="font-size:15px; font-weight:700; text-transform:uppercase; letter-spacing:0.08em; color:#ffffff;">Add Shipping Address</h3>
            <form method="post" action="<%= ctx %>/addresses" style="margin-top:16px;">
                <input type="hidden" name="_csrf" value="${csrfToken}" />
                <div class="field"><label>Address Line</label><input name="addressLine" maxlength="255" required placeholder="Street address, gym floor, suite"></div>
                <div class="field"><label>City</label><input name="city" maxlength="100" required placeholder="City"></div>
                <div class="field"><label>State</label><input name="state" maxlength="100" required placeholder="State"></div>
                <div class="field"><label>Pincode</label><input name="pincode" inputmode="numeric" pattern="[0-9]{6}" maxlength="6" required placeholder="6-digit PIN code"></div>
                <button type="submit" class="btn" style="width:100%; margin-top:12px;">Save New Address</button>
            </form>
        </section>
        
        <section class="card">
            <h3 style="font-size:15px; font-weight:700; text-transform:uppercase; letter-spacing:0.08em; color:#ffffff;">Your Saved Locations</h3>
            <div style="margin-top:16px; display:flex; flex-direction:column; gap:12px;">
                <% if (addresses == null || addresses.isEmpty()) { %>
                <div class="card empty"><p class="muted">No saved addresses yet. Add a location to speed up supplement checkout.</p></div>
                <% } else { for (Address a : addresses) { %>
                <div class="addr-card">
                    <div>
                        <strong style="font-size:15px; color:#ffffff;"><%= a.getAddressLine() %></strong>
                        <div class="muted" style="margin-top:4px; font-size:13px;"><%= a.getCity() %>, <%= a.getState() %> — <strong><%= a.getPincode() %></strong></div>
                    </div>
                    <form method="post" action="<%= ctx %>/addresses" onsubmit="return confirm('Are you sure you want to delete this saved address?');">
                        <input type="hidden" name="_csrf" value="${csrfToken}" />
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="addressId" value="<%= a.getAddressId() %>">
                        <button class="btn danger" type="submit" style="padding:6px 14px; font-size:11px; cursor:pointer;">Delete</button>
                    </form>
                </div>
                <% } } %>
            </div>
        </section>
    </div>
</main>
<footer class="main-footer">
    <div class="container footer-bottom">
        <span>© 2026 BEAST LIFE ATHLETICS • ALL RIGHTS RESERVED</span>
        <a href="<%= ctx %>/products">Continue shopping</a>
    </div>
</footer>
</body>
</html>
