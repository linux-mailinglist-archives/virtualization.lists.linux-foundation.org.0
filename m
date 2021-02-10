Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 686E6316120
	for <lists.virtualization@lfdr.de>; Wed, 10 Feb 2021 09:37:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E3A0B85B25;
	Wed, 10 Feb 2021 08:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CnrhVGG-J7xv; Wed, 10 Feb 2021 08:37:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 929CB85010;
	Wed, 10 Feb 2021 08:37:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6DCB0C0174;
	Wed, 10 Feb 2021 08:37:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82E45C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 08:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F6FD600BB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 08:36:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TKW0mnSHhMUb
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 08:36:58 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id C81926F515; Wed, 10 Feb 2021 08:36:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4BC16F4B9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1Jf9kK5BwbeodaWWVRp1+fG5UN617NHybGlzbgdtR8Y=; b=QsOlCWtCYJJr2M0srUVdN7vGuf
 lYWu8T7T40V5kchDJavFRETQgZVC1/55M7TNhJNvyyIdjVU2mo9a4BCoqsINILnp/kIPQsnt/Z6k5
 bSzPrCMQarYtQMqK7DiOs3vo4V21C7hH25q7+OCztqPGW+KZvLrj0bxtaGFFmg7Ig3zGuox2nTwvn
 twmzniexSRh19vFgSvGyClo8VKFJcNUm33S31x/9oyAZ6b/bM2nb0CTLsMWoqUxuniz4CCunlVhJT
 KM6ETSUsL0weCi2xKMaZnlNeqFvdQgJojlrH7JA96s5wDCnXNgDPgRU+Ukyad7NpVaDLzzRUNEdFG
 jRBWdepg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l9kzK-008aTG-Ea; Wed, 10 Feb 2021 08:36:42 +0000
Date: Wed, 10 Feb 2021 08:36:42 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 02/13] target: split target_submit_cmd_map_sgls
Message-ID: <20210210083642.GB2045726@infradead.org>
References: <20210209123845.4856-1-michael.christie@oracle.com>
 <20210209123845.4856-3-michael.christie@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209123845.4856-3-michael.christie@oracle.com>
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

Can you just kill off target_submit_cmd_map_sgls entirely and just
open code the two calls in the three callers?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
