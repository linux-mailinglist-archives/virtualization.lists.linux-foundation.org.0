Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB5B2FF150
	for <lists.virtualization@lfdr.de>; Thu, 21 Jan 2021 18:05:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7EF6886D21;
	Thu, 21 Jan 2021 17:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t4DQZZAouaJK; Thu, 21 Jan 2021 17:05:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1748A86D1B;
	Thu, 21 Jan 2021 17:05:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9898C013A;
	Thu, 21 Jan 2021 17:04:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C90DC013A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 17:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 62A1486268
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 17:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e2cVu0Y74Yyf
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 17:04:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5A45286208
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 17:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WXp9P2+4ttOF7WOJ6N6+oYIjL/n1xFJfDmqOtrJBLpU=; b=gd4BKa4iFPPuT/lD2l4BSb7o3D
 CcZwhIeTFXpXFqJD7zm1KvhSW779Tw+VeuicSpzqOYgmQKe4y9bE4q0XwrV2FsRd0k3PdBFb+bpW/
 /RQs1TEqLYPidsbGr4wAwL0sHpKJEn9FCbbWRyhRHuoVk0i8QSB3Imxpsokzc9D3i8gabl7lj5xpS
 le/fJd0Q0THs9DBKuCcPcXJ4dZYELr7B/+V5dHjXnOgJjAHd+4JqUCv/DNHbG0Ng2PVhcxqxNrhGg
 e1ahOjpwMV0H6IKQqoBM0no7vfgQSDJsKHdBSL6kx7XXLhD8nhdOpQ3cL9dT1JDTT5SYOU8uSpxtx
 fdX0PhQg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l2dNh-00HIE9-Vn; Thu, 21 Jan 2021 17:04:26 +0000
Date: Thu, 21 Jan 2021 17:04:25 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Subject: Re: [PATCH 2/2] block: remove unnecessary argument from blk_execute_rq
Message-ID: <20210121170425.GB4120717@infradead.org>
References: <20210121142905.13089-1-guoqing.jiang@cloud.ionos.com>
 <20210121142905.13089-3-guoqing.jiang@cloud.ionos.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121142905.13089-3-guoqing.jiang@cloud.ionos.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, linux-nfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 linux-ide@vger.kernel.org, target-devel@vger.kernel.org
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

On Thu, Jan 21, 2021 at 03:29:05PM +0100, Guoqing Jiang wrote:
> We can remove 'q' from blk_execute_rq as well after the previous change
> in blk_execute_rq_nowait.

Same trivial nits as for the other one.

Otherwise this looks good to me.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
