<%@ page contentType="text/html;charset=UTF-8" %>
<% String ctx = request.getContextPath(); %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Join The Beast Squad — BEAST LIFE</title>
    <link rel="stylesheet" href="<%= ctx %>/assets/css/app.css">
    <style>
        .auth-divider { display: flex; align-items: center; margin: 20px 0; color: var(--muted, #8c8c8c); font-size: 11px; letter-spacing: 0.14em; text-transform: uppercase; }
        .auth-divider::before, .auth-divider::after { content: ""; flex: 1; border-bottom: 1px solid var(--line); }
        .auth-divider span { padding: 0 12px; }
        .google-btn { display: flex; align-items: center; justify-content: center; gap: 10px; width: 100%; padding: 13px; background: #161616; border: 1px solid var(--line); color: #ffffff; font-size: 11px; font-weight: 700; letter-spacing: 0.12em; text-transform: uppercase; cursor: pointer; transition: all 0.25s ease; text-decoration: none; box-sizing: border-box; }
        .google-btn:hover { background: #222; border-color: #ffffff; color: #ffffff; box-shadow: 0 0 14px rgba(255,255,255,0.15); }
    </style>
</head>
<body>
<main class="container form-shell">
    <div class="card">
        <a class="brand-logo" href="<%= ctx %>/">BEAST LIFE</a>
        <span class="eyebrow" style="display:block;margin-top:35px">NEW ATHLETE REGISTRATION</span>
        <h1 class="form-title">Join The Beast Squad.</h1>
        <p class="muted">Create an account to track protein deliveries, save heavy gym gear, and get member deals.</p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert error" style="margin-top:16px;"><%= request.getAttribute("error") %></div>
        <% } %>

        <!-- Real Google OAuth Section -->
        <div style="margin-top:24px;">
            <a href="<%= ctx %>/google-oauth" class="google-btn">
                <svg width="18" height="18" viewBox="0 0 24 24">
                    <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                    <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                    <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.06H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.94l2.85-2.22.81-.63z"/>
                    <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.06l3.66 2.84c.87-2.6 3.3-4.52 6.16-4.52z"/>
                </svg>
                Sign Up with Google
            </a>
        </div>

        <div class="auth-divider"><span>OR REGISTER WITH EMAIL</span></div>

        <form method="post" action="<%= ctx %>/register">
            <input type="hidden" name="_csrf" value="${csrfToken}" />
            
            <div class="field">
                <label>Athlete Name</label>
                <input name="name" required placeholder="Marcus Vane">
            </div>
            <div class="field">
                <label>Email Address</label>
                <input type="email" name="email" required placeholder="athlete@beastlife.com">
            </div>
            <div class="field">
                <label>Mobile Number</label>
                <input name="mobile" placeholder="+91 9876543210">
            </div>
            <div class="field">
                <label>Password</label>
                <input type="password" name="password" minlength="8" maxlength="128" required placeholder="••••••••">
                <small class="muted">8–128 characters with uppercase, lowercase and a digit.</small>
            </div>
            <button type="submit" style="width:100%; margin-top:8px;">Create Athlete Account</button>
        </form>

        <p class="muted" style="margin-top:22px; text-align:center;">Already part of the squad? <a href="<%= ctx %>/login" style="color:#ffffff; font-weight:700; text-decoration:underline;">Sign In</a></p>
    </div>
</main>
</body>
</html>