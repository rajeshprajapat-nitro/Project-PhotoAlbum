Imports System.io
Imports System.Data
Imports System.Data.SqlClient

Partial Class UploadPhoto
    Inherits System.Web.UI.Page

    Protected Sub btnAddToCategory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddToCategory.Click
        Try
            Dim strGuid As String = ""
            Dim strPicExtension As String = ""
            Dim strFileName As String = ""

            '   Firstly upload the picture associated with the news
            If PhotoUpload.HasFile Then
                '   Constructs the picture extension
                strGuid = fnGuid()
                strPicExtension = fnGetPictureExtension(PhotoUpload.FileName)
                strFileName = strGuid & strPicExtension

                '   Add picture to folder
                subAddNewPicture(PhotoUpload, strFileName, "Gallery")

                '   Add the record to the database
                UpdateGallery(cmbCategory.SelectedValue, strFileName, txtMemo.Text.Trim())

                lblUploadMessage.Text = "Image uploaded successfully..."
            Else
                lblUploadMessage.Text = "Please select appropriate image..."
            End If

            lblUploadMessage.Visible = True
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

#Region "DataLayer"
    Private Sub UpdateGallery(ByVal strCategoryValue As String, ByVal strFileName As String, ByVal strMemo As String)
        '   Variables declaration
        Dim strConnString As String = System.Configuration.ConfigurationManager.ConnectionStrings.Item("ConnectionString").ToString()
        Dim sqlConn As New SqlConnection(strConnString)
        Dim sqlcmd As New SqlCommand()

        '   Building the query
        Dim sqlQuery_Photo As String = "INSERT INTO [Photo] VALUES ('{0}', '{1}', '{2}')"

        sqlQuery_Photo = sqlQuery_Photo.Replace("{0}", strCategoryValue)
        sqlQuery_Photo = sqlQuery_Photo.Replace("{1}", strFileName)
        sqlQuery_Photo = sqlQuery_Photo.Replace("{2}", strMemo)

        '   Retrieving search result
        sqlConn.Open()
        sqlcmd.Connection = sqlConn

        '   Adding records to table
        sqlcmd.CommandText = sqlQuery_Photo
        sqlcmd.ExecuteNonQuery()

        sqlConn.Close()
    End Sub
#End Region

#Region "Private Functions"
    '   Adds picture to specified folder
    Private Sub subAddNewPicture(ByVal FileUploader As FileUpload, ByVal strPictureName As String, ByVal strImgFolder As String)
        Dim strImageFolderPath As String
        Dim strImagePath As String

        Try
            '   Construct saving path
            strImageFolderPath = Path.Combine(Request.PhysicalApplicationPath, strImgFolder)
            strImagePath = Path.Combine(strImageFolderPath, strPictureName)

            '   Upload image
            FileUploader.SaveAs(strImagePath)
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    '   Function to generate a GUID using current date and time
    Private Function fnGuid() As String
        Dim strGuid As String = ""

        Try
            With Today
                strGuid = .Year & .Month & .Day & Now.Hour & Now.Minute & Now.Second
            End With
        Catch ex As Exception
            Throw ex
        End Try

        '   returning the guid generated
        Return strGuid
    End Function

    '   Returns true if file name has the extension .jpg, .gif, .jpeg
    Private Function fnGetPictureExtension(ByVal strPictureName As String) As String
        Try
            With strPictureName.ToUpper
                If .EndsWith(".JPG") Then
                    Return ".JPG"
                ElseIf .EndsWith(".GIF") Then
                    Return ".GIF"
                ElseIf .EndsWith(".JPEG") Then
                    Return ".JPEG"
                End If
            End With
        Catch ex As Exception
            Throw ex
        End Try

        ' Else if has no extension so it returns ""
        Return ""
    End Function
#End Region
End Class
