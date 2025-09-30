<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <h1 id="kc-page-title">Welcome back</h1>
        <p>Sign in to your account to continue</p>
    <#elseif section = "form">
    <div id="kc-form">
      <div id="kc-form-wrapper">
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">
                    <label for="username" class="${properties.kcLabelClass!}">Email</label>

                    <input tabindex="1" 
                           id="username" 
                           class="${properties.kcInputClass!} form-control" 
                           name="username" 
                           value="${(login.username!'')}"  
                           type="email" 
                           autofocus 
                           autocomplete="email"
                           placeholder="Enter your email"
                           aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                    />

                    <#if messagesPerField.existsError('username','password')>
                        <span id="input-error" class="${properties.kcInputErrorMessageClass!} alert-error" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </span>
                    </#if>
                </div>
                
                <div class="${properties.kcFormGroupClass!}">
                    <label for="password" class="${properties.kcLabelClass!}">Password</label>

                    <input tabindex="2" 
                           id="password" 
                           class="${properties.kcInputClass!} form-control" 
                           name="password" 
                           type="password" 
                           autocomplete="current-password"
                           placeholder="Enter your password"
                           aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                    />

                    <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                        <span id="input-error" class="${properties.kcInputErrorMessageClass!} alert-error" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </span>
                    </#if>
                </div>

                <div class="${properties.kcFormGroupClass!} kc-form-options">
                    <#if realm.rememberMe && !usernameHidden??>
                        <div class="checkbox">
                            <label>
                                <#if login.rememberMe??>
                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> Remember me
                                <#else>
                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> Remember me
                                </#if>
                            </label>
                        </div>
                    </#if>
                    
                    <#if realm.resetPasswordAllowed>
                        <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">Forgot password?</a></span>
                    </#if>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                    <input tabindex="4" 
                           class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} btn-primary" 
                           name="login" 
                           id="kc-login" 
                           type="submit" 
                           value="Sign In"/>
                </div>
            </form>
        </#if>
        
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="kc-social-links">
                <div style="text-align: center; margin: 24px 0; color: #9FC7D9; font-size: 14px;">
                    Or continue with
                </div>
                <ul class="list-unstyled">
                    <#list social.providers as p>
                        <li>
                            <a id="social-${p.alias}" 
                               class="kc-social-provider-button" 
                               href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${p.iconClasses}" aria-hidden="true"></i>
                                </#if>
                                <span>Google</span>
                            </a>
                        </li>
                    </#list>
                </ul>
            </div>
        </#if>
      </div>
    </div>
    <#elseif section = "info">
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container" class="login-pf-signup">
                <div id="kc-registration">
                    <span>Don't have an account? <a tabindex="6" href="${url.registrationUrl}">Sign up</a></span>
                </div>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>