using DevExpress.Web.ASPxClasses;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page {
    protected void gv1_RowUpdating(object sender, ASPxDataUpdatingEventArgs e) {
        string categoryName = e.NewValues["CategoryName"].ToString();

        // Remove this block to allow editing
        ASPxGridView gv = sender as ASPxGridView;
        e.Cancel = true;
        gv.CancelEdit();
    }

    protected void gv2_RowUpdating(object sender, ASPxDataUpdatingEventArgs e) {
        string categoryName = e.NewValues["ProductName"].ToString();

        // Remove this block to allow editing
        ASPxGridView gv = sender as ASPxGridView;
        e.Cancel = true;
        gv.CancelEdit();
    }

    protected void cp_Callback(object sender, CallbackEventArgsBase e) {
        switch (e.Parameter) {
            case "Update":
                gv1.UpdateEdit();
                gv2.UpdateEdit();
                break;
            case "Cancel":
                gv1.CancelEdit();
                gv2.CancelEdit();
                break;
        }
    }

    protected void gv_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e) {
        if (e.ButtonType == ColumnCommandButtonType.Update || e.ButtonType == ColumnCommandButtonType.Cancel)
            e.Visible = false;
    }
}