Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 045AD316128
	for <lists.virtualization@lfdr.de>; Wed, 10 Feb 2021 09:43:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FDFB6F613
	for <lists.virtualization@lfdr.de>; Wed, 10 Feb 2021 08:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rY6dWZXCg92a for <lists.virtualization@lfdr.de>;
	Wed, 10 Feb 2021 08:42:58 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id 1D28A6F5B1; Wed, 10 Feb 2021 08:42:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E0ED6F4B9;
	Wed, 10 Feb 2021 08:42:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0138BC013A;
	Wed, 10 Feb 2021 08:42:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4568FC013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 08:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 337EA8588C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 08:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OguNYJYs+znJ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 08:42:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6179E856ED
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 08:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Z4Mk8otGK+jpyE+StMgkefLnz/H6FEtC0tGXbTOrCcA=; b=ht2N0i/MJmJfUxBYS4DSB0ToA4
 AvVXqyhKHoWzR8bgAT/uWcESaqTCYQJw+YeBO0xEVsPP8biT2qJ3rWFLVHlx/hLEpZTBe2dVkSJ8a
 9+D3zum/+F0m9f7AhSIDddf13HqpregqTEKZ53DOKZDn7Mb9ieDzeBSqvhnLV9aY8ianrP9IL4yus
 OPaXZf2YLZc8FPI0sMrEaZzAxUsHeZMeOTsO7SU+mFcraO3Negnc9cFneXej01FbRqYizMB7LT5NH
 FJ6OZvwl0HCqECaYhxKaJ+AjeAMg4jHGDwFyhLIgAO6OyL1gAuQBHNaTxRYAqp5HYVmqONTQ84aMP
 C7iQIXsg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l9l57-008b7U-Gt; Wed, 10 Feb 2021 08:42:41 +0000
Date: Wed, 10 Feb 2021 08:42:41 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 11/13] target: replace work per cmd in completion path
Message-ID: <20210210084241.GE2045726@infradead.org>
References: <20210209123845.4856-1-michael.christie@oracle.com>
 <20210209123845.4856-12-michael.christie@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209123845.4856-12-michael.christie@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: loberman@redhat.com, Chaitanya.Kulkarni@wdc.com, martin.petersen@oracle.com,
 mst@redhat.com, virtualization@lists.linux-foundation.org,
 target-devel@vger.kernel.org, stefanha@redhat.com, linux-scsi@vger.kernel.org
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

On Tue, Feb 09, 2021 at 06:38:43AM -0600, Mike Christie wrote:
> Doing a work per cmd can lead to lots of threads being created.
> This patch just replaces the completion work per cmd with a per cpu
> list. Combined with the first patches this allows tcm loop on top of
> initiators like iser to go from around 700K IOPs to 1000K and reduces
> the number of threads that get created when the system is under heavy
> load and hitting the initiator drivers tagging limits.

OTOH it does increase completion latency, which might be the preference
for some workloads.  Do we need a tunable here?

> +static void target_queue_cmd_work(struct se_cmd_queue *q, struct se_cmd *se_cmd,
> +				  int cpu, struct workqueue_struct *wq)
>  {
> -	struct se_cmd *cmd = container_of(work, struct se_cmd, work);
> +	llist_add(&se_cmd->se_cmd_list, &q->cmd_list);
> +	queue_work_on(cpu, wq, &q->work);
> +}

Do we need this helper at all?  Having it open coded in the two callers
would seem easier to follow to me.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
