<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<jsp:include page="/page/tool/top.jsp"></jsp:include>
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-lg-3">
            <div class="ibox ">
                <div class="ibox-content">
                    <div class="file-manager">
                        <h5>Show:</h5>
                        <a href="#" class="file-control active">全部</a>
                        <a href="#" class="file-control">文件</a>
                        <a href="#" class="file-control">音频</a>
                        <a href="#" class="file-control">图片</a>
                        <div class="hr-line-dashed"></div>
                        <button class="btn btn-primary btn-block">上传文件</button>
                        <div class="hr-line-dashed"></div>
                        <h5>文件夹</h5>
                        <ul class="folder-list" style="padding: 0">
                            <li><a href=""><i class="fa fa-folder"></i> 文档</a></li>
                            <li><a href=""><i class="fa fa-folder"></i> 图片</a></li>
                            <li><a href=""><i class="fa fa-folder"></i> 网页</a></li>
                            <li><a href=""><i class="fa fa-folder"></i> 插图</a></li>
                            <li><a href=""><i class="fa fa-folder"></i> 电影</a></li>
                            <li><a href=""><i class="fa fa-folder"></i> 图书</a></li>
                        </ul>
                        <h5 class="tag-title">标签</h5>
                        <ul class="tag-list" style="padding: 0">
                            <li><a href="">家庭</a></li>
                            <li><a href="">工作</a></li>
                            <li><a href="">房子</a></li>
                            <li><a href="">孩子</a></li>
                            <li><a href="">假期</a></li>
                            <li><a href="">音乐</a></li>
                            <li><a href="">摄影</a></li>
                            <li><a href="">电影</a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-9 animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="icon">
                                    <i class="fa fa-file"></i>
                                </div>
                                <div class="file-name">
                                    Document_2014.doc
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>
                        </div>

                    </div>
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="image">
                                    <img alt="image" class="img-fluid" src="img/p1.jpg">
                                </div>
                                <div class="file-name">
                                    Italy street.jpg
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>

                        </div>
                    </div>
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="image">
                                    <img alt="image" class="img-fluid" src="img/p2.jpg">
                                </div>
                                <div class="file-name">
                                    My feel.png
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="icon">
                                    <i class="fa fa-music"></i>
                                </div>
                                <div class="file-name">
                                    Michal Jackson.mp3
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="image">
                                    <img alt="image" class="img-fluid" src="img/p3.jpg">
                                </div>
                                <div class="file-name">
                                    Document_2014.doc
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="icon">
                                    <i class="img-fluid fa fa-film"></i>
                                </div>
                                <div class="file-name">
                                    Monica's birthday.mpg4
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="file-box">
                        <a href="#">
                            <div class="file">
                                <span class="corner"></span>

                                <div class="icon">
                                    <i class="fa fa-bar-chart-o"></i>
                                </div>
                                <div class="file-name">
                                    Annual report 2014.xls
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="icon">
                                    <i class="fa fa-file"></i>
                                </div>
                                <div class="file-name">
                                    Document_2014.doc
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>
                        </div>

                    </div>
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="image">
                                    <img alt="image" class="img-fluid" src="img/p1.jpg">
                                </div>
                                <div class="file-name">
                                    Italy street.jpg
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>

                        </div>
                    </div>
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="image">
                                    <img alt="image" class="img-fluid" src="img/p2.jpg">
                                </div>
                                <div class="file-name">
                                    My feel.png
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="icon">
                                    <i class="fa fa-music"></i>
                                </div>
                                <div class="file-name">
                                    Michal Jackson.mp3
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="image">
                                    <img alt="image" class="img-fluid" src="img/p3.jpg">
                                </div>
                                <div class="file-name">
                                    Document_2014.doc
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="icon">
                                    <i class="img-fluid fa fa-film"></i>
                                </div>
                                <div class="file-name">
                                    Monica's birthday.mpg4
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="file-box">
                        <a href="#">
                            <div class="file">
                                <span class="corner"></span>

                                <div class="icon">
                                    <i class="fa fa-bar-chart-o"></i>
                                </div>
                                <div class="file-name">
                                    Annual report 2014.xls
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="icon">
                                    <i class="fa fa-file"></i>
                                </div>
                                <div class="file-name">
                                    Document_2014.doc
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>
                        </div>

                    </div>
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="image">
                                    <img alt="image" class="img-fluid" src="img/p1.jpg">
                                </div>
                                <div class="file-name">
                                    Italy street.jpg
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>

                        </div>
                    </div>
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="image">
                                    <img alt="image" class="img-fluid" src="img/p2.jpg">
                                </div>
                                <div class="file-name">
                                    My feel.png
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="icon">
                                    <i class="fa fa-music"></i>
                                </div>
                                <div class="file-name">
                                    Michal Jackson.mp3
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="image">
                                    <img alt="image" class="img-fluid" src="img/p3.jpg">
                                </div>
                                <div class="file-name">
                                    Document_2014.doc
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="icon">
                                    <i class="img-fluid fa fa-film"></i>
                                </div>
                                <div class="file-name">
                                    Monica's birthday.mpg4
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="file-box">
                        <a href="#">
                            <div class="file">
                                <span class="corner"></span>

                                <div class="icon">
                                    <i class="fa fa-bar-chart-o"></i>
                                </div>
                                <div class="file-name">
                                    Annual report 2014.xls
                                    <br/>
                                    <small>添加: 2017年12月12日</small>
                                </div>
                            </div>
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/page/tool/footer.jsp"></jsp:include>
