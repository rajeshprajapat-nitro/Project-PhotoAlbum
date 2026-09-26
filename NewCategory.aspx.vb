Imports System.Data.SqlClient
Imports System.Data

Partial Class NewCategory
    Inherits System.Web.UI.Page

    Protected Sub btnNewCategory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNewCategory.Click
        Try
            addNewCategory(txtCategoryTitle.Text.Trim(), txtCategoryDescription.Text.Trim())
            lblNewCatMessage.Visible = True
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

#Region "Data Layer"
    Private Sub addNewCategory(ByVal strTitle As String, ByVal strDescription As String)
        '   Variables declaration
        Dim strConnString As String = System.Configuration.ConfigurationManager.ConnectionStrings.Item("ConnectionString").ToString()
        Dim sqlConn As New SqlConnection(strConnString)
        Dim sqlcmd As New SqlCommand()

        '   Building the query
        Dim sqlQuery_Category As String = "INSERT INTO [Category] VALUES ('{0}', '{1}')"

        sqlQuery_Category = sqlQuery_Category.Replace("{0}", strTitle)
        sqlQuery_Category = sqlQuery_Category.Replace("{1}", strDescription)

        '   Retrieving search result
        sqlConn.Open()
        sqlcmd.Connection = sqlConn

        '   Adding records to table
        sqlcmd.CommandText = sqlQuery_Category
        sqlcmd.ExecuteNonQuery()

        sqlConn.Close()
    End Sub

#End Region
End Class
