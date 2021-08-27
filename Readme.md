<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128543303/13.2.5%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E4992)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# How to update multiple ASPxGridViews with one button and hide default update/cancel links
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e4992/)**
<!-- run online end -->


<p>It's possible to update multiple ASPxGridViews on the ASPxButton click. To achieve this, I suggest you implement the following:</p><p>- Wrap the ASPxGridView by ASPxCallbackPanel;</p><p>- Set the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxEditorsASPxButton_AutoPostBacktopic">ASPxButton.AutoPostBack</a> to false;</p><p>- Call the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxCallbackPanelScriptsASPxClientCallbackPanel_PerformCallbacktopic">ASPxClientCallbackPanel.PerformCallback</a> method in the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxEditorsScriptsASPxClientButton_Clicktopic">ASPxClientButton.Click</a> event handler;</p><p>- Use the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewASPxGridView_UpdateEdittopic">ASPxGridView.UpdateEdit</a> or the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewASPxGridView_CancelEdittopic">ASPxGridView.CancelEdit</a> to update the ASPxGridViews or cancel editing in the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxCallbackPanelASPxCallbackPanel_Callbacktopic">ASPxCallbackPanel.Callback</a> event handler.</p><br />
<p>To hide Update / Cancel buttons, use the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewASPxGridView_CommandButtonInitializetopic">ASPxGridView.CommandButtonInitialize</a> event:</p>

```cs
<newline/>
protected void gv_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e) {</para><para>   if (e.ButtonType == ColumnCommandButtonType.Update || e.ButtonType == ColumnCommandButtonType.Cancel)</para><para>       e.Visible = false;</para><para>}
```



<br/>


