<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username') displayInfo=realm.duplicateEmailsAllowed && realm.loginWithEmailAllowed && realm.registrationEmailAsUsername; section>
    <#if section = "header">
        <h1 id="kc-page-title">Reset your password</h1>
        <p>Enter your email and we'll send you a reset link</p>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <#if realm.duplicateEmailsAllowed>
                    <div class="alert alert-info">
                        <span class="pficon pficon-info"></span>
                        <span>Please specify username or email.</span>
                    </div>
                </#if>
                
                <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <label for="username" class="${properties.kcLabelClass!}">
                            <#if !realm.loginWithEmailAllowed>Username
                            <#elseif !realm.duplicateEmailsAllowed>Email
                            <#else>Email or Username
                            </#if>
                        </label>
                        
                        <#if usernameEditDisabled??>
                            <input tabindex="1" 
                                   id="username" 
                                   class="${properties.kcInputClass!} form-control" 
                                   name="username" 
                                   value="${(auth.attemptedUsername!'')}" 
                                   type="text" 
                                   autofocus
                                   disabled />
                        <#else>
                            <input tabindex="1" 
                                   id="username" 
                                   class="${properties.kcInputClass!} form-control" 
                                   name="username" 
                                   value="${(auth.attemptedUsername!'')}" 
                                   type="text" 
                                   autofocus
                                   placeholder="<#if !realm.loginWithEmailAllowed>Enter your username<#elseif !realm.duplicateEmailsAllowed>Enter your email<#else>Enter your email or username</#if>"
                                   aria-invalid="<#if messagesPerField.existsError('username')>true</#if>" />
                        </#if>

                        <#if messagesPerField.existsError('username')>
                            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!} alert-error" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} btn-primary" 
                               type="submit" 
                               value="Send Reset Email"/>
                    </div>
                    
                    <div class="kc-form-options" style="text-align: center; margin-top: 24px;">
                        <a href="${url.loginUrl}">Back to Login</a>
                    </div>
                </form>
            </div>
        </div>
    <#elseif section = "info">
        <#if realm.duplicateEmailsAllowed && realm.loginWithEmailAllowed && realm.registrationEmailAsUsername>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span>Need help? <a href="#">Contact Support</a></span>
                </div>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
