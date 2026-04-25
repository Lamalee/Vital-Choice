-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 24, 2026 lúc 10:22 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quiz_game`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `answers`
--

CREATE TABLE `answers` (
  `answer_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `choice` varchar(5) NOT NULL,
  `content` text DEFAULT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `explanation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `answers`
--

INSERT INTO `answers` (`answer_id`, `question_id`, `choice`, `content`, `is_correct`, `explanation`) VALUES
(1, 1, 'T', '\"Đúng\"', 1, ''),
(2, 1, 'F', '\"Sai\"', 0, ''),
(3, 2, 'T', '\"Đúng\"', 0, ''),
(4, 2, 'F', '\"Sai\"', 1, ''),
(5, 3, 'T', '\"Đúng\"', 1, ''),
(6, 3, 'F', '\"Sai\"', 0, ''),
(7, 4, 'T', '\"Đúng\"', 0, ''),
(8, 4, 'F', '\"Sai\"', 1, ''),
(9, 5, 'T', '\"Đúng\"', 1, ''),
(10, 5, 'F', '\"Sai\"', 0, ''),
(11, 6, 'T', '\"Đúng\"', 1, ''),
(12, 6, 'F', '\"Sai\"', 0, ''),
(13, 7, 'T', '\"Đúng\"', 0, ''),
(14, 7, 'F', '\"Sai\"', 1, ''),
(15, 8, 'T', '\"Đúng\"', 1, ''),
(16, 8, 'F', '\"Sai\"', 0, ''),
(17, 9, 'T', '\"Đúng\"', 0, ''),
(18, 9, 'F', '\"Sai\"', 1, ''),
(19, 10, 'T', '\"Đúng\"', 1, ''),
(20, 10, 'F', '\"Sai\"', 0, ''),
(21, 11, 'A', '\"A. Đại diện cho một giá trị số âm đặc biệt\"', 0, ''),
(22, 11, 'B', '\"B. Viết tắt của \"Not a Number\" (Không phải là một số)\"', 0, ''),
(23, 11, 'C', '\"C. Viết tắt của \"Not a Number\" (Không phải là một số)\"', 1, ''),
(24, 11, 'D', '\"D. Một ngôn ngữ định dạng kiểu cách CSS\"', 0, ''),
(25, 12, 'A', '\"A. Kiểm tra xem biến có phải số nguyên hay không\"', 0, ''),
(26, 12, 'B', '\"B. Chuyển đổi kiểu dữ liệu sang dạng số\"', 0, ''),
(27, 12, 'C', '\"C. Khai báo các biến mới cho hệ thống\"', 0, ''),
(28, 12, 'D', '\"D. Kiểm tra xem một giá trị có phải là NaN hay không\"', 1, ''),
(29, 13, 'A', '\"A. Trả về độ dài chuỗi hoặc số phần tử của mảng\"', 1, ''),
(30, 13, 'B', '\"B. Dùng để ép kiểu dữ liệu cho biến trong hệ thống\"', 0, ''),
(31, 13, 'C', '\"C. Kiểu dữ liệu Đúng hoặc Sai (Boolean)\"', 0, ''),
(32, 13, 'D', '\"D. Cấu trúc dữ liệu dạng mảng (Array)\"', 0, ''),
(33, 14, 'A', '\"A. Thực hiện việc nối các chuỗi văn bản lại với nhau\"', 0, ''),
(34, 14, 'B', '\"B. Tìm kiếm và thay thế văn bản trong chuỗi\"', 1, ''),
(35, 14, 'C', '\"C. Bao gồm 3 giá trị logic khác nhau\"', 0, ''),
(36, 14, 'D', '\"D. Bao gồm 4 giá trị logic khác nhau\"', 0, ''),
(37, 15, 'A', '\"A. Gây ra một lỗi thực thi nghiêm trọng trong chương trình\"', 0, ''),
(38, 15, 'B', '\"B. Xuất dữ liệu ra màn hình hiển thị của trình duyệt\"', 0, ''),
(39, 15, 'C', '\"C. Xuất dữ liệu ra màn hình hiển thị của trình duyệt\"', 1, ''),
(40, 15, 'D', '\"D. Sử dụng để thực hiện các phép toán so sánh\"', 0, ''),
(41, 16, 'A', '\"A. Sử dụng thẻ tiêu đề lớn nhất <h1>\"', 0, ''),
(42, 16, 'B', '\"B. Sử dụng thẻ tiêu đề nhỏ nhất <h6>\"', 0, ''),
(43, 16, 'C', '\"C. Một ngôn ngữ định dạng CSS nâng cao\"', 0, ''),
(44, 16, 'D', '\"D. Sử dụng thẻ tiêu đề nhỏ nhất <h6>\"', 1, ''),
(45, 17, 'A', '\"A. Tạo một liên kết (Hyperlink) đến địa chỉ khác\"', 1, ''),
(46, 17, 'B', '\"B. Tạo một bảng dữ liệu mới hoàn toàn cho trang web\"', 0, ''),
(47, 17, 'C', '\"C. Sử dụng dấu ngoặc nhọn đóng }\"', 0, ''),
(48, 17, 'D', '\"D. Sử dụng từ khóa kết thúc lệnh end\"', 0, ''),
(49, 18, 'A', '\"A. Tên định danh (name) cho đường dẫn liên kết\"', 0, ''),
(50, 18, 'B', '\"B. Địa chỉ đường dẫn (URL) mục tiêu của liên kết\"', 1, ''),
(51, 18, 'C', '\"C. Sử dụng ký hiệu và & để kết nối\"', 0, ''),
(52, 18, 'D', '\"D. Sử dụng ký hiệu dấu phẩy để phân tách\"', 0, ''),
(53, 19, 'A', '\"A. Luôn nằm bên trong cấu trúc của bảng dữ liệu (Table)\"', 0, ''),
(54, 19, 'B', '\"B. Luôn nằm trong danh sách ul hoặc ol\"', 0, ''),
(55, 19, 'C', '\"C. Luôn nằm trong các danh sách ul hoặc ol\"', 1, ''),
(56, 19, 'D', '\"D. Thực hiện việc xóa bỏ một chuỗi văn bản\"', 0, ''),
(57, 20, 'A', '\"A. Hiển thị ở phần thân của trang web (Body)\"', 0, ''),
(58, 20, 'B', '\"B. Hiển thị trên thanh tiêu đề hoặc Tab trình duyệt\"', 0, ''),
(59, 20, 'C', '\"C. Chỉnh sửa nội dung file đang có sẵn\"', 0, ''),
(60, 20, 'D', '\"D. Hiển thị trên thanh tiêu đề hoặc Tab trình duyệt\"', 1, ''),
(61, 21, 'A', '\"A. color chỉnh màu chữ, background chỉnh màu nền\"', 1, ''),
(62, 21, 'B', '\"B. Thay đổi màu sắc cho lớp nền (Background-color)\"', 0, ''),
(63, 21, 'C', '\"C. Hệ quản trị cơ sở dữ liệu (Database)\"', 0, ''),
(64, 21, 'D', '\"D. Một hệ thống máy chủ lưu trữ (Server)\"', 0, ''),
(65, 22, 'A', '\"A. Đơn vị đo lường cố định theo điểm ảnh Pixel\"', 0, ''),
(66, 22, 'B', '\"B. Vì nó thay đổi dựa trên kích thước phần tử cha\"', 1, ''),
(67, 22, 'C', '\"C. Lưu trữ và truy xuất dữ liệu từ Database\"', 0, ''),
(68, 22, 'D', '\"D. Cung cấp các giao diện kết nối API\"', 0, ''),
(69, 23, 'A', '\"A. Thực hiện việc căn lề văn bản về phía bên trái\"', 0, ''),
(70, 23, 'B', '\"B. Sử dụng giá trị thuộc tính text-align: center\"', 0, ''),
(71, 23, 'C', '\"C. Sử dụng giá trị thuộc tính text-align: center\"', 1, ''),
(72, 23, 'D', '\"D. Một hệ quản trị cơ sở dữ liệu (Database)\"', 0, ''),
(73, 24, 'A', '\"A. Xác định khoảng cách giữa các chữ cái (Letter-spacing)\"', 0, ''),
(74, 24, 'B', '\"B. Đường viền bao quanh (độ dày, kiểu dáng, màu sắc)\"', 0, ''),
(75, 24, 'C', '\"C. Thay đổi màu sắc hiển thị của văn bản\"', 0, ''),
(76, 24, 'D', '\"D. Đường viền bao quanh (độ dày, kiểu dáng, màu sắc)\"', 1, ''),
(77, 25, 'A', '\"A. Chiếm toàn bộ chiều ngang của dòng\"', 1, ''),
(78, 25, 'B', '\"B. Hiển thị dưới dạng dòng chảy (Inline)\"', 0, ''),
(79, 25, 'C', '\"C. JavaScript, PHP và hệ quản trị SQL\"', 0, ''),
(80, 25, 'D', '\"D. HTML kết hợp với Java và Python\"', 0, ''),
(81, 26, 'A', '\"A. In dữ liệu trực tiếp ra cửa sổ Console log\"', 0, ''),
(82, 26, 'B', '\"B. Hiển thị một hộp thoại Popup trên trình duyệt\"', 1, ''),
(83, 26, 'C', '\"C. Tạo một liên kết (Hyperlink) mới\"', 0, ''),
(84, 26, 'D', '\"D. Thực hiện việc chèn một hình ảnh mới\"', 0, ''),
(85, 27, 'A', '\"A. Thực hiện việc nhập dữ liệu đầu vào (Input)\"', 0, ''),
(86, 27, 'B', '\"B. Sử dụng hàm console.log()\"', 0, ''),
(87, 27, 'C', '\"C. Sử dụng hàm nhập liệu prompt()\"', 1, ''),
(88, 27, 'D', '\"D. Tạo một biểu mẫu nhập liệu (Form)\"', 0, ''),
(89, 28, 'A', '\"A. Trả về kiểu dữ liệu dạng số (Number)\"', 0, ''),
(90, 28, 'B', '\"B. Trả về kiểu dữ liệu Đúng/Sai (Boolean)\"', 0, ''),
(91, 28, 'C', '\"C. Tạo một liên kết (Hyperlink) cho phần tử\"', 0, ''),
(92, 28, 'D', '\"D. Chèn một hình ảnh minh họa cho nội dung\"', 1, ''),
(93, 29, 'A', '\"A. Khai báo biến có phạm vi trong khối (Block scope)\"', 1, ''),
(94, 29, 'B', '\"B. Khai báo các hằng số không thể thay đổi giá trị\"', 0, ''),
(95, 29, 'C', '\"C. Định dạng văn bản in nghiêng (Italic)\"', 0, ''),
(96, 29, 'D', '\"D. Thực hiện việc căn giữa đoạn văn bản\"', 0, ''),
(97, 30, 'A', '\"A. Khai báo các biến có thể thay đổi giá trị liên tục\"', 0, ''),
(98, 30, 'B', '\"B. Để bảo vệ hằng số không bị gán lại giá trị khác\"', 1, ''),
(99, 30, 'C', '\"C. Tạo đường viền (Border) bao quanh phần tử\"', 0, ''),
(100, 30, 'D', '\"D. Để bảo vệ hằng số không bị gán lại giá trị khác\"', 0, ''),
(101, 31, 'A', '\"A. Thực hiện việc nhập dữ liệu trực tiếp từ người dùng\"', 0, ''),
(102, 31, 'B', '\"B. print trả về giá trị 1, còn echo không trả về gì\"', 0, ''),
(103, 31, 'C', '\"C. print trả về giá trị 1, còn echo không trả về gì\"', 1, ''),
(104, 31, 'D', '\"D. Một kiểu dữ liệu dạng chuỗi văn bản (String)\"', 0, ''),
(105, 32, 'A', '\"A. Là một toán tử toán học đặc biệt trong ngôn ngữ PHP\"', 0, ''),
(106, 32, 'B', '\"B. Ký hiệu bắt buộc để nhận diện biến trong PHP\"', 0, ''),
(107, 32, 'C', '\"C. Thực hiện khởi tạo một giá trị số mới\"', 0, ''),
(108, 32, 'D', '\"D. Ký hiệu bắt buộc để nhận diện biến trong PHP\"', 1, ''),
(109, 33, 'A', '\"A. Trả về thông tin ngày tháng theo định dạng tùy chỉnh\"', 1, ''),
(110, 33, 'B', '\"B. Chuyển đổi kiểu dữ liệu từ dạng Số sang dạng Ngày\"', 0, ''),
(111, 33, 'C', '\"C. Thực hiện việc xóa bỏ phần tử khỏi bộ nhớ\"', 0, ''),
(112, 33, 'D', '\"D. Khởi tạo một biến mới cho hệ thống\"', 0, ''),
(113, 34, 'A', '\"A. Thực hiện việc đếm số lượng phần tử hiện có trong mảng\"', 0, ''),
(114, 34, 'B', '\"B. Sử dụng hàm count() để xác định số phần tử\"', 1, ''),
(115, 34, 'C', '\"C. Đếm tổng số lượng từ trong chuỗi văn bản\"', 0, ''),
(116, 34, 'D', '\"D. Thực hiện việc tách chuỗi thành các phần\"', 0, ''),
(117, 35, 'A', '\"A. Thêm tệp tin vào hệ thống (bắt buộc phải có file hiện hữu)\"', 0, ''),
(118, 35, 'B', '\"B. require sẽ dừng chương trình ngay lập tức nếu lỗi\"', 0, ''),
(119, 35, 'C', '\"C. require sẽ dừng chương trình ngay lập tức nếu lỗi\"', 1, ''),
(120, 35, 'D', '\"D. Khởi tạo một biến mới mang giá trị Hello\"', 0, ''),
(121, 36, 'A', '\"A. Vận hành trực tiếp trên máy chủ vật lý Server\"', 0, ''),
(122, 36, 'B', '\"B. Lưu trữ mã nguồn và xử lý các yêu cầu HTTP\"', 0, ''),
(123, 36, 'C', '\"C. Sử dụng thẻ khai báo đầu trang <head>\"', 0, ''),
(124, 36, 'D', '\"D. require sẽ dừng chương trình ngay lập tức nếu lỗi\"', 1, ''),
(125, 37, 'A', '\"A. Các trình duyệt như Chrome, Firefox, Safari\"', 1, ''),
(126, 37, 'B', '\"B. Một thuật ngữ liên quan đến các trình duyệt web phổ biến\"', 0, ''),
(127, 37, 'C', '\"C. Chèn một hình ảnh mới vào trang web\"', 0, ''),
(128, 37, 'D', '\"D. Tạo một biểu mẫu nhập liệu (Form) cho trang\"', 0, ''),
(129, 38, 'A', '\"A. Chỉ bao gồm tên định danh duy nhất của địa chỉ URL\"', 0, ''),
(130, 38, 'B', '\"B. Giao thức, tên miền và đường dẫn tài nguyên\"', 1, ''),
(131, 38, 'C', '\"C. Thay đổi màu sắc của đoạn văn bản được chọn\"', 0, ''),
(132, 38, 'D', '\"D. Thay đổi phông chữ (Font) cho văn bản\"', 0, ''),
(133, 39, 'A', '\"A. Chế độ không bảo mật khi truyền tải dữ liệu qua mạng\"', 0, ''),
(134, 39, 'B', '\"B. Vì nó mã hóa dữ liệu truyền tải qua SSL/TLS\"', 0, ''),
(135, 39, 'C', '\"C. Luôn nằm trong các danh sách ul hoặc ol\"', 1, ''),
(136, 39, 'D', '\"D. Chèn một hình ảnh minh họa vào danh sách\"', 0, ''),
(137, 40, 'A', '\"A. Địa chỉ IP của máy chủ lưu trữ dữ liệu trang web\"', 0, ''),
(138, 40, 'B', '\"B. Tên định danh dễ nhớ thay thế cho địa chỉ IP\"', 0, ''),
(139, 40, 'C', '\"C. Hiển thị ở phần chân trang web (Footer)\"', 0, ''),
(140, 40, 'D', '\"D. Tên định danh dễ nhớ thay thế cho địa chỉ IP\"', 1, ''),
(141, 41, 'A', '\"A. Nhấn mạnh nội dung mang ý nghĩa quan trọng\"', 1, ''),
(142, 41, 'B', '\"B. Định dạng đoạn văn bản trở nên in nghiêng\"', 0, ''),
(143, 41, 'C', '\"C. Nhấn mạnh nội dung mang ý nghĩa quan trọng\"', 0, ''),
(144, 41, 'D', '\"D. Thay đổi kích thước (Size) của văn bản\"', 0, ''),
(145, 42, 'A', '\"A. Định dạng đoạn văn bản trở nên in đậm\"', 0, ''),
(146, 42, 'B', '\"B. Định dạng nhấn mạnh văn bản dưới dạng in nghiêng\"', 1, ''),
(147, 42, 'C', '\"C. Đơn vị đo lường tuyệt đối theo hệ inch\"', 0, ''),
(148, 42, 'D', '\"D. Đơn vị đo lường theo hệ inch\"', 0, ''),
(149, 43, 'A', '\"A. Sử dụng phổ biến trong thẻ liên kết <a>\"', 0, ''),
(150, 43, 'B', '\"B. Chỉ định địa chỉ đường dẫn nguồn của tài nguyên\"', 0, ''),
(151, 43, 'C', '\"C. Chỉ định địa chỉ đường dẫn nguồn của tài nguyên\"', 1, ''),
(152, 43, 'D', '\"D. Thực hiện việc căn lề đều cho văn bản\"', 0, ''),
(153, 44, 'A', '\"A. Phần tử sẽ chiếm toàn bộ không gian hàng (Block)\"', 0, ''),
(154, 44, 'B', '\"B. Phần tử sẽ hiển thị cùng một hàng với các phần tử khác\"', 0, ''),
(155, 44, 'C', '\"C. Thay đổi màu sắc hiển thị của văn bản\"', 0, ''),
(156, 44, 'D', '\"D. Phần tử sẽ hiển thị cùng một hàng với các phần tử khác\"', 1, ''),
(157, 45, 'A', '\"A. Sử dụng giá trị font-weight: bold\"', 1, ''),
(158, 45, 'B', '\"B. Định dạng văn bản in nghiêng (Italic)\"', 0, ''),
(159, 45, 'C', '\"C. Sử dụng giá trị font-weight: bold\"', 0, ''),
(160, 45, 'D', '\"D. Kỹ thuật đẩy phần tử sang một phía (Float)\"', 0, ''),
(161, 46, 'A', '\"A. Trả về kết quả là kiểu dữ liệu Chuỗi (String)\"', 0, ''),
(162, 46, 'B', '\"B. Kết quả trả về là kiểu dữ liệu String\"', 1, ''),
(163, 46, 'C', '\"C. Khai báo một biến toàn cục cho toàn hệ thống\"', 0, ''),
(164, 46, 'D', '\"D. Thực hiện một vòng lặp trong chương trình\"', 0, ''),
(165, 47, 'A', '\"A. Trả về kết quả là kiểu dữ liệu Chuỗi (String)\"', 0, ''),
(166, 47, 'B', '\"B. Kết quả trả về là kiểu dữ liệu Number\"', 0, ''),
(167, 47, 'C', '\"C. Kết quả trả về là kiểu dữ liệu Number\"', 1, ''),
(168, 47, 'D', '\"D. Khởi tạo một lớp (Class) mới cho hệ thống\"', 0, ''),
(169, 48, 'A', '\"A. Đại diện cho một chuỗi văn bản hoàn toàn rỗng\"', 0, ''),
(170, 48, 'B', '\"B. Nó đại diện cho việc không có giá trị nào tồn tại\"', 0, ''),
(171, 48, 'C', '\"C. Trả về một đối tượng dữ liệu phức tạp (Object)\"', 0, ''),
(172, 48, 'D', '\"D. Trả về một đối tượng dữ liệu (Object)\"', 1, ''),
(173, 49, 'A', '\"A. undefined là chưa gán, null là gán giá trị rỗng\"', 1, ''),
(174, 49, 'B', '\"B. Trạng thái biến chưa được gán bất kỳ giá trị nào\"', 0, ''),
(175, 49, 'C', '\"C. Khai báo các hàm (Function) xử lý dữ liệu\"', 0, ''),
(176, 49, 'D', '\"D. Khởi tạo một lớp (Class) xử lý dữ liệu\"', 0, ''),
(177, 50, 'A', '\"A. In dữ liệu trực tiếp ra cửa sổ điều khiển Console\"', 0, ''),
(178, 50, 'B', '\"B. Hiển thị một hộp thoại thông báo trên màn hình\"', 1, ''),
(179, 50, 'C', '\"C. Khai báo một hàm (Function) xử lý mới\"', 0, ''),
(180, 50, 'D', '\"D. Khởi tạo một mảng (Array) dữ liệu mới\"', 0, ''),
(181, 51, 'A', '\"A. Thực hiện việc căn lề khối phần tử về phía bên trái\"', 0, ''),
(182, 51, 'B', '\"B. Tự động chia đều lề trái và phải để căn giữa\"', 0, ''),
(183, 51, 'C', '\"C. Tự động chia đều lề trái và phải để căn giữa\"', 1, ''),
(184, 51, 'D', '\"D. Khởi tạo một đối tượng dữ liệu mới\"', 0, ''),
(185, 52, 'A', '\"A. Sử dụng ký hiệu hai dấu gạch chéo // để ghi chú\"', 0, ''),
(186, 52, 'B', '\"B. Sử dụng cặp thẻ đặc biệt\"', 0, ''),
(187, 52, 'C', '\"C. Một hàm (Function) xử lý có sẵn của PHP\"', 0, ''),
(188, 52, 'D', '\"D. Sử dụng cặp thẻ đặc biệt\"', 1, ''),
(189, 53, 'A', '\"A. Vì chỉ cần một vế đúng là kết quả sẽ đúng\"', 1, ''),
(190, 53, 'B', '\"B. Trả về giá trị logic Đúng (true) cho hệ thống\"', 0, ''),
(191, 53, 'C', '\"C. Một kiểu dữ liệu dạng chuỗi văn bản (String)\"', 0, ''),
(192, 53, 'D', '\"D. Khai báo một lớp (Class) trong mã nguồn\"', 0, ''),
(193, 54, 'A', '\"A. Trả về giá trị logic Đúng (true) cho hệ thống\"', 0, ''),
(194, 54, 'B', '\"B. Vì chỉ cần một vế đúng là kết quả sẽ đúng\"', 1, ''),
(195, 54, 'C', '\"C. Thực hiện xóa bỏ các phần tử hiện có trong mảng\"', 0, ''),
(196, 54, 'D', '\"D. Khởi tạo một mảng (Array) chứa dữ liệu\"', 0, ''),
(197, 55, 'A', '\"A. Hiển thị thanh cuộn (Scroll) khi nội dung bị tràn ra ngoài\"', 0, ''),
(198, 55, 'B', '\"B. Ẩn hoàn toàn phần nội dung bị tràn ra khỏi khung\"', 0, ''),
(199, 55, 'C', '\"C. Ẩn hoàn toàn phần nội dung bị tràn ra khỏi khung\"', 1, ''),
(200, 55, 'D', '\"D. Quản lý phiên làm việc của người dùng (Session)\"', 0, ''),
(201, 56, 'A', '\"A. Dùng để thực hiện việc nhập dữ liệu dạng số\"', 0, ''),
(202, 56, 'B', '\"B. Thiết lập thuộc tính type=\"text\"\"', 0, ''),
(203, 56, 'C', '\"C. Bộ nhớ truy xuất ngẫu nhiên (RAM) của máy tính\"', 0, ''),
(204, 56, 'D', '\"D. Vì chỉ cần một vế đúng là kết quả sẽ đúng\"', 1, ''),
(205, 57, 'A', '\"A. Trả về kết quả là số thực thập phân 3.14\"', 1, ''),
(206, 57, 'B', '\"B. Trả về kết quả là số nguyên 3 cho hệ thống xử lý\"', 0, ''),
(207, 57, 'C', '\"C. Ngôn ngữ lập trình phía máy chủ như PHP\"', 0, ''),
(208, 57, 'D', '\"D. Giao diện lập trình ứng dụng (API)\"', 0, ''),
(209, 58, 'A', '\"A. Con trỏ chuột chuyển sang dạng hình bàn tay (click)\"', 0, ''),
(210, 58, 'B', '\"B. Sử dụng giá trị thuộc tính cursor: pointer\"', 1, ''),
(211, 58, 'C', '\"C. Một hệ quản trị cơ sở dữ liệu (Database)\"', 0, ''),
(212, 58, 'D', '\"D. Một ngôn ngữ định dạng giao diện CSS\"', 0, ''),
(213, 59, 'A', '\"A. Trả về giá trị logic Đúng (true) cho phép so sánh\"', 0, ''),
(214, 59, 'B', '\"B. Trả về giá trị logic Đúng (true) cho phép so sánh\"', 0, ''),
(215, 59, 'C', '\"C. Trả về kết quả so sánh Đúng (true)\"', 1, ''),
(216, 59, 'D', '\"D. Ngôn ngữ đánh dấu siêu văn bản HTML\"', 0, ''),
(217, 60, 'A', '\"A. Hai thẻ này hoàn toàn giống hệt nhau về mọi mặt\"', 0, ''),
(218, 60, 'B', '\"B. strong mang ý nghĩa nhấn mạnh tầm quan trọng hơn\"', 0, ''),
(219, 60, 'C', '\"C. Một đoạn mã nguồn thực thi phía trình duyệt\"', 0, ''),
(220, 60, 'D', '\"D. strong mang ý nghĩa nhấn mạnh tầm quan trọng hơn\"', 1, ''),
(221, 61, 'T', '\"Đúng\"', 1, ''),
(222, 61, 'F', '\"Sai\"', 0, ''),
(223, 62, 'T', '\"Đúng\"', 0, ''),
(224, 62, 'F', '\"Sai\"', 1, ''),
(225, 63, 'T', '\"Đúng\"', 1, ''),
(226, 63, 'F', '\"Sai\"', 0, ''),
(227, 64, 'T', '\"Đúng\"', 0, ''),
(228, 64, 'F', '\"Sai\"', 1, ''),
(229, 65, 'T', '\"Đúng\"', 1, ''),
(230, 65, 'F', '\"Sai\"', 0, ''),
(231, 66, 'T', '\"Đúng\"', 0, ''),
(232, 66, 'F', '\"Sai\"', 1, ''),
(233, 67, 'T', '\"Đúng\"', 1, ''),
(234, 67, 'F', '\"Sai\"', 0, ''),
(235, 68, 'T', '\"Đúng\"', 1, ''),
(236, 68, 'F', '\"Sai\"', 0, ''),
(237, 69, 'T', '\"Đúng\"', 1, ''),
(238, 69, 'F', '\"Sai\"', 0, ''),
(239, 70, 'T', '\"Đúng\"', 1, ''),
(240, 70, 'F', '\"Sai\"', 0, ''),
(241, 71, 'A', '\"A. Định dạng phong cách hiển thị (Style) cho biểu mẫu\"', 0, ''),
(242, 71, 'B', '\"B. Định dạng phong cách hiển thị (Style) cho biểu mẫu\"', 0, ''),
(243, 71, 'C', '\"C. Tự động phân bổ không gian linh hoạt trong khối\"', 1, ''),
(244, 71, 'D', '\"D. Thực hiện việc ẩn phần tử khỏi giao diện\"', 0, ''),
(245, 72, 'A', '\"A. Cung cấp mức độ bảo mật dữ liệu truyền tải rất cao\"', 0, ''),
(246, 72, 'B', '\"B. Dữ liệu gửi đi sẽ hiển thị trực tiếp trên thanh URL\"', 0, ''),
(247, 72, 'C', '\"C. Sử dụng ký hiệu gạch chéo sao /* nội dung */\"', 0, ''),
(248, 72, 'D', '\"D. Thẻ select đóng vai trò cha chứa các thẻ con option\"', 1, ''),
(249, 73, 'A', '\"A. Sử dụng thẻ option nằm bên trong thẻ select\"', 1, ''),
(250, 73, 'B', '\"B. Dùng để nhập các đoạn văn bản dài (Textarea)\"', 0, ''),
(251, 73, 'C', '\"C. Trả về giá trị không xác định (undefined)\"', 0, ''),
(252, 73, 'D', '\"D. Trả về kết quả không phải là số (NaN)\"', 0, ''),
(253, 74, 'A', '\"A. Phải nằm bên trong cấu trúc của thẻ biểu mẫu <form>\"', 0, ''),
(254, 74, 'B', '\"B. Thẻ select đóng vai trò cha chứa các thẻ con option\"', 1, ''),
(255, 74, 'C', '\"C. Trả về giá trị logic bằng không (0)\"', 0, ''),
(256, 74, 'D', '\"D. Trả về giá trị là số 1 cho hệ thống\"', 0, ''),
(257, 75, 'A', '\"A. Thiết lập thông qua thuộc tính checked\"', 0, ''),
(258, 75, 'B', '\"B. Dùng cho các ô nhập văn bản (text input) thông thường\"', 0, ''),
(259, 75, 'C', '\"C. Thiết lập thông qua thuộc tính checked\"', 1, ''),
(260, 75, 'D', '\"D. Hiển thị toàn bộ nội dung mà không ẩn đi\"', 0, ''),
(261, 76, 'A', '\"A. Làm tăng kích thước tổng thể của phần tử hiển thị\"', 0, ''),
(262, 76, 'B', '\"B. Tính gộp cả Padding và Border vào tổng chiều rộng\"', 0, ''),
(263, 76, 'C', '\"C. Tạo một nút bấm (Button) để gửi dữ liệu\"', 0, ''),
(264, 76, 'D', '\"D. Tính gộp cả Padding và Border vào tổng chiều rộng\"', 1, ''),
(265, 77, 'A', '\"A. Sử dụng giá trị thuộc tính overflow: scroll\"', 1, ''),
(266, 77, 'B', '\"B. Ẩn đi toàn bộ nội dung bị tràn ra ngoài phần tử\"', 0, ''),
(267, 77, 'C', '\"C. Trả về kết quả là số thực thập phân 3.14\"', 0, ''),
(268, 77, 'D', '\"D. Trả về kết quả không phải là số (NaN)\"', 0, ''),
(269, 78, 'A', '\"A. Thay đổi màu sắc phần tử khi người dùng di chuột qua (Hover)\"', 0, ''),
(270, 78, 'B', '\"B. Sử dụng giá trị thuộc tính cursor: pointer\"', 1, ''),
(271, 78, 'C', '\"C. Con trỏ chuột chuyển sang dạng chờ (Loading)\"', 0, ''),
(272, 78, 'D', '\"D. Sử dụng giá trị thuộc tính cursor: pointer\"', 0, ''),
(273, 79, 'A', '\"A. Sử dụng giá trị thuộc tính list-style: none\"', 0, ''),
(274, 79, 'B', '\"B. Dùng để tạo ra một danh sách (List) hoàn toàn mới\"', 0, ''),
(275, 79, 'C', '\"C. Sử dụng giá trị thuộc tính list-style: none\"', 1, ''),
(276, 79, 'D', '\"D. Trả về giá trị bằng 3 cho hệ thống\"', 0, ''),
(277, 80, 'A', '\"A. Tự động xuống dòng khi gặp lề của trang web\"', 0, ''),
(278, 80, 'B', '\"B. Ngăn chặn văn bản tự động xuống dòng khi gặp lề\"', 0, ''),
(279, 80, 'C', '\"C. Thẻ <b> làm văn bản in đậm hơn so với <strong>\"', 0, ''),
(280, 80, 'D', '\"D. Ngăn chặn văn bản tự động xuống dòng khi gặp lề\"', 1, ''),
(281, 81, 'A', '\"A. Sử dụng hàm Number() để thực hiện ép kiểu\"', 1, ''),
(282, 81, 'B', '\"B. Chuyển đổi dữ liệu từ dạng Số sang dạng Chuỗi\"', 0, ''),
(283, 81, 'C', '\"C. Chèn một hình ảnh tĩnh vào trang web hiện tại\"', 0, ''),
(284, 81, 'D', '\"D. Một hệ quản trị cơ sở dữ liệu tập trung (DB)\"', 0, ''),
(285, 82, 'A', '\"A. Chuyển đổi dữ liệu từ dạng Số sang dạng Chuỗi văn bản\"', 0, ''),
(286, 82, 'B', '\"B. Sử dụng hàm String() để thực hiện chuyển đổi\"', 1, ''),
(287, 82, 'C', '\"C. Sử dụng kiểu dữ liệu ẩn giấu hidden\"', 0, ''),
(288, 82, 'D', '\"D. Một hệ thống máy chủ lưu trữ (Server)\"', 0, ''),
(289, 83, 'A', '\"A. Chuyển đổi dữ liệu sang dạng Đúng/Sai (Boolean)\"', 0, ''),
(290, 83, 'B', '\"B. Chuyển đổi dữ liệu sang dạng Đúng/Sai (Boolean)\"', 0, ''),
(291, 83, 'C', '\"C. Sử dụng hàm Boolean() để thực hiện ép kiểu\"', 1, ''),
(292, 83, 'D', '\"D. Ngôn ngữ đánh dấu siêu văn bản HTML\"', 0, ''),
(293, 84, 'A', '\"A. Thêm một phần tử mới vào vị trí đã được chỉ định\"', 0, ''),
(294, 84, 'B', '\"B. Tìm kiếm và trả về vị trí index đầu tiên tìm thấy\"', 0, ''),
(295, 84, 'C', '\"C. Tạo ra một đường dẫn liên kết mới cho trang\"', 0, ''),
(296, 84, 'D', '\"D. Tìm kiếm và trả về vị trí index đầu tiên tìm thấy\"', 1, ''),
(297, 85, 'A', '\"A. Kiểm tra sự tồn tại của phần tử trong mảng\"', 1, ''),
(298, 85, 'B', '\"B. Kiểm tra xem phần tử đó có đang tồn tại hay không\"', 0, ''),
(299, 85, 'C', '\"C. Định nghĩa phần cuối (Footer) của bảng dữ liệu\"', 0, ''),
(300, 85, 'D', '\"D. Một sự kiện (Event) xảy ra trên trình duyệt\"', 0, ''),
(301, 86, 'A', '\"A. Thực hiện việc nối các chuỗi văn bản lại với nhau\"', 0, ''),
(302, 86, 'B', '\"B. Loại bỏ các khoảng trắng thừa ở đầu và cuối chuỗi\"', 1, ''),
(303, 86, 'C', '\"C. Làm mờ phần tử nhưng không khiến nó biến mất\"', 0, ''),
(304, 86, 'D', '\"D. Giúp website trở nên nhẹ và tải nhanh hơn\"', 0, ''),
(305, 87, 'A', '\"A. Thực hiện mã hóa dữ liệu theo tiêu chuẩn một chiều\"', 0, ''),
(306, 87, 'B', '\"B. Thực hiện việc nối các chuỗi văn bản lại với nhau\"', 0, ''),
(307, 87, 'C', '\"C. Loại bỏ các khoảng trắng thừa ở đầu và cuối chuỗi\"', 1, ''),
(308, 87, 'D', '\"D. Thực hiện gửi mã định dạng CSS cho máy chủ\"', 0, ''),
(309, 88, 'A', '\"A. Dùng để in dữ liệu trực tiếp ra màn hình web\"', 0, ''),
(310, 88, 'B', '\"B. Gửi thông tin tiêu đề HTTP (như Redirect) về trình duyệt\"', 0, ''),
(311, 88, 'C', '\"C. Tạo đường viền (Border) trang trí cho phần tử\"', 0, ''),
(312, 88, 'D', '\"D. Gửi thông tin tiêu đề HTTP (như Redirect) về trình duyệt\"', 1, ''),
(313, 89, 'A', '\"A. Sử dụng hàm file_get_contents() để thực hiện\"', 1, ''),
(314, 89, 'B', '\"B. Đọc toàn bộ nội dung tệp tin vào một chuỗi văn bản\"', 0, ''),
(315, 89, 'C', '\"C. Căn chỉnh theo thẻ bao ngoài cùng của trang (Body)\"', 0, ''),
(316, 89, 'D', '\"D. Khởi tạo một hình ảnh minh họa cho nội dung\"', 0, ''),
(317, 90, 'A', '\"A. Đọc dữ liệu từ một tệp tin đang có sẵn trên hệ thống\"', 0, ''),
(318, 90, 'B', '\"B. Sử dụng hàm file_put_contents() để ghi nhanh\"', 1, ''),
(319, 90, 'C', '\"C. Thay đổi kích thước tổng thể của phần tử hiển thị\"', 0, ''),
(320, 90, 'D', '\"D. Phải nằm bên trong thẻ phân vùng div\"', 0, ''),
(321, 91, 'A', '\"A. Dùng để giải mã các tham số từ URL\"', 0, ''),
(322, 91, 'B', '\"B. Thực hiện gán một giá trị mới cho biến hiện có\"', 0, ''),
(323, 91, 'C', '\"C. Để đảm bảo dữ liệu truyền đi không bị lỗi cấu trúc\"', 1, ''),
(324, 91, 'D', '\"D. Phải nằm bên trong thẻ phân vùng div\"', 0, ''),
(325, 92, 'A', '\"A. Thực hiện mã hóa các ký tự trên URL\"', 0, ''),
(326, 92, 'B', '\"B. Sử dụng hàm decodeURIComponent() để thực hiện\"', 0, ''),
(327, 92, 'C', '\"C. Chuyển đổi số thực sang kiểu dữ liệu Đúng/Sai\"', 0, ''),
(328, 92, 'D', '\"D. Sử dụng hàm decodeURIComponent() để thực hiện\"', 1, ''),
(329, 93, 'A', '\"A. Truy xuất thông qua thuộc tính navigator.userAgent\"', 1, ''),
(330, 93, 'B', '\"B. Truy xuất thông tin định danh trình duyệt\"', 0, ''),
(331, 93, 'C', '\"C. Thực hiện dừng ngay lập tức chương trình đang chạy\"', 0, ''),
(332, 93, 'D', '\"D. Thay đổi màu sắc hiển thị cho phần tử\"', 0, ''),
(333, 94, 'A', '\"A. Tải lại (Reload) trang web hiện tại\"', 0, ''),
(334, 94, 'B', '\"B. Sử dụng phương thức history.back() trong JS\"', 1, ''),
(335, 94, 'C', '\"C. Thực hiện việc khai báo một biến mới cho hệ thống\"', 0, ''),
(336, 94, 'D', '\"D. Kỹ thuật đẩy phần tử sang một phía (Float)\"', 0, ''),
(337, 95, 'A', '\"A. Đóng tab trình duyệt đang mở\"', 0, ''),
(338, 95, 'B', '\"B. Thực hiện việc tải lại (Refresh) trang web hiện tại\"', 0, ''),
(339, 95, 'C', '\"C. Thực hiện việc tải lại (Refresh) trang web hiện tại\"', 1, ''),
(340, 95, 'D', '\"D. Thay đổi phông chữ (Font) cho văn bản\"', 0, ''),
(341, 96, 'A', '\"A. Một loại ngôn ngữ lập trình CSS mới\"', 0, ''),
(342, 96, 'B', '\"B. Cách thức xác định kiểu dữ liệu của file truyền tải\"', 0, ''),
(343, 96, 'C', '\"C. Thực hiện lưu trữ tệp tin trực tiếp lên máy chủ\"', 0, ''),
(344, 96, 'D', '\"D. Cách thức xác định kiểu dữ liệu của file truyền tải\"', 1, ''),
(345, 97, 'A', '\"A. Thông báo cho trình duyệt biết kiểu dữ liệu đang nhận\"', 1, ''),
(346, 97, 'B', '\"B. Địa chỉ URL của tệp tin đang truy cập\"', 0, ''),
(347, 97, 'C', '\"C. Thực hiện xóa bỏ một biến khỏi bộ nhớ của hệ thống\"', 0, ''),
(348, 97, 'D', '\"D. Thay đổi phông chữ (Font) cho văn bản\"', 0, ''),
(349, 98, 'A', '\"A. Thông báo yêu cầu xử lý thành công\"', 0, ''),
(350, 98, 'B', '\"B. Trả về mã lỗi trạng thái HTTP 500\"', 1, ''),
(351, 98, 'C', '\"C. Thực hiện gán dữ liệu mới cho biến hiện tại\"', 0, ''),
(352, 98, 'D', '\"D. Thay đổi kích thước (Resize) của phần tử\"', 0, ''),
(353, 99, 'A', '\"A. Thông báo yêu cầu đã xử lý thành công\"', 0, ''),
(354, 99, 'B', '\"B. Thông báo yêu cầu đã xử lý thành công\"', 0, ''),
(355, 99, 'C', '\"C. Thông báo nội dung đã được di chuyển vĩnh viễn\"', 1, ''),
(356, 99, 'D', '\"D. Kỹ thuật đẩy phần tử sang một phía (Float)\"', 0, ''),
(357, 100, 'A', '\"A. Dùng để xóa sạch dữ liệu người dùng\"', 0, ''),
(358, 100, 'B', '\"B. Lưu trữ tạm dữ liệu để giảm thời gian tải lần sau\"', 0, ''),
(359, 100, 'C', '\"C. Lưu trữ dữ liệu trực tiếp vào cơ sở dữ liệu (DB)\"', 0, ''),
(360, 100, 'D', '\"D. Lưu trữ tạm dữ liệu để giảm thời gian tải lần sau\"', 1, ''),
(361, 101, 'A', '\"A. none mất không gian, hidden vẫn giữ chỗ trống\"', 1, ''),
(362, 101, 'B', '\"B. Phần tử biến mất và không chiếm chỗ layout\"', 0, ''),
(363, 101, 'C', '\"C. Tạo ra các định dạng CSS mới linh hoạt cho giao diện\"', 0, ''),
(364, 101, 'D', '\"D. Thực hiện so sánh địa chỉ ô nhớ của biến\"', 0, ''),
(365, 102, 'A', '\"A. Thực hiện việc so sánh giá trị lỏng lẻo\"', 0, ''),
(366, 102, 'B', '\"B. Vì nó so sánh cả giá trị và kiểu dữ liệu (chặt chẽ)\"', 1, ''),
(367, 102, 'C', '\"C. Một ngôn ngữ lập trình bậc cao mới ra mắt\"', 0, ''),
(368, 102, 'D', '\"D. Thực hiện việc sao chép nội dung phần tử\"', 0, ''),
(369, 103, 'A', '\"A. Gán sự kiện trực tiếp cho các phần tử cha\"', 0, ''),
(370, 103, 'B', '\"B. Gán sự kiện cho phần tử cha để quản lý các con\"', 0, ''),
(371, 103, 'C', '\"C. Gán sự kiện cho phần tử cha để quản lý các con\"', 1, ''),
(372, 103, 'D', '\"D. Một hệ quản trị cơ sở dữ liệu tập trung (Database)\"', 0, ''),
(373, 104, 'A', '\"A. let là hằng số, const là biến thay đổi\"', 0, ''),
(374, 104, 'B', '\"B. Cả hai đều không cho phép thay đổi giá trị\"', 0, ''),
(375, 104, 'C', '\"C. Thông báo máy chủ gặp lỗi xử lý nội bộ nghiêm trọng\"', 0, ''),
(376, 104, 'D', '\"D. Vì nó so sánh cả giá trị và kiểu dữ liệu (chặt chẽ)\"', 1, ''),
(377, 105, 'A', '\"A. Cơ chế đưa phần khai báo lên đầu phạm vi thực thi\"', 1, ''),
(378, 105, 'B', '\"B. Đưa các biến xuống cuối phạm vi xử lý\"', 0, ''),
(379, 105, 'C', '\"C. Thông báo tài nguyên yêu cầu hiện không tìm thấy\"', 0, ''),
(380, 105, 'D', '\"D. Khởi tạo một biến toàn cục cho hệ thống\"', 0, ''),
(381, 106, 'A', '\"A. Sự kiện lan truyền từ phần tử cha xuống con\"', 0, ''),
(382, 106, 'B', '\"B. Lan truyền ngược từ phần tử con lên các phần tử cha\"', 1, ''),
(383, 106, 'C', '\"C. Máy chủ trung gian xử lý các yêu cầu dữ liệu (API)\"', 0, ''),
(384, 106, 'D', '\"D. Sự kiện chỉ được thực thi duy nhất một lần\"', 0, ''),
(385, 107, 'A', '\"A. Sự kiện lan truyền từ phần tử cha xuống con\"', 0, ''),
(386, 107, 'B', '\"B. Lan truyền từ phần tử cha xuống đúng phần tử con\"', 0, ''),
(387, 107, 'C', '\"C. Lan truyền từ phần tử cha xuống đúng phần tử con\"', 1, ''),
(388, 107, 'D', '\"D. Một sự kiện được thiết lập theo mặc định\"', 0, ''),
(389, 108, 'A', '\"A. Ngăn chặn các hành vi mặc định của trình duyệt\"', 0, ''),
(390, 108, 'B', '\"B. Sử dụng phương thức stopPropagation()\"', 0, ''),
(391, 108, 'C', '\"C. Một giao diện lập trình ứng dụng kết nối (API)\"', 0, ''),
(392, 108, 'D', '\"D. Sử dụng phương thức stopPropagation()\"', 1, ''),
(393, 109, 'A', '\"A. Ngăn chặn hành vi mặc định của trình duyệt\"', 1, ''),
(394, 109, 'B', '\"B. Ngăn chặn các hành vi mặc định của trình duyệt\"', 0, ''),
(395, 109, 'C', '\"C. Một hệ quản trị cơ sở dữ liệu tập trung (Database)\"', 0, ''),
(396, 109, 'D', '\"D. Thực hiện việc lặp lại sự kiện nhiều lần\"', 0, ''),
(397, 110, 'A', '\"A. Một mô hình định dạng dữ liệu JSON\"', 0, ''),
(398, 110, 'B', '\"B. Vì nó đại diện cho các nút quan hệ Cha - Con phân cấp\"', 1, ''),
(399, 110, 'C', '\"C. Giúp trang web trông đẹp mắt và mang tính nghệ thuật\"', 0, ''),
(400, 110, 'D', '\"D. Một mô hình định dạng kiểu cách CSS\"', 0, ''),
(401, 111, 'A', '\"A. Chỉ hỗ trợ lấy phần tử thông qua thuộc tính ID\"', 0, ''),
(402, 111, 'B', '\"B. Chỉ hỗ trợ lấy phần tử thông qua thuộc tính ID\"', 0, ''),
(403, 111, 'C', '\"C. innerHTML dễ bị tấn công chèn mã độc (XSS)\"', 1, ''),
(404, 111, 'D', '\"D. Hai phương thức này hoàn toàn giống hệt nhau\"', 0, ''),
(405, 112, 'A', '\"A. Chỉ lấy nội dung văn bản, không chứa thẻ HTML\"', 0, ''),
(406, 112, 'B', '\"B. innerHTML dễ bị tấn công chèn mã độc (XSS)\"', 0, ''),
(407, 112, 'C', '\"C. Dữ liệu sẽ không bao giờ được gửi đi xử lý\"', 0, ''),
(408, 112, 'D', '\"D. innerHTML dễ bị tấn công chèn mã độc (XSS)\"', 1, ''),
(409, 113, 'A', '\"A. Giao diện giúp các phần mềm tương tác và kết nối\"', 1, ''),
(410, 113, 'B', '\"B. Một giao diện lập trình ứng dụng kết nối\"', 0, ''),
(411, 113, 'C', '\"C. Tạo một bảng hiển thị dữ liệu (Table) cho trang\"', 0, ''),
(412, 113, 'D', '\"D. Một thư viện định dạng giao diện CSS\"', 0, ''),
(413, 114, 'A', '\"A. Sử dụng giao thức HTTP và tính chất Stateless\"', 0, ''),
(414, 114, 'B', '\"B. Sử dụng giao thức HTTP và tính chất Stateless\"', 1, ''),
(415, 114, 'C', '\"C. Phải nằm bên trong cấu trúc của một bảng table\"', 0, ''),
(416, 114, 'D', '\"D. Sử dụng giao thức truyền nhận file FTP\"', 0, ''),
(417, 115, 'A', '\"A. Thực hiện gửi yêu cầu đồng bộ (Synchronous)\"', 0, ''),
(418, 115, 'B', '\"B. Gửi yêu cầu bất đồng bộ giúp trang không bị treo\"', 0, ''),
(419, 115, 'C', '\"C. Sử dụng Promise giúp viết mã nguồn gọn gàng hơn\"', 1, ''),
(420, 115, 'D', '\"D. Truyền tải dữ liệu qua giao thức WebSocket\"', 0, ''),
(421, 116, 'A', '\"A. Thực hiện truy xuất dữ liệu từ máy chủ\"', 0, ''),
(422, 116, 'B', '\"B. Sử dụng Promise giúp viết mã nguồn gọn gàng hơn\"', 0, ''),
(423, 116, 'C', '\"C. Ẩn hoàn toàn phần tử khỏi giao diện người dùng\"', 0, ''),
(424, 116, 'D', '\"D. Sử dụng Promise giúp viết mã nguồn gọn gàng hơn\"', 1, ''),
(425, 117, 'A', '\"A. Do chính sách bảo mật ngăn chặn truy cập liên miền\"', 1, ''),
(426, 117, 'B', '\"B. Chính sách chia sẻ tài nguyên giữa các miền\"', 0, ''),
(427, 117, 'C', '\"C. Thực hiện thay đổi kích thước hiển thị của phần tử\"', 0, ''),
(428, 117, 'D', '\"D. Một chính sách quản lý API nội bộ của hệ thống\"', 0, ''),
(429, 118, 'A', '\"A. Tạo ra một giao diện web cố định kích thước\"', 0, ''),
(430, 118, 'B', '\"B. Website tự thay đổi bố cục phù hợp mọi màn hình\"', 1, ''),
(431, 118, 'C', '\"C. Thực hiện thay đổi màu sắc hiển thị của phần tử\"', 0, ''),
(432, 118, 'D', '\"D. Thiết kế giao diện chỉ dành riêng cho máy tính\"', 0, ''),
(433, 119, 'A', '\"A. Điều chỉnh giao diện theo kích thước thiết bị\"', 0, ''),
(434, 119, 'B', '\"B. Áp dụng CSS riêng biệt cho từng độ phân giải màn hình\"', 0, ''),
(435, 119, 'C', '\"C. Áp dụng CSS riêng biệt cho từng độ phân giải màn hình\"', 1, ''),
(436, 119, 'D', '\"D. Khởi tạo một định dạng dữ liệu JSON mới\"', 0, ''),
(437, 120, 'A', '\"A. Xác định màu sắc hiển thị cho phần tử\"', 0, ''),
(438, 120, 'B', '\"B. Sử dụng thuộc tính z-index để phân lớp hiển thị\"', 0, ''),
(439, 120, 'C', '\"C. Thực hiện việc căn giữa nội dung văn bản trong khối\"', 0, ''),
(440, 120, 'D', '\"D. Sử dụng thuộc tính z-index để phân lớp hiển thị\"', 1, ''),
(441, 121, 'T', '\"Đúng\"', 1, ''),
(442, 121, 'F', '\"Sai\"', 0, ''),
(443, 122, 'T', '\"Đúng\"', 0, ''),
(444, 122, 'F', '\"Sai\"', 1, ''),
(445, 123, 'T', '\"Đúng\"', 1, ''),
(446, 123, 'F', '\"Sai\"', 0, ''),
(447, 124, 'T', '\"Đúng\"', 0, ''),
(448, 124, 'F', '\"Sai\"', 1, ''),
(449, 125, 'T', '\"Đúng\"', 1, ''),
(450, 125, 'F', '\"Sai\"', 0, ''),
(451, 126, 'T', '\"Đúng\"', 0, ''),
(452, 126, 'F', '\"Sai\"', 1, ''),
(453, 127, 'T', '\"Đúng\"', 1, ''),
(454, 127, 'F', '\"Sai\"', 0, ''),
(455, 128, 'T', '\"Đúng\"', 0, ''),
(456, 128, 'F', '\"Sai\"', 1, ''),
(457, 129, 'T', '\"Đúng\"', 1, ''),
(458, 129, 'F', '\"Sai\"', 0, ''),
(459, 130, 'T', '\"Đúng\"', 0, ''),
(460, 130, 'F', '\"Sai\"', 1, ''),
(461, 131, 'A', '\"A. Sử dụng hàm explode() để cắt chuỗi thành mảng\"', 0, ''),
(462, 131, 'B', '\"B. Thực hiện việc nối các chuỗi lại với nhau\"', 0, ''),
(463, 131, 'C', '\"C. Sử dụng hàm explode() để cắt chuỗi thành mảng\"', 1, ''),
(464, 131, 'D', '\"D. Thực hiện việc đảo ngược trật tự chuỗi\"', 0, ''),
(465, 132, 'A', '\"A. Một lỗi liên quan đến định dạng giao diện CSS\"', 0, ''),
(466, 132, 'B', '\"B. Hình thức tấn công chèn mã độc vào câu truy vấn\"', 0, ''),
(467, 132, 'C', '\"C. Tạo ra một địa chỉ URL hoàn toàn mới cho trang web\"', 0, ''),
(468, 132, 'D', '\"D. Hình thức tấn công chèn mã độc vào câu truy vấn\"', 1, ''),
(469, 133, 'A', '\"A. Tấn công bằng cách chèn các đoạn mã Script\"', 1, ''),
(470, 133, 'B', '\"B. Tấn công bằng cách chèn các đoạn mã Script độc hại\"', 0, ''),
(471, 133, 'C', '\"C. Một ngôn ngữ định dạng kiểu cách giao diện CSS\"', 0, ''),
(472, 133, 'D', '\"D. Một lỗi xảy ra trong cấu trúc ngôn ngữ HTML\"', 0, ''),
(473, 134, 'A', '\"A. Model - View - Controller\"', 0, ''),
(474, 134, 'B', '\"B. Mô hình Model - View - Controller (Dữ liệu - Hiển thị - Điều khiển)\"', 1, ''),
(475, 134, 'C', '\"C. Chuyển hướng người dùng trực tiếp đến một trang mới\"', 0, ''),
(476, 134, 'D', '\"D. Giao diện lập trình ứng dụng (API) bị lỗi\"', 0, ''),
(477, 135, 'A', '\"A. Sử dụng giao thức truyền tải siêu văn bản HTTP\"', 0, ''),
(478, 135, 'B', '\"B. Chuyển hướng người dùng trực tiếp đến một trang mới\"', 0, ''),
(479, 135, 'C', '\"C. Chuyển hướng người dùng trực tiếp đến một trang mới\"', 1, ''),
(480, 135, 'D', '\"D. Hiện không có định nghĩa chính xác nào\"', 0, ''),
(481, 136, 'A', '\"A. Trả về một chuỗi văn bản rỗng \"\"\"', 0, ''),
(482, 136, 'B', '\"B. Kết quả trả về là một chuỗi văn bản rỗng \"\"\"', 0, ''),
(483, 136, 'C', '\"C. Một hệ quản trị cơ sở dữ liệu (Database) phổ biến\"', 0, ''),
(484, 136, 'D', '\"D. Kết quả trả về là một chuỗi văn bản rỗng \"\"\"', 1, ''),
(485, 137, 'A', '\"A. PHP tự động ép kiểu chuỗi thành số để cộng\"', 1, ''),
(486, 137, 'B', '\"B. Trả về kết quả là số nguyên 2\"', 0, ''),
(487, 137, 'C', '\"C. Mã trạng thái phản hồi nhận được từ phía máy chủ\"', 0, ''),
(488, 137, 'D', '\"D. Một hệ quản trị cơ sở dữ liệu (SQL)\"', 0, ''),
(489, 138, 'A', '\"A. Trả về kết quả là số 10\"', 0, ''),
(490, 138, 'B', '\"B. Kết quả trả về là chuỗi nối \"55\"\"', 1, ''),
(491, 138, 'C', '\"C. Thông báo tài nguyên yêu cầu hiện không tồn tại\"', 0, ''),
(492, 138, 'D', '\"D. Trả về kết quả không phải là số (NaN)\"', 0, ''),
(493, 139, 'A', '\"A. Trả về kết quả là số 10\"', 0, ''),
(494, 139, 'B', '\"B. Trả về kết quả là số 10\"', 0, ''),
(495, 139, 'C', '\"C. PHP tự động ép kiểu chuỗi thành số để cộng\"', 1, ''),
(496, 139, 'D', '\"D. Gây ra một thông báo lỗi thực thi nghiêm trọng\"', 0, ''),
(497, 140, 'A', '\"A. Một bộ khung (Framework) phổ biến của PHP\"', 0, ''),
(498, 140, 'B', '\"B. Một Framework PHP mạnh mẽ và có hệ sinh thái lớn\"', 0, ''),
(499, 140, 'C', '\"C. Thông báo lỗi xảy ra từ phía người dùng truy cập\"', 0, ''),
(500, 140, 'D', '\"D. Một Framework PHP mạnh mẽ và có hệ sinh thái lớn\"', 1, ''),
(501, 141, 'A', '\"A. Thư viện UI dựa trên các thành phần (Components)\"', 1, ''),
(502, 141, 'B', '\"B. Một bộ khung (Framework) của ngôn ngữ PHP\"', 0, ''),
(503, 141, 'C', '\"C. Một ngôn ngữ định dạng giao diện trang web CSS\"', 0, ''),
(504, 141, 'D', '\"D. Trả về một giá trị rỗng không xác định (null)\"', 0, ''),
(505, 142, 'A', '\"A. Một bộ khung (Framework) chuyên về CSS\"', 0, ''),
(506, 142, 'B', '\"B. Tận dụng hệ thống lưới Grid để dàn trang nhanh\"', 1, ''),
(507, 142, 'C', '\"C. Visibility hidden: Phần tử ẩn nhưng vẫn chiếm không gian\"', 0, ''),
(508, 142, 'D', '\"D. Trả về một giá trị rỗng không xác định (null)\"', 0, ''),
(509, 143, 'A', '\"A. Môi trường thực thi JavaScript phía Server\"', 0, ''),
(510, 143, 'B', '\"B. Một ngôn ngữ định dạng kiểu cách giao diện CSS\"', 0, ''),
(511, 143, 'C', '\"C. Một ngôn ngữ định dạng kiểu cách giao diện CSS\"', 1, ''),
(512, 143, 'D', '\"D. Một bộ xử lý mã nguồn JavaScript (JS Engine)\"', 0, ''),
(513, 144, 'A', '\"A. Sử dụng để trực tiếp soạn thảo mã nguồn\"', 0, ''),
(514, 144, 'B', '\"B. Hệ thống quản lý và theo dõi các phiên bản mã nguồn\"', 0, ''),
(515, 144, 'C', '\"C. Thực hiện xóa bỏ các sự kiện đã gán của phần tử\"', 0, ''),
(516, 144, 'D', '\"D. Hệ thống quản lý và theo dõi các phiên bản mã nguồn\"', 1, ''),
(517, 145, 'A', '\"A. Sự khác biệt về tài nguyên, bảo mật và chi phí\"', 1, ''),
(518, 145, 'B', '\"B. Nơi lưu trữ và vận hành dữ liệu Website\"', 0, ''),
(519, 145, 'C', '\"C. Cả hai từ khóa đều có phạm vi hoạt động giống hệt nhau\"', 0, ''),
(520, 145, 'D', '\"D. Một giao diện thiết kế đồ họa (UI Design)\"', 0, ''),
(521, 146, 'A', '\"A. Dùng để xóa bỏ hoàn toàn một đối tượng\"', 0, ''),
(522, 146, 'B', '\"B. Sao chép thuộc tính giữa các đối tượng trong JS\"', 1, ''),
(523, 146, 'C', '\"C. Thực hiện xóa bỏ hoàn toàn biến khỏi bộ nhớ đệm\"', 0, ''),
(524, 146, 'D', '\"D. Một đoạn mã nguồn JavaScript xử lý dữ liệu\"', 0, ''),
(525, 147, 'A', '\"A. Thao tác, kết nối và gộp các mảng hoặc đối tượng\"', 0, ''),
(526, 147, 'B', '\"B. Dùng để gộp các dữ liệu lại với nhau\"', 0, ''),
(527, 147, 'C', '\"C. Thao tác, kết nối và gộp các mảng hoặc đối tượng\"', 1, ''),
(528, 147, 'D', '\"D. Thực hiện việc sắp xếp (Sort) lại các đối tượng\"', 0, ''),
(529, 148, 'A', '\"A. Dùng để lưu trữ các cặp giá trị Key-Value\"', 0, ''),
(530, 148, 'B', '\"B. Khi cần lưu trữ một danh sách các giá trị không trùng\"', 0, ''),
(531, 148, 'C', '\"C. Hiện tượng sự kiện bị hủy bỏ ngay lập tức\"', 0, ''),
(532, 148, 'D', '\"D. Khi cần lưu trữ một danh sách các giá trị không trùng\"', 1, ''),
(533, 149, 'A', '\"A. Cho phép Key có thể là bất kỳ kiểu dữ liệu nào\"', 1, ''),
(534, 149, 'B', '\"B. Không có khả năng lưu trữ các từ khóa (Key)\"', 0, ''),
(535, 149, 'C', '\"C. Thực hiện việc xóa bỏ hoàn toàn sự kiện khỏi phần tử\"', 0, ''),
(536, 149, 'D', '\"D. Thực hiện việc sắp xếp (Sort) lại các dữ liệu\"', 0, ''),
(537, 150, 'A', '\"A. Lưu trữ dữ liệu và hỗ trợ giải phóng bộ nhớ\"', 0, ''),
(538, 150, 'B', '\"B. Giúp tự động giải phóng bộ nhớ (Garbage Collection)\"', 1, ''),
(539, 150, 'C', '\"C. Thực hiện việc xóa bỏ hoàn toàn sự kiện khỏi phần tử\"', 0, ''),
(540, 150, 'D', '\"D. Giúp tự động giải phóng bộ nhớ (Garbage Collection)\"', 0, ''),
(541, 151, 'A', '\"A. Thực hiện các tính toán giá trị trong CSS\"', 0, ''),
(542, 151, 'B', '\"B. Thực hiện các tính toán kích thước CSS trực tiếp\"', 0, ''),
(543, 151, 'C', '\"C. querySelector cho phép dùng mọi loại bộ chọn CSS\"', 1, ''),
(544, 151, 'D', '\"D. Một ngôn ngữ lập trình JavaScript nâng cao\"', 0, ''),
(545, 152, 'A', '\"A. Dùng để cắt phần tử theo các hình dạng\"', 0, ''),
(546, 152, 'B', '\"B. Dùng để cắt phần tử theo các hình dạng\"', 0, ''),
(547, 152, 'C', '\"C. Cả hai thuộc tính đều có chức năng dùng giống hệt nhau\"', 0, ''),
(548, 152, 'D', '\"D. Thay đổi màu sắc hiển thị của phần tử\"', 1, ''),
(549, 153, 'A', '\"A. Hiệu ứng làm mờ lớp nền phía sau phần tử\"', 1, ''),
(550, 153, 'B', '\"B. Hiệu ứng làm mờ lớp nền phía sau phần tử\"', 0, ''),
(551, 153, 'C', '\"C. Một ngôn ngữ lập trình xử lý phía Backend mới\"', 0, ''),
(552, 153, 'D', '\"D. Thay đổi đường viền (Border) của phần tử\"', 0, ''),
(553, 154, 'A', '\"A. Thực hiện việc mở một tệp tin để xử lý\"', 0, ''),
(554, 154, 'B', '\"B. Thiết lập luồng xử lý và mở một tệp tin vật lý\"', 1, ''),
(555, 154, 'C', '\"C. Sử dụng giao thức WebSocket để truyền tải dữ liệu\"', 0, ''),
(556, 154, 'D', '\"D. In thông tin chi tiết của tệp tin ra màn hình\"', 0, ''),
(557, 155, 'A', '\"A. Thực hiện việc đọc nội dung từ file\"', 0, ''),
(558, 155, 'B', '\"B. Thực hiện việc ghi nội dung vào tệp tin đang mở\"', 0, ''),
(559, 155, 'C', '\"C. Gửi yêu cầu bất đồng bộ giúp trang không bị treo\"', 1, ''),
(560, 155, 'D', '\"D. Khởi tạo một mảng dữ liệu (Array) mới hoàn toàn\"', 0, ''),
(561, 156, 'A', '\"A. Thực hiện việc đọc nội dung tệp tin\"', 0, ''),
(562, 156, 'B', '\"B. Thực hiện việc xóa hoàn toàn tệp tin khỏi máy chủ\"', 0, ''),
(563, 156, 'C', '\"C. Một phương thức hiện đại để tạo ra các thẻ HTML mới\"', 0, ''),
(564, 156, 'D', '\"D. Thực hiện việc xóa hoàn toàn tệp tin khỏi máy chủ\"', 1, ''),
(565, 157, 'A', '\"A. Ngăn chặn việc truy cập dữ liệu giữa các miền khác nhau\"', 1, ''),
(566, 157, 'B', '\"B. Cho phép mọi tên miền truy cập dữ liệu\"', 0, ''),
(567, 157, 'C', '\"C. Một chính sách lưu trữ dữ liệu vào bộ nhớ của máy tính\"', 0, ''),
(568, 157, 'D', '\"D. In thông tin tệp tin ra màn hình hiển thị\"', 0, ''),
(569, 158, 'A', '\"A. Chỉ bao gồm việc sử dụng Cookie\"', 0, ''),
(570, 158, 'B', '\"B. Sử dụng các phương thức như localStorage, sessionStorage\"', 1, ''),
(571, 158, 'C', '\"C. Thiết kế giao diện chỉ dành riêng cho thiết bị di động\"', 0, ''),
(572, 158, 'D', '\"D. Một ngôn ngữ lập trình JavaScript nâng cao\"', 0, ''),
(573, 159, 'A', '\"A. Dữ liệu sẽ được lưu trữ vĩnh viễn\"', 0, ''),
(574, 159, 'B', '\"B. Dữ liệu sẽ được lưu trữ vĩnh viễn\"', 0, ''),
(575, 159, 'C', '\"C. Dữ liệu chỉ tồn tại trong phiên làm việc của Tab đó\"', 1, ''),
(576, 159, 'D', '\"D. Giao diện lập trình ứng dụng kết nối (API)\"', 0, ''),
(577, 160, 'A', '\"A. Chỉ là một trang web thông thường\"', 0, ''),
(578, 160, 'B', '\"B. Website có trải nghiệm mượt mà như ứng dụng gốc\"', 0, ''),
(579, 160, 'C', '\"C. Một phương thức hiện đại để tạo ra các thẻ HTML mới\"', 0, ''),
(580, 160, 'D', '\"D. Website có trải nghiệm mượt mà như ứng dụng gốc\"', 1, ''),
(581, 161, 'A', '\"A. Cơ chế điều phối thực thi các tác vụ bất đồng bộ\"', 1, ''),
(582, 161, 'B', '\"B. Cơ chế render giao diện HTML\"', 0, ''),
(583, 161, 'C', '\"C. Sử dụng thuộc tính z-index để xác định thứ tự lớp chồng\"', 0, ''),
(584, 161, 'D', '\"D. Một hệ quản trị cơ sở dữ liệu tập trung (Database)\"', 0, ''),
(585, 162, 'A', '\"A. Tự động thực thi mã nguồn\"', 0, ''),
(586, 162, 'B', '\"B. Tự động đưa các khai báo lên đầu phạm vi thực thi\"', 1, ''),
(587, 162, 'C', '\"C. Trả về một thông báo lỗi hệ thống nghiêm trọng\"', 0, ''),
(588, 162, 'D', '\"D. Một giao diện lập trình ứng dụng (API) trình duyệt\"', 0, ''),
(589, 163, 'A', '\"A. Hàm không có tham số truyền vào\"', 0, ''),
(590, 163, 'B', '\"B. Khả năng ghi nhớ biến ở phạm vi bên ngoài của hàm\"', 0, ''),
(591, 163, 'C', '\"C. Khả năng ghi nhớ biến ở phạm vi bên ngoài của hàm\"', 1, ''),
(592, 163, 'D', '\"D. Khởi tạo một biến toàn cục (Global variable) mới\"', 0, ''),
(593, 164, 'A', '\"A. Một kiểu dữ liệu nguyên thủy\"', 0, ''),
(594, 164, 'B', '\"B. Cơ chế nền tảng giúp thực hiện kế thừa trong JS\"', 0, ''),
(595, 164, 'C', '\"C. Một vòng lặp vô hạn xảy ra trong chương trình\"', 0, ''),
(596, 164, 'D', '\"D. Cơ chế nền tảng giúp thực hiện kế thừa trong JS\"', 1, ''),
(597, 165, 'A', '\"A. Deep copy sao chép giá trị, Shallow copy sao chép tham chiếu\"', 1, ''),
(598, 165, 'B', '\"B. Hai cơ chế này hoàn toàn giống nhau\"', 0, ''),
(599, 165, 'C', '\"C. Khai báo một biến toàn cục cho toàn bộ hệ thống\"', 0, ''),
(600, 165, 'D', '\"D. Một hàm xử lý bất đồng bộ (Async function)\"', 0, ''),
(601, 166, 'A', '\"A. Một biến toàn cục (Global)\"', 0, ''),
(602, 166, 'B', '\"B. Tự động xác định ngữ cảnh thực thi của hàm\"', 1, ''),
(603, 166, 'C', '\"C. Một ngôn ngữ định dạng kiểu cách giao diện CSS\"', 0, ''),
(604, 166, 'D', '\"D. Khai báo một lớp (Class) trong mã nguồn\"', 0, ''),
(605, 167, 'A', '\"A. Trả về kết quả là một chuỗi văn bản \"123\"\"', 0, ''),
(606, 167, 'B', '\"B. Trả về kết quả là số nguyên 6\"', 0, ''),
(607, 167, 'C', '\"C. Tự động xác định ngữ cảnh thực thi của hàm\"', 1, ''),
(608, 167, 'D', '\"D. Shallow copy luôn đảm bảo an toàn dữ liệu hơn\"', 0, ''),
(609, 168, 'A', '\"A. Trả về giá trị logic Sai (false)\"', 0, ''),
(610, 168, 'B', '\"B. Trả về giá trị logic Sai (false)\"', 0, ''),
(611, 168, 'C', '\"C. Xác định thứ tự lớp hiển thị của các phần tử (Layer)\"', 0, ''),
(612, 168, 'D', '\"D. Tự động xác định ngữ cảnh thực thi của hàm\"', 1, ''),
(613, 169, 'A', '\"A. Lệnh console.log chạy trước, setTimeout chạy sau\"', 1, ''),
(614, 169, 'B', '\"B. In ra kết quả A rồi đến B (A -> B)\"', 0, ''),
(615, 169, 'C', '\"C. Thay đổi kích thước (Resize) của phần tử trên giao diện\"', 0, ''),
(616, 169, 'D', '\"D. Một hàm (Function) xử lý dữ liệu thông thường\"', 0, ''),
(617, 170, 'A', '\"A. Thực hiện các xử lý đồng bộ\"', 0, ''),
(618, 170, 'B', '\"B. Giải quyết bài toán xử lý tác vụ bất đồng bộ\"', 1, ''),
(619, 170, 'C', '\"C. Một ngôn ngữ đánh dấu siêu văn bản phổ biến HTML\"', 0, ''),
(620, 170, 'D', '\"D. Trả về kết quả là một chuỗi có giá trị là 6\"', 0, ''),
(621, 171, 'A', '\"A. Một quy tắc định dạng giao diện CSS\"', 0, ''),
(622, 171, 'B', '\"B. Một quy tắc định dạng giao diện CSS\"', 0, ''),
(623, 171, 'C', '\"C. Quy tắc bảo mật khi chia sẻ tài nguyên giữa các miền\"', 1, ''),
(624, 171, 'D', '\"D. Gây ra một lỗi thực thi trong chương trình\"', 0, ''),
(625, 172, 'A', '\"A. Lỗi liên quan đến định dạng CSS\"', 0, ''),
(626, 172, 'B', '\"B. Tin tặc chèn mã độc nhằm đánh cắp thông tin người dùng\"', 0, ''),
(627, 172, 'C', '\"C. Thực hiện việc xóa bỏ hoàn toàn chuỗi văn bản\"', 0, ''),
(628, 172, 'D', '\"D. Tin tặc chèn mã độc nhằm đánh cắp thông tin người dùng\"', 1, ''),
(629, 173, 'A', '\"B. Chèn mã SQL trái phép gây mất mát dữ liệu hệ thống\"', 1, ''),
(630, 173, 'B', '\"B. Tấn công bằng cách chèn các đoạn mã Script\"', 0, ''),
(631, 173, 'C', '\"C. Một lỗi xảy ra trong mã nguồn xử lý JavaScript\"', 0, ''),
(632, 173, 'D', '\"D. Chỉ in ra màn hình duy nhất ký tự B cho hệ thống\"', 0, ''),
(633, 174, 'A', '\"A. Hai cơ chế này không có điểm khác biệt\"', 0, ''),
(634, 174, 'B', '\"B. SSR render tại Server, CSR render tại trình duyệt\"', 1, ''),
(635, 174, 'C', '\"C. Một lỗi liên quan đến định dạng giao diện trang web CSS\"', 0, ''),
(636, 174, 'D', '\"D. SSR render tại Server, CSR render tại trình duyệt\"', 0, ''),
(637, 175, 'A', '\"A. Một mô hình cấu trúc DOM thật\"', 0, ''),
(638, 175, 'B', '\"B. Bản sao DOM giúp tối ưu hóa quá trình cập nhật giao diện\"', 0, ''),
(639, 175, 'C', '\"C. Bản sao DOM giúp tối ưu hóa quá trình cập nhật giao diện\"', 1, ''),
(640, 175, 'D', '\"D. Khởi tạo một lớp (Class) xử lý dữ liệu mới\"', 0, ''),
(641, 176, 'A', '\"A. Thực hiện gọi hàm một cách liên tục\"', 0, ''),
(642, 176, 'B', '\"B. Một mô hình cấu trúc DOM thật\"', 0, ''),
(643, 176, 'C', '\"C. Map - View - Control\"', 0, ''),
(644, 176, 'D', '\"D. Bản sao DOM giúp tối ưu hóa quá trình cập nhật giao diện\"', 1, ''),
(645, 177, 'A', '\"A. Giới hạn số lần thực thi hành động trong một khoảng thời gian\"', 1, ''),
(646, 177, 'B', '\"B. Thực hiện gọi hàm vô hạn lần\"', 0, ''),
(647, 177, 'C', '\"C. Sử dụng ngôn ngữ đánh dấu siêu văn bản HTML\"', 0, ''),
(648, 177, 'D', '\"D. Một bộ khung (Framework) thiết kế giao diện\"', 0, ''),
(649, 178, 'A', '\"A. Một lỗi liên quan đến giao diện CSS\"', 0, ''),
(650, 178, 'B', '\"B. Bộ nhớ không được giải phóng đúng cách khiến RAM bị đầy\"', 1, ''),
(651, 178, 'C', '\"C. Trả về giá trị số không (0) cho hệ thống xử lý\"', 0, ''),
(652, 178, 'D', '\"D. Một giao diện lập trình ứng dụng (API) bị lỗi\"', 0, ''),
(653, 179, 'A', '\"A. Do tính phổ biến, bảo mật và cấu trúc của giao thức HTTP\"', 0, ''),
(654, 179, 'B', '\"B. Giao thức truyền tệp tin FTP\"', 0, ''),
(655, 179, 'C', '\"C. Do tính phổ biến, bảo mật và cấu trúc của giao thức HTTP\"', 1, ''),
(656, 179, 'D', '\"D. Giúp thực hiện các truy vấn dữ liệu nhanh hơn\"', 0, ''),
(657, 180, 'A', '\"A. Một trang web thông thường\"', 0, ''),
(658, 180, 'B', '\"B. Ứng dụng web hoạt động và cài đặt như ứng dụng di động\"', 0, ''),
(659, 180, 'C', '\"C. Một ngôn ngữ định dạng giao diện trang web CSS\"', 0, ''),
(660, 180, 'D', '\"D. Ứng dụng web hoạt động và cài đặt như ứng dụng di động\"', 1, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exams`
--

CREATE TABLE `exams` (
  `exam_id` int(11) NOT NULL,
  `exam_code` varchar(50) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exam_questions`
--

CREATE TABLE `exam_questions` (
  `exam_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `game_sessions`
--

CREATE TABLE `game_sessions` (
  `session_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `current_day` int(11) DEFAULT 1,
  `health` int(11) DEFAULT 20,
  `mode` tinyint(4) DEFAULT 0,
  `exam_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history_answers`
--

CREATE TABLE `history_answers` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `day` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(4) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `players`
--

INSERT INTO `players` (`id`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'admin', 'admin', 2, '2026-04-21 10:38:36'),
(2, 'admin1', '$2y$10$eCPVSo.EdVqe7OH7zwka2ODhQwXJxYODOuZOZHjFTsUHzPyQ6ShFa', 0, '2026-04-24 01:22:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `type` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `tag` tinyint(4) NOT NULL,
  `is_active` tinyint(4) DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `questions`
--

INSERT INTO `questions` (`question_id`, `content`, `type`, `created_by`, `tag`, `is_active`, `deleted_at`) VALUES
(1, '\"Câu 1: HTML thường được ví như \"khung xương\" của một trang web vì nó định nghĩa cấu trúc và nội dung cơ bản của trang đó.\"', 1, 1, 0, 1, '0000-00-00 00:00:00'),
(2, '\"Câu 2: Khả năng chính của ngôn ngữ CSS trong phát triển Web là thực hiện các logic tính toán và xử lý dữ liệu phức tạp.\"', 1, 1, 0, 1, '0000-00-00 00:00:00'),
(3, '\"Câu 3: JavaScript đóng vai trò cốt lõi trong việc tạo ra các tương tác và hành động động trên trình duyệt để tăng cường trải nghiệm người dùng.\"', 1, 1, 0, 1, '0000-00-00 00:00:00'),
(4, '\"Câu 4: Trong kiến trúc Web, ngôn ngữ PHP được sử dụng chủ yếu để xử lý hiển thị giao diện phía người dùng (Frontend).\"', 1, 1, 0, 1, '0000-00-00 00:00:00'),
(5, '\"Câu 5: Ba thành phần cốt lõi và không thể thiếu để xây dựng một trang web hoàn chỉnh hiện nay là HTML, CSS và JavaScript.\"', 1, 1, 0, 1, '0000-00-00 00:00:00'),
(6, '\"Câu 6: Thẻ <hr> trong HTML được sử dụng để tạo ra một đường kẻ ngang trên trình duyệt nhằm phân cách các nội dung văn bản.\"', 1, 1, 0, 1, '0000-00-00 00:00:00'),
(7, '\"Câu 7: Thẻ <span> là một phần tử khối (Block), có đặc điểm là luôn chiếm toàn bộ chiều ngang của dòng hiện tại.\"', 1, 1, 0, 1, '0000-00-00 00:00:00'),
(8, '\"Câu 8: Thuộc tính title trong HTML có chức năng hiển thị một cửa sổ chú thích nhỏ (Tooltip) khi người dùng di chuột vào phần tử đó.\"', 1, 1, 0, 1, '0000-00-00 00:00:00'),
(9, '\"Câu 9: Để tạo đường gạch chân cho văn bản trong CSS, chúng ta cần sử dụng giá trị bold cho thuộc tính text-decoration.\"', 1, 1, 0, 1, '0000-00-00 00:00:00'),
(10, '\"Câu 10: Thuộc tính background-image trong CSS được sử dụng để thiết lập một hình ảnh làm nền cho phần tử thay vì màu sắc đơn thuần.\"', 1, 1, 0, 1, '0000-00-00 00:00:00'),
(11, '\"Câu 11: Ý nghĩa của giá trị NaN khi xuất hiện trong các tính toán của JavaScript là gì?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(12, '\"Câu 12: Làm thế nào để kiểm tra một biến có phải là số hay không thông qua hàm isNaN()?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(13, '\"Câu 13: Cách sử dụng thuộc tính length để kiểm tra số lượng phần tử trong JavaScript?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(14, '\"Câu 14: Hàm str_replace() trong ngôn ngữ PHP thực hiện công việc gì?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(15, '\"Câu 15: Lệnh echo có nhiệm vụ gì khi xử lý dữ liệu trong ngôn ngữ PHP?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(16, '\"Câu 16: Trong các thẻ tiêu đề từ <h1> đến <h6>, thẻ nào có kích thước hiển thị nhỏ nhất?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(17, '\"Câu 17: Chức năng quan trọng nhất của thẻ liên kết <a> trong HTML là gì?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(18, '\"Câu 18: Thuộc tính href trong thẻ liên kết chứa loại thông tin quan trọng nào?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(19, '\"Câu 19: Thẻ liệt kê <li> bắt buộc phải nằm bên trong các thẻ cha nào?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(20, '\"Câu 20: Nội dung nằm bên trong thẻ <title> sẽ hiển thị ở vị trí nào trên trình duyệt?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(21, '\"Câu 21: Cách phân biệt giữa thuộc tính color và background-color trong CSS?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(22, '\"Câu 22: Tại sao đơn vị % (phần trăm) được coi là đơn vị đo lường tương đối trong CSS?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(23, '\"Câu 23: Làm thế nào để căn giữa nội dung văn bản bên trong một khối bằng text-align?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(24, '\"Câu 24: Thuộc tính border trong CSS giúp định nghĩa những yếu tố nào cho phần tử?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(25, '\"Câu 25: Hiệu ứng của giá trị display: block đối với cách hiển thị của một phần tử là gì?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(26, '\"Câu 26: Cách hiển thị một hộp thoại thông báo đơn giản cho người dùng bằng hàm alert()?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(27, '\"Câu 27: Để nhận dữ liệu nhập vào trực tiếp từ người dùng, ta dùng hàm nào trong JavaScript?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(28, '\"Câu 28: Hàm confirm() trả về giá trị gì khi người dùng nhấn vào nút OK hoặc Cancel?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(29, '\"Câu 29: Sự tiện dụng và phạm vi hoạt động của từ khóa let khi khai báo biến trong ES6?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(30, '\"Câu 30: Tại sao trong lập trình nên ưu tiên sử dụng const cho các giá trị không thay đổi?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(31, '\"Câu 31: Sự khác biệt bản chất về giá trị trả về giữa echo và print trong PHP là gì?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(32, '\"Câu 32: Tại sao mọi tên biến trong ngôn ngữ PHP đều phải bắt đầu bằng ký tự $?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(33, '\"Câu 33: Cách định dạng và lấy thông tin thời gian hiện tại bằng hàm date() trong PHP?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(34, '\"Câu 34: Để đếm tổng số lượng phần tử hiện có trong một mảng PHP, ta dùng hàm nào?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(35, '\"Câu 35: Điểm khác biệt quan trọng nhất về mặt xử lý lỗi giữa require và include là gì?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(36, '\"Câu 36: Web Server đóng vai trò trung tâm như thế nào trong việc vận hành một Website?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(37, '\"Câu 37: Kể tên các trình duyệt web phổ biến và tiêu biểu nhất đang được sử dụng hiện nay?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(38, '\"Câu 38: Cấu trúc cơ bản của một đường dẫn URL chuẩn bao gồm những phần nào?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(39, '\"Câu 39: Tại sao giao thức HTTPS lại được coi là an toàn và bảo mật hơn so với HTTP?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(40, '\"Câu 40: Tên miền (Domain) đóng vai trò gì trong việc định danh và truy cập trang web?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(41, '\"Câu 41: Thẻ <strong> mang ý nghĩa quan trọng gì đối với các công cụ tìm kiếm (SEO)?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(42, '\"Câu 42: Cách tạo điểm nhấn và định dạng in nghiêng cho văn bản bằng thẻ <em>?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(43, '\"Câu 43: Tại sao cả hai thẻ <img> và <script> đều sử dụng thuộc tính src?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(44, '\"Câu 44: Đặc điểm hiển thị đặc trưng của một phần tử mang giá trị display: inline là gì?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(45, '\"Câu 45: Làm thế nào để sử dụng thuộc tính font-weight để làm đậm văn bản trong CSS?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(46, '\"Câu 46: Kết quả trả về của phép toán typeof \"Hello\" trong JavaScript sẽ là gì?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(47, '\"Câu 47: Để kiểm tra kiểu dữ liệu của số 123 bằng toán tử typeof, kết quả nhận được là?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(48, '\"Câu 48: Tại sao giá trị null trong lập trình lại được gọi là giá trị \"trống\" có chủ ý?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(49, '\"Câu 49: Sự khác biệt bản chất giữa một biến mang giá trị null và biến undefined là gì?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(50, '\"Câu 50: Làm thế nào để tạo một cửa sổ thông báo bật lên (Popup) bằng lệnh alert()?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(51, '\"Câu 51: Mẹo căn giữa một khối phần tử theo chiều ngang bằng thuộc tính margin: 0 auto?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(52, '\"Câu 52: Cách viết ghi chú (comment) trong mã nguồn HTML đúng quy tắc cú pháp?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(53, '\"Câu 53: Giải thích kết quả logic của phép toán so sánh true && false trong JavaScript?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(54, '\"Câu 54: Tại sao phép toán logic true || false luôn trả về kết quả là true?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(55, '\"Câu 55: Thuộc tính overflow: hidden giải quyết triệt để vấn đề gì cho bố cục (layout)?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(56, '\"Câu 56: Cách tạo một ô nhập liệu văn bản đơn giản bằng thẻ <input> trong HTML?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(57, '\"Câu 57: Chức năng của hàm parseFloat() khi xử lý một chuỗi chứa số thập phân là gì?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(58, '\"Câu 58: Làm thế nào để thay đổi hình dạng con trỏ chuột sang hình bàn tay bằng cursor?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(59, '\"Câu 59: Phép so sánh logic 5 > 3 trong JavaScript sẽ trả về giá trị nào?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(60, '\"Câu 60: Sự khác biệt về mặt ngữ nghĩa (Semantic) giữa thẻ <b> và thẻ <strong> là gì?\"', 0, 1, 0, 1, '0000-00-00 00:00:00'),
(61, '\"Câu 61: Công nghệ AJAX giúp trang web cập nhật dữ liệu ngầm mà không cần phải tải lại (reload) toàn bộ nội dung trang.\"', 1, 1, 1, 1, '0000-00-00 00:00:00'),
(62, '\"Câu 62: Định dạng JSON là một tiêu chuẩn phổ biến trong việc trao đổi dữ liệu vì nó tập trung vào việc trang trí giao diện trang web.\"', 1, 1, 1, 1, '0000-00-00 00:00:00'),
(63, '\"Câu 63: API đóng vai trò là giao diện trung gian cho phép các hệ thống phần mềm khác nhau có thể kết nối và trao đổi dữ liệu.\"', 1, 1, 1, 1, '0000-00-00 00:00:00'),
(64, '\"Câu 64: Thông điệp \"HTTP 404 Not Found\" xuất hiện khi yêu cầu của người dùng đã được máy chủ xử lý thành công rực rỡ.\"', 1, 1, 1, 1, '0000-00-00 00:00:00'),
(65, '\"Câu 65: Mã trạng thái \"HTTP 200 OK\" có ý nghĩa là yêu cầu từ phía trình duyệt đã được máy chủ tiếp nhận và xử lý thành công.\"', 1, 1, 1, 1, '0000-00-00 00:00:00'),
(66, '\"Câu 66: Cơ chế Cookie giúp website ghi nhớ thông tin bằng cách lưu trữ các mẩu dữ liệu nhỏ trực tiếp trên máy chủ (Server).\"', 1, 1, 1, 1, '0000-00-00 00:00:00'),
(67, '\"Câu 67: Một trong những điểm khác biệt lớn nhất là dữ liệu trong sessionStorage sẽ tự động bị xóa bỏ ngay sau khi người dùng đóng tab trình duyệt.\"', 1, 1, 1, 1, '0000-00-00 00:00:00'),
(68, '\"Câu 68: Flexbox là mô hình bố cục giúp dàn trang linh hoạt, cho phép các phần tử tự động điều chỉnh không gian bên trong khung chứa.\"', 1, 1, 1, 1, '0000-00-00 00:00:00'),
(69, '\"Câu 69: Lập trình viên nên sử dụng CSS Grid thay vì Flexbox khi muốn quản lý bố cục trang web theo cả hai chiều hàng (row) và cột (column).\"', 1, 1, 1, 1, '0000-00-00 00:00:00'),
(70, '\"Câu 70: Thiết kế Responsive giúp trang web có khả năng tự động thay đổi bố cục để hiển thị tối ưu trên nhiều kích thước màn hình khác nhau.\"', 1, 1, 1, 1, '0000-00-00 00:00:00'),
(71, '\"Câu 71: Thuộc tính action trong biểu mẫu (form) xác định điều gì sau khi Submit?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(72, '\"Câu 72: Phân tích ưu và nhược điểm khi sử dụng phương thức GET trong các biểu mẫu?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(73, '\"Câu 73: Cách tạo một danh sách lựa chọn thả xuống bằng cặp thẻ <select> và <option>?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(74, '\"Câu 74: Mối quan hệ phân cấp giữa thẻ <select> và các thẻ <option> bên trong là gì?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(75, '\"Câu 75: Cách thiết lập trạng thái mặc định cho Checkbox bằng thuộc tính checked?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(76, '\"Câu 76: Lợi ích của box-sizing: border-box trong việc tính toán chiều rộng ô CSS?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(77, '\"Câu 77: Làm thế nào để kích hoạt thanh cuộn cho một khối nội dung bằng thuộc tính overflow?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(78, '\"Câu 78: Thay đổi biểu tượng con trỏ chuột thành hình bàn tay click (Pointer) bằng CSS như thế nào?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(79, '\"Câu 79: Cách loại bỏ hoàn toàn các ký hiệu đầu dòng của danh sách bằng thuộc tính list-style?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(80, '\"Câu 80: Thuộc tính white-space: nowrap có tác dụng gì đối với việc hiển thị văn bản?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(81, '\"Câu 81: Chuyển đổi dữ liệu từ các kiểu khác sang kiểu Số bằng hàm Number()?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(82, '\"Câu 82: Làm thế nào để biến đổi một giá trị số thành chuỗi văn bản bằng hàm String()?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(83, '\"Câu 83: Ép kiểu dữ liệu về dạng Đúng/Sai (Boolean) bằng hàm Boolean() như thế nào?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(84, '\"Câu 84: Cách tìm kiếm và trả về vị trí index của một ký tự bằng hàm indexOf()?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(85, '\"Câu 85: Hàm includes() giúp kiểm tra sự tồn tại của phần tử trong mảng như thế nào?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(86, '\"Câu 86: Tại sao cần sử dụng hàm trim() để làm sạch dữ liệu văn bản đầu vào?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(87, '\"Câu 87: Vai trò và ứng dụng của thuật toán mã hóa md5() trong bảo mật cơ bản?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(88, '\"Câu 88: Cách điều hướng trang web (Redirect) thông qua hàm header() trong PHP?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(89, '\"Câu 89: Phương pháp đọc toàn bộ nội dung của một file vào một chuỗi bằng PHP?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(90, '\"Câu 90: Cách thực hiện ghi dữ liệu trực tiếp vào một file bằng hàm file_put_contents()?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(91, '\"Câu 91: Tại sao việc mã hóa các ký tự đặc biệt trên URL bằng encodeURIComponent lại vô cùng cần thiết?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(92, '\"Câu 92: Phương pháp giải mã các tham số từ URL thông qua hàm decodeURIComponent được thực hiện như thế nào?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(93, '\"Câu 93: Cách thức truy xuất thông tin về hệ điều hành và trình duyệt của khách truy cập bằng thuộc tính userAgent?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(94, '\"Câu 94: Lệnh JavaScript nào hỗ trợ người dùng quay lại trang web đã xem trước đó trong lịch sử trình duyệt?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(95, '\"Câu 95: Làm thế nào để thực hiện việc tải lại (Refresh) trang web hiện tại bằng mã lệnh JavaScript?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(96, '\"Câu 96: Khái niệm về MIME type và tầm quan trọng của nó trong việc xác định các định dạng file truyền tải?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(97, '\"Câu 97: Header Content-Type trong giao thức HTTP đóng vai trò gì trong việc thông báo kiểu dữ liệu cho trình duyệt?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(98, '\"Câu 98: Khi máy chủ gặp lỗi xử lý nội bộ nghiêm trọng (Server Error), mã trạng thái HTTP nào thường được trả về?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(99, '\"Câu 99: Tại sao mã chuyển hướng \"HTTP 301\" lại đóng vai trò cực kỳ quan trọng trong việc tối ưu hóa SEO?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(100, '\"Câu 100: Cơ chế Cache hoạt động như thế nào để giúp tăng tốc độ tải trang web cho những lần truy cập sau?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(101, '\"Câu 101: Phân tích sự khác biệt về mặt hiển thị và không gian của display: none so với visibility: hidden?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(102, '\"Câu 102: Tại sao các lập trình viên luôn được khuyến cáo sử dụng toán tử so sánh tuyệt đối === trong JavaScript?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(103, '\"Câu 103: Kỹ thuật \"Event Delegation\" giúp tối ưu hóa hiệu năng và quản lý bộ nhớ cho ứng dụng web ra sao?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(104, '\"Câu 104: So sánh sự khác biệt về phạm vi hoạt động (Scope) và khả năng gán lại giá trị giữa từ khóa let và const?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(105, '\"Câu 105: Hiểu về cơ chế \"Hoisting\": Tại sao JavaScript lại cho phép gọi một hàm trước khi nó được khai báo chính thức?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(106, '\"Câu 106: Giải thích cơ chế lan truyền của hiện tượng \"Nổi bọt sự kiện\" (Event Bubbling) trong cây cấu trúc DOM?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(107, '\"Câu 107: Cơ chế \"Event Capturing\" (Bắt sự kiện) hoạt động theo trình tự ngược lại với cơ chế Bubbling như thế nào?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(108, '\"Câu 108: Làm thế nào để sử dụng lệnh trong JavaScript nhằm ngăn chặn một sự kiện tiếp tục lan truyền lên các phần tử cha?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(109, '\"Câu 109: Cách thức sử dụng preventDefault() để hủy bỏ các hành động mặc định của trình duyệt khi một sự kiện xảy ra?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(110, '\"Câu 110: Tại sao mô hình DOM lại được mô tả dưới dạng một cấu trúc cây (Tree structure) phân cấp giữa các phần tử?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(111, '\"Câu 111: So sánh sự linh hoạt và sức mạnh của phương thức querySelector so với các hàm chọn phần tử ID truyền thống?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(112, '\"Câu 112: Phân tích nguy cơ bảo mật và tấn công XSS khi lập trình viên lạm dụng innerHTML thay vì textContent?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(113, '\"Câu 113: Cách thức vận hành và vai trò kết nối giữa các hệ thống của một Web API trong kiến trúc ứng dụng thực tế?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(114, '\"Câu 114: Tại sao kiến trúc REST API lại trở thành tiêu chuẩn vàng trong việc phát triển các ứng dụng web và di động hiện đại?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(115, '\"Câu 115: Phương pháp kết hợp JavaScript và XML để tạo ra các yêu cầu AJAX bất đồng bộ giúp trang web hoạt động mượt mà?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(116, '\"Câu 116: Những ưu điểm vượt trội và tính năng hiện đại của Fetch API so với phương thức XMLHttpRequest cổ điển?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(117, '\"Câu 117: Tại sao chính sách bảo mật CORS thường gây ra lỗi khi ứng dụng thực hiện gọi dữ liệu từ một tên miền khác?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(118, '\"Câu 118: Những tiêu chuẩn cốt lõi nào dùng để đánh giá một trang web có khả năng Responsive (thích ứng) tốt trên thiết bị?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(119, '\"Câu 119: Cách ứng dụng Media Query trong CSS để thay đổi giao diện linh hoạt theo từng kích thước màn hình cụ thể?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(120, '\"Câu 120: Làm thế nào để kiểm soát thứ tự hiển thị của các phần tử đè lên nhau bằng thuộc tính lớp z-index?\"', 0, 1, 1, 1, '0000-00-00 00:00:00'),
(121, '\"Câu 121: Trong JavaScript, kết quả logic của phép so sánh lỏng lẻo null == undefined sẽ trả về giá trị là true.\"', 1, 1, 2, 1, '0000-00-00 00:00:00'),
(122, '\"Câu 122: Khi thực hiện phép so sánh nghiêm ngặt null === undefined, kết quả trả về sẽ là true vì chúng có cùng ý nghĩa là không có giá trị.\"', 1, 1, 2, 1, '0000-00-00 00:00:00'),
(123, '\"Câu 123: Cơ chế Closure cho phép một hàm ghi nhớ và truy cập được các biến nằm trong phạm vi (scope) bên ngoài của nó ngay cả khi hàm đó đã thực thi xong.\"', 1, 1, 2, 1, '0000-00-00 00:00:00'),
(124, '\"Câu 124: Đối tượng Promise trong JavaScript ra đời để giúp xử lý các tác vụ đồng bộ diễn ra theo thứ tự ưu tiên từ trên xuống dưới.\"', 1, 1, 2, 1, '0000-00-00 00:00:00'),
(125, '\"Câu 125: Việc sử dụng bộ đôi async/await giúp mã nguồn xử lý bất đồng bộ trông gọn gàng và có cấu trúc giống như mã đồng bộ thông thường.\"', 1, 1, 2, 1, '0000-00-00 00:00:00'),
(126, '\"Câu 126: Trong mô hình Flexbox, thuộc tính align-items được sử dụng để căn chỉnh các phần tử con theo trục ngang (trục chính).\"', 1, 1, 2, 1, '0000-00-00 00:00:00'),
(127, '\"Câu 127: Thuộc tính justify-content giúp phân bổ không gian và căn chỉnh các phần tử con theo trục chính (thường là trục ngang) trong Flexbox.\"', 1, 1, 2, 1, '0000-00-00 00:00:00'),
(128, '\"Câu 128: Thuộc tính overflow: hidden có tác dụng hiển thị toàn bộ nội dung của phần tử kể cả khi nội dung đó vượt quá kích thước khung chứa.\"', 1, 1, 2, 1, '0000-00-00 00:00:00'),
(129, '\"Câu 129: Thư viện PDO (PHP Data Objects) cung cấp một lớp kết nối an toàn và hỗ trợ giao tiếp với nhiều hệ quản trị cơ sở dữ liệu khác nhau trong PHP.\"', 1, 1, 2, 1, '0000-00-00 00:00:00'),
(130, '\"Câu 130: SQL Injection là một kỹ thuật lập trình an toàn giúp tăng tốc độ truy vấn dữ liệu từ máy chủ một cách hiệu quả.\"', 1, 1, 2, 1, '0000-00-00 00:00:00'),
(131, '\"Câu 131: Cách thức chuyển đổi một chuỗi văn bản dài thành một mảng các phần tử riêng biệt thông qua hàm explode()?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(132, '\"Câu 132: Phân tích mức độ nguy hiểm của lỗ hổng bảo mật SQL Injection đối với việc rò rỉ và mất mát dữ liệu người dùng?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(133, '\"Câu 133: Cơ chế hoạt động của cuộc tấn công XSS (Cross-Site Scripting) khi tin tặc chèn mã độc vào hệ thống trang web?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(134, '\"Câu 134: Phân tích mô hình kiến trúc MVC (Model-View-Controller) trong việc tổ chức và quản lý mã nguồn ứng dụng chuyên nghiệp?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(135, '\"Câu 135: Các phương thức HTTP phổ biến như GET, POST, PUT, DELETE đóng vai trò nghiệp vụ gì trong kiến trúc REST API?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(136, '\"Câu 136: Giải thích hiện tượng và kết quả kỳ lạ khi thực hiện phép toán cộng giữa hai mảng trống [] + [] trong JavaScript?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(137, '\"Câu 137: Tại sao cơ chế ép kiểu tự động (Coercion) trong JavaScript lại khiến phép toán 1 + true trả về kết quả là 2?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(138, '\"Câu 138: Cách thức hoạt động của toán tử nối chuỗi (dấu chấm) đặc trưng và duy nhất trong ngôn ngữ lập trình PHP?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(139, '\"Câu 139: Tại sao PHP có khả năng tự động chuyển đổi chuỗi chứa số thành dạng số để thực hiện phép cộng toán học?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(140, '\"Câu 140: Những lý do chính khiến Laravel trở thành Framework PHP mạnh mẽ và được ưa chuộng nhất trong cộng đồng lập trình viên?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(141, '\"Câu 141: Tại sao React được định nghĩa là một thư viện UI dựa trên các thành phần (Components) có khả năng tái sử dụng cao?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(142, '\"Câu 142: Cách tận dụng hệ thống lưới (Grid system) của Bootstrap để xây dựng giao diện web chuẩn và nhanh chóng nhất?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(143, '\"Câu 143: Node.js đã thay đổi cuộc chơi như thế nào khi đưa JavaScript thực thi ở phía máy chủ (Server) thay vì chỉ ở trình duyệt?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(144, '\"Câu 144: Cách thức quản lý, lưu trữ và theo dõi các phiên bản thay đổi của mã nguồn hiệu quả thông qua hệ thống Git?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(145, '\"Câu 145: Sự khác biệt cơ bản về hiệu năng và chi phí giữa các loại hình lưu trữ web như Shared Hosting, VPS và Dedicated Server?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(146, '\"Câu 146: Phương pháp sao chép các thuộc tính giữa các đối tượng trong JavaScript bằng cách sử dụng Object.assign()?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(147, '\"Câu 147: Sự tiện ích và sức mạnh của toán tử Spread ... trong việc thao tác, kết nối và gộp các mảng hoặc đối tượng?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(148, '\"Câu 148: Trong trường hợp nào một lập trình viên nên sử dụng cấu trúc dữ liệu Set thay vì Mảng để lưu trữ các giá trị duy nhất?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(149, '\"Câu 149: Phân tích những điểm vượt trội của cấu trúc dữ liệu Map so với Object truyền thống khi quản lý cặp dữ liệu Key-Value?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(150, '\"Câu 150: Tại sao cấu trúc WeakMap lại giúp tối ưu hóa bộ nhớ và ngăn chặn triệt để hiện tượng rò rỉ dữ liệu (Memory leak)?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(151, '\"Câu 151: Sức mạnh của hàm calc() trong CSS đối với việc thực hiện các tính toán kích thước giao diện một cách linh hoạt?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(152, '\"Câu 152: Cách tạo ra các hình dạng cắt gọt (Masking) độc đáo cho phần tử trang web bằng thuộc tính clip-path?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(153, '\"Câu 153: Cách tạo hiệu ứng làm mờ hậu cảnh (Glassmorphism) cực kỳ thời thượng bằng thuộc tính CSS backdrop-filter?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(154, '\"Câu 154: Quy trình mở và thiết lập luồng xử lý dữ liệu của một tệp tin thông qua hàm hệ thống fopen() trong PHP?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(155, '\"Câu 155: Cách thức thực hiện việc ghi nội dung mới vào một tệp tin đang trong trạng thái mở bằng hàm fwrite() trong PHP?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(156, '\"Câu 156: Làm thế nào để thực hiện việc xóa hoàn toàn một tệp tin vật lý khỏi máy chủ lưu trữ bằng lệnh unlink() trong PHP?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(157, '\"Câu 157: Chính sách Same-Origin Policy (SOP) đóng vai trò gì trong việc bảo vệ người dùng khỏi những rủi ro bảo mật liên miền?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(158, '\"Câu 158: Tổng quan về các phương thức lưu trữ dữ liệu phía Client: Sự tiến hóa từ Cookie đến Web Storage API?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(159, '\"Câu 159: Tại sao các dữ liệu lưu trữ trong sessionStorage lại tự động bị xóa bỏ ngay sau khi người dùng đóng tab trình duyệt?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(160, '\"Câu 160: Khái niệm PWA (Progressive Web App) mang lại khả năng hoạt động ngoại tuyến và trải nghiệm như ứng dụng gốc là gì?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(161, '\"Câu 161: Cơ chế \"Event Loop\" đóng vai trò điều phối việc thực thi mã nguồn và các tác vụ bất đồng bộ trong JavaScript như thế nào?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(162, '\"Câu 162: Hiểu về cơ chế \"Hoisting\": Tại sao JavaScript tự động đưa các khai báo lên đầu phạm vi thực thi của chương trình?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(163, '\"Câu 163: Định nghĩa chi tiết về \"Closure\" và khả năng ghi nhớ đặc biệt các biến ở phạm vi bên ngoài của một hàm JavaScript?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(164, '\"Câu 164: Cơ chế \"Prototype\" trong JavaScript đóng vai trò nền tảng như thế nào trong việc thực hiện kế thừa giữa các đối tượng?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(165, '\"Câu 165: Phân tích sự khác biệt cốt lõi về mặt ô nhớ giữa kỹ thuật \"Deep copy\" và \"Shallow copy\" khi sao chép dữ liệu?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(166, '\"Câu 166: Ý nghĩa sâu xa của từ khóa this và cách nó tự động xác định ngữ cảnh thực thi (Context) của một hàm cụ thể?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(167, '\"Câu 167: Giải thích chi tiết kết quả trả về của dòng lệnh console.log(1 + \"2\" + 3) dựa trên cơ chế ép kiểu tự động?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(168, '\"Câu 168: Tại sao phép so sánh lỏng lẻo [] == false trong JavaScript lại trả về kết quả logic cuối cùng là true?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(169, '\"Câu 169: Thứ tự in ra màn hình thực tế khi sử dụng đồng thời setTimeout (với 0ms) và một lệnh console.log thông thường là gì?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(170, '\"Câu 170: Đối tượng Promise được ra đời để giải quyết triệt để bài toán khó khăn gì trong việc xử lý các tác vụ bất đồng bộ?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(171, '\"Câu 171: Khái niệm về chính sách \"CORS\" và các bộ quy tắc bảo mật khi thực hiện chia sẻ tài nguyên giữa các miền khác nhau?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(172, '\"Câu 172: Bản chất kỹ thuật của cuộc tấn công XSS và cách thức tin tặc chèn mã độc vào trang web nhằm đánh cắp thông tin khách hàng?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(173, '\"Câu 173: Cách thức thực hiện và những hậu quả nghiêm trọng đối với hệ thống khi bị tấn công thông qua lỗ hổng \"SQL Injection\"?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(174, '\"Câu 174: Sự khác biệt về quy trình xử lý dữ liệu và tốc độ hiển thị giao diện giữa hai mô hình SSR và CSR là gì?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(175, '\"Câu 175: Cơ chế \"Virtual DOM\" hoạt động như thế nào để giảm thiểu số lần render lại không cần thiết trên cấu trúc DOM thật?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(176, '\"Câu 176: Kỹ thuật \"Debounce\" giúp lập trình viên kiểm soát và tối ưu tần suất gọi hàm (ví dụ: khi người dùng đang gõ tìm kiếm)?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(177, '\"Câu 177: Ứng dụng thực tế của kỹ thuật \"Throttle\" trong việc giới hạn tốc độ thực thi các hành động xảy ra liên tục trên web?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(178, '\"Câu 178: Hiện tượng \"Memory leak\" trong ứng dụng và những tác động tiêu cực của nó đến hiệu năng và tài nguyên bộ nhớ RAM?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(179, '\"Câu 179: Tại sao các hệ thống kiến trúc REST API hiện đại lại ưu tiên tuyệt đối việc sử dụng giao thức truyền tải HTTP?\"', 0, 1, 2, 1, '0000-00-00 00:00:00'),
(180, '\"Câu 180: Những đặc tính kỹ thuật vượt trội nào khiến ứng dụng PWA trở thành xu hướng mới trong trải nghiệm web di động hiện nay?\"', 0, 1, 2, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `summary_status`
--

CREATE TABLE `summary_status` (
  `player_id` int(11) NOT NULL,
  `total_games` int(11) DEFAULT 0,
  `best_score` int(11) DEFAULT 0,
  `longest_survival` int(11) DEFAULT 0,
  `wrong_answers` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `fk_answers_question` (`question_id`);

--
-- Chỉ mục cho bảng `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `fk_event_question` (`question_id`);

--
-- Chỉ mục cho bảng `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`exam_id`),
  ADD UNIQUE KEY `exam_code` (`exam_code`),
  ADD KEY `fk_exam_teacher` (`teacher_id`);

--
-- Chỉ mục cho bảng `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD PRIMARY KEY (`exam_id`,`question_id`),
  ADD KEY `fk_eq_question` (`question_id`);

--
-- Chỉ mục cho bảng `game_sessions`
--
ALTER TABLE `game_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `fk_sessions_player` (`player_id`),
  ADD KEY `fk_sessions_exam` (`exam_id`);

--
-- Chỉ mục cho bảng `history_answers`
--
ALTER TABLE `history_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_history_session` (`session_id`),
  ADD KEY `fk_history_question` (`question_id`),
  ADD KEY `fk_history_answer` (`answer_id`),
  ADD KEY `fk_history_exam` (`exam_id`);

--
-- Chỉ mục cho bảng `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `fk_questions_creator` (`created_by`);

--
-- Chỉ mục cho bảng `summary_status`
--
ALTER TABLE `summary_status`
  ADD PRIMARY KEY (`player_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `answers`
--
ALTER TABLE `answers`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=661;

--
-- AUTO_INCREMENT cho bảng `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `exams`
--
ALTER TABLE `exams`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `game_sessions`
--
ALTER TABLE `game_sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `history_answers`
--
ALTER TABLE `history_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `fk_answers_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_event_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `fk_exam_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `players` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD CONSTRAINT `fk_eq_exam` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_eq_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `game_sessions`
--
ALTER TABLE `game_sessions`
  ADD CONSTRAINT `fk_sessions_exam` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_sessions_player` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `history_answers`
--
ALTER TABLE `history_answers`
  ADD CONSTRAINT `fk_history_answer` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`),
  ADD CONSTRAINT `fk_history_exam` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_history_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_history_session` FOREIGN KEY (`session_id`) REFERENCES `game_sessions` (`session_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `fk_questions_creator` FOREIGN KEY (`created_by`) REFERENCES `players` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `summary_status`
--
ALTER TABLE `summary_status`
  ADD CONSTRAINT `fk_summary_player` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
