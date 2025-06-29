<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Table1.aspx.cs" Inherits="CTR_Table.Category.Table1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Table</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            text-align: center;
        }

        .button {
            background-color: #4ab7dc; /* لون أزرق */
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

            .button:hover {
                background-color: #0056b3; /* لون أزرق غامق عند التحويل */
                transform: translateY(-2px);
                box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
            }

            .button:active {
                transform: translateY(1px);
                box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
            }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #4ab7dc;
            font-weight: bold;
            color: white;
        }

        /* تثبيت رأس الجدول */
        .table-container {
            max-height: auto; /* تحديد ارتفاع الجدول */
            overflow-y: auto; /* السماح بالتمرير العمودي */
            position: relative; /* مهم لتثبيت الرأس */
        }
        /* تثبيت رأس الجدول */
        table thead tr {
            position: sticky;
            top: 0;
            background-color: #4ab7dc; /* لون ثابت عند التمرير */
            z-index: 10;
        }
    .sticky-column {
        position : -webkit-sticky;
        position: sticky;
        left : 0;
        background-color: #4ab7dc;
        z-index: 1;
        box-shadow: 2px 0px 5px rgba(0,0,0,0.1);
        color : white;
    }
    </style>
</head>
<body>

    <form id="form1" runat="server">


        <h2>Data Table</h2>
        <div style="max-height: 600px; overflow-y: auto;" class="table-container">
            <table>
                <thead>
                    <tr>
                        <th class="sticky-column">No.</th>
                        <th>Category</th>
                        <th>Subcategory</th>
                        <th>BrandProductLine</th>
                        <th>Size</th>
                        <th>SKUDescription</th>
                        <th>Shelf Price</th>
                        <th>GrossValue</th>
                        <th>Discount</th>
                        <th>Rebate</th>
                        <th>Total Discount</th>
                        <th>%NS</th>
                        <th>Net Sales</th>
                        <th>Input</th>
                        <th>Calculated Value</th>
                        <th>RM</th>
                        <th>PM</th>
                        <th>Input</th>
                        <th>Calculated Value</th>
                        <th>Total Prime Cost</th>
                        <th>%NS</th>
                        <th>Conversion Variable</th>
                        <th>Input</th>
                        <th>Calculated Value</th>
                        <th>Conversion Fixed</th>
                        <th>Conversion Total</th>
                        <th>%NS</th>
                        <th>SC</th>
                        <th>COGS</th>
                        <th>%NS</th>
                        <th>Input</th>
                        <th>Calculated Value</th>
                        <th>GPC</th>
                        <th>%NS</th>
                        <th>A&P</th>
                        <th>NPC</th>
                        <th>%NS</th>
                        <th>S&D</th>
                        <th>%ns(S&D)</th>
                        <th>G&A</th>
                        <th>%NS</th>
                        <th>EBIT</th>
                        <th>%ns(EBIT)</th>
                        <th>Save</th>
                    </tr>
                </thead>


                <tbody>
                    <asp:Label ID="NoDataResultDeatils" runat="server" Visible="False">
<tr>
<td colspan="12">NO DATA FOUND</td>
</tr>
</asp:Label>
                    <asp:Repeater ID="ViewDataRepeater" runat="server" OnItemDataBound="ViewDataRepeater_ItemDataBound">
                        <ItemTemplate>
                            <tr>
                                <td class="sticky-column">
                                    <asp:Label ID="id" runat="server" Text='<%# Eval("id") %>' /></td>
                                <td>
                                    <asp:Label ID="Category" runat="server" Text='<%# Eval("Category") %>' /></td>
                                <td>
                                    <asp:Label ID="Subcategory" runat="server" Text='<%# Eval("Subcategory") %>' /></td>
                                <td>
                                    <asp:Label ID="BrandProductLine" runat="server" Text='<%# Eval("BrandProductLine") %>' /></td>
                                <td>
                                    <asp:Label ID="Size" runat="server" Text='<%# Eval("Size") %>' /></td>
                                <td>
                                    <asp:Label ID="SKUDescription" runat="server" Text='<%# Eval("SKUDescription") %>' /></td>
                                <td>
                                    <asp:Label ID="ShelfPrice" runat="server" Text='<%# Eval("[Shelf Price]") %>' /></td>
                                <td>
                                    <asp:Label ID="GrossValue" runat="server" Text='<%# Eval("GrossValue") %>' /></td>
                                <td>
                                    <asp:Label ID="Discount" runat="server" Text='<%# Eval("Discount") %>' /></td>
                                <td>
                                    <asp:Label ID="Rebate" runat="server" Text='<%# Eval("Rebate") %>' /></td>
                                <td>
                                    <asp:Label ID="TotalDiscount" runat="server" Text='<%# Eval("[Total Discount]") %>' /></td>
                                <td>
                                    <asp:Label ID="NS" runat="server" Text='<%# Eval("[% NS]") %>' /></td>
                                <td>
                                    <asp:Label ID="NetSales" runat="server" Text='<%# Eval("[Net Sales]") %>' /></td>
                                <td>
                                    <asp:TextBox ID="userinput" runat="server" Visible="false"></asp:TextBox>
                                    <asp:Label ID="Input1" runat="server" Text='<%# Eval("Input_1") %>' Visible="false"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="CalculatedValue1" runat="server" Text='<%# Eval("[Calculated Value1]") %>' /></td>
                                <td>
                                    <asp:Label ID="RM" runat="server" Text='<%# Eval("RM") %>' /></td>
                                <td>
                                    <asp:Label ID="PM" runat="server" Text='<%# Eval("PM") %>' /></td>
                                <td>
                                    <asp:TextBox ID="userinput2" runat="server" Visible="true" btnID='<%# Eval("Input_2") %>'></asp:TextBox>
                                    <asp:Label ID="Input2" runat="server" Text='<%# Eval("Input_2") %>' Visible="false"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="CalculatedValue2" runat="server" Text='<%# Eval("[Calculated Value2]") %>' /></td>
                                <td>
                                    <asp:Label ID="TotalPrimeCost" runat="server" Text='<%# Eval("[Total Prime Cost]") %>' /></td>
                                <td>
                                    <asp:Label ID="NS1" runat="server" Text='<%# Eval("[% NS1]") %>' /></td>
                                <td>
                                    <asp:Label ID="ConversionVariable" runat="server" Text='<%# Eval("[Conversion Variable]") %>' /></td>
                                <td>
                                    <asp:TextBox ID="userinput3" runat="server" Visible="true" btnID='<%# Eval("Input_3") %>'></asp:TextBox>
                                    <asp:Label ID="Input3" runat="server" Text='<%# Eval("Input_3") %>' Visible="false"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="CalculatedValue3" runat="server" Text='<%# Eval("[Calculated Value3]") %>' /></td>
                                <td>
                                    <asp:Label ID="ConversionFixed" runat="server" Text='<%# Eval("[Conversion Fixed]") %>' /></td>
                                <td>
                                    <asp:Label ID="ConversionTotal" runat="server" Text='<%# Eval("ConversionTotal") %>' /></td>
                                <td>
                                    <asp:Label ID="NS2" runat="server" Text='<%# Eval("[% NS2]") %>' /></td>
                                <td>
                                    <asp:Label ID="SC" runat="server" Text='<%# Eval("SC") %>' /></td>
                                <td>
                                    <asp:Label ID="COGS" runat="server" Text='<%# Eval("COGS") %>' /></td>
                                <td>
                                    <asp:Label ID="NS3" runat="server" Text='<%# Eval("[% NS3]") %>' /></td>
                                <td>
                                    <asp:TextBox ID="userinput4" runat="server" Visible="true" btnID='<%# Eval("Input_4") %>'></asp:TextBox>
                                    <asp:Label ID="Input4" runat="server" Text='<%# Eval("Input_4") %>' Visible="false"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="CalculatedValue4" runat="server" ReadOnly="true" Text='<%# Eval("[Calculated Value4]") %>' /></td>
                                <td>
                                    <asp:Label ID="GPC" runat="server" Text='<%# Eval("GPC") %>' /></td>
                                <td>
                                    <asp:Label ID="NS4" runat="server" Text='<%# Eval("[% NS4]") %>' /></td>
                                <td>
                                    <asp:Label ID="AP" runat="server" Text='<%# Eval("[A&P]") %>' /></td>
                                <td>
                                    <asp:Label ID="NPC" runat="server" Text='<%# Eval("NPC") %>' /></td>
                                <td>
                                    <asp:Label ID="NS5" runat="server" Text='<%# Eval("[% NS5]") %>' /></td>
                                <td>
                                    <asp:Label ID="SD" runat="server" Text='<%# Eval("[S&D]") %>' /></td>
                                <td>
                                    <asp:Label ID="ns_S_D" runat="server" Text='<%# Eval("ns_S_D") %>' /></td>
                                <td>
                                    <asp:Label ID="GA" runat="server" Text='<%# Eval("[G&A]") %>' /></td>
                                <td>
                                    <asp:Label ID="NS6" runat="server" Text='<%# Eval("[% NS6]") %>' /></td>
                                <td>
                                    <asp:Label ID="EBIT" runat="server" Text='<%# Eval("EBIT") %>' /></td>
                                <td>
                                    <asp:Label ID="ns_EBIT" runat="server" Text='<%# Eval("ns_EBIT") %>' /></td>
                         
                                <td id="Saved" runat="server">
                                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="button" btnID1='<%# Eval("id") %>' OnClick="Save" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>

