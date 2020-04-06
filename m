Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A8319F673
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 15:09:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 88FE585DE6;
	Mon,  6 Apr 2020 13:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zb5kyj3t3ICq; Mon,  6 Apr 2020 13:09:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 83D5485DF6;
	Mon,  6 Apr 2020 13:09:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57689C0177;
	Mon,  6 Apr 2020 13:09:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 106FEC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0AE5B87E01
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:09:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aGSwuV-lDqo9
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:09:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A0CE687AC8
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=d8z40dNKaPY2tTRvNqVh/Hg7COGe6Xus2Dj2Co5njCA=; b=qaF9jgqXRIEeKu2Y2Dr7vB13TD
 KAolynoC5eVhhwajk0M4cxtVWIE6G7MpqOI8nrq6w21TdsRfaf03cgNCb4ztaP5X1jrRsvGzGvCHP
 dIPR3oBv+MDsPAvpd6u9p+//LYaetf5LYB3R+VCJKwXq4rzAswlBPGdVBHYyNAWmgGL3HMKYMi+Mo
 6ril3DjTx0HIsB0ky0W/jYQ9Uu2uAUq5Q9KbXwQYip2ADF/2/AFKAK+s44RVAnQGeL9QfqYpAgRB5
 hawKVDzbjNyucsIwbKpLvr/mplANc239iPxGKmzma4N1lDRPRvDZNkoWDCnV6AVw7MDt6TIpGyl++
 jpQc4UJw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jLRVH-0000Ci-KN; Mon, 06 Apr 2020 13:09:27 +0000
Date: Mon, 6 Apr 2020 06:09:27 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vdpa-sim: depend on HAS_DMA
Message-ID: <20200406130927.GA20291@infradead.org>
References: <20200405081355.2870-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200405081355.2870-1-mst@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Pleae just drop the code - we should not add new drivers with custom
DMA ops.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
