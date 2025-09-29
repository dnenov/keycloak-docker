<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <h1 id="kc-page-title">Create an account</h1>
        <p>Already have an account? <a href="${url.loginUrl}">Log in</a></p>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
                    <!-- Hidden username field - required by Keycloak, will use email -->
                    <input type="hidden" id="username" name="username" value="" />
                    
                    <!-- First Name and Last Name in same row -->
                    <div class="form-row">
                        <div class="${properties.kcFormGroupClass!} half-width">
                            <label for="firstName" class="${properties.kcLabelClass!}">First name <span class="required">*</span></label>
                            <input type="text" 
                                   id="firstName" 
                                   class="${properties.kcInputClass!} form-control" 
                                   name="firstName" 
                                   value="${(register.formData.firstName!'')}"
                                   placeholder="First name"
                                   aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>" />

                            <#if messagesPerField.existsError('firstName')>
                                <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!} alert-error" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                                </span>
                            </#if>
                        </div>

                        <div class="${properties.kcFormGroupClass!} half-width">
                            <label for="lastName" class="${properties.kcLabelClass!}">Last name <span class="required">*</span></label>
                            <input type="text" 
                                   id="lastName" 
                                   class="${properties.kcInputClass!} form-control" 
                                   name="lastName" 
                                   value="${(register.formData.lastName!'')}"
                                   placeholder="Last name"
                                   aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>" />

                            <#if messagesPerField.existsError('lastName')>
                                <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!} alert-error" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                                </span>
                            </#if>
                        </div>
                    </div>

                    <!-- Email full row -->
                    <div class="${properties.kcFormGroupClass!}">
                        <label for="email" class="${properties.kcLabelClass!}">Email <span class="required">*</span></label>
                        <input type="text" 
                               id="email" 
                               class="${properties.kcInputClass!} form-control" 
                               name="email" 
                               value="${(register.formData.email!'')}" 
                               autocomplete="email"
                               placeholder="Enter your email"
                               aria-invalid="<#if messagesPerField.existsError('email')>true</#if>" />

                        <#if messagesPerField.existsError('email')>
                            <span id="input-error-email" class="${properties.kcInputErrorMessageClass!} alert-error" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('email'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <!-- Username removed - using email as username -->

                    <!-- Password full row -->
                    <#if passwordRequired??>
                        <div class="${properties.kcFormGroupClass!}">
                            <label for="password" class="${properties.kcLabelClass!}">Password <span class="required">*</span></label>
                            <input type="password" 
                                   id="password" 
                                   class="${properties.kcInputClass!} form-control" 
                                   name="password" 
                                   autocomplete="new-password"
                                   placeholder="Enter your password"
                                   aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>" />

                            <#if messagesPerField.existsError('password')>
                                <span id="input-error-password" class="${properties.kcInputErrorMessageClass!} alert-error" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                </span>
                            </#if>
                        </div>

                        <div class="${properties.kcFormGroupClass!}">
                            <label for="password-confirm" class="${properties.kcLabelClass!}">Confirm password <span class="required">*</span></label>
                            <input type="password" 
                                   id="password-confirm" 
                                   class="${properties.kcInputClass!} form-control" 
                                   name="password-confirm"
                                   placeholder="Confirm your password"
                                   aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>" />

                            <#if messagesPerField.existsError('password-confirm')>
                                <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!} alert-error" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                </span>
                            </#if>
                        </div>
                    </#if>

                    <!-- Terms and Conditions -->
                    <div class="${properties.kcFormGroupClass!}">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="terms" name="terms" required> 
                                I agree to the <a href="#" target="_blank">Terms & Conditions</a>
                            </label>
                        </div>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} btn-primary" 
                               type="submit" 
                               value="Create account"/>
                    </div>
                </form>
                
                <!-- Social Registration -->
                <#if realm.password && social.providers??>
                    <div id="kc-social-providers" class="kc-social-links">
                        <div style="text-align: center; margin: 24px 0; color: #9FC7D9; font-size: 14px;">
                            Or register with
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
    </#if>

</@layout.registrationLayout>

<style>
/* Registration specific styles */
.form-row {
    display: flex;
    gap: 16px;
    margin-bottom: 24px;
}

.half-width {
    flex: 1;
    margin-bottom: 0 !important;
}

.required {
    color: #CFFBF0;
}

#kc-content-wrapper > p a {
    color: #CFFBF0;
    text-decoration: none;
    font-weight: 500;
}

#kc-content-wrapper > p a:hover {
    color: #9FC7D9;
}
</style>
