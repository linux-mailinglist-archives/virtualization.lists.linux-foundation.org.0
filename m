Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5105F47947C
	for <lists.virtualization@lfdr.de>; Fri, 17 Dec 2021 20:02:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F36E404A9;
	Fri, 17 Dec 2021 19:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRAhFqtIN6J0; Fri, 17 Dec 2021 19:02:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E9F8440C1A;
	Fri, 17 Dec 2021 19:02:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 754FFC0070;
	Fri, 17 Dec 2021 19:02:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 663FAC0012
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Dec 2021 19:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54D9060EC6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Dec 2021 19:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lcF7LQxVN_Qs
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Dec 2021 19:02:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C365C60EBB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Dec 2021 19:02:01 +0000 (UTC)
Received: from in01.mta.xmission.com ([166.70.13.51]:58054)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1myIUR-00FfBf-I2; Fri, 17 Dec 2021 12:01:59 -0700
Received: from ip68-227-161-49.om.om.cox.net ([68.227.161.49]:42796
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1myIUQ-004HxV-4I; Fri, 17 Dec 2021 12:01:59 -0700
From: ebiederm@xmission.com (Eric W. Biederman)
To: Mike Christie <michael.christie@oracle.com>
References: <20211129194707.5863-1-michael.christie@oracle.com>
 <20211129194707.5863-11-michael.christie@oracle.com>
Date: Fri, 17 Dec 2021 13:01:51 -0600
In-Reply-To: <20211129194707.5863-11-michael.christie@oracle.com> (Mike
 Christie's message of "Mon, 29 Nov 2021 13:47:07 -0600")
Message-ID: <87bl1fcaxs.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1myIUQ-004HxV-4I; ; ;
 mid=<87bl1fcaxs.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.227.161.49; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX19b9elxsYumUcbq/GZ1o040CaaHOg07k30=
X-SA-Exim-Connect-IP: 68.227.161.49
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Virus: No
X-Spam-DCC: XMission; sa03 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Mike Christie <michael.christie@oracle.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 365 ms - load_scoreonly_sql: 0.03 (0.0%),
 signal_user_changed: 3.9 (1.1%), b_tie_ro: 2.7 (0.7%), parse: 0.63
 (0.2%), extract_message_metadata: 8 (2.1%), get_uri_detail_list: 1.14
 (0.3%), tests_pri_-1000: 10 (2.7%), tests_pri_-950: 0.90 (0.2%),
 tests_pri_-900: 0.76 (0.2%), tests_pri_-90: 82 (22.6%), check_bayes:
 81 (22.2%), b_tokenize: 6 (1.6%), b_tok_get_all: 7 (2.0%),
 b_comp_prob: 1.51 (0.4%), b_tok_touch_all: 63 (17.3%), b_finish: 0.77
 (0.2%), tests_pri_0: 250 (68.4%), check_dkim_signature: 0.38 (0.1%),
 check_dkim_adsp: 2.4 (0.7%), poll_dns_idle: 1.05 (0.3%), tests_pri_10:
 1.58 (0.4%), tests_pri_500: 5 (1.5%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH V6 10/10] vhost: use user_worker to check RLIMITs
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Cc: axboe@kernel.dk, hdanton@sina.com, mst@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 hch@infradead.org, vverma@digitalocean.com, geert@linux-m68k.org,
 stefanha@redhat.com, christian.brauner@ubuntu.com,
 Christoph Hellwig <hch@lst.de>
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

Mike Christie <michael.christie@oracle.com> writes:

> For vhost workers we use the kthread API which inherit's its values from
> and checks against the kthreadd thread. This results in the wrong RLIMITs
> being checked. This patch has us use the user_worker helpers which will
> inherit its values/checks from the thread that owns the device similar to
> if we did a clone in userspace.
>
> Signed-off-by: Mike Christie <michael.christie@oracle.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/vhost/vhost.c | 65 +++++++++++++++----------------------------
>  drivers/vhost/vhost.h |  7 ++++-
>  2 files changed, 28 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index c9a1f706989c..8cf259d798c0 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -22,7 +22,6 @@
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
>  #include <linux/kthread.h>
> -#include <linux/cgroup.h>
>  #include <linux/module.h>
>  #include <linux/sort.h>
>  #include <linux/sched/mm.h>
> @@ -344,17 +343,14 @@ static void vhost_vq_reset(struct vhost_dev *dev,
>  static int vhost_worker(void *data)
>  {
>  	struct vhost_worker *worker = data;
> -	struct vhost_dev *dev = worker->dev;
>  	struct vhost_work *work, *work_next;
>  	struct llist_node *node;
>  
> -	kthread_use_mm(dev->mm);
> -
>  	for (;;) {
>  		/* mb paired w/ kthread_stop */
>  		set_current_state(TASK_INTERRUPTIBLE);
>  
> -		if (kthread_should_stop()) {
> +		if (test_bit(VHOST_WORKER_FLAG_STOP, &worker->flags)) {
>  			__set_current_state(TASK_RUNNING);
>  			break;
>  		}
> @@ -376,8 +372,9 @@ static int vhost_worker(void *data)
>  				schedule();
>  		}
>  	}
> -	kthread_unuse_mm(dev->mm);
> -	return 0;
> +
> +	complete(worker->exit_done);
> +	do_exit(0);

This code worries me.

It has the potential for a caller to do:

	vhost_worker_stop()
        module_put();

Then the exiting work thread tries to do:
	do_exit()

Except the code that calls do_exit has already been removed from the
kernel.  Maybe the vhost code can never be removed from the kernel
but otherwise I expect that is possible.

Eric
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
