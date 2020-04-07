Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF501A1162
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 18:31:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2ADE587C3F;
	Tue,  7 Apr 2020 16:30:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D7-1Y8bDXjm5; Tue,  7 Apr 2020 16:30:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A852E87C20;
	Tue,  7 Apr 2020 16:30:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A567C1D8D;
	Tue,  7 Apr 2020 16:30:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C92EFC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 16:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B26F987AEE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 16:30:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JXwOYP-QVdsT
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 16:30:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3EF7787ACE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 16:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=nuh4nVXCUJwlPsAFN4ZcIX/xOtefRx7Y3gNridK28QY=; b=ciZFBeMvY6ceMxZGa0UjRmpv6b
 Vx/9nAHJ7cxHdVPsGVO0PNZBmYRA2oafiriwUZf2uaLm6sd/JHTHiYn96WGCqPGsDik4kWqPeniyw
 bdPj2+66DNoBS6v1/G5yrPYOsYOcP/bvsesb1lQ1CaETVyn/lrp3nTn0SCkBzpTmooMJ3D/tGkZ+R
 NXpVCbx8OlXunsKpnNLxI2zsDYD8s35fOl9y5pQxPznzzFfQF6aC55FJlcxyBErnqhLDdJdomi9i8
 iGQlKFyYr8/UGVmLCIfv4Z/U8ElXOR0AFlrBMC4KujJgBb0wM24+ct4pshpcOFedveoKb2djkQ37L
 0xZMV4/g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jLr7R-00017v-Tj; Tue, 07 Apr 2020 16:30:33 +0000
Date: Tue, 7 Apr 2020 09:30:33 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH RFC v2 02/24] scsi: allocate separate queue for reserved
 commands
Message-ID: <20200407163033.GA26568@infradead.org>
References: <1583857550-12049-1-git-send-email-john.garry@huawei.com>
 <1583857550-12049-3-git-send-email-john.garry@huawei.com>
 <20200310183243.GA14549@infradead.org>
 <79cf4341-f2a2-dcc9-be0d-2efc6e83028a@huawei.com>
 <20200311062228.GA13522@infradead.org>
 <b5a63725-722b-8ccd-3867-6db192a248a4@suse.de>
 <9c6ced82-b3f1-9724-b85e-d58827f1a4a4@huawei.com>
 <39bc2d82-2676-e329-5d32-8acb99b0a204@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39bc2d82-2676-e329-5d32-8acb99b0a204@suse.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
 Hannes Reinecke <hare@suse.com>, bvanassche@acm.org,
 martin.petersen@oracle.com, chenxiang66@hisilicon.com, jejb@linux.ibm.com,
 John Garry <john.garry@huawei.com>, esc.storagedev@microsemi.com,
 linux-kernel@vger.kernel.org, ming.lei@redhat.com,
 Christoph Hellwig <hch@infradead.org>, linux-scsi@vger.kernel.org,
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

On Tue, Apr 07, 2020 at 04:00:10PM +0200, Hannes Reinecke wrote:
> My concern is this:
> 
> struct scsi_device *scsi_get_host_dev(struct Scsi_Host *shost)
> {
> 	[ .. ]
> 	starget = scsi_alloc_target(&shost->shost_gendev, 0, shost->this_id);
> 	[ .. ]
> 
> and we have typically:
> 
> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c: .this_id                = -1,
> 
> It's _very_ uncommon to have a negative number as the SCSI target device; in
> fact, it _is_ an unsigned int already.
> 
> But alright, I'll give it a go; let's see what I'll end up with.

But this shouldn't be exposed anywhere.  And I prefer that over having
magic requests/scsi_cmnd that do not have a valid ->device pointer.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
