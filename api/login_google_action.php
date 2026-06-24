<?php
session_start();
header('Content-Type: application/json');
include '../profile/db.php';
include 'send_email.php';
require_once '../vendor/autoload.php';

$id_token = $_POST['token'] ?? '';

if (!$id_token) {
    echo json_encode(['success' => false, 'message' => 'Không tìm thấy dữ liệu Token!']);
    exit;
}


$CLIENT_ID = "63291630669-bu4mcmmm96dcniruhg83j8g9r3l6mdou.apps.googleusercontent.com";
$client = new Google_Client(['client_id' => $CLIENT_ID]);

try {
    $payload = $client->verifyIdToken($id_token);
    
    if ($payload) {
        $google_id = $payload['sub']; 
        $email = $payload['email'];
        $name = $payload['name'];
        $stmt = $conn->prepare("SELECT * FROM players WHERE google_id = ? LIMIT 1");
        $stmt->bind_param("s", $google_id);
        $stmt->execute();
        $result = $stmt->get_result();
        $isNewUser = false;
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            if ($row['status'] == 0) {
                echo json_encode(['success' => false, 'error_type' => 'banned']);
                exit;
            }
            if ($row['pending'] == 0) {
                echo json_encode(['success' => false, 'error_type' => 'pending']);
                exit;
            }
            $user_id = $row['id'];
            $username = $row['username'];
            $role = $row['role'];

        } else {
            $username = explode('@', $email)[0]; 
            if (str_contains($email, '@st.qnu.edu.vn')) {
                $determined_role = 1; 
            } else {
                $determined_role = 0; 
               
                if ($email === 'chongkhai2006@gmail.com') {
                    $determined_role = 2; 
                }
            }

            $pending = 0; 
            $insert_stmt = $conn->prepare("INSERT INTO players (google_id, email, username, role, pending) VALUES (?, ?, ?, ?, ?)");
            $insert_stmt->bind_param("sssii", $google_id, $email, $username, $determined_role, $pending);
            $insert_stmt->execute();
            
            $user_id = $conn->insert_id;
            $role = $determined_role;
            $isNewUser = true;
            
            $insert_stmt->close();
        }

        $stmt->close();
        $conn->close();

   
        if ($isNewUser) {
            $roleDisplay = ($role == 0) ? 'Student' : 'Teacher';
            $pendingEmailBody = "
            <html>
            <head>
                <style>
                    body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
                    .container { max-width: 600px; margin: 0 auto; padding: 20px; background: #f4f4f4; border-radius: 5px; }
                    .header { background: #2196F3; color: white; padding: 20px; border-radius: 5px 5px 0 0; text-align: center; }
                    .content { background: white; padding: 20px; }
                    .footer { background: #333; color: white; padding: 10px; text-align: center; border-radius: 0 0 5px 5px; font-size: 12px; }
                </style>
            </head>
            <body>
                <div class='container'>
                    <div class='header'>
                        <h2>⏳ Account Pending Approval</h2>
                    </div>
                    <div class='content'>
                        <p>Dear <strong>$username</strong>,</p>
                        <p>Thank you for registering on <strong>Vital Choice</strong>!</p>
                        <p>Your $roleDisplay account has been created and is currently pending admin approval. You will receive another email once your account has been reviewed and approved.</p>
                        <p><strong>What to expect:</strong></p>
                        <ul>
                            <li>Our admin team will review your account within 24-48 hours</li>
                            <li>You'll receive an email notification once approved</li>
                            <li>After approval, you can log in and start using the platform</li>
                        </ul>
                        <p>Thank you for your patience!</p>
                        <p>Best regards,<br><strong>Vital Choice Team</strong></p>
                    </div>
                    <div class='footer'>
                        <p>&copy; 2026 Vital Choice. All rights reserved.</p>
                    </div>
                </div>
            </body>
            </html>
            ";
            
            sendEmailNotification($email, $username, 'Welcome to Vital Choice - Pending Approval', $pendingEmailBody);
            echo json_encode([
            'success' => false,
            'error_type' => 'pending'
            ]);

exit;
        }
$_SESSION['id'] = $user_id;
$_SESSION['username'] = $username;
$_SESSION['role'] = $role;
$remember = [
    "id" => $user_id,
    "username" => $username,
    "role" => $role,
    "time" => time()
];


setcookie(
    "remember_login",
    json_encode($remember),
    [
        "expires" => time() + 1800,
        "path" => "/",
        "httponly" => true,
        "samesite" => "Lax"
    ]
);
        echo json_encode([
            'success' => true,
            'role' => $role
        ]);

    } else {
        echo json_encode(['success' => false, 'message' => 'Token giả mạo hoặc hết hạn!']);
    }
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Lỗi hệ thống: ' . $e->getMessage()]);
}