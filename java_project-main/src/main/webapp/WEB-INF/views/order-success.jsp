<%@ page contentType="text/html;charset=UTF-8" %>
<% String ctx = request.getContextPath(); %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Order Placed — BEAST LIFE</title>
    <link rel="stylesheet" href="<%= ctx %>/assets/css/app.css">
    <style>
        .success-wrapper {
            max-width: 600px;
            margin: 40px auto 80px;
            text-align: center;
        }
        .success-icon-badge {
            width: 68px;
            height: 68px;
            margin: 0 auto 20px;
            border-radius: 50%;
            background: #ffffff;
            color: #000000;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            font-weight: 900;
            box-shadow: 0 0 25px rgba(255, 255, 255, 0.35);
        }
        .receipt-card {
            background: var(--surface);
            border: 1px solid var(--line);
            padding: 30px;
            margin: 30px 0;
            text-align: left;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }
        .receipt-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 13px;
        }
    </style>
</head>
<body>
<div class="announcement-bar"><span>🔥 100% CLINICAL PURITY • AUTHENTIC ATHLETE NUTRITION & GEAR</span></div>
<header class="nav-header">
    <div class="container nav-inner">
        <nav class="nav-menu">
            <a class="nav-link" href="<%= ctx %>/">Home</a>
            <a class="nav-link" href="<%= ctx %>/products">All Products</a>
        </nav>
        <a class="brand-logo" href="<%= ctx %>/">BEAST LIFE</a>
        <div>
            <a class="btn ghost" href="<%= ctx %>/orders">My Orders</a>
        </div>
    </div>
</header>

<main class="container section">
    <div class="success-wrapper">
        <div class="success-icon-badge">✓</div>
        <span class="eyebrow">THANK YOU FOR YOUR ORDER</span>
        <h1 class="section-title" style="margin-top:8px;">Order #${orderId} Confirmed.</h1>
        <p class="muted" style="margin-top:12px; font-size:14px;">Your supplements and gym gear order has been received. Our fulfillment team is preparing your package for express dispatch.</p>

        <div class="receipt-card">
            <div class="receipt-row">
                <span class="muted">Order Reference</span>
                <strong style="color:#ffffff; font-family:var(--font-mono);">#${orderId}</strong>
            </div>
            <div class="receipt-row">
                <span class="muted">Order Status</span>
                <span class="chip success">CONFIRMED</span>
            </div>
            <div class="receipt-row">
                <span class="muted">Payment Method</span>
                <span style="color:#ffffff; font-weight:600;">Verified Payment / COD</span>
            </div>
            <div class="receipt-row" style="border-top:1px solid var(--line); padding-top:14px; margin-top:4px;">
                <span class="muted">Fulfillment Status</span>
                <span class="chip">PREPARING DISPATCH IN 24H</span>
            </div>
        </div>

        <div style="display:flex; gap:12px; justify-content:center; flex-wrap:wrap;">
            <a class="btn" href="<%= ctx %>/order-detail?orderId=${orderId}">View Order Details</a>
            <a class="btn ghost" href="<%= ctx %>/products">Continue Shopping</a>
        </div>
    </div>
</main>

<footer class="main-footer">
    <div class="container">
        <div class="footer-bottom">
            <span>© 2026 BEAST LIFE ATHLETICS • ALL RIGHTS RESERVED</span>
            <span>UNLEASH YOUR INNER BEAST</span>
        </div>
    </div>
</footer>
</body>
</html>