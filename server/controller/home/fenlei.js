module.exports = {
    fenlei: (ctx) => {
        $id = I('get.id');
        $m =M('fenlei');
        $fenleiInfo = $m ->where("id ={$id}")->find();
        $this ->assign("fenleiInfo",$fenleiInfo);
        $article = D("article");
        $count      = $article->where("fid = '%s' AND status = 0",$id)->count();//
        $Page       = new \Think\Page($count,10);
        $show       = $Page->show();//
        $articleList = $article->where("fid = '%s' AND status = 0",$id)->relation(true)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign("articleList",$articleList);
        $this->assign('page',$show);
        $this->display();
    },
};

