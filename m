Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F1620E145A
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 10:36:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0D853C4E;
	Wed, 23 Oct 2019 08:36:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2EE55C4E
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 08:36:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AA18187E
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 08:36:33 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id m4so2084324qke.9
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 01:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9v9iQV19DgUi7HpW2WaXbL0gSupsIrn2jbWl4B5cbgA=;
	b=GVNr3B/Pu7MhpLCF/dDljxT+FdoGWUX3wKn2/1eUXY7mn6PbLjPdBp3YQsOZ3yPYLQ
	WSWxUBvh9cHNDXTl/XYd6WcF58ndf5Enb6Zf8GLJrDjg5QY6kDKBcRU+VbEj3gahLRg7
	vJ9UFiG27wNkTs/40C073ctPhILdFtxNxS+6tI4RSo7/BtCENKdU3NUEzHRPNk2pkyGp
	cKRNlEWDrcCZQOXVaRFjIaVuR+ng9CxjSsJOAjcXp+VlZYyTIbSM7X1Oxmk8LwouDTkq
	JOfQ4gCi61/2ZVRZbGRn4D2gGe28nDUzHjiqJm8y4UqCUqMgTGv1E98tZF4saJknGme8
	2zeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9v9iQV19DgUi7HpW2WaXbL0gSupsIrn2jbWl4B5cbgA=;
	b=kO8mWR9Fz1iapezKZEGtTGwDg2COPyLfmcWUaltkSGECPMQgFCtZqauSnKKflCsCbR
	AID6Y3KyKnyc9+RN8cQioabukaVou+kSzs6aMngZ6K1h0lDBK3ogmua6kaoECPrUsZK3
	fcjscjs3GnYVagZ+3QSGHP0IG59CtFafLIDvupo29A9CaTdZ6B+/WdyTI/4I3D7Iaez2
	JlTWSNrAk/aOg95IFH87VIyGsj2RSXxtywe3M6tj5FYrH8FMALKqCl49wyZFMEqt2eW9
	RX5nQFQz/wILJB7wsz0foZdoSCOy8XfHy+q5ZYS0FkbXg0hSwu2FuARBFHRAlMgPyVXL
	6KHA==
X-Gm-Message-State: APjAAAWJODljxh2PIJRkHxYnCvh1iTIEGKkYrcMU947CeFHoaahY4tcZ
	acNiuRY/m8O9oByJF/osYJMTHfqB12UxToRtPSHOHg==
X-Google-Smtp-Source: APXvYqz5/xtUvZp/vVxcL3Gonlq1fmzZz6efHYtE62iXY8lYaTgZeEKiWaOv+Rs97z8NDXNy+5/kH6MjE+IQOOktJZw=
X-Received: by 2002:a05:620a:16a6:: with SMTP id
	s6mr6613669qkj.407.1571819792095; 
	Wed, 23 Oct 2019 01:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571762488.git.andreyknvl@google.com>
	<26e088ae3ebcaa30afe957aeabaa9f0c653df7d0.1571762488.git.andreyknvl@google.com>
In-Reply-To: <26e088ae3ebcaa30afe957aeabaa9f0c653df7d0.1571762488.git.andreyknvl@google.com>
Date: Wed, 23 Oct 2019 10:36:20 +0200
Message-ID: <CACT4Y+YntxT+cpESOBvbg+h=g-84ECJwQrFg7LM5tbq_zaMd3A@mail.gmail.com>
Subject: Re: [PATCH 3/3] vhost, kcov: collect coverage from vhost_worker
To: Andrey Konovalov <andreyknvl@google.com>
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	KVM list <kvm@vger.kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>,
	netdev <netdev@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux-foundation.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Elena Reshetova <elena.reshetova@intel.com>,
	David Windsor <dwindsor@gmail.com>
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
From: Dmitry Vyukov via Virtualization
	<virtualization@lists.linux-foundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Tue, Oct 22, 2019 at 6:46 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> This patch adds kcov_remote_start()/kcov_remote_stop() annotations to the
> vhost_worker() function, which is responsible for processing vhost works.
> Since vhost_worker() threads are spawned per vhost device instance
> the common kcov handle is used for kcov_remote_start()/stop() annotations
> (see Documentation/dev-tools/kcov.rst for details). As the result kcov can
> now be used to collect coverage from vhost worker threads.
>
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> ---
>  drivers/vhost/vhost.c | 6 ++++++
>  drivers/vhost/vhost.h | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 36ca2cf419bf..a5a557c4b67f 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -30,6 +30,7 @@
>  #include <linux/sched/signal.h>
>  #include <linux/interval_tree_generic.h>
>  #include <linux/nospec.h>
> +#include <linux/kcov.h>
>
>  #include "vhost.h"
>
> @@ -357,7 +358,9 @@ static int vhost_worker(void *data)
>                 llist_for_each_entry_safe(work, work_next, node, node) {
>                         clear_bit(VHOST_WORK_QUEUED, &work->flags);
>                         __set_current_state(TASK_RUNNING);
> +                       kcov_remote_start(dev->kcov_handle);
>                         work->fn(work);
> +                       kcov_remote_stop();
>                         if (need_resched())
>                                 schedule();
>                 }
> @@ -546,6 +549,7 @@ long vhost_dev_set_owner(struct vhost_dev *dev)
>
>         /* No owner, become one */
>         dev->mm = get_task_mm(current);
> +       dev->kcov_handle = current->kcov_handle;

kcov_handle is not present in task_struct if !CONFIG_KCOV

Also this does not use KCOV_SUBSYSTEM_COMMON.
We discussed something along the following lines:

u64 kcov_remote_handle(u64 subsys, u64 id)
{
  WARN_ON(subsys or id has wrong bits set).
  return ...;
}

kcov_remote_handle(KCOV_SUBSYSTEM_USB, bus);
kcov_remote_handle(KCOV_SUBSYSTEM_COMMON, current->kcov_handle);


>         worker = kthread_create(vhost_worker, dev, "vhost-%d", current->pid);
>         if (IS_ERR(worker)) {
>                 err = PTR_ERR(worker);
> @@ -571,6 +575,7 @@ long vhost_dev_set_owner(struct vhost_dev *dev)
>         if (dev->mm)
>                 mmput(dev->mm);
>         dev->mm = NULL;
> +       dev->kcov_handle = 0;
>  err_mm:
>         return err;
>  }
> @@ -682,6 +687,7 @@ void vhost_dev_cleanup(struct vhost_dev *dev)
>         if (dev->worker) {
>                 kthread_stop(dev->worker);
>                 dev->worker = NULL;
> +               dev->kcov_handle = 0;
>         }
>         if (dev->mm)
>                 mmput(dev->mm);
> diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
> index e9ed2722b633..a123fd70847e 100644
> --- a/drivers/vhost/vhost.h
> +++ b/drivers/vhost/vhost.h
> @@ -173,6 +173,7 @@ struct vhost_dev {
>         int iov_limit;
>         int weight;
>         int byte_weight;
> +       u64 kcov_handle;
>  };
>
>  bool vhost_exceeds_weight(struct vhost_virtqueue *vq, int pkts, int total_len);
> --
> 2.23.0.866.gb869b98d4c-goog
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
