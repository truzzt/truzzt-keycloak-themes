<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        <h1 id="kc-page-title"></h1>
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post" style="margin-left:100px">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="firmname" name="user.attributes.firmname" placeholder="Firmenname" value="" required/>
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="firstName" placeholder="Vorname" class="${properties.kcInputClass!}" name="firstName"
                           value="${(register.formData.firstName!'')}"
                           aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                    />
                </div>
            </div>
            <#if messagesPerField.existsError('firstName')>
                        <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                        </span>
                    </#if>
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="lastName" placeholder="Nachname" class="${properties.kcInputClass!}" name="lastName"
                           value="${(register.formData.lastName!'')}"
                           aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                    />
                </div>
            </div>
                <#if messagesPerField.existsError('lastName')>
                    <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                        </span>
                    </#if>
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="email" placeholder="Email" class="${properties.kcInputClass!}" name="email"
                           value="${(register.formData.email!'')}" autocomplete="email"
                           aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                    />
                </div>
            </div>
            <#if messagesPerField.existsError('email')>
                <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                    ${kcSanitize(messagesPerField.get('email'))?no_esc}
                </span>
            </#if>
            <#if !realm.registrationEmailAsUsername>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="text" id="username" placeholder="Firmenname" class="${properties.kcInputClass!}" name="username"
                               value="${(register.formData.username!'')}" autocomplete="username"
                               aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                        />
                    </div>
                </div>
                <#if messagesPerField.existsError('username')>
                            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                </#if>
            </#if>

            <#if passwordRequired??>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="password" id="password" placeholder="Passwort" class="${properties.kcInputClass!}" name="password"
                               autocomplete="new-password"
                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>${msg("password")}</#if>"
                        />
                    </div>
                </div>
                <#if messagesPerField.existsError('password')>
                            <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                </#if>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="password" id="password-confirm" placeholder="Passwort bestätigen" class="${properties.kcInputClass!}"
                               name="password-confirm"
                               aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                        />
                    </div>
                </div>
                <#if messagesPerField.existsError('password-confirm')>
                    <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                    </span>
                </#if>
            </#if>

            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}" style="margin-left:-37">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" id="registerbutton" value="${msg("doRegister")}"/>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
