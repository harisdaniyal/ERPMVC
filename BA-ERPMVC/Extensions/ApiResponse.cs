using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BA_ERPMVC.Extensions
{
    public class ApiResponse
    {
        public string statusCode { get; set; } = "11";
        public int statusCodeint { get; set; } = 11;
        public string message { get; set; } = "No data found";
        public Object data { get; set; } = null;
    }

    public class StatusCode
    {
        public static string SUCCESS_CODE = "00";
        public static string SUCCESS_DESCRIPTION = "Detail has been Added Successfully";
        public static string UPDATED_CODE = "000";
        public static string UPDATED_DESCRIPTION = "Detail has been Updated Successfully";
        public static string ERROR_CODE = "11";
        public static string ERROR_DESCRIPTION = "Something went wrong,Please check your internet connection";
        public static string DELETE_DESCRIPTION = "Detail has been Deleted Successfully";
        public static string NOTFOUND_CODE = "01";
        public static string NOTFOUND_DESCRIPTION = "Record not found";
        public static string ALREADY_EXIST_CODE = "10";
        public static string NO_CHANGE_CODE = "201";
        public static string NO_CHANGE_DESCRIPTION = "No changes has been made";
        public static string RECORD_FOUND_DESCRIPTION = "Records found";
        public static string STATUS_UPLOAD_LIMIT = "101";
        public static string EXPIRED_CODE = "1111";
    }
}