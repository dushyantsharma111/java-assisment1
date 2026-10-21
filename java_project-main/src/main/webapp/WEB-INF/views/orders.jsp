<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>My Orders — BEAST LIFE</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
</head>
<body>
<div class="announcement-bar"><span>🔥 100% CLINICAL PURITY • FREE SHIPPING OVER ₹999</span></div>
<header class="nav-header">
    <div class="container nav-inner">
        <a class="brand-logo" href="${pageContext.request.contextPath}/">BEAST LIFE</a>
        <a class="btn ghost" href="${pageContext.request.contextPath}/products">Continue Shopping</a>
    </div>
</header>
<main class="container section">
    <div class="section-head">
        <div>
            <span class="eyebrow">ATHLETE ORDERS</span>
            <h2>Order History</h2>
            <p class="muted">Track your supplement shipments, gym equipment delivery, and payment statuses.</p>
        </div>
    </div>
    <div class="table-wrap">
        <table>
            <tr>
                <th>Order</th>
                <th>Total</th>
                <th>Payment</th>
                <th>Payment Status</th>
                <th>Fulfillment</th>
                <th>Date</th>
                <th>Details</th>
            </tr>
            <% 
                List<Map<String,Object>> orders = (List<Map<String,Object>>) request.getAttribute("orders");
                if (orders == null || orders.isEmpty()) { 
            %>
                <tr>
                    <td colspan="7" class="empty">No orders placed yet.</td>
                </tr>
            <% } else { 
                for (Map<String,Object> o : orders) { 
            %>
                <tr>
                    <td><strong style="font-family:var(--font-mono);">#<%= o.get("orderId") %></strong></td>
                    <td><strong>₹<%= String.format("%.2f", Double.parseDouble(String.valueOf(o.get("total")))) %></strong></td>
                    <td><span class="chip"><%= o.get("paymentMethod") %></span></td>
                    <td><span class="chip success"><%= o.get("paymentStatus") %></span></td>
                    <td><span class="chip"><%= o.get("orderStatus") %></span></td>
                    <td class="muted"><%= o.get("createdAt") %></td>
                    <td><a class="btn ghost" style="padding:6px 14px;" href="<%= request.getContextPath() %>/order-detail?orderId=<%= o.get("orderId") %>">View</a></td>
                </tr>
            <%  } 
               } 
            %>
        </table>
    </div>
</main>
<footer class="main-footer">
    <div class="container footer-bottom">
        <span>© 2026 BEAST LIFE ATHLETICS • ALL RIGHTS RESERVED</span>
        <a href="${pageContext.request.contextPath}/products">Back to store</a>
    </div>
</footer>
</body>
</html>