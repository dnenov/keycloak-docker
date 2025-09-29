<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false displayInfo=false; section>
    <#if section = "header">
        <h1 id="kc-page-title">Check your email</h1>
        <p>We've sent a password reset link to your email</p>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <div class="reset-sent-message">
                    <div class="success-icon">
                        <svg width="64" height="64" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <circle cx="12" cy="12" r="10" fill="#CFFBF0"/>
                            <path d="M9 12l2 2 4-4" stroke="#0F1724" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </div>
                    
                    <h2>Password reset email sent!</h2>
                    
                    <p class="reset-instructions">
                        If an account with that email address exists, we've sent you a password reset link. 
                        Please check your email and follow the instructions to reset your password.
                    </p>
                    
                    <div class="reset-actions">
                        <a href="${url.loginUrl}" class="btn-primary">Back to Login</a>
                        
                        <div class="resend-section">
                            <p>Didn't receive the email?</p>
                            <a href="${url.loginResetCredentialsUrl}" class="resend-link">Resend email</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>

<style>
.reset-sent-message {
    text-align: center;
    padding: 40px 20px;
}

.success-icon {
    margin-bottom: 24px;
    display: flex;
    justify-content: center;
}

.reset-sent-message h2 {
    font-size: 24px;
    font-weight: 600;
    color: white;
    margin-bottom: 16px;
}

.reset-instructions {
    font-size: 16px;
    color: #9FC7D9;
    line-height: 1.5;
    margin-bottom: 32px;
    max-width: 400px;
    margin-left: auto;
    margin-right: auto;
}

.reset-actions {
    display: flex;
    flex-direction: column;
    gap: 24px;
    align-items: center;
}

.reset-actions .btn-primary {
    display: inline-block;
    padding: 16px 32px;
    background: #CFFBF0;
    color: #0F1724;
    text-decoration: none;
    font-weight: 600;
    border-radius: 4px;
    transition: all 0.2s ease;
}

.reset-actions .btn-primary:hover {
    background: #9FC7D9;
    transform: translateY(-1px);
}

.resend-section {
    text-align: center;
}

.resend-section p {
    color: #9FC7D9;
    font-size: 14px;
    margin-bottom: 8px;
}

.resend-link {
    color: #CFFBF0;
    text-decoration: none;
    font-weight: 500;
    font-size: 14px;
}

.resend-link:hover {
    color: #9FC7D9;
}
</style>
