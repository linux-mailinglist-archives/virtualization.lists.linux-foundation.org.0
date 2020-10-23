Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B05A2972FF
	for <lists.virtualization@lfdr.de>; Fri, 23 Oct 2020 17:57:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D4691873EC;
	Fri, 23 Oct 2020 15:57:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1-OsIHVcT8E; Fri, 23 Oct 2020 15:57:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 274AF873E4;
	Fri, 23 Oct 2020 15:57:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3A11C0051;
	Fri, 23 Oct 2020 15:57:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA590C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 15:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AE57E87669
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 15:57:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RL50O5hMt5B0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 15:57:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 889DD87662
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 15:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603468630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bqy3pRoTvYhu7QrM6bZLJLQpl8FY7dkuE8Yeqvd9psc=;
 b=f8E4PNi/hf4/BBMtSWO+l5AoRWCF4xznJEZfG/TH5mYim2kxke4KQiR9eXr+K+wrc4TqhC
 z0CqOpaDUicDqwM8GaEakmUS00/k9rNERGsUAvvQYX8id8jxdMwXnWFypxFACyYkc2Xk6w
 fv88h3p3jVz6MG5v44Ea068qDNJq7y0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-fe3DHfhSOPqqQFLRrO_NFA-1; Fri, 23 Oct 2020 11:57:06 -0400
X-MC-Unique: fe3DHfhSOPqqQFLRrO_NFA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D04AF100F94D;
 Fri, 23 Oct 2020 15:57:04 +0000 (UTC)
Received: from redhat.com (ovpn-113-117.ams2.redhat.com [10.36.113.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF1EB1002C09;
 Fri, 23 Oct 2020 15:56:56 +0000 (UTC)
Date: Fri, 23 Oct 2020 11:56:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 04/16] vhost: prep vhost_dev_init users to handle failures
Message-ID: <20201023115635-mutt-send-email-mst@kernel.org>
References: <1602104101-5592-5-git-send-email-michael.christie@oracle.com>
 <20201009114126.GI1042@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009114126.GI1042@kadam>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: kbuild-all@lists.01.org, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, virtualization@lists.linux-foundation.org,
 target-devel@vger.kernel.org, stefanha@redhat.com, pbonzini@redhat.com,
 kbuild@lists.01.org, Mike Christie <michael.christie@oracle.com>,
 lkp@intel.com
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

On Fri, Oct 09, 2020 at 02:41:26PM +0300, Dan Carpenter wrote:
> Hi Mike,
> 
> url:    https://github.com/0day-ci/linux/commits/Mike-Christie/vhost-fix-scsi-cmd-handling-and-IOPs/20201008-045802
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
> config: x86_64-randconfig-m001-20201008 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> New smatch warnings:
> drivers/vhost/vdpa.c:844 vhost_vdpa_open() error: uninitialized symbol 'r'.
> 
> Old smatch warnings:
> drivers/vhost/vdpa.c:436 vhost_vdpa_unlocked_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?
> drivers/vhost/vdpa.c:489 vhost_vdpa_unlocked_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?
> 
> vim +/r +844 drivers/vhost/vdpa.c
> 
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  793  static int vhost_vdpa_open(struct inode *inode, struct file *filep)
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  794  {
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  795  	struct vhost_vdpa *v;
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  796  	struct vhost_dev *dev;
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  797  	struct vhost_virtqueue **vqs;
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  798  	int nvqs, i, r, opened;
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  799  
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  800  	v = container_of(inode->i_cdev, struct vhost_vdpa, cdev);
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  801  
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  802  	opened = atomic_cmpxchg(&v->opened, 0, 1);
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  803  	if (opened)
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  804  		return -EBUSY;
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  805  
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  806  	nvqs = v->nvqs;
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  807  	vhost_vdpa_reset(v);
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  808  
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  809  	vqs = kmalloc_array(nvqs, sizeof(*vqs), GFP_KERNEL);
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  810  	if (!vqs) {
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  811  		r = -ENOMEM;
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  812  		goto err;
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  813  	}
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  814  
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  815  	dev = &v->vdev;
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  816  	for (i = 0; i < nvqs; i++) {
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  817  		vqs[i] = &v->vqs[i];
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  818  		vqs[i]->handle_kick = handle_vq_kick;
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  819  	}
> 7dc4d1082d406f3 Mike Christie 2020-10-07  820  	if (vhost_dev_init(dev, vqs, nvqs, 0, 0, 0, false,
> 7dc4d1082d406f3 Mike Christie 2020-10-07  821  			   vhost_vdpa_process_iotlb_msg))
> 7dc4d1082d406f3 Mike Christie 2020-10-07  822  		goto err_dev_init;
> 
> "r" not set on this error path.
> 
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  823  
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  824  	dev->iotlb = vhost_iotlb_alloc(0, 0);
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  825  	if (!dev->iotlb) {
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  826  		r = -ENOMEM;
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  827  		goto err_init_iotlb;
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  828  	}
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  829  
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  830  	r = vhost_vdpa_alloc_domain(v);
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  831  	if (r)
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  832  		goto err_init_iotlb;
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  833  
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  834  	filep->private_data = v;
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  835  
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  836  	return 0;
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  837  
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  838  err_init_iotlb:
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  839  	vhost_dev_cleanup(&v->vdev);
> 7dc4d1082d406f3 Mike Christie 2020-10-07  840  err_dev_init:
> 37787e9f81e2e58 Mike Christie 2020-09-21  841  	kfree(vqs);
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  842  err:
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  843  	atomic_dec(&v->opened);
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26 @844  	return r;
> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  845  }


Yes looks like it would use r uninitialized ...
Mike?

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
