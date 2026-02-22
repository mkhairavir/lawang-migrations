ALTER TABLE server_settings
    ADD COLUMN email_notification_template text,
    ADD COLUMN telegram_notification_template text,
    ADD COLUMN wa_notification_template text;

UPDATE server_settings
    SET
    wa_notification_template = '*ALERT: {{TITLE}}*

Severity: *{{LEVEL}}*
Server: {{SERVER_ID}}
Time: {{NOW}}

*Details:*
Job: {{JOB_NAME}} ({{JOB_CODE}})
URL: {{URL}}
Latency: {{LATENCY}}
Status: {{RESPONSE_CODE}}

*Message:*
{{MESSAGE}}

*Response:*
```{{RESPONSE_BODY}}```

_Ref: {{REQUEST_ID}} | {{RUN_ID}}_',
    telegram_notification_template = '🚨 *{{TITLE}}*

*Status:* {{LEVEL}}
*Time:* {{NOW}}
*Server:* `{{SERVER_ID}}`

📊 *Metrics*
• Latency: {{LATENCY}}
• Code: {{RESPONSE_CODE}}
• Endpoint: `{{ENDPOINT_TYPE}}` {{URL}}

🛠 *Job Details*
• Job Name: {{JOB_NAME}}
• Job Code: `{{JOB_CODE}}`
• Run ID: `{{RUN_ID}}`

📝 *Message*
{{MESSAGE}}

Request ID: `{{REQUEST_ID}}`
Client IP: {{CLIENT_IP}}

🔻 *Response Body:*',
    email_notification_template = 'System Notification
--------------------------------------------------
Title       : {{TITLE}}
Severity    : {{LEVEL}}
Timestamp   : {{NOW}}
Server ID   : {{SERVER_ID}}

JOB INFORMATION
--------------------------------------------------
Job Name    : {{JOB_NAME}}
Job Code    : {{JOB_CODE}}
Run ID      : {{RUN_ID}}

REQUEST DETAILS
--------------------------------------------------
URL         : {{URL}}
Method      : {{ENDPOINT_TYPE}}
Client IP   : {{CLIENT_IP}}
Latency     : {{LATENCY}}
Resp Code   : {{RESPONSE_CODE}}
Request ID  : {{REQUEST_ID}}

MESSAGE
--------------------------------------------------
{{MESSAGE}}

RESPONSE BODY
--------------------------------------------------
{{RESPONSE_BODY}}

--------------------------------------------------
Automated Alert System';