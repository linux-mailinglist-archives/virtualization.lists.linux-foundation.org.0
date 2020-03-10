Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E1A180681
	for <lists.virtualization@lfdr.de>; Tue, 10 Mar 2020 19:33:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4B89B875BD;
	Tue, 10 Mar 2020 18:33:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UzzFp5a4cGhA; Tue, 10 Mar 2020 18:33:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4CB4E875B7;
	Tue, 10 Mar 2020 18:33:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20F6DC0177;
	Tue, 10 Mar 2020 18:33:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90D0AC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 18:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8602287E37
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 18:32:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zBUFDy+Qte3P
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 18:32:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1806687E23
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 18:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BM1rOj2mhNiPAl7HQ9Dqr15pnyhMXu6TgEmfxY4G2dE=; b=ed6zJKUMN0NHTWgGMZZSTBEMDJ
 ZDwYVpOOtBbWFiUHnmoG6GaShnCVBNtgLFdocdwwRDKj4qutRI2XnmiCFY3FvYu0H6LTim5ZMYG7l
 er2Lg68TxUnu7dgmzliLVYHYuWZlDRVJZnXxTrNbeyTmFNxMT/4eKfoklcs5lYKYFagBDGM3D1DXQ
 Mfob/seec8sdaZisq4mZffAyZUetOdUKq7p7SqhAx2aZ6sX/rk12t8fIAlAmkmzXB/Fu5MVzj1oNr
 3IDqAJiLb2d029n6cYMi7pHsO0hMT85id6WaFxFPrLWgXPuuRoplFfqkZd8EvysaP2+Sgd06AOwkD
 QGZb4vxQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jBjgJ-0005Yb-SK; Tue, 10 Mar 2020 18:32:43 +0000
Date: Tue, 10 Mar 2020 11:32:43 -0700
From: Christoph Hellwig <hch@infradead.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH RFC v2 02/24] scsi: allocate separate queue for reserved
 commands
Message-ID: <20200310183243.GA14549@infradead.org>
References: <1583857550-12049-1-git-send-email-john.garry@huawei.com>
 <1583857550-12049-3-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583857550-12049-3-git-send-email-john.garry@huawei.com>
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

On Wed, Mar 11, 2020 at 12:25:28AM +0800, John Garry wrote:
> From: Hannes Reinecke <hare@suse.com>
> 
> Allocate a separate 'reserved_cmd_q' for sending reserved commands.

Why?  Reserved command specifically are not in any way tied to queues.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
