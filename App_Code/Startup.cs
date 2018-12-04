using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BanHangDienTu.Startup))]
namespace BanHangDienTu
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
