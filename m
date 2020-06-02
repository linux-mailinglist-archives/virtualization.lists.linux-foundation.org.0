Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A43931EB4C4
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 06:57:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D47C885DF6;
	Tue,  2 Jun 2020 04:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XWW6yJ9YhFFL; Tue,  2 Jun 2020 04:57:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 538D985EC4;
	Tue,  2 Jun 2020 04:57:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EA76C0176;
	Tue,  2 Jun 2020 04:57:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E7B6C0176
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 04:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 44BF2203FE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 04:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ND61pT42AYmf
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 04:57:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id C1564203F7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 04:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591073836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gchTFiwviKMDwZXWqMwug6HrHP15DUCH03zQ9j5rpHE=;
 b=fvCRdFLfZAVb4cEjARqPVm25/CyiCI3ZbQmSgw1WpEYSvo+wB9PoIoPbJr2n+gvme1fmTw
 Q3w8/BuG0oEzU5z2Hpcfg20b2PvlcEAwibE9ruPsQ4jtJ2mz7WCbYNL762qnksXq+3bRmR
 NEPgz5vXPKoKjepWhB8Jh8UoJO9o8BI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-_evoWoHQM9WcRsSw46QtIw-1; Tue, 02 Jun 2020 00:57:00 -0400
X-MC-Unique: _evoWoHQM9WcRsSw46QtIw-1
Received: by mail-wr1-f70.google.com with SMTP id w4so872684wrl.13
 for <virtualization@lists.linux-foundation.org>;
 Mon, 01 Jun 2020 21:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gchTFiwviKMDwZXWqMwug6HrHP15DUCH03zQ9j5rpHE=;
 b=KkLQtGzrq8HWDtW6faLVUPE8FtKmSj1Hqr17EPmHyXsr9IZrawlxsWRVJq4xoBpOjA
 SN4Ycb8sRrUldj6z/TI9suMM4Su4jInFeuAZVs+35SnS3P7wOA9HntTFz7MNVFzeLHcr
 8m7gFfHx5tIVzJTGZYXGC8mi+uGwWRSj6JK8EOPhCvCKtHcp+hm4hPcWkTUefWAAPTjr
 R5MOebfwy0GScnCx93lpz/WzOKgROSU71VaoPc+U8TfA/bThwZC60RtF/DWbhrzHAvyQ
 3RD264+JGn/7yjMj1fSTOXfZFCWhNci5WYlaKGZVmF0Z6zvDi8o6IzTIEl6Z54sh8eGC
 R63A==
X-Gm-Message-State: AOAM530UjFQPn5EQ4tCocAdnC5kUDn8jzCk/dK6txFkyhl+kNZFJel3B
 /vMnwkdslhwYqTH0bDNBpb1k0It3laB6/WIqMU7dG57+N5ck1f85ccPSWkI3fR3rK8buWIHhx6n
 LB0bjT8nEdTMOi8QxKSL9i7+YO9oPWDUxTq9ShRrnLQ==
X-Received: by 2002:a1c:ed0e:: with SMTP id l14mr2320508wmh.8.1591073818233;
 Mon, 01 Jun 2020 21:56:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwezYypzZbKEY1d6YwmBv/8PZj3UfnzO1aXl2q6kGlCaJNGq8F3H+NRcEoRO1KXyF9lWjuqqA==
X-Received: by 2002:a1c:ed0e:: with SMTP id l14mr2320484wmh.8.1591073818026;
 Mon, 01 Jun 2020 21:56:58 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 x205sm1900586wmx.21.2020.06.01.21.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 21:56:57 -0700 (PDT)
Date: Tue, 2 Jun 2020 00:56:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 4/6] vhost_vdpa: support doorbell mapping via mmap
Message-ID: <20200602005007-mutt-send-email-mst@kernel.org>
References: <20200529080303.15449-5-jasowang@redhat.com>
 <202006020308.kLXTHt4n%lkp@intel.com>
MIME-Version: 1.0
In-Reply-To: <202006020308.kLXTHt4n%lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kbuild-all@lists.01.org, lulu@redhat.com, kvm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
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

On Tue, Jun 02, 2020 at 03:22:49AM +0800, kbuild test robot wrote:
> Hi Jason,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on vhost/linux-next]
> [also build test ERROR on linus/master v5.7 next-20200529]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> 
> url:    https://github.com/0day-ci/linux/commits/Jason-Wang/vDPA-doorbell-mapping/20200531-070834
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
> config: m68k-randconfig-r011-20200601 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> drivers/vhost/vdpa.c: In function 'vhost_vdpa_fault':
> >> drivers/vhost/vdpa.c:754:22: error: implicit declaration of function 'pgprot_noncached' [-Werror=implicit-function-declaration]
> 754 |  vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> |                      ^~~~~~~~~~~~~~~~
> >> drivers/vhost/vdpa.c:754:22: error: incompatible types when assigning to type 'pgprot_t' {aka 'struct <anonymous>'} from type 'int'
> cc1: some warnings being treated as errors
> 
> vim +/pgprot_noncached +754 drivers/vhost/vdpa.c
> 
>    742	
>    743	static vm_fault_t vhost_vdpa_fault(struct vm_fault *vmf)
>    744	{
>    745		struct vhost_vdpa *v = vmf->vma->vm_file->private_data;
>    746		struct vdpa_device *vdpa = v->vdpa;
>    747		const struct vdpa_config_ops *ops = vdpa->config;
>    748		struct vdpa_notification_area notify;
>    749		struct vm_area_struct *vma = vmf->vma;
>    750		u16 index = vma->vm_pgoff;
>    751	
>    752		notify = ops->get_vq_notification(vdpa, index);
>    753	
>  > 754		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>    755		if (remap_pfn_range(vma, vmf->address & PAGE_MASK,
>    756				    notify.addr >> PAGE_SHIFT, PAGE_SIZE,
>    757				    vma->vm_page_prot))
>    758			return VM_FAULT_SIGBUS;
>    759	
>    760		return VM_FAULT_NOPAGE;
>    761	}
>    762	

Yes well, all this remapping clearly has no chance to work
on systems without CONFIG_MMU.



> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
