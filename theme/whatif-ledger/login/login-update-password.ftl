<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm') displayInfo=false; section>
    <#if section = "header">
        <h1 id="kc-page-title">Set new password</h1>
        <p>Enter your new password below</p>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
                    <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

                    <div class="${properties.kcFormGroupClass!}">
                        <label for="password-new" class="${properties.kcLabelClass!}">New Password</label>
                        <input type="password" 
                               id="password-new" 
                               name="password-new" 
                               class="${properties.kcInputClass!} form-control"
                               autofocus 
                               autocomplete="new-password"
                               placeholder="Enter your new password"
                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>" />

                        <#if messagesPerField.existsError('password')>
                            <span id="input-error-password" class="${properties.kcInputErrorMessageClass!} alert-error" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <label for="password-confirm" class="${properties.kcLabelClass!}">Confirm New Password</label>
                        <input type="password" 
                               id="password-confirm" 
                               name="password-confirm"
                               class="${properties.kcInputClass!} form-control"
                               autocomplete="new-password"
                               placeholder="Confirm your new password"
                               aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>" />

                        <#if messagesPerField.existsError('password-confirm')>
                            <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!} alert-error" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <#if isAppInitiatedAction??>
                                <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} btn-primary" 
                                       type="submit" 
                                       value="Update Password" />
                                <button class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!}" 
                                        type="submit" 
                                        name="cancel-aia" 
                                        value="true"
                                        style="background: transparent; border: 2px solid #374151; color: white; margin-left: 12px;">Cancel</button>
                            <#else>
                                <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} btn-primary" 
                                       type="submit" 
                                       value="Update Password" />
                            </#if>
                        </div>
                        
                        <#if !isAppInitiatedAction??>
                            <div class="kc-form-options" style="text-align: center; margin-top: 24px;">
                                <a href="${url.loginUrl}">Back to Login</a>
                            </div>
                        </#if>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
