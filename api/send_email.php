<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require_once '../PHPMailer/src/PHPMailer.php';
require_once '../PHPMailer/src/SMTP.php';
require_once '../PHPMailer/src/Exception.php';

/**
 * Send email notification to a user
 * @param string $userEmail - Recipient email address
 * @param string $username - Username of the recipient
 * @param string $subject - Email subject
 * @param string $message - Email body (HTML)
 * @return array - ['success' => bool, 'message' => string]
 */
function sendEmailNotification($userEmail, $username, $subject, $message) {
    try {
        $mail = new PHPMailer(true);

        // Server settings
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        
        // Gmail Configuration - Update these with your credentials
        $mail->Username = 'chongkhai2006@gmail.com';  // Change to your Gmail
        $mail->Password = 'mleq ajbz qilz mkrf';      // Change to your App Password
        
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        // Sender
        $mail->setFrom('chongkhai2006@gmail.com', 'Vital Choice System');
        
        // Recipient
        $mail->addAddress($userEmail, $username);

        // Content
        $mail->isHTML(true);
        $mail->Subject = $subject;
        $mail->Body = $message;

        // Alternative text version
        $mail->AltBody = strip_tags($message);

        $mail->send();
        
        return ['success' => true, 'message' => 'Email sent successfully'];

    } catch (Exception $e) {
        return ['success' => false, 'message' => 'Email error: ' . $mail->ErrorInfo];
    }
}

/**
 * Send approval notification email
 */
function sendApprovalEmail($userEmail, $username, $role) {
    $roleDisplay = ($role == 0) ? 'Student' : 'Teacher';
    
    $subject = 'Account Approved - Vital Choice';
    $message = "
    <html>
    <head>
        <style>
            body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
            .container { max-width: 600px; margin: 0 auto; padding: 20px; background: #f4f4f4; border-radius: 5px; }
            .header { background: #4CAF50; color: white; padding: 20px; border-radius: 5px 5px 0 0; text-align: center; }
            .content { background: white; padding: 20px; }
            .footer { background: #333; color: white; padding: 10px; text-align: center; border-radius: 0 0 5px 5px; font-size: 12px; }
            .button { display: inline-block; background: #4CAF50; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; margin-top: 20px; }
        </style>
    </head>
    <body>
        <div class='container'>
            <div class='header'>
                <h2>✅ Your Account Has Been Approved!</h2>
            </div>
            <div class='content'>
                <p>Dear <strong>$username</strong>,</p>
                <p>We're pleased to inform you that your $roleDisplay account on <strong>Vital Choice</strong> has been approved by our administrators.</p>
                <p>You can now log in and start using all features available to you.</p>
                <p><a href='http://localhost/VITAL-CHOICE/login_register/login.php' class='button'>Login Now</a></p>
                <p>If you have any questions, please contact our support team.</p>
                <p>Best regards,<br><strong>Vital Choice Team</strong></p>
            </div>
            <div class='footer'>
                <p>&copy; 2026 Vital Choice. All rights reserved.</p>
            </div>
        </div>
    </body>
    </html>
    ";
    
    return sendEmailNotification($userEmail, $username, $subject, $message);
}

/**
 * Send rejection notification email
 */
function sendRejectionEmail($userEmail, $username, $role) {
    $roleDisplay = ($role == 0) ? 'Student' : 'Teacher';
    
    $subject = 'Account Request Rejected - Vital Choice';
    $message = "
    <html>
    <head>
        <style>
            body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
            .container { max-width: 600px; margin: 0 auto; padding: 20px; background: #f4f4f4; border-radius: 5px; }
            .header { background: #f44336; color: white; padding: 20px; border-radius: 5px 5px 0 0; text-align: center; }
            .content { background: white; padding: 20px; }
            .footer { background: #333; color: white; padding: 10px; text-align: center; border-radius: 0 0 5px 5px; font-size: 12px; }
        </style>
    </head>
    <body>
        <div class='container'>
            <div class='header'>
                <h2>❌ Account Request Rejected</h2>
            </div>
            <div class='content'>
                <p>Dear <strong>$username</strong>,</p>
                <p>Unfortunately, your $roleDisplay account request for <strong>Vital Choice</strong> has been rejected by our administrators.</p>
                <p>This may be due to various reasons such as:</p>
                <ul>
                    <li>Incomplete or invalid information provided</li>
                    <li>Policy violations in your request</li>
                    <li>Other administrative reasons</li>
                </ul>
                <p>If you believe this is an error or would like to appeal this decision, please contact our support team.</p>
                <p>Best regards,<br><strong>Vital Choice Team</strong></p>
            </div>
            <div class='footer'>
                <p>&copy; 2026 Vital Choice. All rights reserved.</p>
            </div>
        </div>
    </body>
    </html>
    ";
    
    return sendEmailNotification($userEmail, $username, $subject, $message);
}

/**
 * Send ban notification email
 */
function sendBanEmail($userEmail, $username) {
    $subject = 'Account Banned - Vital Choice';
    $message = "
    <html>
    <head>
        <style>
            body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
            .container { max-width: 600px; margin: 0 auto; padding: 20px; background: #f4f4f4; border-radius: 5px; }
            .header { background: #f44336; color: white; padding: 20px; border-radius: 5px 5px 0 0; text-align: center; }
            .content { background: white; padding: 20px; }
            .footer { background: #333; color: white; padding: 10px; text-align: center; border-radius: 0 0 5px 5px; font-size: 12px; }
        </style>
    </head>
    <body>
        <div class='container'>
            <div class='header'>
                <h2>🚫 Your Account Has Been Banned</h2>
            </div>
            <div class='content'>
                <p>Dear <strong>$username</strong>,</p>
                <p>Your account on <strong>Vital Choice</strong> has been banned by our administrators.</p>
                <p>You will no longer be able to access our platform.</p>
                <p>If you believe this is a mistake or wish to appeal, please contact our support team immediately.</p>
                <p>Best regards,<br><strong>Vital Choice Team</strong></p>
            </div>
            <div class='footer'>
                <p>&copy; 2026 Vital Choice. All rights reserved.</p>
            </div>
        </div>
    </body>
    </html>
    ";
    
    return sendEmailNotification($userEmail, $username, $subject, $message);
}

/**
 * Send unban notification email
 */
function sendUnbanEmail($userEmail, $username) {
    $subject = 'Your Account Has Been Restored - Vital Choice';
    $message = "
    <html>
    <head>
        <style>
            body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
            .container { max-width: 600px; margin: 0 auto; padding: 20px; background: #f4f4f4; border-radius: 5px; }
            .header { background: #4CAF50; color: white; padding: 20px; border-radius: 5px 5px 0 0; text-align: center; }
            .content { background: white; padding: 20px; }
            .footer { background: #333; color: white; padding: 10px; text-align: center; border-radius: 0 0 5px 5px; font-size: 12px; }
        </style>
    </head>
    <body>
        <div class='container'>
            <div class='header'>
                <h2>✅ Your Account Has Been Restored</h2>
            </div>
            <div class='content'>
                <p>Dear <strong>$username</strong>,</p>
                <p>Good news! Your account ban has been lifted and you can now access <strong>Vital Choice</strong> again.</p>
                <p>We appreciate your understanding and look forward to your continued participation.</p>
                <p>Best regards,<br><strong>Vital Choice Team</strong></p>
            </div>
            <div class='footer'>
                <p>&copy; 2026 Vital Choice. All rights reserved.</p>
            </div>
        </div>
    </body>
    </html>
    ";
    
    return sendEmailNotification($userEmail, $username, $subject, $message);
}

/**
 * Send exam approval notification email
 */
function sendExamApprovalEmail($userEmail, $username, $examCode) {
    $subject = 'Exam Approved - Vital Choice';
    $message = "
    <html>
    <head>
        <style>
            body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
            .container { max-width: 600px; margin: 0 auto; padding: 20px; background: #f4f4f4; border-radius: 5px; }
            .header { background: #4CAF50; color: white; padding: 20px; border-radius: 5px 5px 0 0; text-align: center; }
            .content { background: white; padding: 20px; }
            .footer { background: #333; color: white; padding: 10px; text-align: center; border-radius: 0 0 5px 5px; font-size: 12px; }
            .button { display: inline-block; background: #4CAF50; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; margin-top: 20px; }
            .exam-code { background: #f0f0f0; padding: 10px; border-radius: 5px; font-family: monospace; margin: 15px 0; }
        </style>
    </head>
    <body>
        <div class='container'>
            <div class='header'>
                <h2>✅ Your Exam Has Been Approved!</h2>
            </div>
            <div class='content'>
                <p>Dear <strong>$username</strong>,</p>
                <p>Great news! Your exam set has been approved by our administrators on <strong>Vital Choice</strong>.</p>
                <p>Your exam is now live and can be used by students.</p>
                <div class='exam-code'>
                    <strong>Exam Code:</strong> $examCode
                </div>
                <p>You can now access your exam through your teacher dashboard.</p>
                <p>If you have any questions, please contact our support team.</p>
                <p>Best regards,<br><strong>Vital Choice Team</strong></p>
            </div>
            <div class='footer'>
                <p>&copy; 2026 Vital Choice. All rights reserved.</p>
            </div>
        </div>
    </body>
    </html>
    ";
    
    return sendEmailNotification($userEmail, $username, $subject, $message);
}

/**
 * Send exam rejection notification email
 */
function sendExamRejectionEmail($userEmail, $username, $examCode, $reason = '') {
    $reasonText = !empty($reason) ? "<p><strong>Reason:</strong> $reason</p>" : "";
    
    $subject = 'Exam Request Rejected - Vital Choice';
    $message = "
    <html>
    <head>
        <style>
            body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
            .container { max-width: 600px; margin: 0 auto; padding: 20px; background: #f4f4f4; border-radius: 5px; }
            .header { background: #f44336; color: white; padding: 20px; border-radius: 5px 5px 0 0; text-align: center; }
            .content { background: white; padding: 20px; }
            .footer { background: #333; color: white; padding: 10px; text-align: center; border-radius: 0 0 5px 5px; font-size: 12px; }
            .exam-code { background: #f0f0f0; padding: 10px; border-radius: 5px; font-family: monospace; margin: 15px 0; }
        </style>
    </head>
    <body>
        <div class='container'>
            <div class='header'>
                <h2>❌ Exam Request Rejected</h2>
            </div>
            <div class='content'>
                <p>Dear <strong>$username</strong>,</p>
                <p>Unfortunately, your exam set on <strong>Vital Choice</strong> has been rejected by our administrators.</p>
                <div class='exam-code'>
                    <strong>Exam Code:</strong> $examCode
                </div>
                $reasonText
                <p>Please review and update your exam content before resubmitting.</p>
                <p>If you have any questions or would like to appeal this decision, please contact our support team.</p>
                <p>Best regards,<br><strong>Vital Choice Team</strong></p>
            </div>
            <div class='footer'>
                <p>&copy; 2026 Vital Choice. All rights reserved.</p>
            </div>
        </div>
    </body>
    </html>
    ";
    
    return sendEmailNotification($userEmail, $username, $subject, $message);
}
?>
