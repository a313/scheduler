// ignore_for_file: constant_identifier_names

const UNKNOWN_ERROR = 'Có lỗi xảy ra, vui lòng thử lại sau!';
const EMPTY_FIELD = '---';

const CMND = 'cmnd';
const IMAGE = 'image';
const MULTI_IMAGE = 'multiple_image';
const STAFF_CARD = 'staff_card';

const FIELD_TEXT = 'text';
const FIELD_CHECK_BOX = 'radio';
const FIELD_SALARY = 'salary';
const FIELD_SELECT_BOX = 'select_box';
const FIELD_NUMBER = 'number';
const FIELD_DATE = 'date';
const FIELD_LOCATION = 'location';
const FIELD_BANK = 'bank';
const FIELD_DATE_MONTH = 'month_year';
const FIELD_REFERRAL = 'referral_phone';
const FIELD_FULL_NAME = 'full_name';
const FIELD_SALE = 'sale_code';
const FIELD_CONTACT_PERSON = 'contact_person_phone';
const FIELD_BANK_ACCOUNT = 'bank_account_name';
const FIELD_EMPLOYEE_CODE = 'employee_code';
const FIELD_EKYC = 'ekyc';

const UPLOAD_TYPE_ALL = "ALL";
const UPLOAD_TYPE_CAMERA = "CAMERA";
const UPLOAD_TYPE_GALLERY = "UPLOAD";

const FIRST_FORM = 'FIRST_FORM';
const SECOND_FORM = 'SECOND_FORM';
const GIFT_ONBOARD = 'GIFT_ONBOARD';

const CONNECT_TIMEOUT = "Yêu cầu hết thời gian chờ";
const REQUEST_ERROR = "Yêu cầu không hợp lệ";
const REQUEST_ERROR_SHORT =
    "Chúng tôi không thể tải dữ liệu do vấn đề kỹ thuật. Vui lòng tải lại trang.";
const REQUEST_EXCEPTION = "Kết nối không thành công. Vui lòng thử lại sau!";
const NETWORK_ERROR =
    "Không có kết nối mạng. Vui lòng kiểm trả lại kết nối mạng và thử lại!";
const CONNECT_ERROR = "Kết nối không thành công. Vui lòng thử lại sau!";

const IOS_APP_ID = "1542361834";
const ANDROID_APP_ID = "vn.gimo";

const RE_UPLOAD_ACCOUNT_STATEMENT = "SUSPEND__RE_UPLOAD_ACCOUNT_STATEMENT";
const WAITING_APPRAISALS_ACCOUNT_STATEMENT =
    "SUSPEND__WAITING_APPRAISALS_ACCOUNT_STATEMENT";

const PHONE_CSKH = "1900232360";
const TITLE_ALERT_NOTI = "Thông báo";
const UPDATE_TAG = "UPDATE_APP";
const MAINTAIN_TAG = "MAINTAIN_TAG";
const DEV_SSL_FINGERPRINT =
    "F3 BD 6A A4 70 A4 3C 4F 72 04 F9 DD 14 84 61 98 1D 07 77 79 08 86 BE 09 05 E3 44 06 EF 25 09 9E";
const PROD_SSL_FINGERPRINT =
    "AF 9C B8 17 86 14 FA 16 52 34 58 7C 35 6B 79 58 36 51 63 AF B1 B9 E6 79 78 B6 1F DA F6 12 DA 8E";

// const TAG_EDU =
//     "tin-tuc,cong-nghe,bai-viet,cau-chuyen-ngưoi-dung,cau-chuyen-doanh-nghiep,tai-chinh,quan-tri-nhan-su,chu-dong-nhan-luong-linh-hoat,tai-chinh-toan-dien,funding,";

const PRIVACY_LINK =
    "https://firebasestorage.googleapis.com/v0/b/gimo-61603.appspot.com/o/app.html?alt=media";
const FAQ_LINK =
    "https://firebasestorage.googleapis.com/v0/b/gimo-61603.appspot.com/o/faq.html?alt=media";

const FIXED = "FIXED";

const String URL_TEMP = "https://i.ibb.co/HPCm1Lr/image-28.png";
const String m2 = "m2";

//
const double COMPONENT_HEIGHT = 48.0;
const double FORM_ELEMENT_HEIGHT = 48.0;
const double BUTTON_HEIGHT = 56.0;
const double BUTTON_HEIGHT_NAV = 40.0;
const double FIRST_COLUMN_WIDTH = 36;
const double SECOND_COLUMN_WIDTH = 64;

const double ROW_HEIGHT = 48;
const int MIN_CONTRACT_AMOUNT = 100000;

const String ACTION_CONFIRM = "CONFIRM";
const String ACTION_REFUSE = "REFUSE";
const String ACTION_LOCK = "LOCK_UNLOCK";
const String RESULT_SUCCESS = "SUCCESS";
const String BIOMETRIC = "BIOMETRIC";

const String PROCESSING = "PROCESSING";
const String DISBURSED = "DISBURSED";
const String CANCEL = "CANCEL";

const String USER_STATUS_ACTIVE = "ACTIVE";
const String USER_STATUS_INACTIVE = "INACTIVE";
const String USER_STATUS_SUSPEND = "SUSPEND";

const String DDA_REGISTERED = "REGISTERED";
const String DDA_UNREGISTERED = "UNREGISTERED";
const String DDA_CANCEL = "CANCEL";

const String FORM_WAITING_APPROVE = "WAITING_APPROVE";
const String FORM_APPROVED = "APPROVED";
const String FORM_REJECTED = "REJECTED";
const String FORM_CANCEL = "CANCELED";

const String PARTNER_CHECK_CREATE = "CREATE";
const String PARTNER_CHECK_PENDING = "PENDING";
const String PARTNER_CHECK_APPROVED = "APPROVED";
const String PARTNER_CHECK_REJECT = "REJECT";

const TYPE_INSIGHT = 0;
const TYPE_CASE_STUDY = 1;
const TYPE_TESTIMONIAL = 2;

const DISBURSED_24H = 2;
const DISBURSED_INSTANT = 1;

const String DISBURSED_TIME_INSTANT = "INSTANT";
const String DISBURSED_TIME_24H = "H24";

const String INCOME_ATTENDANCES = "ATTENDANCES";
const String INCOME_INCENTIVE = "INCENTIVE";

const String REFRESH_DIE = "auth/token/unable-to-refresh-access-token";

const String ekyc_font = 'idFronImagePath';
const String ekyc_back = 'idBackImagePath';
const String ekyc_selfie = 'selfieImage';

const Map<String, String> MAP_ICONS_HISTORY = {
  DISBURSED: 'assets/ic_his_contract_ok.svg',
  PROCESSING: 'assets/ic_his_contract_review.svg',
  CANCEL: 'assets/ic_his_contract_fail.svg',
};

const Map<String, String> API_ERROR_CODE = {
  '400': 'Bad Request',
  '500': 'Internal Server Error',
};

const Map<bool, String> MAP_OF_MARRIED = {
  false: 'Chưa kết hôn',
  true: 'Đã kết hôn',
};

const Map<String, bool> MAP_OF_RESIDENCY = {
  'Không': false,
  'Có': true,
};

const Map<String, String> MAP_OF_GENDER = {
  "MALE": 'Nam',
  "FEMALE": 'Nữ',
  "OTHER": 'Khác',
};

const mapVehicle = {
  'Electrical': 'Xe điện',
  'Over50cc': 'Xe > 50cc',
  'Under50cc': 'Xe <= 50cc',
  'ThreeWheeler': 'Xe 3 bánh'
};
