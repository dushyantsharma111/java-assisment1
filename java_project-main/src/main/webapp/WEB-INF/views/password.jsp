<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Change Password — BEAST LIFE</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
</head>
<body>
<div class="announcement-bar"><span>🔥 100% CLINICAL PURITY • FREE SHIPPING OVER ₹999</span></div>
<header class="nav-header">
    <div class="container nav-inner">
        <nav class="nav-menu">
            <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/products">All Products</a>
        </nav>
        <a class="brand-logo" href="${pageContext.request.contextPath}/">BEAST LIFE</a>
        <div>
            <a class="btn ghost" href="${pageContext.request.contextPath}/profile">Profile</a>
        </div>
    </div>
</header>
<main class="container form-shell">
    <div class="card">
        <span class="eyebrow">ATHLETE SECURITY</span>
        <h1 class="form-title">Change Password</h1>
        <p class="muted">Use 8–128 characters with uppercase, lowercase and a digit to protect your account.</p>
        <% if (request.getAttribute("error") != null) { %><div class="chip danger" style="margin-top:12px;"><%= request.getAttribute("error") %></div><% } %>
        <% if (request.getAttribute("success") != null) { %><div class="chip success" style="margin-top:12px;"><%= request.getAttribute("success") %></div><% } %>
        <form method="post" action="${pageContext.request.contextPath}/password" style="margin-top:16px;">
            <input type="hidden" name="_csrf" value="${csrfToken}" />
            <div class="field"><label>Current Password</label><input type="password" name="currentPassword" required></div>
            <div class="field"><label>New Password</label><input type="password" name="newPassword" minlength="8" maxlength="128" required></div>
            <button type="submit" style="width:100%; margin-top:8px;">Update Password</button>
        </form>
        <p style="margin-top:18px;"><a href="${pageContext.request.contextPath}/profile" class="muted">← Back to Profile</a></p>
    </div>
</main>
<footer class="main-footer">
    <div class="container footer-bottom">
        <span>© 2026 BEAST LIFE ATHLETICS • ALL RIGHTS RESERVED</span>
        <a href="${pageContext.request.contextPath}/products">Continue shopping</a>
    </div>
</footer>
</body>
</html>