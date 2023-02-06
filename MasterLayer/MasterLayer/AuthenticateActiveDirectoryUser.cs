using System;
using System.Collections.Generic;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MasterLayer
{
    public class AuthenticateActiveDirectoryUser
    {

        PrincipalContext pc = new PrincipalContext(ContextType.Domain, "nbp.com.pk");

        public AuthenticateActiveDirectoryUser(string domainName)
        {
            //pc = new PrincipalContext(ContextType.Domain, domainName);
        }

        // PrincipalContext pc = new PrincipalContext(ContextType.Domain, "nbp.com.pk/Users");
        //bool isValid = pc.ValidateCredentials("lsghelpdesk@nbp.com.pk", "logistic+1");
        public string Email { get; set; }
        public string Password { get; set; }

        public bool IsAuthenticate(string Email, string Password)
        {
            bool response = false;
            try
            {
                response = pc.ValidateCredentials(this.Email.Trim(), this.Password.Trim(), ContextOptions.Negotiate);
                this.Email = Email;
                this.Password = Password;
            }
            catch (Exception ex)
            {
                CustomLogger.WriteErrorLogToFile(ex);
            }

            return response;
        }
    }
}
