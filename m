Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABFE5AE50C
	for <lists.virtualization@lfdr.de>; Tue,  6 Sep 2022 12:11:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BBA661081;
	Tue,  6 Sep 2022 10:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BBA661081
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LCJEJ2pC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mE_6Km2EWEeW; Tue,  6 Sep 2022 10:11:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 09DD961038;
	Tue,  6 Sep 2022 10:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09DD961038
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16FF1C007C;
	Tue,  6 Sep 2022 10:11:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FECEC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 10:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10D088186B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 10:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10D088186B
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=LCJEJ2pC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XVDopXV26uxL
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 10:11:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C902481865
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C902481865
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 10:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662459088; x=1693995088;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oB1TtPVVHc8wxkEfbkl6xSPnmmpiaRnJ3fakqY2gLXM=;
 b=LCJEJ2pCKAVSop9tO/yqXBxIAmZUVqoR86fTewmJ/Dyznf7McwA+v/xE
 wWvtTiNFGLEV50tVK1KhIhQ7JzBOfQkxfoUZkfNHami83dqOtQmEi7NpA
 33sx3dsdJepEp82DHdxSxi5dPpmoUgwrUfudLMddNnN+/UlN2VWHNTkt3
 Rl92cj417lbFGQOXWdeqB77pcPM6D71C/4EW0Kl0j4yaY9kcem5StCsuh
 26WPxA3tzJ2no5Vw5EuqRmyBqqHUsedY/B9YEk9dDO/J4hpoBXeZA+Kng
 XQ8hyEvpDPI8FsNGXicS2TKyJ3+3xDwZGBNUWbzl4FPObI365tS8SpwNv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="283550682"
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; d="scan'208";a="283550682"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 03:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; d="scan'208";a="565041316"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 06 Sep 2022 03:11:17 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oVVY4-0004zl-2N;
 Tue, 06 Sep 2022 10:11:16 +0000
Date: Tue, 6 Sep 2022 18:10:54 +0800
From: kernel test robot <lkp@intel.com>
To: Deming Wang <wangdeming@inspur.com>, vgoyal@redhat.com,
 stefanha@redhat.com, miklos@szeredi.hu
Subject: Re: [PATCH] virtiofs: Drop unnecessary initialization in
 send_forget_request and virtio_fs_get_tree
Message-ID: <202209061738.Epufa2eF-lkp@intel.com>
References: <20220906053848.2503-1-wangdeming@inspur.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906053848.2503-1-wangdeming@inspur.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev,
 Deming Wang <wangdeming@inspur.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-fsdevel@vger.kernel.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi Deming,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v6.0-rc4]
[also build test WARNING on linus/master next-20220901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Deming-Wang/virtiofs-Drop-unnecessary-initialization-in-send_forget_request-and-virtio_fs_get_tree/20220906-135058
base:    7e18e42e4b280c85b76967a9106a13ca61c16179
config: hexagon-randconfig-r035-20220906 (https://download.01.org/0day-ci/archive/20220906/202209061738.Epufa2eF-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a61f879fdb56490afddb6ddea4a9d57226f339f3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Deming-Wang/virtiofs-Drop-unnecessary-initialization-in-send_forget_request-and-virtio_fs_get_tree/20220906-135058
        git checkout a61f879fdb56490afddb6ddea4a9d57226f339f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/fuse/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/fuse/virtio_fs.c:422:2: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!fsvq->connected) {
           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:30: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/virtio_fs.c:465:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   fs/fuse/virtio_fs.c:422:2: note: remove the 'if' if its condition is always false
           if (!fsvq->connected) {
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/fuse/virtio_fs.c:417:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
>> fs/fuse/virtio_fs.c:1433:2: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (WARN_ON(virtqueue_size <= FUSE_HEADER_OVERHEAD))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:30: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/virtio_fs.c:1481:9: note: uninitialized use occurs here
           return err;
                  ^~~
   fs/fuse/virtio_fs.c:1433:2: note: remove the 'if' if its condition is always false
           if (WARN_ON(virtqueue_size <= FUSE_HEADER_OVERHEAD))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/fuse/virtio_fs.c:1420:9: note: initialize the variable 'err' to silence this warning
           int err;
                  ^
                   = 0
   2 warnings generated.


vim +422 fs/fuse/virtio_fs.c

a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  406  
58ada94f95f71d Vivek Goyal     2019-10-30  407  /*
58ada94f95f71d Vivek Goyal     2019-10-30  408   * Returns 1 if queue is full and sender should wait a bit before sending
58ada94f95f71d Vivek Goyal     2019-10-30  409   * next request, 0 otherwise.
58ada94f95f71d Vivek Goyal     2019-10-30  410   */
58ada94f95f71d Vivek Goyal     2019-10-30  411  static int send_forget_request(struct virtio_fs_vq *fsvq,
58ada94f95f71d Vivek Goyal     2019-10-30  412  			       struct virtio_fs_forget *forget,
58ada94f95f71d Vivek Goyal     2019-10-30  413  			       bool in_flight)
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  414  {
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  415  	struct scatterlist sg;
58ada94f95f71d Vivek Goyal     2019-10-30  416  	struct virtqueue *vq;
a61f879fdb5649 Deming Wang     2022-09-06  417  	int ret;
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  418  	bool notify;
1efcf39eb62757 Vivek Goyal     2019-10-30  419  	struct virtio_fs_forget_req *req = &forget->req;
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  420  
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  421  	spin_lock(&fsvq->lock);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12 @422  	if (!fsvq->connected) {
58ada94f95f71d Vivek Goyal     2019-10-30  423  		if (in_flight)
c17ea009610366 Vivek Goyal     2019-10-15  424  			dec_in_flight_req(fsvq);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  425  		kfree(forget);
58ada94f95f71d Vivek Goyal     2019-10-30  426  		goto out;
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  427  	}
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  428  
1efcf39eb62757 Vivek Goyal     2019-10-30  429  	sg_init_one(&sg, req, sizeof(*req));
58ada94f95f71d Vivek Goyal     2019-10-30  430  	vq = fsvq->vq;
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  431  	dev_dbg(&vq->vdev->dev, "%s\n", __func__);
58ada94f95f71d Vivek Goyal     2019-10-30  432  
58ada94f95f71d Vivek Goyal     2019-10-30  433  	ret = virtqueue_add_outbuf(vq, &sg, 1, forget, GFP_ATOMIC);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  434  	if (ret < 0) {
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  435  		if (ret == -ENOMEM || ret == -ENOSPC) {
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  436  			pr_debug("virtio-fs: Could not queue FORGET: err=%d. Will try later\n",
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  437  				 ret);
58ada94f95f71d Vivek Goyal     2019-10-30  438  			list_add_tail(&forget->list, &fsvq->queued_reqs);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  439  			schedule_delayed_work(&fsvq->dispatch_work,
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  440  					      msecs_to_jiffies(1));
58ada94f95f71d Vivek Goyal     2019-10-30  441  			if (!in_flight)
58ada94f95f71d Vivek Goyal     2019-10-30  442  				inc_in_flight_req(fsvq);
58ada94f95f71d Vivek Goyal     2019-10-30  443  			/* Queue is full */
58ada94f95f71d Vivek Goyal     2019-10-30  444  			ret = 1;
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  445  		} else {
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  446  			pr_debug("virtio-fs: Could not queue FORGET: err=%d. Dropping it.\n",
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  447  				 ret);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  448  			kfree(forget);
58ada94f95f71d Vivek Goyal     2019-10-30  449  			if (in_flight)
58ada94f95f71d Vivek Goyal     2019-10-30  450  				dec_in_flight_req(fsvq);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  451  		}
58ada94f95f71d Vivek Goyal     2019-10-30  452  		goto out;
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  453  	}
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  454  
58ada94f95f71d Vivek Goyal     2019-10-30  455  	if (!in_flight)
58ada94f95f71d Vivek Goyal     2019-10-30  456  		inc_in_flight_req(fsvq);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  457  	notify = virtqueue_kick_prepare(vq);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  458  	spin_unlock(&fsvq->lock);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  459  
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  460  	if (notify)
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  461  		virtqueue_notify(vq);
58ada94f95f71d Vivek Goyal     2019-10-30  462  	return ret;
58ada94f95f71d Vivek Goyal     2019-10-30  463  out:
58ada94f95f71d Vivek Goyal     2019-10-30  464  	spin_unlock(&fsvq->lock);
58ada94f95f71d Vivek Goyal     2019-10-30  465  	return ret;
58ada94f95f71d Vivek Goyal     2019-10-30  466  }
58ada94f95f71d Vivek Goyal     2019-10-30  467  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
