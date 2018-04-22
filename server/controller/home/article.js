module.exports = {
    articleList:()=>{
        $m = D("article");
        $count      = $m->where("status = 0")->count();
        $Page       = new \Think\Page($count,10);
        $show       = $Page->show();// 分页显示输出
        $list = $m->where("status = 0")->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->relation(true)->select();
        $this->assign("list",$list);
        $this->assign('page',$show);// 赋值分页输出
        $slides = M("slides");
        $slidesList = $slides->order("id desc")->select();
        $this->assign("slidesList",$slidesList);
        $this->assign("slidesLists",$slidesList);
        $this->display();
    },
    searchArtile:()=>{
        $keywords = $_GET['keywords'];
        $m=M("article");
        $where['title']  = array("like","%{$keywords}%");
        $arr = $m->where($where)->select();
        $count = $m->where($where)->count();
        $this->assign("count",$count);
        $this->assign("arr",$arr);
        $this->display();
    },
    article: async (ctx) => {
        $id = $_GET['id'];
        $m=M("article");
        $articleInfo = $m->where("id = {$id}")->find();
        if($articleInfo){
            $mm=D("user");
            $m->where("id = {$id}")->setInc('view',1);
            $userInfo = $mm->where("id = {$articleInfo['uid']}")->relation(true)->find();
            $mmm=M("fenlei");
            $fenleiInfo = $mmm->where("id = {$articleInfo['fid']}")->find();
            $articleCount = $m->where("uid = {$userInfo['id']} AND status = 0")->count();
            $zuixin = $m->where("uid = {$userInfo['id']} AND status = 0")->limit(5)->order("id desc")->select();
            $this->assign("zuixin",$zuixin);
            $this->assign("articleCount",$articleCount);
            $this->assign("articleInfo",$articleInfo);
            $this->assign("userInfo",$userInfo);
            $this->assign("fenleiInfo",$fenleiInfo);
            $this->display();
        }else{
            $this->show("<center><h1>你迷路了</h1></center>");
        }
    },
    replay:async(ctx)=>{    // 评论
        $recive= $_POST['content'];
        if(strstr($recive,"评") === false){
            $this->error("{$recive} 的首字需为 评 ");
            exit;
        }
        $aid = $_GET['id'];
        $m =M("comment");
        $data = $m->create();
        $data['aid'] = $aid;
        $data['ctime']=time();
        if($_SESSION['muser']!=null || $_SESSION['muser']!= ''){
            $data['uid'] = $_SESSION['mid'];
        }
        $result = $m->add($data);
        if($result>0){
            $mm = M("article");
            if(!$this->email_set['comment_set']){
                $m = M('email_type');
                $info= $m->find(1);
                $article= $mm->find($aid);
                $info['send_comment_content'] = $info['send_comment_content']."<br/>回复帖子标题：<a href = '".$_SERVER['HTTP_REFERER']."' target = '_blank'>{$article['title']}</a><br/>回复署名：{$_POST['name']}<br/>回复内容：{$_POST['content']}";
                $this->MySmtp($this->admin_email,$info['send_comment_title'],$info['send_comment_content']);
            }
            $this->success("回复成功！");
            $a=$mm->where("id = {$aid}")->setInc('Comment');
        }else{
            $this->error("回复失败！");
        }
    },
    getReplay:(ctx)=>{  //获取评论
        $id  = intval($_POST['id']);
        $num = intval($_POST['num']);
        $m = D("comment");
        $arr = $m->where("aid = {$id}")->limit($num,10)->relation(true)->select();
        if(!empty($arr)){
            $this->ajaxReturn($arr,'JSON');
        }else{
            echo 5;
            exit;
        }
    }
};

