Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A251A0074
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:49:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6BEFA86142;
	Mon,  6 Apr 2020 21:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiR7R1beKuyS; Mon,  6 Apr 2020 21:49:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CA8E786702;
	Mon,  6 Apr 2020 21:49:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB5C2C0177;
	Mon,  6 Apr 2020 21:49:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D761C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 044F686142
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:49:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WAN4MVYo935G
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:49:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 363A986130
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586209782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kIXDxUjS2HMskB+mPSwuv3yFtOM4CbvksE2h37nZI78=;
 b=G03to6zMu4TUsnLfHbUIWkeCIpfrl+oI/yvXLzi5Nzy5o5c+gDpowE6KOla1oKxlDuIP8w
 UHw6/gSZfDpvqwMAU+5AN+Qm94CeQHHj1xWk4jiNh6xVIDWj164K9xxrjhUOj4mTrXOTlr
 JAvQ1neZL0M2w5Wm0Tc2Pv+NBvkFtQo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-6Yj3EoULPmiyVugiCs9VIg-1; Mon, 06 Apr 2020 17:49:40 -0400
X-MC-Unique: 6Yj3EoULPmiyVugiCs9VIg-1
Received: by mail-wm1-f71.google.com with SMTP id s22so428216wmh.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kIXDxUjS2HMskB+mPSwuv3yFtOM4CbvksE2h37nZI78=;
 b=KUVclkWAA5AcslN7eUDfWLiumV6F8GmdKntG7mXtapMs2ZU4MMeDPait4cbQ37WO4i
 gY4tST8K1vxrDD5lB46BRJe4WeYEHxST3DRAsG+Z50VacBnPnZ3BZt1Th0cTmMramveX
 YTwTD9ojQT2p3mps3NNf1TtMNpfIaq3JH9f/4Z7VPgTLjr/j1PZhmFPryPop9Zsv0PjG
 w6nOfZieu8IpK9it+w1BSqelxcpml8ZBTSnRSYyOQggr+uK4ORt5mVqfhRBgOLPVk3R+
 UKooqsLWekEh8EYIqtkkMdWn3ayqEbkEB0YcXT5UTJEDVlBgDDOCBcfw5sdeaaQTsNYP
 TT+g==
X-Gm-Message-State: AGi0PuZQhbrjFehuGuGpD3STQOjQXob7bKe6xM9/ACgw3IfbmwncuGaN
 XiJWzdFOcoraAonNGLGbID3A9PgtldNyA1mpCFKnYtRuUo33J5MtJuozYlVDvg0pdrenfK34iVw
 lgCJqf1l2TZVdCKQ1SAKjgTWzk3YkksuQ/njFBUUqCA==
X-Received: by 2002:a5d:5230:: with SMTP id i16mr1340782wra.15.1586209779342; 
 Mon, 06 Apr 2020 14:49:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypJNgJ7eiNVOi5WqhYdhc42FjdejCWO6/Y8fkLNs2CGrGBsCWnbC9H2zd2UGSvXrNhDXRVbxFQ==
X-Received: by 2002:a5d:5230:: with SMTP id i16mr1340765wra.15.1586209779132; 
 Mon, 06 Apr 2020 14:49:39 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id n6sm1057944wmc.28.2020.04.06.14.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:49:38 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:49:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 6/6] kernel: set USER_DS in kthread_use_mm
Message-ID: <20200406174917-mutt-send-email-mst@kernel.org>
References: <20200404094101.672954-1-hch@lst.de>
 <20200404094101.672954-7-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200404094101.672954-7-hch@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 intel-gvt-dev@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-usb@vger.kernel.org, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, intel-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Zhi Wang <zhi.a.wang@intel.com>
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

On Sat, Apr 04, 2020 at 11:41:01AM +0200, Christoph Hellwig wrote:
> Some architectures like arm64 and s390 require USER_DS to be set for
> kernel threads to access user address space, which is the whole purpose
> of kthread_use_mm, but other like x86 don't.  That has lead to a huge
> mess where some callers are fixed up once they are tested on said
> architectures, while others linger around and yet other like io_uring
> try to do "clever" optimizations for what usually is just a trivial
> asignment to a member in the thread_struct for most architectures.
> 
> Make kthread_use_mm set USER_DS, and kthread_unuse_mm restore to the
> previous value instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

I'm ok with vhost bits:

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/usb/gadget/function/f_fs.c | 4 ----
>  drivers/vhost/vhost.c              | 3 ---
>  fs/io-wq.c                         | 8 ++------
>  fs/io_uring.c                      | 4 ----
>  kernel/kthread.c                   | 6 ++++++
>  5 files changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index d9e48bd7c692..a1198f4c527c 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -824,13 +824,9 @@ static void ffs_user_copy_worker(struct work_struct *work)
>  	bool kiocb_has_eventfd = io_data->kiocb->ki_flags & IOCB_EVENTFD;
>  
>  	if (io_data->read && ret > 0) {
> -		mm_segment_t oldfs = get_fs();
> -
> -		set_fs(USER_DS);
>  		kthread_use_mm(io_data->mm);
>  		ret = ffs_copy_to_iter(io_data->buf, ret, &io_data->data);
>  		kthread_unuse_mm(io_data->mm);
> -		set_fs(oldfs);
>  	}
>  
>  	io_data->kiocb->ki_complete(io_data->kiocb, ret, ret);
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 1787d426a956..b5229ae01d3b 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -333,9 +333,7 @@ static int vhost_worker(void *data)
>  	struct vhost_dev *dev = data;
>  	struct vhost_work *work, *work_next;
>  	struct llist_node *node;
> -	mm_segment_t oldfs = get_fs();
>  
> -	set_fs(USER_DS);
>  	kthread_use_mm(dev->mm);
>  
>  	for (;;) {
> @@ -365,7 +363,6 @@ static int vhost_worker(void *data)
>  		}
>  	}
>  	kthread_unuse_mm(dev->mm);
> -	set_fs(oldfs);
>  	return 0;
>  }
>  
> diff --git a/fs/io-wq.c b/fs/io-wq.c
> index 83c2868eff2a..75cc2f31816d 100644
> --- a/fs/io-wq.c
> +++ b/fs/io-wq.c
> @@ -168,7 +168,6 @@ static bool __io_worker_unuse(struct io_wqe *wqe, struct io_worker *worker)
>  			dropped_lock = true;
>  		}
>  		__set_current_state(TASK_RUNNING);
> -		set_fs(KERNEL_DS);
>  		kthread_unuse_mm(worker->mm);
>  		mmput(worker->mm);
>  		worker->mm = NULL;
> @@ -420,14 +419,11 @@ static void io_wq_switch_mm(struct io_worker *worker, struct io_wq_work *work)
>  		mmput(worker->mm);
>  		worker->mm = NULL;
>  	}
> -	if (!work->mm) {
> -		set_fs(KERNEL_DS);
> +	if (!work->mm)
>  		return;
> -	}
> +
>  	if (mmget_not_zero(work->mm)) {
>  		kthread_use_mm(work->mm);
> -		if (!worker->mm)
> -			set_fs(USER_DS);
>  		worker->mm = work->mm;
>  		/* hang on to this mm */
>  		work->mm = NULL;
> diff --git a/fs/io_uring.c b/fs/io_uring.c
> index 367406381044..c332a34e8b34 100644
> --- a/fs/io_uring.c
> +++ b/fs/io_uring.c
> @@ -5871,15 +5871,12 @@ static int io_sq_thread(void *data)
>  	struct io_ring_ctx *ctx = data;
>  	struct mm_struct *cur_mm = NULL;
>  	const struct cred *old_cred;
> -	mm_segment_t old_fs;
>  	DEFINE_WAIT(wait);
>  	unsigned long timeout;
>  	int ret = 0;
>  
>  	complete(&ctx->completions[1]);
>  
> -	old_fs = get_fs();
> -	set_fs(USER_DS);
>  	old_cred = override_creds(ctx->creds);
>  
>  	timeout = jiffies + ctx->sq_thread_idle;
> @@ -5985,7 +5982,6 @@ static int io_sq_thread(void *data)
>  	if (current->task_works)
>  		task_work_run();
>  
> -	set_fs(old_fs);
>  	if (cur_mm) {
>  		kthread_unuse_mm(cur_mm);
>  		mmput(cur_mm);
> diff --git a/kernel/kthread.c b/kernel/kthread.c
> index 316db17f6b4f..9e27d01b6d78 100644
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -52,6 +52,7 @@ struct kthread {
>  	unsigned long flags;
>  	unsigned int cpu;
>  	void *data;
> +	mm_segment_t oldfs;
>  	struct completion parked;
>  	struct completion exited;
>  #ifdef CONFIG_BLK_CGROUP
> @@ -1235,6 +1236,9 @@ void kthread_use_mm(struct mm_struct *mm)
>  
>  	if (active_mm != mm)
>  		mmdrop(active_mm);
> +
> +	to_kthread(tsk)->oldfs = get_fs();
> +	set_fs(USER_DS);
>  }
>  EXPORT_SYMBOL_GPL(kthread_use_mm);
>  
> @@ -1249,6 +1253,8 @@ void kthread_unuse_mm(struct mm_struct *mm)
>  	WARN_ON_ONCE(!(tsk->flags & PF_KTHREAD));
>  	WARN_ON_ONCE(!tsk->mm);
>  
> +	set_fs(to_kthread(tsk)->oldfs);
> +
>  	task_lock(tsk);
>  	sync_mm_rss(mm);
>  	tsk->mm = NULL;
> -- 
> 2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
