<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
    <!-- ������ �ֻ�� �� �� -->
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>������������</title>
        <link href="../resources/css/admin/styles.css" rel="stylesheet" type="text/css"/> <!-- css���� import -->
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>

    <!-- ������ ���� �κ� -->
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- ��� ���� -->
            <a class="navbar-brand" href="../admin.jsp">������ ������</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"></button>
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
            </form>
            <!-- ȸ�� ������ ��Ӵٿ� �޴� -->
            <ul class="navbar-nav ml-auto ml-md-0"> 
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    
                    <!-- ���������� �̵� -->
                        <a class="dropdown-item" href="../all/homepage.do">���� ������ �̵�</a> 
                        <div class="dropdown-divider"></div>
                    <!-- ����ȭ�� �α���â���� �̵� -->
                    <a class="dropdown-item" href="#">�α� �ƿ�</a>
                    </div>
                </li>
            </ul>
        </nav>
        
        <!-- ���� �޴� -->
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading"><h4>�޴�</h4></div>  
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>ȸ������
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion" style="">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="./userlist.do">ȸ�����</a>
                                    <a class="nav-link" href="./withdrawal.do">Ż��ȸ�����</a> 
                                    <a class="nav-link" href="./blacklist.do">������Ʈ���</a>
                                    <a class="nav-link" href="./createAdmin.do">�����ڻ���</a>
                                    <a class="nav-link" href="./adminlist.do">�����ڸ��</a>  
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseone" aria-expanded="false" aria-controls="collapseAdd">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>������Ȳ
                            </a>
                            <div class="collapse" id="collapseone" aria-labelledby="headingOne" data-parent="#sidenavAccordion" style="">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="./dailycoin.do">�Ϻ���������</a>
                                    <a class="nav-link" href="./monthlycoin.do">������������</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsetwo" aria-expanded="false" aria-controls="collapseAdd">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>�湮��Ȳ
                            </a>
                            <div class="collapse" id="collapsetwo" aria-labelledby="headingOne" data-parent="#sidenavAccordion" style="">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="./dailysales.do">���Ϲ湮��Ȳ</a>
                                    <a class="nav-link" href="./monthlysales.do">�����湮����</a>
                                </nav>
                            </div>
                            
                             <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsethree" aria-expanded="false" aria-controls="collapseAdd">
                             <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>�Խñ۰���
                             </a>
                             <div class="collapse" id="collapsethree" aria-labelledby="headingOne" data-parent="#sidenavAccordion" style="">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="./salesarticlelist.do">�Ǹű�</a>
                                    <a class="nav-link" href="./userinquiry.do">������</a> 
                                    <a class="nav-link" href="./carnews.do">�ڵ�������</a>
                                    <a class="nav-link" href="./purchasereview.do">�����ı�</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
            
            <!-- ��ú��� ���� -->
            <div id="layoutSidenav_content">
                    <div class="container-fluid">
                        <h2 class="mt-4">�����ı���</h2>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                              	�����ı�
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    
                                        <!-- ���� ������ ���� -->
                                        <thead>
                                            <tr>  
                                                <th width="70px">�۹�ȣ</th>      
                                                <th width="140px">�Ǹ��ڹ�ȣ</th>   
                                                <th width="140px">�����ھ��̵�</th>     
                                                <th width="70px">����</th>
                                                <th width="70px">����</th>   
                                                <th width="200px">����</th>     
                                                <th>����</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>�۹�ȣ1</td>
                                                <td>�Ǹ��ڹ�ȣ1</td>
                                                <td>�����ھ��̵�1</td>
                                                <td>����1</td>
                                                <td>���Ű���1</td>
                                                <td>�Ǹ�������1</td>
                                                <td>����</td>
                                            </tr>
                                            <tr>
                                                <td>�۹�ȣ2</td>
                                                <td>�Ǹ��ڹ�ȣ2</td>
                                                <td>�����ھ��̵�2</td>
                                                <td>����2</td>
                                                <td>���Ű���2</td>
                                                <td>�Ǹ�������2</td>
                                                <td>����2</td> 
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                <!-- ���ϴ� footer -->
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; ������</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        
        <!-- javascript ���� import -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/admin/chart-area-demo.js"></script>
        <script src="../resources/js/admin/chart-bar-demo.js"></script>
        <script src="../resources/js/admin/chart-area-sell.js"></script>
        <script src="../resources/js/admin/chart-bar-sell.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/admin/datatables-demo.js"></script>
    </body>
</html>
