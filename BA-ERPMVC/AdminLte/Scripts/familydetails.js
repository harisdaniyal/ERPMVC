function editparentClick(id){   
         console.log(id);
        var referenceNum =id;
           window.location.href = "FamilyDetails?id=" + referenceNum + "&edit=parent";
}
function editspouseClick(id){   
         console.log(id);
        var referenceNum =id;
           window.location.href = "FamilyDetails?id=" + referenceNum + "&edit=spouse";
}
function editChildClick(id){   
         console.log(id);
        var referenceNum =id;
           window.location.href = "FamilyDetails?id=" + referenceNum + "&edit=child";
}
 
$(document).ready(function () {
        var services = new Services(); 

var id = $.url().param("id");
    var isEdit = $.url().param("edit");
if (isEdit == 'parent') {
$("#editparent").removeClass("d-none");
    function getparentbypid(id)
     {
            services.getparentbypid(JSON.stringify({
            id : id
            })).then(function(response){ 
                
                var data = response;
                
                var Pid=data[0].parentid;
                $("#txteditparentname").val(data[0].parentname);
                $("#txteditparentcnic").val(data[0].paerntcnic); //Reading text box values using Jquery
                $("#txteditparentDob").val(data[0].parentdob);
                $("#ddleditparentgender").val(data[0].parentgender);
               
                
                  });
          }getparentbypid(id);            

$('#btneditparent').on('click', function() {
                  window.location.href = "FamilyDetails";
                });
}
if(isEdit == 'spouse')
{
$("#editspouse").removeClass("d-none");
function getspousebypid(id)
     {
            services.getspousebypid(JSON.stringify({
            id : id
            })).then(function(response){ 
                
                var data = response;
              
                var Sid=data[0].spouseid;
                $("#txteditspousename").val(data[0].spousename);
                $("#txteditspousecnic").val(data[0].spousecnic); //Reading text box values using Jquery
                $("#txteditsDob").val(data[0].spousedob);
                $("#ddleditsgender").val(data[0].spousegender).change();
               
                
                  });
          }getspousebypid(id);            
        $('#btneditspouse').on('click', function() {
                  window.location.href = "FamilyDetails";
                });

}
if(isEdit == 'child')
{
$("#editchild").removeClass("d-none");
function getchildbypid(id)
     {
            services.getchildbypid(JSON.stringify({
            id : id
            })).then(function(response){ 
                
                var data = response.Child;
             
                var cid=data[0].Childid;
                $("#txteditchildname").val(data[0].Cname);
                $("#txteditchildcnic").val(data[0].ChildCnic); //Reading text box values using Jquery
                $("#txteditcDob").val(data[0].Cdob);
                $("#ddleditchildgender").val(data[0].Cgender).change();
                $("#ddleditchildstatus").val(data[0].ChildStatus).change();    
                });
          }getchildbypid(id);            
        $('#btneditchild').on('click', function() {
                  window.location.href = "FamilyDetails";
                });
}

else{
                $("#lloForm").removeClass("d-none");
                function getEmployeeDetail() {
                services.getEmployeeDetail(JSON.stringify({
                })).then(function (data) {
                        var s = '<option value="-1">Employee Name - Employee Code</option>';
                        for (var i = 0; i < data.result.length; i++) {
                            s += '<option value="' +data.result[i].EID + '">' +  data.result[i].FirstName+" "+data.result[i].LastName+"-"+data.result[i].Ecode  + '</option>';
                        }
                        $("#ddlEmployee").html(s);
                        
                    });
                }getEmployeeDetail();
                   
                 
                       

                
                $('#ddltype').on('change', function() {
                 if ( this.value == 'Parents')
                 {
                    $("#divparent").removeClass("d-none");
                    $( "#divspouse" ).addClass("d-none");
                    $( "#divchild" ).addClass("d-none");
                   
                    function getparentbyid(id)
                         {
                                services.getparentbyid(JSON.stringify({
                                    id : id
                                })).then(function(response){ 
                                      
                                    $("#ddltype").val("-1").change();
                                    if(response.length)
                                    {
                                     $('#ParentGrid').dataTable().fnClearTable();
                                     $('#ParentGrid').dataTable().fnDestroy();
                                     $('#ParentGrid').dataTable({
                                        dom: 'Bfrtip',
                                    "lengthChange": false,
                                    "paging": false,
                                    'searching': false,
                                       data: response,
                                    columns: [
                                    {
                                        "render": function (data, type, parent, row) {
                                            return '<button class="btn btn-primary" id="btnChildEdit" onclick="editparentClick('+parent.parentid+')">Edit</button>';
                                        }
                                    },
                                    { 'data': 'parentid', visible:false },
                                    { 'data': 'parentname'},
                                    { 'data': 'paerntcnic' },
                                    { 'data': 'parentdob' },
                                    { 'data': 'parentgender' }
                        
                
                        ],
                            buttons: []
                        });
                                   
                                } });
                              }getparentbyid($("#ddlEmployee option:selected").val());
                    
                  }else if(this.value == 'Spouse')
                  {
                    $("#divspouse").removeClass("d-none");
                    $("#divparent").addClass("d-none");
                    $("#divchild").addClass("d-none");
                    function getspousebyid(id)
                         {
                                services.getspousebyid(JSON.stringify({
                                    id : id
                                })).then(function(response){ 
                                $("#ddltype").val("-1").change();
                                if(response.length)
                                {
                                 $('#SpouseGrid').dataTable().fnClearTable();
                                 $('#SpouseGrid').dataTable().fnDestroy();
                                 $('#SpouseGrid').dataTable({
                                    dom: 'Bfrtip',
                                "lengthChange": false,
                                "paging": false,
                                'searching': false,
                                    data: response,
                                columns: [
                                {
                                    "render": function (data, type, spouse, row) {
                                        return '<button class="btn btn-primary" id="btnChildEdit" onclick="editspouseClick('+spouse.spouseid+')">Edit</button>';
                                    }
                                },
                                { 'data': 'spouseid', visible:false },
                                { 'data': 'spousename'},
                                { 'data': 'spousecnic' },
                                { 'data': 'spousedob' },
                                { 'data': 'spousegender' }
                        
                
                        ],
                            buttons: []
                        });
                                   
                                } });
                              }getspousebyid($("#ddlEmployee option:selected").val());

                  }else if(this.value == 'Children')
                  {
                    $("#divchild").removeClass("d-none");
                    $("#divparent").addClass("d-none");
                    $("#divspouse").addClass("d-none");
                     $("#ddltype").val("-1").change();
                    function getChildGridDetail(id) {
                           
                            services.getChildGridDetail(JSON.stringify({
                                 id : id
                            })).then(function (response) {            
           
                        $('#ChildGrid').dataTable().fnClearTable();
                        $('#ChildGrid').dataTable().fnDestroy();
                         $('#ChildGrid').dataTable({
               
                              dom: 'Bfrtip',
                            "lengthChange": false,
                            "paging": false,
                            'searching': false,
                
                
                         data: response.Child,
                            columns: [
                            {
                            "render": function (data, type, Child, row) {
                                return '<button class="btn btn-primary" id="btnChildEdit" onclick="editChildClick('+Child.Childid+')">Edit</button>';
                            }
                        },
                        { 'data': 'Childid', visible:false },
                        { 'data': 'Cname'},
                        { 'data': 'ChildCnic' },
                        { 'data': 'Cdob' },
                        { 'data': 'ChildStatus' },
                        { 'data': 'Cgender' }
                
                
                        ],
                            buttons: []
                        });
                                });
                            }getChildGridDetail($("#ddlEmployee option:selected").val());
                  }//elseif
                    
                });//function
                
                
                $('#ddlEmployee').on('change', function() {
                    $("#typecol").removeClass("d-none");
                    
                });
}
        });