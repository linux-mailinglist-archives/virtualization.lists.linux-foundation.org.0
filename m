Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F8D1806BA
	for <lists.virtualization@lfdr.de>; Tue, 10 Mar 2020 19:35:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 46D23875AC;
	Tue, 10 Mar 2020 18:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XASf2UGLeNsy; Tue, 10 Mar 2020 18:35:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CF5FD87563;
	Tue, 10 Mar 2020 18:35:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B325AC0177;
	Tue, 10 Mar 2020 18:35:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2F30C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 18:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id ECC2288659
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 18:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QYLk-zcggqAv
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 18:35:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 83A1B88653
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 18:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=f2QIKjI8cYNlOJbeMqgxIhxEPRSUmrEl+tsAYjSK8m8=; b=H7Hg3iHhU9Pw60VhTAE9cYI6HR
 2toN/jrJZ6zBbyrU0G7lJrEeLpeekDWBK9hhLqMI5Koq3UHLf0o/gLNWYajwyZEp9mivPiKG5dbHU
 lYv2ueIuG2okv8ihdoPp19X46Uuk0YubE/yk/cUdeH85mHgOHyQR/Z40XEGShkUtc2WQsjM5tNdn1
 u7KUHl8+5GQ455+JRI2KBRzr1CKF9+Ti8uSEuxAYcFqpnDuQXCKNGa4NYktKWVRUN95/brwwxfDQ7
 U7gQA1jmJuWgJAcoJnQ/dK64b99M7ZqjRhMIPA5KZpMYYoAiIG4d8MEvM9enYix/NFph/hu+l1qzX
 0Apbw/eA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jBjia-0007xl-Nv; Tue, 10 Mar 2020 18:35:04 +0000
Date: Tue, 10 Mar 2020 11:35:04 -0700
From: Christoph Hellwig <hch@infradead.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH RFC v2 22/24] scsi: drop scsi command list
Message-ID: <20200310183504.GB14549@infradead.org>
References: <1583857550-12049-1-git-send-email-john.garry@huawei.com>
 <1583857550-12049-23-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583857550-12049-23-git-send-email-john.garry@huawei.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
 Hannes Reinecke <hare@suse.com>, bvanassche@acm.org,
 martin.petersen@oracle.com, chenxiang66@hisilicon.com, jejb@linux.ibm.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 ming.lei@redhat.com, hch@infradead.org, linux-scsi@vger.kernel.org,
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

On Wed, Mar 11, 2020 at 12:25:48AM +0800, John Garry wrote:
> From: Hannes Reinecke <hare@suse.com>
> 
> No users left, kill it.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.com>

Wasn't this part of a series from Hannes that already got merged?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
