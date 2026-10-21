<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%
    Integer status = (Integer) request.getAttribute("jakarta.servlet.error.status_code");
    if (status == null && response.getStatus() != 200) status = response.getStatus();
    String message = (String) request.getAttribute("jakarta.servlet.error.message");
    if (message == null || message.isBlank()) message = "An unexpected error occurred while processing your request. Please try again or return to the main store.";
    String ctx = request.getContextPath();
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title><%= status != null ? status + " — BEAST LIFE" : "Notice — BEAST LIFE" %></title>
    <link rel="stylesheet" href="<%= ctx %>/assets/css/app.css">
    <style>
        body { background: #070707; color: #ffffff; display: flex; align-items: center; justify-content: center; min-height: 100vh; margin: 0; font-family: var(--font-body); }
        .error-card { background: var(--surface); border: 1px solid var(--line); border-radius: 2px; padding: 45px 35px; max-width: 500px; width: 90%; text-align: center; box-shadow: 0 16px 40px rgba(0,0,0,0.7); }
        .error-code { font-family: var(--font-display); font-size: 64px; font-weight: 800; color: #ffffff; margin: 10px 0; letter-spacing: 2px; }
        .error-msg { color: #aaaaaa; font-size: 14px; line-height: 1.6; margin-bottom: 28px; }
    </style>
</head>
<body>
<div class="error-card">
    <span class="eyebrow">BEAST LIFE SYSTEM</span>
    <h1 class="error-code"><%= status == null ? "Notice" : status %></h1>
    <p class="error-msg"><%= message %></p>
    <div style="display:flex; gap:12px; justify-content:center; flex-wrap:wrap;">
        <a class="btn" href="<%= ctx %>/products">Explore Products</a>
        <a class="btn secondary" href="<%= ctx %>/">Home Page</a>
    </div>
</div>
</body>
</html>
