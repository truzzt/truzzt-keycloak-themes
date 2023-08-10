<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}" style="margin-left:80px;margin-bottom:10px">
                <div class="${properties.kcInputWrapperClass!}">
                    <#if auth?has_content && auth.showUsername()>
                        <input type="text" style="margin-left:20px" id="username" name="username" placeholder="Email" class="${properties.kcInputClass!}" autofocus value="${auth.attemptedUsername}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                    <#else>
                        <input type="text" style="color:white" id="username" name="username" placeholder="Email" class="${properties.kcInputClass!}" autofocus aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                    </#if>
                </div>
            </div>
            <#if messagesPerField.existsError('username')>
                <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                </span>
            </#if>
            
            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}" style="margin-right:1px;margin-top:100px">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a href="${url.loginUrl}" style="color:black">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>

                <div class="${properties.kcFormButtonsClass!}">
                    <input style="margin-right:40px" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
                </div>
            </div>
        </form>
    <#elseif section = "info" >
        ${msg("emailInstruction")}
    </#if>
</@layout.registrationLayout>
