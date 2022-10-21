Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8158D606CBB
	for <lists.virtualization@lfdr.de>; Fri, 21 Oct 2022 02:58:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A728284385;
	Fri, 21 Oct 2022 00:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A728284385
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gPUYnCJI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n3VlvxcEBi2K; Fri, 21 Oct 2022 00:58:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5A47B843B5;
	Fri, 21 Oct 2022 00:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A47B843B5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86EA6C0078;
	Fri, 21 Oct 2022 00:58:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C9BEC002D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Oct 2022 00:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 015788436B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Oct 2022 00:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 015788436B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OtkduvbTSfRD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Oct 2022 00:58:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AC1484286
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AC1484286
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Oct 2022 00:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666313883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qG8591Xly/v0qWxUjLRp/EASy0SBvAr2VHzhz10020A=;
 b=gPUYnCJInxVv3Rb7vv+hGQPadmmzvPBTczmo5rcEFeB+IPW9uGsrF/Cmi8ojzbrW7E75Eb
 4S5D5m7PSWll+VhfVDrhS7rD3Tozm5SSbU5+XqCBOLIugRmx6y9pKOw3C8JVDMlzL4mqYU
 MQnpDDj3NtKlcV/CTjf4dzUyn9c9CVo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-0wpCcC_WPSy-6gDMJBGIww-1; Thu, 20 Oct 2022 20:57:57 -0400
X-MC-Unique: 0wpCcC_WPSy-6gDMJBGIww-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62761811E7A;
 Fri, 21 Oct 2022 00:57:57 +0000 (UTC)
Received: from T590 (ovpn-8-24.pek2.redhat.com [10.72.8.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CDFB40611D;
 Fri, 21 Oct 2022 00:57:50 +0000 (UTC)
Date: Fri, 21 Oct 2022 08:57:44 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [Bug] double ->queue_rq() because of timeout in ->queue_rq()
Message-ID: <Y1HuiFXyQ1k+OH92@T590>
References: <Y1EQdafQlKNAsutk@T590>
 <7d5eae39-3a56-df7d-eb72-3cb910c2b802@acm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d5eae39-3a56-df7d-eb72-3cb910c2b802@acm.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Cc: Jens Axboe <axboe@kernel.dk>, djeffery@redhat.com,
 linux-scsi@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, stefanha@redhat.com,
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

On Thu, Oct 20, 2022 at 01:26:48PM -0700, Bart Van Assche wrote:
> On 10/20/22 02:10, Ming Lei wrote:
> > [ ... ]
> 
> Hi Ming,
> 
> Fixing this in the block layer seems fine to me. A few comments:
> 
> > +	/* Before walking tags, we must ensure any submit started before the
> > +	 * current time has finished. Since the submit uses srcu or rcu, wait
> > +	 * for a synchronization point to ensure all running submits have
> > +	 * finished
> > +	 */
> 
> Should the above comment follow the style of other comments in the block
> layer?

OK.

> 
> > +	blk_mq_wait_quiesce_done(q);
> > +
> > +	blk_mq_queue_tag_busy_iter(q, blk_mq_check_expired, &expired);
> 
> The above doesn't look sufficient to me since .queue_rq() may be called
> while blk_mq_queue_tag_busy_iter() is in progress. How about moving the
> blk_mq_wait_quiesce_done() call into blk_mq_check_expired() and preventing
> new .queue_rq() calls before the timeout handler is called?

blk_mq_timeout_work() records the time before calling
blk_mq_wait_quiesce_done(), and only handle requests which is timed out
before the recorded jiffies, so new queued request won't be covered
in this time.

Thanks,
Ming

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
