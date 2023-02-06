namespace BA_ERPMVC.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddFirstLastBusinessName : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "CNIC", c => c.String(nullable: true, maxLength: 50));
            AddColumn("dbo.AspNetUsers", "FirstName", c => c.String(nullable: true, maxLength: 50));
            AddColumn("dbo.AspNetUsers", "LastName", c => c.String(nullable: true, maxLength: 50));
            AddColumn("dbo.AspNetUsers", "BusinessDivisionID", c => c.Int(nullable: true));           
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "BusinessDivisionID");
            DropColumn("dbo.AspNetUsers", "LastName");
            DropColumn("dbo.AspNetUsers", "FirstName");
            DropColumn("dbo.AspNetUsers", "CNIC");
        }
    }
}
