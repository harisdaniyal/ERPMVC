using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using MasterLayer;

namespace BA_ERPMVC.UtilityClasses
{
    public class UserDetail
    {
        public static int EmpId
        {
            get
            {
                var val = HttpContext.Current.Session["EmpId"];
                if (val != null)
                {
                    return (int)val;
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                HttpContext.Current.Session["EmpId"] = value;
            }
        }

        public static int LoginId
        {
            get
            {
                var val = HttpContext.Current.Session["LoginId"];
                if (val != null)
                {
                    return (int)val;
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                HttpContext.Current.Session["LoginId"] = value;
            }
        }


        public static int DesignationId
        {
            get
            {
                var val = HttpContext.Current.Session["DesignationId"];
                if (val != null)
                {
                    return (int)val;
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                HttpContext.Current.Session["DesignationId"] = value;
            }
        }

        public static int LocationId
        {
            get
            {
                var val = HttpContext.Current.Session["LocationId"];
                if (val != null)
                {
                    return (int)val;
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                HttpContext.Current.Session["LocationId"] = value;
            }
        }

        public static int TeamId
        {
            get
            {
                var val = HttpContext.Current.Session["TeamId"];
                if (val != null)
                {
                    return (int)val;
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                HttpContext.Current.Session["TeamId"] = value;
            }
        }

        public static string DesignationName
        {
            get
            {
                var val = HttpContext.Current.Session["DesignationName"];
                if (val != null)
                {
                    return val.ToString();
                }
                else
                {
                    return null;
                }
            }
            set
            {
                HttpContext.Current.Session["DesignationName"] = value;
            }
        }

        public static string Roles
        {
            get
            {
                var val = HttpContext.Current.Session["Roles"];
                if (val != null)
                {
                    return val.ToString();
                }
                else
                {
                    return null;
                }
            }
            set
            {
                HttpContext.Current.Session["Roles"] = value;
            }
        }

        public static string Email
        {
            get
            {
                var val = HttpContext.Current.Session["Email"];
                if (val != null)
                {
                    return val.ToString();
                }
                else
                {
                    return null;
                }
            }
            set
            {
                HttpContext.Current.Session["Email"] = value;
            }
        }

        public static string Password
        {
            get
            {
                var val = HttpContext.Current.Session["Password"];
                if (val != null)
                {
                    return val.ToString();
                }
                else
                {
                    return null;
                }
            }
            set
            {
                HttpContext.Current.Session["Password"] = value;
            }
        }

        public static string UserName
        {
            get
            {
                var val = HttpContext.Current.Session["UserName"];
                if (val != null)
                {
                    return val.ToString();
                }
                else
                {
                    return null;
                }
            }
            set
            {
                HttpContext.Current.Session["UserName"] = value;
            }
        }

        public static int BranchCode
        {
            get
            {
                var val = HttpContext.Current.Session["BranchCode"];
                if (val != null)
                {
                    return (int)val;
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                HttpContext.Current.Session["BranchCode"] = value;
            }
        }

        public static int IsAdmin
        {
            get
            {
                var val = HttpContext.Current.Session["IsAdmin"];
                if (val != null)
                {
                    return (int)val;
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                HttpContext.Current.Session["IsAdmin"] = value;
            }
        }



        public static string BranchName
        {
            get
            {
                var val = HttpContext.Current.Session["BranchName"];
                if (val != null)
                {
                    return val.ToString();
                }
                else
                {
                    return null;
                }
            }
            set
            {
                HttpContext.Current.Session["BranchName"] = value;
            }
        }


        public static string City
        {
            get
            {
                var val = HttpContext.Current.Session["City"];
                if (val != null)
                {
                    return val.ToString();
                }
                else
                {
                    return null;
                }
            }
            set
            {
                HttpContext.Current.Session["City"] = value;
            }

        }

        public static string Province
        {
            get
            {
                var val = HttpContext.Current.Session["Province"];
                if (val != null)
                {
                    return val.ToString();
                }
                else
                {
                    return null;
                }
            }
            set
            {
                HttpContext.Current.Session["Province"] = value;
            }

        }

        public static int EmployeeManagerId
        {
            get
            {
                var val = HttpContext.Current.Session["EmployeeManagerId"];
                if (val != null)
                {
                    return (int)val;
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                HttpContext.Current.Session["EmployeeManagerId"] = value;
            }
        }

        public static int OfficeId
        {
            get
            {
                var val = HttpContext.Current.Session["OfficeId"];
                if (val != null)
                {
                    return (int)val;
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                HttpContext.Current.Session["OfficeId"] = value;
            }
        }


        public static int IsReset
        {
            get
            {
                var val = HttpContext.Current.Session["IsReset"];
                if (val != null)
                {
                    return (int)val;
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                HttpContext.Current.Session["IsReset"] = value;
            }
        }




        public static bool isAdmin()
        {
            bool b = false;
            if (DesignationId == 1)
            {
                b = true;
            }
            return b;
        }

        public static bool isOperator()
        {
            bool b = false;
            if (DesignationId == 2)
            {
                b = true;
            }
            return b;
        }

        public static bool isEngineer()
        {
            bool b = false;
            if (Roles.IndexOf("ENGINEER") >= 0)
            {
                b = true;
            }
            return b;
        }

        public static bool isSupport()
        {
            bool b = false;
            if (Roles.IndexOf("SUPPORT") >= 0)
            {
                b = true;
            }
            return b;
        }

        public static bool isUser()
        {
            bool b = false;
            if (!string.IsNullOrEmpty(Roles))
            {
                if ((Roles.IndexOf("USER") >= 0) || (Roles.IndexOf("ENGINEER") >= 0) || (Roles.IndexOf("SUPPORT") >= 0) || (Roles.IndexOf("COORDINATOR") >= 0))
                {
                    b = true;
                }
            }
            return b;
        }

        public static void DestroySessions()
        {
            EmpId = 0;
            DesignationId = 0;
            BranchCode = 0;
            BranchCode = 0;
            OfficeId = 0;
            DesignationName = null;
            UserName = null;
            Password = null;
            Email = null;
            Roles = null;
            TeamId = 0;

        }

        public static void email_send(string filePath)
        {
            string strName = ConfigurationManager.AppSettings["EmailAddresses"];

            try
            {
                CustomLogger.Info("Email Automation started");
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                mail.From = new MailAddress("supremeftp21@gmail.com");
                mail.To.Add(strName);
                mail.Subject = "Import Order Booking Report";
                mail.Body = "Dear Concern, \n\nPlease check out the attachment for Import Order Booking.\n\nRegards,\nBilal Associates";
                // ashraf @bilal-group.com
                System.Net.Mail.Attachment attachment;
                attachment = new System.Net.Mail.Attachment(filePath);
                mail.Attachments.Add(attachment);

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential("supremeftp21@gmail.com", "a!d@m#i$n");
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);
            }
            catch (Exception ex )
            {
                throw;
            }

          

           

        }
    }
}