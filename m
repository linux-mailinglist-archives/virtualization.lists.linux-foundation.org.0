Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBB41C5C1E
	for <lists.virtualization@lfdr.de>; Tue,  5 May 2020 17:45:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DA4BC80EB7;
	Tue,  5 May 2020 15:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id whUxkAtMCbki; Tue,  5 May 2020 15:45:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1C4FE86DEA;
	Tue,  5 May 2020 15:45:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3D52C0175;
	Tue,  5 May 2020 15:45:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8904EC0175
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 May 2020 15:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8564D86D31
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 May 2020 15:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wn0q3bCJRMro
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 May 2020 15:44:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D267D80EB7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 May 2020 15:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588693497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ATymMeG6RiOGBAAfWdg7fwilnSvvAev3slucMk0tl5E=;
 b=e3dVUVbYT23HNGLZNXk4DR1D80eNSsGzSeatVpX26UC7LfLvdJ5v/Difa8HBs19Vv3OaSv
 jWEgCLMrFLs8KqTurvbsE5xmKqU5RaawrONW651QR1FTxJS/2iu2cVb8gGl9rGL4bWnnKm
 sZtWZQaZz/Pnh6E7zxN71Wb+iLxNmNI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-xasHtegbNhCpixy3FWKcnw-1; Tue, 05 May 2020 11:44:53 -0400
X-MC-Unique: xasHtegbNhCpixy3FWKcnw-1
Received: by mail-wr1-f70.google.com with SMTP id 30so385923wrq.15
 for <virtualization@lists.linux-foundation.org>;
 Tue, 05 May 2020 08:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ATymMeG6RiOGBAAfWdg7fwilnSvvAev3slucMk0tl5E=;
 b=F+R4gBsRQFxQvctmyBbg48+14t3+7Bfwi1ir0XUimwCad+yn172i0r0WwuaanT4ufz
 NxFMOLSGzsjlFfequ4tlA/a+iK5px5R6C725ASQEUo5jg3GpzRB1o5UWTgtjWyihexMk
 Sa9rQYNrS/2UO+cH5/i3J2m8ml8W3dcSkF3i1hEtqCMgSdv8QJEPnO4JbrmFhF3sfMFR
 U/zva9Qv8wiIDGsDtn7AFmmV6XKHZpItkowvGVxbLTDLZe45LCr9iofpM58Elpcyq95V
 B5qLkMacuM/RmPXptBNIZmSFl7QeeV9Z2LtazQnHdXSNhznV/TXmIAi/Xa2ekGirHKjh
 edcA==
X-Gm-Message-State: AGi0PuY6IE7uzzwaKiHOH+2Kg9Grh1wjpc5tr8k6Tq7cl9Ci9z5ZUdX2
 X+Z7dlcW79t9kegocSrfXpcITd4r4yKsPGJ432sMz7BPuRntxW7Ms0NRkxXpUavmXtAk/LBFcbq
 JjOgR2Rbn0kpcPiENvYgJR03Bwauu1QHhHEHzXI3ueQ==
X-Received: by 2002:a05:600c:220c:: with SMTP id
 z12mr3889164wml.84.1588693492413; 
 Tue, 05 May 2020 08:44:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypLAtAtR29+1Xpb9v/bXxgErbXkwmiM0ZkUgsrIiaMjwwteCzask/x8xdzj9MT0cC1whI9Hdyw==
X-Received: by 2002:a05:600c:220c:: with SMTP id
 z12mr3889139wml.84.1588693492106; 
 Tue, 05 May 2020 08:44:52 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 x13sm4635004wmc.5.2020.05.05.08.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 08:44:51 -0700 (PDT)
Date: Tue, 5 May 2020 11:44:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [vhost:vhost 8/22] drivers/virtio/virtio_mem.c:1375:20: error:
 implicit declaration of function 'kzalloc'; did you mean 'vzalloc'?
Message-ID: <20200505114433-mutt-send-email-mst@kernel.org>
References: <202005052221.83QerHmG%lkp@intel.com>
 <7dea2810-85cf-0892-20a8-bba3e3a2c133@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7dea2810-85cf-0892-20a8-bba3e3a2c133@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, kbuild-all@lists.01.org,
 kbuild test robot <lkp@intel.com>, kvm@vger.kernel.org, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On Tue, May 05, 2020 at 04:50:13PM +0200, David Hildenbrand wrote:
> On 05.05.20 16:15, kbuild test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vhost
> > head:   da1742791d8c0c0a8e5471f181549c4726a5c5f9
> > commit: 7527631e900d464ed2d533f799cb0da2b29cc6f0 [8/22] virtio-mem: Paravirtualized memory hotplug
> > config: x86_64-randconfig-b002-20200505 (attached as .config)
> > compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> > reproduce:
> >         git checkout 7527631e900d464ed2d533f799cb0da2b29cc6f0
> >         # save the attached .config to linux build tree
> >         make ARCH=x86_64 
> > 
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> > 
> > All error/warnings (new ones prefixed by >>):
> > 
> >    drivers/virtio/virtio_mem.c: In function 'virtio_mem_probe':
> >>> drivers/virtio/virtio_mem.c:1375:20: error: implicit declaration of function 'kzalloc'; did you mean 'vzalloc'? [-Werror=implicit-function-declaration]
> >      vdev->priv = vm = kzalloc(sizeof(*vm), GFP_KERNEL);
> >                        ^~~~~~~
> >                        vzalloc
> >>> drivers/virtio/virtio_mem.c:1375:18: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
> >      vdev->priv = vm = kzalloc(sizeof(*vm), GFP_KERNEL);
> >                      ^
> >>> drivers/virtio/virtio_mem.c:1419:2: error: implicit declaration of function 'kfree'; did you mean 'vfree'? [-Werror=implicit-function-declaration]
> >      kfree(vm);
> >      ^~~~~
> >      vfree
> >    cc1: some warnings being treated as errors
> > 
> > vim +1375 drivers/virtio/virtio_mem.c
> 
> Guess we simply need
> 
>  #include <linux/slab.h>
> 
> to make it work for that config.


OK I added that in the 1st commit that introduced virtio-mem.

> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
