namespace BA_ERPMVC.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddLockColumn : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "LockoutEndDateUtc", c => c.DateTime(nullable: true));
        }
        
        public override void Down()
        {
        }
    }
}
