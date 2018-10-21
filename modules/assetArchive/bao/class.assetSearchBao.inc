<!--Search specific project-->
<?php
include_once UTILITY.'class.util.inc';
include_once MODULE_PROJECT.'dao/class.assetSearchDao.inc';
include_once MODULE_PROJECT.'dao/class.assetDao.inc';

/*
    User Business Object
*/
Class SearchAssetBao
{

    private $_SearchAssetDao;

    public function __construct()
    {
        $this->_SearchAssetDao=new SearchAssetDao();
    }

    //get searched asset
    public function getSearchedAsset(){
        $Result=$this->_SearchAssetDao->getSearchedAsset();

        if(!$Result->getIsSuccess()){
            $Result->setResultObject("Database failure in SearchAssetBao.getSearchedAsset()");
        }
        return $Result;
    }

    //get all asset types
    public function getAllAssetType(){
        $Result=$this->_SearchAssetDao->getAllAssetType();
        if (!$Result->getIsSuccess()){
            $Result->setResultObject("Database failure in SearchAssetBao.getAllAssetType()");
        }
    }
    

?>
