<%@ Control Language="C#" EnableViewState="false" AutoEventWireup="false" Inherits="CKFinder.Settings.ConfigFile" %>
<%@ Import Namespace="CKFinder.Settings" %>
<script runat="server">
    
	/**
	 * This function must check the user session to be sure that he/she is
	 * authorized to upload and access files using CKFinder.
	 */
    
	public override bool CheckAuthentication()
	{
		// WARNING : DO NOT simply return "true". By doing so, you are allowing
		// "anyone" to upload and list the files in your server. You must implement
		// some kind of session validation here. Even something very simple as...
		//
		//		return ( Session[ "IsAuthorized" ] != null && (bool)Session[ "IsAuthorized" ] == true );
		//
		// ... where Session[ "IsAuthorized" ] is set to "true" as soon as the
		// user logs on your system.

		return true;
        //return (Session["IsAuthorized"] != null && (bool)Session["IsAuthorized"] == true);
	}

	/**
	 * All configuration settings must be defined here.
	 */
	public override void SetConfig()
	{
        
		// Paste your license name and key here. If left blank, CKFinder will
		// be fully functional, in Demo Mode.
        LicenseName = "news.princeton.edu";
        LicenseKey = "BNHY-MFK1-P111-X7B9-MVFK-UL5A-11XH";

		BaseUrl = "/Uploads/";
        BaseDir = Server.MapPath("/Uploads/");
		Thumbnails.Url = BaseUrl + "_thumbs/";
		Thumbnails.Dir = BaseDir + "_thumbs/";
		Thumbnails.Enabled = true;
		Thumbnails.DirectAccess = false;
		Thumbnails.MaxWidth = 100;
		Thumbnails.MaxHeight = 100;
		Thumbnails.Quality = 80;
		Images.MaxWidth = 0;
		Images.MaxHeight = 0;
		Images.Quality = 80;


        DisallowUnsafeCharacters = false;
		// Indicates that the file size (MaxSize) for images must be checked only
		// after scaling them. Otherwise, it is checked right after uploading.
		CheckSizeAfterScaling = true;

		// Due to security issues with Apache modules, it is recommended to leave the
		// following setting enabled. It can be safely disabled on IIS.
		ForceSingleExtension = true;

		// For security, HTML is allowed in the first Kb of data for files having the
		// following extensions only.
		HtmlExtensions = new string[] { "html", "htm", "xml", "js" };

		// Folders to not display in CKFinder, no matter their location. No
		// paths are accepted, only the folder name.
		// The * and ? wildcards are accepted.
        //".*" disallows the creation of folders starting with a dot character.
		HideFolders = new string[] { ".svn", "CVS" };

		// Files to not display in CKFinder, no matter their location. No
		// paths are accepted, only the file name, including extension.
		// The * and ? wildcards are accepted.
		HideFiles = new string[] { ".*" };

		// Perform additional checks for image files.
		SecureImageUploads = true;

		// The session variable name that CKFinder must use to retrieve the
		// "role" of the current user. The "role" is optional and can be used
		// in the "AccessControl" settings (bellow in this file).
        
        RoleSessionVar = "CKFinder_UserRole";
        
        
        
		// ACL (Access Control) settings. Used to restrict access or features
		// to specific folders.
		// Several "AccessControl.Add()" calls can be made, which return a
		// single ACL setting object to be configured. All properties settings
		// are optional in that object.
		// Subfolders inherit their default settings from their parents' definitions.
		//
		//	- The "Role" property accepts the special "*" value, which means
		//	  "everybody".
		//	- The "ResourceType" attribute accepts the special value "*", which
		//	  means "all resource types".
        AccessControl acl = AccessControl.Add();

        //acl = AccessControl.Add();
        acl.Role = "*";
        acl.ResourceType = "Huong Dan";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = false;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = false;
        acl.FileRename = false;
        acl.FileDelete = false;
        
        acl = AccessControl.Add();
        acl.Role = "2_1";
        acl.ResourceType = "*";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = true;
        acl.FolderDelete = true;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = true;
        acl.FileDelete = true;

        acl = AccessControl.Add();        
        acl.Role = "2";
        acl.ResourceType = "*";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "6";
        acl.ResourceType = "DL Viet Tri";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "7";
        acl.ResourceType = "DL TX Phu Tho";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "8";
        acl.ResourceType = "DL Thanh Ba";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "10";
        acl.ResourceType = "DL Lam Thao";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "16";
        acl.ResourceType = "DL Cam Khe";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "17";
        acl.ResourceType = "DL Phu Ninh";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "18";
        acl.ResourceType = "DL Tam Nong";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "19";
        acl.ResourceType = "DL Doan Hung";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "20";
        acl.ResourceType = "DL Ha Hoa";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "21";
        acl.ResourceType = "DL Lam Thao";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "22";
        acl.ResourceType = "DL Tan Son";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "23";
        acl.ResourceType = "DL Thanh Son";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "24";
        acl.ResourceType = "DL Thanh Thuy";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "25";
        acl.ResourceType = "DL Yen Lap";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "27";
        acl.ResourceType = "Phong Dieu Do";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "28";
        acl.ResourceType = "Phong Ky Thuat";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "29";
        acl.ResourceType = "Phong Kinh Doanh";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "31";
        acl.ResourceType = "Phong KTGS MBD";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "32";
        acl.ResourceType = "Phong KH VT";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "33";
        acl.ResourceType = "Phong QLDT";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "34";
        acl.ResourceType = "Phong CNTT";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "35";
        acl.ResourceType = "Phong TCCB";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "36";
        acl.ResourceType = "Phong TTPC";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "37";
        acl.ResourceType = "Van Phong";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "38";
        acl.ResourceType = "Phong TCKT";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "39";
        acl.ResourceType = "Phong An Toan";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "40";
        acl.ResourceType = "XNDV";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;

        acl = AccessControl.Add();
        acl.Role = "41";
        acl.ResourceType = "Ban QLDA";
        acl.Folder = "/";

        acl.FolderView = true;
        acl.FolderCreate = true;
        acl.FolderRename = false;
        acl.FolderDelete = false;

        acl.FileView = true;
        acl.FileUpload = true;
        acl.FileRename = false;
        acl.FileDelete = false;
        
		// Resource Type settings.
		// A resource type is nothing more than a way to group files under
		// different paths, each one having different configuration settings.
		// Each resource type name must be unique.
		// When loading CKFinder, the "type" querystring parameter can be used
		// to display a specific type only. If "type" is omitted in the URL,
		// the "DefaultResourceTypes" settings is used (may contain the
		// resource type names separated by a comma). If left empty, all types
		// are loaded.

		DefaultResourceTypes = "";

		ResourceType type;

        
        
        
		type = ResourceType.Add( "Cong Ty Dien Luc Phu Tho" );
        type.Url = BaseUrl + "Cong Ty Dien Luc Phu Tho/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "Cong Ty Dien Luc Phu Tho";
		type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
		type.DeniedExtensions = new string[] { };

		

        type = ResourceType.Add("DL Cam Khe");
        type.Url = BaseUrl + "DL Cam Khe/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "DL Cam Khe/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("DL Doan Hung");
        type.Url = BaseUrl + "DL Doan Hung/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "DL Doan Hung/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("DL Ha Hoa");
        type.Url = BaseUrl + "DL Ha Hoa/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "DL Ha Hoa/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("DL Lam Thao");
        type.Url = BaseUrl + "DL Lam Thao/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "DL Lam Thao/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("DL Phu Ninh");
        type.Url = BaseUrl + "DL Phu Ninh/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "DL Phu Ninh/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("DL Tam Nong");
        type.Url = BaseUrl + "DL Tam Nong/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "DL Tam Nong/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("DL Tan Son");
        type.Url = BaseUrl + "DL Tan Son/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "DL Tan Son/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("DL Thanh Son");
        type.Url = BaseUrl + "DL Thanh Son/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "DL Thanh Son/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("DL Thanh Thuy");
        type.Url = BaseUrl + "DL Thanh Thuy/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "DL Thanh Thuy/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("DL Thanh Ba");
        type.Url = BaseUrl + "DL Thanh Ba/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "DL Thanh Ba/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("DL TX Phu Tho");
        type.Url = BaseUrl + "DL TX Phu Tho/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "DL TX Phu Tho/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("DL Viet Tri");
        type.Url = BaseUrl + "DL Viet Tri/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "DL Viet Tri/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("DL Yen Lap");
        type.Url = BaseUrl + "DL Yen Lap/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "DL Yen Lap/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("Phong CNTT");
        type.Url = BaseUrl + "Phong CNTT/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "Phong CNTT/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("Phong Dieu Do");
        type.Url = BaseUrl + "Phong Dieu Do/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "Phong Dieu Do/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("Phong KH VT");
        type.Url = BaseUrl + "Phong KH VT/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "Phong KH VT/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("Phong Kinh Doanh");
        type.Url = BaseUrl + "Phong Kinh Doanh/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "Phong Kinh Doanh/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("Phong KTGS MBD");
        type.Url = BaseUrl + "Phong KTGS MBD/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "Phong KTGS MBD/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("Phong Ky Thuat");
        type.Url = BaseUrl + "Phong Ky Thuat/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "Phong Ky Thuat/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("Phong QLDT");
        type.Url = BaseUrl + "Phong QLDT/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "Phong QLDT/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("Phong TCCB");
        type.Url = BaseUrl + "Phong TCCB/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "Phong TCCB/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("Phong TTPC");
        type.Url = BaseUrl + "Phong TTPC/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "Phong TTPC/";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("Huong Dan");
        type.Url = BaseUrl + "Huong Dan/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "Huong Dan";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("Van Phong");
        type.Url = BaseUrl + "Van Phong/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "Van Phong";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("Phong TCKT");
        type.Url = BaseUrl + "Phong TCKT/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "Phong TCKT";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("Phong An Toan");
        type.Url = BaseUrl + "Phong An Toan/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "Phong An Toan";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("Ban QLDA");
        type.Url = BaseUrl + "Ban QLDA/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "Ban QLDA";
        type.MaxSize = 104857600; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };

        type = ResourceType.Add("XNDV");
        type.Url = BaseUrl + "XNDV/";
        type.Dir = BaseDir == "" ? "" : BaseDir + "XNDV";
        type.MaxSize = 1048576000; //100Mb
        type.AllowedExtensions = new string[] { "7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip" };
        type.DeniedExtensions = new string[] { };
	}

</script>
