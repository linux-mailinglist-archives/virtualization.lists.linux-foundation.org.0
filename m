Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F60181280
	for <lists.virtualization@lfdr.de>; Wed, 11 Mar 2020 09:00:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AB2C686985;
	Wed, 11 Mar 2020 08:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doT-wnTCuqMy; Wed, 11 Mar 2020 08:00:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1AF408695E;
	Wed, 11 Mar 2020 08:00:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D865FC0177;
	Wed, 11 Mar 2020 08:00:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61161C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 08:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4A7AD22026
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 08:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J8-A7zdJI8WM
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 08:00:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 0E6652202E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583913647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BTQ/qk+PVYNZHsKM28XRoYcuNh5fpwlLGdRZPJQp7IM=;
 b=LslJIrMGyeY2qzQm10qSrcGvSYRN8FBQ5Hne4C9WZ7XT0uncO0TxbFEXclI+C5cpC57Rsy
 bXACM3pIn9caWatPyzNNfKi6V1BkVPnNisU36dUWbjYbaHT5IlTDejF23SOYr0cSUq9EqN
 Y/rlARvVePkrWt7DrapHVS12B6esNKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-QGvsN90iOsqhbPUTuUsqug-1; Wed, 11 Mar 2020 04:00:43 -0400
X-MC-Unique: QGvsN90iOsqhbPUTuUsqug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EAB418B5F8A;
 Wed, 11 Mar 2020 08:00:41 +0000 (UTC)
Received: from ming.t460p (ovpn-8-26.pek2.redhat.com [10.72.8.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69F7D60C18;
 Wed, 11 Mar 2020 08:00:30 +0000 (UTC)
Date: Wed, 11 Mar 2020 16:00:26 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH RFC v2 01/24] scsi: add 'nr_reserved_cmds' field to the
 SCSI host template
Message-ID: <20200311080026.GB31504@ming.t460p>
References: <1583857550-12049-1-git-send-email-john.garry@huawei.com>
 <1583857550-12049-2-git-send-email-john.garry@huawei.com>
 <20200310230835.GA16056@ming.t460p>
 <fecc400c-fe6b-144a-51f9-1b3b2704c1a2@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fecc400c-fe6b-144a-51f9-1b3b2704c1a2@suse.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
 Hannes Reinecke <hare@suse.com>, bvanassche@acm.org,
 martin.petersen@oracle.com, chenxiang66@hisilicon.com, jejb@linux.ibm.com,
 John Garry <john.garry@huawei.com>, esc.storagedev@microsemi.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 hch@infradead.org, linux-scsi@vger.kernel.org
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

On Wed, Mar 11, 2020 at 07:55:46AM +0100, Hannes Reinecke wrote:
> On 3/11/20 12:08 AM, Ming Lei wrote:
> > On Wed, Mar 11, 2020 at 12:25:27AM +0800, John Garry wrote:
> >> From: Hannes Reinecke <hare@suse.com>
> >>
> >> Add a new field 'nr_reserved_cmds' to the SCSI host template to
> >> instruct the block layer to set aside a tag space for reserved
> >> commands.
> >>
> >> Signed-off-by: Hannes Reinecke <hare@suse.com>
> >> ---
> >>  drivers/scsi/scsi_lib.c  | 1 +
> >>  include/scsi/scsi_host.h | 6 ++++++
> >>  2 files changed, 7 insertions(+)
> >>
> >> diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
> >> index 610ee41fa54c..2967325df7a0 100644
> >> --- a/drivers/scsi/scsi_lib.c
> >> +++ b/drivers/scsi/scsi_lib.c
> >> @@ -1896,6 +1896,7 @@ int scsi_mq_setup_tags(struct Scsi_Host *shost)
> >>  		shost->tag_set.ops = &scsi_mq_ops_no_commit;
> >>  	shost->tag_set.nr_hw_queues = shost->nr_hw_queues ? : 1;
> >>  	shost->tag_set.queue_depth = shost->can_queue;
> >> +	shost->tag_set.reserved_tags = shost->nr_reserved_cmds;
> > 
> > You reserve tags for special usage, meantime the whole queue depth
> > isn't increased, that means the tags for IO request is decreased given
> > reserved tags can't be used for IO, so IO performance may be effected.
> > 
> > If not the case, please explain a bit in commit log.
> > 
> The overall idea of this patchset is to fold _existing_ management
> command handling into using the blk-mq bitmap.
> Currently, quite a lot of drivers are using management commands
> internally, which typically use the same hardware tag pool (ie they are
> being allocated from the same hardware resources) than the 'normal' I/O
> commands.
> But as they are using the same tagpool these drivers already decrement
> the available number of commands; check eg. hpsa:
> 
> static int hpsa_scsi_host_alloc(struct ctlr_info *h)
> {
> 	struct Scsi_Host *sh;
> 
> 	sh = scsi_host_alloc(&hpsa_driver_template, sizeof(h));
> 	if (sh == NULL) {
> 		dev_err(&h->pdev->dev, "scsi_host_alloc failed\n");
> 		return -ENOMEM;
> 	}
> 
> 	sh->io_port = 0;
> 	sh->n_io_port = 0;
> 	sh->this_id = -1;
> 	sh->max_channel = 3;
> 	sh->max_cmd_len = MAX_COMMAND_SIZE;
> 	sh->max_lun = HPSA_MAX_LUN;
> 	sh->max_id = HPSA_MAX_LUN;
> 	sh->can_queue = h->nr_cmds - HPSA_NRESERVED_CMDS;
> 	sh->cmd_per_lun = sh->can_queue;
> 
> So the idea of this patchset is to convert existing use-cases; seeing
> that they already reserve commands internally performance will not be
> affected.
> 

OK, got it.

I'd suggest to add comment about this idea in commit log, cause
it is one fundamental thing about this change.

Thanks,
Ming

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
