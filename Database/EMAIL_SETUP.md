# Email Notification System Setup Guide

## Overview

This system automatically sends email notifications to users when an admin:

- ✅ Approves their account
- ❌ Rejects their account
- 🚫 Bans their account
- 🔓 Unbans their account

## Prerequisites

- PHPMailer (already included in vendor folder)
- Email account (Gmail recommended)
- Database with email column in players table

## Step 1: Update Database Schema

Run the migration to add email column to the players table:

```sql
ALTER TABLE players ADD COLUMN email VARCHAR(255) UNIQUE AFTER username;
```

Or use the migration file:

```bash
# Execute migration_add_email.sql in your database
```

## Step 2: Configure Email Settings

Edit `api/send_email.php` and update these lines with your email credentials:

```php
// Line ~17-18
$mail->Username = 'your-email@gmail.com';  // Change to your Gmail
$mail->Password = 'your-app-password';      // Change to your App Password

// Line ~24
$mail->setFrom('your-email@gmail.com', 'Vital Choice Admin');
```

### Setting Up Gmail:

1. **Enable 2-Factor Authentication** on your Google Account
2. **Create App Password**:
   - Go to [Google Account Security](https://myaccount.google.com/security)
   - Click "App passwords" (under 2-Step Verification)
   - Select "Mail" and "Windows Computer"
   - Google will generate a 16-character password
   - Use this as your `Password` in send_email.php

3. **Update the login domain** (optional, if using different email provider):
   ```php
   $mail->Host = 'smtp.gmail.com';        // Gmail (default)
   $mail->Port = 587;                     // Gmail port
   $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
   ```

## Step 3: Customize Email Templates (Optional)

Edit the email templates in `api/send_email.php`:

- `sendApprovalEmail()` - Customize approval message
- `sendRejectionEmail()` - Customize rejection message
- `sendBanEmail()` - Customize ban message
- `sendUnbanEmail()` - Customize unban message

Update the login links to match your domain:

```php
<a href='http://your-domain.com/login.php' class='button'>Login Now</a>
```

## Step 4: Test the System

### Option A: Manual Test

1. Create a test user account and wait for approval
2. As admin, accept/reject the account
3. Check the test email inbox for the notification

### Option B: Direct Test

Create a test file at `api/test_email.php`:

```php
<?php
include 'send_email.php';

// Test approval email
$result = sendApprovalEmail('test@example.com', 'testuser', 0);
echo json_encode($result);
?>
```

Then visit: `http://localhost/api/test_email.php`

## Admin Panel Actions

The email system is automatically triggered when:

1. **Approving a pending user**
   - Admin clicks "✅ Phê duyệt tài khoản"
   - Email: Approval notification sent
   - User can now log in

2. **Rejecting a pending user**
   - Admin clicks "❌ Từ chối phê duyệt"
   - Email: Rejection notification sent
   - User account is deleted

3. **Banning a user**
   - Admin clicks "🚫 Cấm tài khoản"
   - Email: Ban notification sent
   - User can no longer access the system

4. **Unbanning a user**
   - Admin clicks "🔓 Mở cấm tài khoản"
   - Email: Restoration notification sent
   - User can access the system again

## Email Function Reference

### Main Function

```php
sendEmailNotification($userEmail, $username, $subject, $message)
```

### Convenience Functions

- `sendApprovalEmail($email, $username, $role)`
- `sendRejectionEmail($email, $username, $role)`
- `sendBanEmail($email, $username)`
- `sendUnbanEmail($email, $username)`

All functions return:

```php
[
    'success' => bool,
    'message' => string
]
```

## Troubleshooting

### Emails not sending?

1. **Check credentials**
   - Verify email and app password in send_email.php
   - Test credentials in browser console

2. **Check email field**
   - Ensure users have email addresses stored in database
   - Verify email column exists: `ALTER TABLE players ADD COLUMN email VARCHAR(255) UNIQUE;`

3. **Check PHPMailer**
   - Verify vendor/autoload.php exists
   - Check require_once path is correct

4. **Check email format**
   - Ensure email is valid format (user@domain.com)
   - Avoid special characters

5. **Enable debug mode** (temporary):
   ```php
   $mail->SMTPDebug = SMTP::DEBUG_SERVER; // Add to send_email.php
   ```

### Gmail App Password Issues?

- Use a new 16-character password generated from Google
- Don't use your regular Gmail password
- Ensure 2-Factor Authentication is enabled first

## Security Notes

⚠️ **Important**:

- Never commit email credentials to version control
- Consider using environment variables:
  ```php
  $mail->Username = getenv('SMTP_USERNAME');
  $mail->Password = getenv('SMTP_PASSWORD');
  ```
- Implement rate limiting for production
- Log email sending attempts

## Files Modified/Created

- ✅ `api/send_email.php` - Email function library
- ✅ `admin/admin.php` - Updated with email triggers
- ✅ `Database/migration_add_email.sql` - Database migration
- 📖 `Database/EMAIL_SETUP.md` - This guide

## Next Steps

1. Run the database migration
2. Configure email credentials
3. Update your domain in email templates
4. Test with a pending user approval
5. Monitor email logs for any issues
