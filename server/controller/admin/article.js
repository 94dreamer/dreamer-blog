module.exports = {
    addArticle:(ctx)=>{
        if($_SESSION['muser']==null || $_SESSION['muser']== ''){
            $this->error("非法操作",U('Index/index'));
        }else{
            $m=M("fenlei");
            $arr = $m->where("fid != 0")->select();
            // $arr2 = $m->where("fid != 0")->select();
            $this->assign("arr",$arr);
            // $this->assign("arr2",$arr2);
            $this->display();
        }
    },
    doAddArticle:(ctx)=>{
        if($_SESSION['muser']==null || $_SESSION['muser']== ''){
            $this->error("非法操作",U('Index/index'));
        }else{
            $m=M("article");
            $data = $m->create();
            $data['uid']= $_SESSION['mid'];
            $data['ctime']=time();
            $data['edittime']=time();
            $data['view']=1;
            if($this->SiteInfo['articlesatus'] ==1){
                $data['status']=1;
            }else{
                $data['status']=0;
            }
            $data['content'] = $_POST['content'];
            //判断文章类型
            $mm = M("fenlei");
            $fidInfo = $mm->where("id={$data['fid']}")->find();
            if($fidInfo['type']==2){
                $upload = new \Think\Upload();// 实例化上传类
                $upload->maxSize   =     20971520 ;// 设置附件上传大小
                $upload->exts      =     array('mp3', 'wam', 'wma', 'aac','mod','cd');// 设置附件上传类型
                $upload->rootPath  =      './Public/Uploads/'; // 设置附件上传目录    // 上传文件
                $info   =   $upload->uploadOne($_FILES['mp3']);
                if(!$info) {// 上传错误提示错误信息
                    $this->error($upload->getError());
                }else{
                    $data['mp3']=$info['savepath'].$info['savename'];
                }
            }elseif ($fidInfo['type']==4) {
                //原来是两张图片，现在取消了
            }
                $upload = new \Think\Upload();// 实例化上传类
                $upload->maxSize   =     3145728 ;// 设置附件上传大小
                $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
                $upload->rootPath  =      './Public/Uploads/'; // 设置附件上传目录    // 上传文件
                $info   =   $upload->uploadOne($_FILES['pic']);
                if(!$info) {// 上传错误提示错误信息
                    $this->error($upload->getError());
                }else{// 上传成功
                    $data['pic']=$info['savepath'].$info['savename'];

                    $result = $m->add($data);
                    if($result>0){
                        if(!$this->email_set['send_article_set']){
                            $m = M('email_type');
                            $info= $m->find(1);
                            $url = "http://".$_SERVER['SERVER_NAME'].__MODULE__."/Article/index/id/".$result;
                            $info['send_article_content'] = $info['send_article_content']."<br/>发表文章标题：<a href = '".$url."' target = '_blank'>{$_POST['title']}</a>";
                            $this->MySmtp($this->admin_email,$info['send_article_title'],$info['send_article_content']);
                        }
                        $this->success("发布成功！");
                    }else{
                        $this->error("发布失败！");
                    }
                }
            }
    },
    updateArticle:(ctx){
        $id = $_GET['id'];
        if(empty($id)){
            $this->error("非法操作");
        }else{
            $m =M("article");
            $uid = $_SESSION['mid'];
            $m = M("article");
            $articleInfo = $m->find($id);
            if($articleInfo == null || $articleInfo['uid'] != $uid){
                $this->error("再见了！");
            }else{
                $m=M("fenlei");
                $arr = $m->where("fid != 0")->select();
                $this->assign("arr2",$arr);
                $this->assign("arr",$articleInfo);
                $this->display();
            }
        }
    },
    doUpdateArticle(){
        $id = $_GET['id'];
        $uid = $_SESSION['mid'];
        $m = M("article");
        $articleInfo = $m->find($id);
        if(empty($id) || $articleInfo == null || $articleInfo['uid'] != $uid){
            $this->error("坐飞机了");
        }else{
            $data = $m->create();
            $data['edittime']=time();
            if($fidInfo['type']==2 && $_FILES['mp3']['name'] != ''){
            $upload = new \Think\Upload();// 实例化上传类
            $upload->maxSize   =     20971520 ;// 设置附件上传大小
            $upload->exts      =     array('mp3', 'wam', 'wma', 'aac','mod','cd');// 设置附件上传类型
            $upload->rootPath  =      './Public/Uploads/'; // 设置附件上传目录    // 上传文件
            $info   =   $upload->uploadOne($_FILES['mp3']);
            if(!$info) {// 上传错误提示错误信息
                $this->error($upload->getError());
            }else{
                $data['mp3']=$info['savepath'].$info['savename'];
            }
        }elseif($fidInfo['type']==2 && $_FILES['mp3']['name'] == ''){
            unset($data['mp3']);
        }
        if($_FILES['pic']['name'] != ''){
            $upload = new \Think\Upload();// 实例化上传类
            $upload->maxSize   =     3145728 ;// 设置附件上传大小
            $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
            $upload->rootPath  =      './Public/Uploads/'; // 设置附件上传目录    // 上传文件
            $info   =   $upload->uploadOne($_FILES['pic']);
            if(!$info) {// 上传错误提示错误信息
                $this->error($upload->getError());
            }else{// 上传成功
                $data['pic']=$info['savepath'].$info['savename'];
            }
        }else{
            unset($data['pic']);
        }
        $data['content'] = $_POST['content'];
        $result = $m->where("id = {$id}")->save($data);
        if($result == false){
            $this->error("更新失败！");
        }else{
            $this->success("更新成功！");
        }
        }
    },
    myArticle:()=>{
        if($_SESSION['muser']==null || $_SESSION['muser']== ''){
            $this->error("非法操作",U('Index/index'));
        }
        $uid = $_SESSION['mid'];
        $m = M("article");
        $count      = $m->where("uid = {$uid} AND status = 0")->count();//
        $Page       = new \Think\Page($count,10);//
        $show       = $Page->show();//
        $articleList = $m->where("uid = {$uid} AND status = 0")->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('page',$show);// 赋值分页输出
        $this->assign("articleList",$articleList);
        $this->display();
    },
    delArticle:(ctx)=>{
        if($_SESSION['muser']==null || $_SESSION['muser']== ''){
            $this->error("非法操作",U('Index/index'));
        }
        $uid = $_SESSION['mid'];
        $id = $_GET['id'];
        $m = M("article");
        $articleInfo= $m->where("id = {$id}")->find();
        if($articleInfo['uid'] != $uid){
            $this->error("非法操作",U('Index/index'));
        }else{
            $result = $m->where("id = {$id}")->setField('status',1);
            if($result>0){
                $this->success("删除成功！");
            }else{
                $this->error("删除失败！");
            }
        }
    },
};

