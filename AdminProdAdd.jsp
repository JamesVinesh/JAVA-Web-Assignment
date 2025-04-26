<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Product Add</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Titillium Web", sans-serif;
            list-style: none;
            text-decoration: none;
        }

        body {
            background: grey !important;
            padding: 30px;
        }

        h1 {
            text-align: center;
            margin-top: 30px;
            margin-bottom: 20px;
        }

        .container {
            background: #fff;
            padding: 25px;
            max-width: 600px;
            margin: 0 auto;
            margin-top: 50px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }

        input[type=text], select, textarea {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .subbtn, .resetbtn {
            width: 48%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .resetbtn {
            background-color: #f44336;
            float: right;
        }
        
        textarea {
            resize: none;
        }   
        
        .image {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
    </style>
</head>

<body>
    <jsp:include page="header/header.jsp" />
    
    <div class="container">
        <h1>Add Product</h1>
        <form action="AdminProdAdd" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Admin ID:</td>
                    <td><input type="text" name="adminID" placeholder="Admin id... " required /></td>
                </tr>
                <tr>
                    <td>Category:</td>
                    <td>
                        <select name="category" required>
                            <option>Refrigerator</option>
                            <option>Air Conditional</option>
                            <option>Rice Cooker</option>
                            <option>Washing Machine</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Product Name:</td>
                    <td><input type="text" name="prodName" placeholder="Product name..." required /></td>
                </tr>
                <tr>
                    <td>Product Price:</td>
                    <td><input type="text" name="prodPrice" placeholder="Product price..." required /></td>
                </tr>
                <tr>
                    <td>Product Description:</td>
                    <td><textarea name="prodDesc" placeholder="Product description..." required ></textarea></td>
                </tr>
                <tr>
                    <td>Stock:</td>
                    <td><input type="text" name="stock" placeholder="Stock..." required /></td>
                </tr>
                
                    <tr>
                        <td>Product Image:</td>
                        <td><input type="file" name="prodIm" accept="image/*" class="image" required /></td>
                   
                    </tr>
                
                
            </table>
            <input type="submit" class="subbtn" value="Submit" />
            <input type="reset" class="resetbtn" value="Reset" />
        </form>
    </div>
</body>
</html>
