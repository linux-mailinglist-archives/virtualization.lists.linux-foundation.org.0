Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C988D316122
	for <lists.virtualization@lfdr.de>; Wed, 10 Feb 2021 09:37:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 60A6687166;
	Wed, 10 Feb 2021 08:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 35TbqK0WFLz8; Wed, 10 Feb 2021 08:37:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E195087171;
	Wed, 10 Feb 2021 08:37:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1D6CC013A;
	Wed, 10 Feb 2021 08:37:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D342C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 08:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5BA2285633
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 08:37:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3ufeyHhGeMi
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 08:37:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D94F585010
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 08:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1r0irMz2N0yyYbwfbWnEViPW0NRdXGASq84W3NqA1ik=; b=dUsRsSif+hnZBSGbN83obM3tgZ
 lVJf3UfphZrzmkM9NIeDnz/SGWiRL/ljUp7J+g26OUepT8HFRSEGzduFv2CakNSqNVwAQkOD4R1zT
 dPVq094moraofb+zWnciYZ3MlejLVB93UJOWw/KUXFGxLYFYZr+TkyRf0lqq8HjedKzgXDEf2oJ6P
 YaLlIsw/PtWml9+0q9mUvH15xyzIG0ReK4fd+McYEbZHbyDUqHSZDmk/KJYgz+LY3j+EjsMiynSdr
 +uQjh8PD1M3wm1KXeH9IOUIawIc5pVsdmIMBlz5bAhZwIe2/NX5X8mHLpNrwrpfCbHzdffMsekX21
 QnRiOWZA==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l9l0G-008akL-Mb; Wed, 10 Feb 2021 08:37:41 +0000
Date: Wed, 10 Feb 2021 08:37:40 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 05/13] tcm loop: use blk cmd allocator for se_cmds
Message-ID: <20210210083740.GC2045726@infradead.org>
References: <20210209123845.4856-1-michael.christie@oracle.com>
 <20210209123845.4856-6-michael.christie@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209123845.4856-6-michael.christie@oracle.com>
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

On Tue, Feb 09, 2021 at 06:38:37AM -0600, Mike Christie wrote:
> This just has tcm loop use the block layer cmd allocator for se_cmds
> instead of using the tcm_loop_cmd_cache. In future patches when we
> can use the host tags for internal requests like TMFs we can completely
> kill the tcm_loop_cmd_cache.
> 
> Signed-off-by: Mike Christie <michael.christie@oracle.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
