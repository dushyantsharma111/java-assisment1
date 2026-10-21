<%@ page contentType="text/html;charset=UTF-8" %>
<% String ctx = request.getContextPath(); %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Reset Password — BEAST LIFE</title>
    <link rel="stylesheet" href="<%= ctx %>/assets/css/app.css">
</head>
<body>
<main class="container form-shell">
    <div class="card">
        <a class="brand-logo" href="<%= ctx %>/">BEAST LIFE</a>
        <span class="eyebrow" style="display:block;margin-top:35px">ATHLETE SECURITY</span>
        <h1 class="form-title">Reset Password.</h1>
        <p class="muted">Enter your account email to receive a 6-digit OTP verification code.</p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert error" style="margin-top:16px;"><%= request.getAttribute("error") %></div>
        <% } %>

        <% if (request.getAttribute("message") != null) { %>
            <div class="alert success" style="margin-top:16px;"><%= request.getAttribute("message") %></div>
        <% } %>

        <% String step = (String) request.getAttribute("step"); %>
        <% if (!"verify".equals(step)) { %>
            <!-- Step 1: Send OTP -->
            <form method="post" action="<%= ctx %>/forgot-password" style="margin-top:24px;">
                <input type="hidden" name="_csrf" value="${csrfToken}" />
                <input type="hidden" name="action" value="send-otp">
                <div class="field">
                    <label>Athlete Account Email</label>
                    <input type="email" name="email" required placeholder="athlete@beastlife.com">
                </div>
                <button type="submit" style="width:100%; margin-top:8px;">Send OTP Code</button>
            </form>
        <% } else { %>
            <!-- Step 2: Verify OTP & New Password -->
            <form method="post" action="<%= ctx %>/forgot-password" style="margin-top:24px;">
                <input type="hidden" name="_csrf" value="${csrfToken}" />
                <input type="hidden" name="action" value="reset-password">
                <div class="field">
                    <label>6-Digit OTP Code</label>
                    <input type="text" name="otp" pattern="[0-9]{6}" required placeholder="123456" maxlength="6" style="letter-spacing:6px; font-weight:bold; text-align:center;">
                </div>
                <div class="field">
                    <label>New Password</label>
                    <input type="password" name="newPassword" minlength="8" required placeholder="••••••••">
                </div>
                <div class="field">
                    <label>Confirm New Password</label>
                    <input type="password" name="confirmPassword" minlength="8" required placeholder="••••••••">
                </div>
                <button type="submit" style="width:100%; margin-top:8px;">Update Password</button>
            </form>
        <% } %>

        <p class="muted" style="margin-top:22px; text-align:center;">Remembered your password? <a href="<%= ctx %>/login" style="color:#ffffff; font-weight:700; text-decoration:underline;">Sign in</a></p>
    </div>
</main>
</body>
</html>
