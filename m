Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B97C4E3648
	for <lists.virtualization@lfdr.de>; Tue, 22 Mar 2022 02:56:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73B26404DA;
	Tue, 22 Mar 2022 01:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qllRgprVAZtQ; Tue, 22 Mar 2022 01:56:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C85E240928;
	Tue, 22 Mar 2022 01:56:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AF2CC0082;
	Tue, 22 Mar 2022 01:56:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA07CC000B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Mar 2022 01:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D135640018
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Mar 2022 01:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cqu-DLzN-dYI
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Mar 2022 01:56:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D86DB404B7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Mar 2022 01:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647914200; x=1679450200;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ulc+oGET9j6DNlpWj/HczbXJfqJE/opE8gnWWtf+C1Y=;
 b=ieJHwQPoeQuko778Bpd9LlEqoOYzy06cZVvNtsc7Vj1JucErs1excKAk
 CVi5LQ296ChTQWZ8tVJvLz4VzV/rgmwxTlBe99Z6f7pt+u9C2cwcfTreS
 A3KmICh3VWYxLyaxuXqlakVfhWiSX2kI4teuVo128u3xjkvRLLmBGCufT
 Xh3K00Sdrhag7JXXl4ijVFEPJwnv9qc1CiQ42qx9EA6jiGbsuQon+g698
 OaPxvwxXvEqXlAawRwj0FjxogLwstZsKML6l75YmEhQ9rWnKeILG4lOB8
 qYCVbvy5o8JRCbfBI9giIP1rPbc0jFS9ptcA6cxOL1Dt1NrgEDiRlvPP3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257644637"
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; d="scan'208";a="257644637"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 18:56:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; d="scan'208";a="716723862"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 21 Mar 2022 18:56:37 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nWTlE-000ILI-LX; Tue, 22 Mar 2022 01:56:36 +0000
Date: Tue, 22 Mar 2022 09:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: Suwan Kim <suwan.kim027@gmail.com>, mst@redhat.com, jasowang@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mgurtovoy@nvidia.com
Subject: Re: [PATCH v2 1/2] virtio-blk: support polling I/O
Message-ID: <202203220946.YKj9GuI8-lkp@intel.com>
References: <20220321142441.132888-2-suwan.kim027@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321142441.132888-2-suwan.kim027@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-block@vger.kernel.org, Suwan Kim <suwan.kim027@gmail.com>,
 kbuild-all@lists.01.org, virtualization@lists.linux-foundation.org
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

Hi Suwan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v5.17]
[also build test WARNING on next-20220321]
[cannot apply to axboe-block/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Suwan-Kim/virtio-blk-support-polling-I-O-and-mq_ops-queue_rqs/20220321-223027
base:    f443e374ae131c168a065ea1748feac6b2e76613
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20220322/202203220946.YKj9GuI8-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/5388c0729248236712cf865643a2190989dabbb5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Suwan-Kim/virtio-blk-support-polling-I-O-and-mq_ops-queue_rqs/20220321-223027
        git checkout 5388c0729248236712cf865643a2190989dabbb5
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/block/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/block/virtio_blk.c:803:66: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int ioerror @@     got restricted blk_status_t @@
   drivers/block/virtio_blk.c:803:66: sparse:     expected int ioerror
   drivers/block/virtio_blk.c:803:66: sparse:     got restricted blk_status_t

vim +803 drivers/block/virtio_blk.c

   788	
   789	static int virtblk_poll(struct blk_mq_hw_ctx *hctx, struct io_comp_batch *iob)
   790	{
   791		struct virtio_blk_vq *vq = hctx->driver_data;
   792		struct virtblk_req *vbr;
   793		unsigned long flags;
   794		unsigned int len;
   795		int found = 0;
   796	
   797		spin_lock_irqsave(&vq->lock, flags);
   798	
   799		while ((vbr = virtqueue_get_buf(vq->vq, &len)) != NULL) {
   800			struct request *req = blk_mq_rq_from_pdu(vbr);
   801	
   802			found++;
 > 803			if (!blk_mq_add_to_batch(req, iob, virtblk_result(vbr),
   804							virtblk_complete_batch))
   805				blk_mq_complete_request(req);
   806		}
   807	
   808		spin_unlock_irqrestore(&vq->lock, flags);
   809	
   810		return found;
   811	}
   812	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
