hexo clean && hexo g
cp -r public/* ../wudizhangzhi.github.io/
cd ../wudizhangzhi.github.io/
git add *
today=`date`
git commit -m "$today" 
git push origin master


