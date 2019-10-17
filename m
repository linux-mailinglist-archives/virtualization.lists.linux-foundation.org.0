Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5E4DB5B4
	for <lists.virtualization@lfdr.de>; Thu, 17 Oct 2019 20:18:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 082CBBB3;
	Thu, 17 Oct 2019 18:18:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1A6A6A80
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 18:18:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BE49B608
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 18:18:00 +0000 (UTC)
Received: from localhost (unknown [192.55.54.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 78A0420659;
	Thu, 17 Oct 2019 18:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571336280;
	bh=SR+bTSpFdod0Pmckp7adJ/ibEnctQOUUmhnuvOQCrjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RkTngsv/1miXtFdWrcmt1WxD7vnDnHdpunA+SOr9P2/TvBDfb8M9X/TVQm8/BNYl1
	/ah1UqwxSf42djwPhxXDYrM8gkSc8vvloXnEcxjykfTzwn+2CKdx5qfuktu09gIoOU
	Fe8DldLn8f7+VsWb+IdxBoFJS4qSBQmy0O3JoTiM=
Date: Thu, 17 Oct 2019 11:18:00 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH RFC 3/3] vhost, kcov: collect coverage from vhost_worker
Message-ID: <20191017181800.GB1094415@kroah.com>
References: <cover.1571333592.git.andreyknvl@google.com>
	<af26317c0efd412dd660e81d548a173942f8a0ad.1571333592.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af26317c0efd412dd660e81d548a173942f8a0ad.1571333592.git.andreyknvl@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux-foundation.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dmitry Vyukov <dvyukov@google.com>, David Windsor <dwindsor@gmail.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Thu, Oct 17, 2019 at 07:44:15PM +0200, Andrey Konovalov wrote:
> This patch adds kcov_remote_start/kcov_remote_stop annotations to the
> vhost_worker function, which is responsible for processing vhost works.
> Since vhost_worker is spawned when a vhost device instance is created,
> the common kcov handle is used for kcov_remote_start/stop annotations.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> ---
>  drivers/vhost/vhost.c | 15 +++++++++++++++
>  drivers/vhost/vhost.h |  3 +++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 36ca2cf419bf..71a349f6b352 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -357,7 +357,13 @@ static int vhost_worker(void *data)
>  		llist_for_each_entry_safe(work, work_next, node, node) {
>  			clear_bit(VHOST_WORK_QUEUED, &work->flags);
>  			__set_current_state(TASK_RUNNING);
> +#ifdef CONFIG_KCOV
> +			kcov_remote_start(dev->kcov_handle);
> +#endif

Shouldn't you hide these #ifdefs in a .h file?  This is not a "normal"
kernel coding style at all.

>  			work->fn(work);
> +#ifdef CONFIG_KCOV
> +			kcov_remote_stop();
> +#endif
>  			if (need_resched())
>  				schedule();
>  		}
> @@ -546,6 +552,9 @@ long vhost_dev_set_owner(struct vhost_dev *dev)
>  
>  	/* No owner, become one */
>  	dev->mm = get_task_mm(current);
> +#ifdef CONFIG_KCOV
> +	dev->kcov_handle = current->kcov_handle;
> +#endif
>  	worker = kthread_create(vhost_worker, dev, "vhost-%d", current->pid);
>  	if (IS_ERR(worker)) {
>  		err = PTR_ERR(worker);
> @@ -571,6 +580,9 @@ long vhost_dev_set_owner(struct vhost_dev *dev)
>  	if (dev->mm)
>  		mmput(dev->mm);
>  	dev->mm = NULL;
> +#ifdef CONFIG_KCOV
> +	dev->kcov_handle = 0;
> +#endif
>  err_mm:
>  	return err;
>  }
> @@ -682,6 +694,9 @@ void vhost_dev_cleanup(struct vhost_dev *dev)
>  	if (dev->worker) {
>  		kthread_stop(dev->worker);
>  		dev->worker = NULL;
> +#ifdef CONFIG_KCOV
> +		dev->kcov_handle = 0;
> +#endif
>  	}
>  	if (dev->mm)
>  		mmput(dev->mm);
> diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
> index e9ed2722b633..010ca1ebcbd5 100644
> --- a/drivers/vhost/vhost.h
> +++ b/drivers/vhost/vhost.h
> @@ -173,6 +173,9 @@ struct vhost_dev {
>  	int iov_limit;
>  	int weight;
>  	int byte_weight;
> +#ifdef CONFIG_KCOV
> +	u64 kcov_handle;
> +#endif

Why is this a #ifdef at all here?

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
