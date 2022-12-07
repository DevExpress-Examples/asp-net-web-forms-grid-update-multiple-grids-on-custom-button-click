Imports Microsoft.VisualBasic
Imports DevExpress.Web
Imports DevExpress.Web.Data
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub gv1_RowUpdating(ByVal sender As Object, ByVal e As ASPxDataUpdatingEventArgs)
		Dim categoryName As String = e.NewValues("CategoryName").ToString()

		' Remove this block to allow editing
		Dim gv As ASPxGridView = TryCast(sender, ASPxGridView)
		e.Cancel = True
		gv.CancelEdit()
	End Sub

	Protected Sub gv2_RowUpdating(ByVal sender As Object, ByVal e As ASPxDataUpdatingEventArgs)
		Dim categoryName As String = e.NewValues("ProductName").ToString()

		' Remove this block to allow editing
		Dim gv As ASPxGridView = TryCast(sender, ASPxGridView)
		e.Cancel = True
		gv.CancelEdit()
	End Sub

	Protected Sub cp_Callback(ByVal sender As Object, ByVal e As CallbackEventArgsBase)
		Select Case e.Parameter
			Case "Update"
				gv1.UpdateEdit()
				gv2.UpdateEdit()
			Case "Cancel"
				gv1.CancelEdit()
				gv2.CancelEdit()
		End Select
	End Sub

	Protected Sub gv_CommandButtonInitialize(ByVal sender As Object, ByVal e As ASPxGridViewCommandButtonEventArgs)
		If e.ButtonType = ColumnCommandButtonType.Update OrElse e.ButtonType = ColumnCommandButtonType.Cancel Then
			e.Visible = False
		End If
	End Sub
End Class